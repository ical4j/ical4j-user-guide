# iCalendar Components

Components in iCalendar are used to encapsulate a group of properties (and subcomponents) that
define a specific type of content. For example, events, to-dos and journals
are all defined as components of an iCalendar object.

## Calendar Components

Some components may be added directly to an iCalendar object, whereas others are used as
subcomponents to these top-level components. In iCal4j top-level components are known as
_Calendar Components_ and extend the `CalendarComponent` abstract class.

| Calendar Components |
|---------------------|
| `VEVENT`            |
| `VTODO`             |
| `VJOURNAL`          |
| `VFREEBUSY`         |
| `VTIMEZONE`         |
| `VAVAILABILITY`     |


## Subcomponents

Subcomponents are nested components, and can be multiple levels deep. For example, an
event may have a nested alarm component, which in turn has a nested location component
for a proximity trigger.

| Component       | Subcomponents                                     |
|-----------------|---------------------------------------------------|
| `VEVENT`        | `VALARM`, `PARTICIPANT`, `VLOCATION`, `VRESOURCE` |
| `VTODO`         | `VALARM`, `PARTICIPANT`, `VLOCATION`, `VRESOURCE` |
| `VJOURNAL`      | `PARTICIPANT`, `VLOCATION`, `VRESOURCE`           |
| `VFREEBUSY`     | `PARTICIPANT`, `VLOCATION`, `VRESOURCE`           |
| `VTIMEZONE`     | `STANDARD`, `DAYLIGHT`                            |
| `VAVAILABILITY` | `AVAILABLE`                                       |
| `VALARM`        | `VLOCATION`                                       |
| `PARTICIPANT`   | `VLOCATION`, `VRESOURCE`                          |

## Property Accessors

Each component may implement one or more property accessors, which provide convenience
methods for retrieval of different property types.

```java
Optional<DtStart> start = event.getDtStart();

List<Categories> categories = todo.getCategories();
```

| Property Accessor                | Supported Properties                                                                                                              |
|----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| ChangeManagementPropertyAccessor | `CREATED`, `DTSTAMP`, `LAST-MODIFIED`, `SEQUENCE`                                                                                 |
| DateTimePropertyAccessor         | `COMPLETED`, `DTEND`, `DUE`, `DTSTART`, `DURATION`, `FREEBUSY`, `TRANSP`                                                          |
| DescriptivePropertyAccessor      | `ATTACH`, `CATEGORIES`, `CLASS`, `COMMENT`, `DESCRIPTION`, `GEO`, `LOCATION`, `PERCENT-COMPLETE`, `PRIORITY`, `STATUS`, `SUMMARY` |
| RelationshipPropertyAccessor     | `ATTENDEE`, `CONTACT`, `ORGANIZER`, `RECURRENCE-ID`, `RELATED-TO`, `URL`                                                          |

## Property Modifiers

The iCalendar specification defines which properties are applicable, along with their cardinality for 
iCalendar objects and components. Property modifiers provide a safe way to modify properties for existing
objects and components that comply with the rules of the iCalendar specification.

```java
event.with(DTSTART, new DtStart("20240101T0900000"));

todo.with(CATEGORIES, new Categories("travel"));
```

| Property Modifier                 | Supported Properties                                                     |
|-----------------------------------|--------------------------------------------------------------------------|
| ChangeManagementPropertyModifiers | `CREATED`, `DTSTAMP`, `LAST-MODIFIED`, `SEQUENCE`, `SEQUENCE_INCREMENT`   |
| DateTimePropertyModifiers         | `COMPLETED`, `DTEND`, `DUE`, `DTSTART`, `DURATION`, `FREEBUSY`, `TRANSP` |
| DescriptivePropertyModifiers      | `ATTACH`, `CATEGORIES`, `DESCRIPTION`, `SUMMARY`                         |
| RecurrencePropertyModifiers       | `EXDATE`, `RDATE`, `RRULE`                                               |
| RelationshipPropertyModifiers     | `ATTENDEE`, `CONTACT`, `ORGANIZER`, `RECURRENCE-ID`, `RELATED-TO`, `URL` |

## Component Accessors

Component accessors provide convenience methods for subcomponent retrieval, and are implemented by components
that support nested subcomponents.

| Component Accessor   | Supported Components |
|----------------------|----------------------|
| AlarmsAccessor       | `VALARM`             |
| LocationsAccessor    | `VLOCATION`          |
| ParticipantsAccessor | `PARTICIPANT`        |
| ResourcesAccessor    | `VRESOURCE`          |



## Recurrence Support

Some components support the concept of recurrence, which may be defined by the inclusion of `RRULE`,
`RDATE` and/or `EXDATE` properties. Components that support these properties also implement the
`RecurrenceSupport` interface which defines methods for calculating discrete occurrences.

```java
Period period = new Period("20230301/P1M");

List<VEvent> occurrences = event.getOccurrences(period);

Set<Period> recurrenceSet = event.calculateRecurrenceSet(period);
```