# iCal4j Connector - Google Calendar

[![javadoc](https://javadoc.io/badge2/org.ical4j/ical4j-connector-google/javadoc.svg)](https://javadoc.io/doc/org.ical4j/ical4j-connector-google)

The Google connector exposes a user's Google Calendar through the standard `ObjectStore` and
`CalendarCollection` interfaces. Each Google calendar becomes a `CalendarCollection`, and each Google
event is converted to and from an iCal4j `Calendar` containing a single `VEVENT`.

## Setup

Add the module to your build. It depends transitively on the Google API client, the Calendar API
service library and the Jetty OAuth helper, so no further Google dependencies are required.

```groovy
dependencies {
    implementation 'org.ical4j:ical4j-connector-google:2.0.0-beta2'
}
```

```xml
<dependency>
    <groupId>org.ical4j</groupId>
    <artifactId>ical4j-connector-google</artifactId>
    <version>2.0.0-beta2</version>
</dependency>
```

### Google Cloud project

The connector needs an OAuth client that is allowed to use the Google Calendar API:

1. Create a project in the [Google Cloud Console](https://console.cloud.google.com/) and enable the
   **Google Calendar API**.
2. Configure the OAuth consent screen and add the `https://www.googleapis.com/auth/calendar` scope.
3. Create an OAuth client ID of type **Desktop app** and download the `client_secret.json` file.

## Authentication

The connector does not perform authentication itself. You construct an authenticated
`com.google.api.services.calendar.Calendar` client and pass it to the store. The `connect()` and
`disconnect()` methods on the store are no-ops that exist only to satisfy the `ObjectStore` interface.

The example below uses the installed-application OAuth flow bundled with the module. It opens a browser
for consent on first run and caches the refresh token under the `tokens` directory for later runs.

```java
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.calendar.Calendar;
import com.google.api.services.calendar.CalendarScopes;

NetHttpTransport transport = GoogleNetHttpTransport.newTrustedTransport();
GsonFactory jsonFactory = GsonFactory.getDefaultInstance();

GoogleClientSecrets secrets = GoogleClientSecrets.load(jsonFactory,
        new InputStreamReader(new FileInputStream("client_secret.json")));

GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
        transport, jsonFactory, secrets, List.of(CalendarScopes.CALENDAR))
        .setDataStoreFactory(new FileDataStoreFactory(new File("tokens")))
        .setAccessType("offline")
        .build();

Credential credential = new AuthorizationCodeInstalledApp(flow, new LocalServerReceiver())
        .authorize("user");

Calendar client = new Calendar.Builder(transport, jsonFactory, credential)
        .setApplicationName("my-application")
        .build();
```

Any other way of obtaining a `Calendar` client works equally well, for example a service account with
domain-wide delegation, or credentials obtained by a web application. Use the `CalendarScopes.CALENDAR_READONLY`
scope if you only need to read events.

## Creating the store

```java
import org.ical4j.connector.google.GoogleCalendarStore;

GoogleCalendarStore store = new GoogleCalendarStore(client);
```

## Working with collections

Google Calendar has no concept of calendar groups, so the store exposes a single workspace named
`ObjectStore.DEFAULT_WORKSPACE`. The workspace-parameterised methods accept that value and throw an
`ObjectStoreException` for any other workspace id.

```java
// exactly one workspace: "default"
List<String> workspaces = store.listWorkspaceIds();

// every calendar the user can see, including subscribed calendars
List<CalendarCollection> collections = store.getCollections();
for (CalendarCollection collection : collections) {
    System.out.println(collection.getDisplayName());
}

// wrap a known calendar id (no request is made until the collection is used)
CalendarCollection primary = store.getCollection("primary");

// create a new calendar owned by the user
CalendarCollection team = store.addCollection("Team Events");

// create with a description and time zone; the id and supported components arguments are ignored
Calendar tz = new Calendar().withComponent(TimeZoneRegistryFactory.getInstance()
        .createRegistry().getTimeZone("Australia/Melbourne").getVTimeZone()).getFluentTarget();
CalendarCollection shared = store.addCollection(null, "Shared", "Shared team events", null, tz);

// delete a calendar, either by id or through the collection
store.removeCollection("abc123@group.calendar.google.com");
shared.delete();
```

Collection ids are Google calendar ids, such as `primary` or `abc123@group.calendar.google.com`.
Listing uses the user's calendar list, so subscribed calendars are included. Only owned calendars can be
modified: attempting to delete a subscribed calendar surfaces the Google API error as an `ObjectStoreException`.

## Working with events

Each event is represented as an iCal4j `Calendar` containing a single `VEVENT`. Events are identified by
their iCalendar `UID`, which Google stores as `iCalUID` and preserves as submitted.

```java
import net.fortuna.ical4j.model.Calendar;
import net.fortuna.ical4j.model.component.VEvent;

CalendarCollection collection = store.getCollection("primary");

// add an event; the returned string is the event's UID
VEvent event = new VEvent(LocalDate.of(2026, 6, 1), "Team offsite");
String uid = collection.add(new Calendar().withComponent(event).getFluentTarget());

// list the UIDs of every event in the calendar
List<String> uids = collection.listObjectUIDs();

// fetch a single event by UID
Optional<Calendar> found = collection.get(uid);
```

Listing and lookup transparently follow Google's page tokens, so large calendars are returned in full.
Note that `get(uid)` scans the calendar's event list to find a matching `iCalUID`, so it is linear in the
size of the calendar.

## Field mapping

The following properties are mapped in both directions. Any other property on the `VEVENT` is dropped
without error when writing to Google.

| iCal4j `VEVENT` property        | Google `Event` field                              |
|---------------------------------|---------------------------------------------------|
| `UID`                           | `iCalUID`                                         |
| `SUMMARY`                       | `summary`                                         |
| `DESCRIPTION`                   | `description`                                     |
| `LOCATION`                      | `location`                                        |
| `DTSTART` / `DTEND` (date)      | `start.date` / `end.date`                         |
| `DTSTART` / `DTEND` (date-time) | `start.dateTime` + `start.timeZone` (and `end`)   |
| `ORGANIZER`                     | `organizer.email` / `organizer.displayName`       |
| `ATTENDEE`                      | `attendees[].email` / `displayName` / `responseStatus` |
| `RRULE` / `RDATE` / `EXDATE`    | `recurrence[]` (raw iCalendar lines, passed through) |
| `CREATED`                       | `created`                                         |
| `LAST-MODIFIED`                 | `updated`                                         |

Attendee participation status maps as follows.

| `PARTSTAT`     | Google `responseStatus` |
|----------------|-------------------------|
| `NEEDS-ACTION` | `needsAction`           |
| `ACCEPTED`     | `accepted`              |
| `DECLINED`     | `declined`              |
| `TENTATIVE`    | `tentative`             |

Date-time values carrying a `TZID` are written with that zone id. UTC values are written with the `UTC`
zone. Recurrence rules are passed to Google verbatim, so anything Google accepts in an `RRULE` is supported.

The two builder classes can also be used directly when you want to convert events without going through
a collection:

```java
import org.ical4j.connector.google.GoogleEventBuilder;
import org.ical4j.connector.google.ICalCalendarBuilder;

com.google.api.services.calendar.model.Event googleEvent =
        new GoogleEventBuilder().vevent(vevent).build();

Calendar calendar = new ICalCalendarBuilder().build(googleEvent);
```

## Limitations

* `merge()`, `export()` and `removeAll()` on `GoogleCalendarCollection` are not yet implemented. They return
  an empty array, `null` and an empty list respectively. Use `add()`, `get()` and `listObjectUIDs()` instead.
* Only the first `VEVENT` in the calendar passed to `add()` is stored. Recurrence overrides (instances with a
  `RECURRENCE-ID`) are not written, and Google's own exception instances are not reconstructed on read.
* Collection metadata such as `getTimeZone()`, `getSupportedComponentTypes()` and the size limits return
  stub values rather than data from Google.
* Store and collection listener lists are not supported and return `null`.
* Google-specific features with no iCalendar equivalent (Meet links, reminders, colours, attachments) are
  not mapped.
