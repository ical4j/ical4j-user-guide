# iCal4j Query

Query iCalendar data using iCal4j filter expressions.

## Command line usage

### Find Boxing Day in a collection of public holidays

    ical4j-query/bin/ical4j-query calendar-collection -F ./Australian32Holidays.ics -X summary="Boxing Day"

Result:

```
BEGIN:VCALENDAR
BEGIN:VEVENT
UID:D41666AF-C414-11D6-BA97-003065F198AC
DTSTAMP:20020906T094459Z
SUMMARY:Boxing Day
RRULE:FREQ=YEARLY;INTERVAL=1;BYMONTH=12
DTSTART;VALUE=DATE:20021226
DTEND;VALUE=DATE:20021227
END:VEVENT
END:VCALENDAR
```