# iCal4j - Validator

The iCal4j Validator is a service that provides a thin veneer over the iCal4j validation framework.

## Command line usage

### Generate validation report

    ical4j-validator/bin/ical4j-validator report -F ./OZMovies.ics

Result:

```
- ERROR: VCALENDAR - If one is present, ALL others MUST NOT be present: VEVENT,VFREEBUSY,VTODO,VJOURNAL
```
