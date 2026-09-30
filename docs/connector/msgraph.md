# iCal4j Connector - Microsoft Graph

[![javadoc](https://javadoc.io/badge2/org.ical4j/ical4j-connector-msgraph/javadoc.svg)](https://javadoc.io/doc/org.ical4j/ical4j-connector-msgraph)

The Microsoft Graph connector exposes a Microsoft 365 user's Outlook calendars through the standard
`ObjectStore` and `CalendarCollection` interfaces. Each Outlook calendar becomes a `CalendarCollection`,
calendar groups are surfaced as workspaces, and each Graph event is converted to and from an iCal4j
`Calendar` containing a single `VEVENT`.

## Setup

Add the module together with an Azure credential library. The module depends transitively on the
Microsoft Graph SDK, but the credential classes used to sign in live in `azure-identity`, which you must
add yourself.

```groovy
dependencies {
    implementation 'org.ical4j:ical4j-connector-msgraph:2.0.0-beta2'
    implementation 'com.azure:azure-identity:1.18.6'
}
```

```xml
<dependency>
    <groupId>org.ical4j</groupId>
    <artifactId>ical4j-connector-msgraph</artifactId>
    <version>2.0.0-beta2</version>
</dependency>
<dependency>
    <groupId>com.azure</groupId>
    <artifactId>azure-identity</artifactId>
    <version>1.18.6</version>
</dependency>
```

### Microsoft Entra application

The connector needs an application registration that is allowed to use the Graph calendar API:

1. Register an application in the [Microsoft Entra admin center](https://entra.microsoft.com/) and note
   its **Application (client) ID** and **Directory (tenant) ID**.
2. Under **Authentication**, enable **Allow public client flows** if you intend to use the device code or
   interactive browser flows shown below.
3. Under **API permissions**, add the Microsoft Graph delegated permission `Calendars.ReadWrite`
   (or `Calendars.Read` for read-only access).

The store operates on the signed-in user's mailbox via the `/me` endpoint, so a delegated (user) sign-in
is required. Application-only credentials such as a client secret without a user context will not work.

## Authentication

The connector does not perform authentication itself. You construct an authenticated
`GraphServiceClient` and pass it to the store. The `connect()` and `disconnect()` methods on the store
are no-ops that exist only to satisfy the `ObjectStore` interface.

The example below uses the device code flow, which prints a URL and a code for the user to enter in any
browser. It suits command-line tools and headless environments.

```java
import com.azure.identity.DeviceCodeCredential;
import com.azure.identity.DeviceCodeCredentialBuilder;
import com.microsoft.graph.serviceclient.GraphServiceClient;

DeviceCodeCredential credential = new DeviceCodeCredentialBuilder()
        .clientId("<application-client-id>")
        .tenantId("<directory-tenant-id>")
        .challengeConsumer(challenge -> System.out.println(challenge.getMessage()))
        .build();

GraphServiceClient client = new GraphServiceClient(credential, "Calendars.ReadWrite");
```

For a desktop application, `InteractiveBrowserCredentialBuilder` opens the system browser instead. Any
`TokenCredential` from `azure-identity` that yields a delegated user token can be used in the same way.

## Creating the store

```java
import org.ical4j.connector.msgraph.MSGraphCalendarStore;

MSGraphCalendarStore store = new MSGraphCalendarStore(client);
```

## Working with collections

Outlook organises calendars into calendar groups. The connector exposes those groups as workspaces, so
`listWorkspaceIds()` returns the user's calendar group ids and the workspace-parameterised methods
operate inside the named group. Methods without a workspace argument operate on the user's default
calendar list. Listing follows Graph's `@odata.nextLink` paging, so every group and calendar is returned.

```java
// calendar group ids
List<String> groups = store.listWorkspaceIds();

// calendars in the user's default list
List<CalendarCollection> collections = store.getCollections();
for (CalendarCollection collection : collections) {
    System.out.println(collection.getDisplayName());
}

// calendars within a specific calendar group
List<CalendarCollection> groupCalendars = store.getCollections(groups.get(0));

// wrap a known calendar id (no request is made until the collection is used)
CalendarCollection calendar = store.getCollection("<calendar-id>");
CalendarCollection grouped = store.getCollection("<calendar-id>", groups.get(0));

// create a calendar in the default list, or inside a calendar group
CalendarCollection team = store.addCollection("Team Events");
CalendarCollection projects = store.addCollection("Projects", groups.get(0));

// delete a calendar, either by id or through the collection
store.removeCollection("<calendar-id>");
team.delete();
```

Collection ids are Graph calendar ids. A Graph calendar carries only a name, so the five-argument form
of `addCollection()` ignores the id, description, supported components and time zone arguments and
creates the calendar by name alone. Likewise `getDescription()` returns an empty string and
`getTimeZone()` returns `null`.

## Working with events

Each event is represented as an iCal4j `Calendar` containing a single `VEVENT`. Events are identified by
Graph's `iCalUId`, which is assigned by the server on creation. The `UID` you submit is not preserved,
so always use the identifier returned by `add()` for later lookups.

```java
import net.fortuna.ical4j.model.Calendar;
import net.fortuna.ical4j.model.component.VEvent;

CalendarCollection collection = store.getCollection("<calendar-id>");

// add an event; the returned string is the iCalUId assigned by Graph
VEvent event = new VEvent(LocalDate.of(2026, 6, 1), "Team offsite");
String uid = collection.add(new Calendar().withComponent(event).getFluentTarget());

// list the UIDs of every event in the calendar
List<String> uids = collection.listObjectUIDs();

// fetch a single event by UID
Optional<Calendar> found = collection.get(uid);

// merge a multi-event calendar; one VEVENT is added per UID and the assigned ids are returned
Uid[] assigned = collection.merge(importedCalendar);

// export the whole calendar as a single iCalendar object
Calendar everything = collection.export();

// delete events by UID; the removed events are returned, unknown UIDs are skipped
List<Calendar> removed = collection.removeAll(uid);
```

Lookups filter on `iCalUId` server-side where the service allows it and fall back to a paged scan if
Graph rejects the filter. Only series master events are listed, so occurrences of a recurring event
appear once, as the series.

## Field mapping

The following properties are mapped between a `VEVENT` and a Graph `Event`. Any other property is dropped
without error when writing to Graph.

| iCal4j `VEVENT` property        | Microsoft Graph `Event` field                          |
|---------------------------------|--------------------------------------------------------|
| `UID`                           | `iCalUId` (read only; assigned by Graph on write)      |
| `SUMMARY`                       | `subject`                                              |
| `DESCRIPTION`                   | `body.content` with `contentType` = `text`             |
| `LOCATION`                      | `location.displayName`                                 |
| `DTSTART` / `DTEND` (date)      | `start` / `end` at midnight with `isAllDay` = `true`   |
| `DTSTART` / `DTEND` (date-time) | `start.dateTime` + `start.timeZone` (and `end`)        |
| `ORGANIZER`                     | `organizer.emailAddress.address` / `.name`             |
| `ATTENDEE`                      | `attendees[].emailAddress` / `status.response`         |
| `RRULE`                         | `recurrence` (`PatternedRecurrence`)                   |
| `CREATED`                       | `createdDateTime` (read only)                          |
| `LAST-MODIFIED`                 | `lastModifiedDateTime` (read only)                     |

Attendee participation status maps as follows.

| `PARTSTAT`     | Graph `status.response`   |
|----------------|---------------------------|
| `NEEDS-ACTION` | `none` / `notResponded`   |
| `ACCEPTED`     | `accepted`                |
| `DECLINED`     | `declined`                |
| `TENTATIVE`    | `tentativelyAccepted`     |

### Time zones

Graph identifies time zones by name and by default returns Windows zone names such as
`AUS Eastern Standard Time`. The connector ships a Windows-to-IANA mapping so events are read back in
their original zone, giving a faithful round trip for values such as
`DTSTART;TZID=Australia/Melbourne:20260601T093000`.

* A `TZID` naming a known IANA or Windows zone is written with its local time in that zone.
* UTC values, fixed-offset values and unrecognised `TZID` values are converted to the same instant in UTC.
* Floating values (no `TZID` and no `Z`) keep their wall-clock time in the builder's floating time zone,
  which defaults to the JVM's system zone.
* On read, a Graph zone name the connector does not recognise is emitted as a floating value rather than
  being mislabelled as UTC.

### Recurrence

`RRULE` values are converted to Graph's structured recurrence pattern. Daily, weekly, monthly and yearly
rules with `INTERVAL`, `COUNT`, `UNTIL`, a single `BYDAY` week offset or `BYSETPOS`, a single
`BYMONTHDAY` and `BYMONTH` are supported. A weekly rule without `BYDAY` repeats on the `DTSTART` weekday,
as Graph requires. Rules Graph cannot express, such as `FREQ=HOURLY`, several `BYMONTHDAY` values or
`BYDAY=-2FR`, cause the event to be created without recurrence and a warning to be logged.

### Body text

Descriptions are written as plain text. When Graph returns an HTML body, the markup is stripped and the
text is placed in `DESCRIPTION`.

The two builder classes can also be used directly when you want to convert events without going through
a collection. The event builder additionally lets you choose the zone used for floating times.

```java
import org.ical4j.connector.msgraph.MSGraphEventBuilder;
import org.ical4j.connector.msgraph.ICalCalendarBuilder;

com.microsoft.graph.models.Event graphEvent = new MSGraphEventBuilder()
        .vevent(vevent)
        .floatingTimeZone(ZoneId.of("Australia/Melbourne"))
        .build();

Calendar calendar = new ICalCalendarBuilder().build(graphEvent);
```

## Limitations

* Only the series master `VEVENT` in the calendar passed to `add()` is stored. Recurrence overrides
  (instances with a `RECURRENCE-ID`) are ignored with a warning, and `RDATE` and `EXDATE` are dropped.
* `merge()` skips objects that contain no `VEVENT`, such as `VTODO` or `VJOURNAL`, with a warning.
* The submitted `UID` is not preserved. Track events by the identifier returned from `add()` or `merge()`.
* Collection metadata such as `getSupportedComponentTypes()` and the size limits return stub values
  rather than data from Graph.
* Store and collection listener lists are not supported and return `null`.
* The `service` package contains placeholders for To Do, Planner and OneNote integration that are not
  yet implemented.
