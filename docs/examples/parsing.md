# iCal4j Examples - Parsing

This page provides examples of using iCal4j to parse iCalendar (*.ics) files.

## Parsing a calendar file

```java
FileInputStream fin = new FileInputStream("mycalendar.ics");
CalendarBuilder builder = new CalendarBuilder();
Calendar calendar = builder.build(fin);
```

## Parsing a calendar string

```java
String myCalendarString = ...
StringReader sin = new StringReader(myCalendarString);
CalendarBuilder builder = new CalendarBuilder();
Calendar calendar = builder.build(sin);
```

