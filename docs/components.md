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

  | Property Accessor                | Supported Properties                                                                                                              |
|----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| ChangeManagementPropertyAccessor | `CREATED`, `DTSTAMP`, `LAST-MODIFIED`, `SEQUENCE`                                                                                 |
| DateTimePropertyAccessor         | `COMPLETED`, `DTEND`, `DUE`, `DTSTART`, `DURATION`, `FREEBUSY`, `TRANSP`                                                          |
| DescriptivePropertyAccessor      | `ATTACH`, `CATEGORIES`, `CLASS`, `COMMENT`, `DESCRIPTION`, `GEO`, `LOCATION`, `PERCENT-COMPLETE`, `PRIORITY`, `STATUS`, `SUMMARY` |
| RelationshipPropertyAccessor     | `ATTENDEE`, `CONTACT`, `ORGANIZER`, `RECURRENCE-ID`, `RELATED-TO`, `URL`                                                          |
