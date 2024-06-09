# iCal4j Command - Calendar

Calendar commands are used to parse, transform and validate existing iCalendar data.

## Validate

### Generate validation report

    ical4j calendar validate -file ./OZMovies.ics

Result:

```
- ERROR: VCALENDAR - If one is present, ALL others MUST NOT be present: VEVENT,VFREEBUSY,VTODO,VJOURNAL
```

## Serialize

TBD.

## Filter

TBD.

## Replace UIDs

TBD.
