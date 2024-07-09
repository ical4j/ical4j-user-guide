# iCalendar Properties

In the iCalendar specification properties are used to define features of iCalendar objects
or components embedded within them (e.g. `VEVENT`, `VTIMEZONE`, etc.).

## Mutable by default

Properties in iCal4j are mutable, so you should be careful not to share them between objects
and components.

```java
DtStart start = new DtStart("20251225");
VEvent christmas = new VEvent("Christmas Day").add(start);

## AVOID THIS!!
start.setValue("20260101");
VEvent newYear = new VEvent("New Years Day").add(start);

## THIS IS OK.
start = new DtStart("20251226");
VEvent boxingDay = new VEvent("Boxing Day").add(start);

```

## Immutable instances

There are some exceptions where sharing properties is safe, when they are defined as
immutable instances. These represent properties defined by the specification with
no variable elements (e.g. `VERSION`, `CALSCALE`, `METHOD`, etc.).

```java
VEvent event1 = new VEvent("Meeting 1").add(ImmutableTransp.OPAQUE)
        .ImmutableClazz.PRIVATE;
VEvent event2 = new VEvent("Meeting 2").add(ImmutableTransp.OPAQUE)
        .ImmutableClazz.PRIVATE;

```