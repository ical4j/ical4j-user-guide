# iCal4j Examples - Filtering

This page provides examples of using iCal4j to filter iCal4j objects.

## Filtering events

The correct way to filter events according to the spec (RFC2445) would be to construct a VFREEBUSY request that represents the properties of events that you are interested in. You would then pass this request as an argument to the constructor of a new VFREEBUSY, along with the list of components (events) you want to inspect to derive a VFREEBUSY instance that represents the consumed/free time based on the specified events (see the [API Documentation](http://ical4j.github.io/docs/ical4j/api/3.0.19/net/fortuna/ical4j/model/component/VFreeBusy.html) for more information).

If instead you would like to identify specific events occurring within a time frame, you can use iCal4j filters to filter components within a specified period. For example, to filter a list of events only occurring today you might do the following:

```java
java.util.Calendar today = java.util.Calendar.getInstance();
today.set(java.util.Calendar.HOUR_OF_DAY, 0);
today.clear(java.util.Calendar.MINUTE);
today.clear(java.util.Calendar.SECOND);

// create a period starting now with a duration of one (1) day..
Period period = new Period(new DateTime(today.getTime()), new Dur(1, 0, 0, 0));
Filter filter = new Filter(new PeriodRule(period));

List eventsToday = filter.filter(calendar.getComponents(Component.VEVENT));
```
