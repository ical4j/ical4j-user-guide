# iCal4j Examples - Output

This page provides examples of using an iCal4j model to generate iCalendar (*.ics) files.

## Generating a calendar file

```java
FileOutputStream fout = new FileOutputStream("mycalendar.ics");

CalendarOutputter outputter = new CalendarOutputter();
outputter.output(calendar, fout);
```
