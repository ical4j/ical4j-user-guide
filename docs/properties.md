# iCalendar Properties

[[Javadoc]](https://javadoc.io/doc/org.mnode.ical4j/ical4j/latest/ical4j.core/net/fortuna/ical4j/model/property/package-summary.html)

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
        .add(ImmutableClazz.PRIVATE);
VEvent event2 = new VEvent("Meeting 2").add(ImmutableTransp.OPAQUE)
        .add(ImmutableClazz.PRIVATE);

```

## Equality

Two property instances are considered equal if they share the same name, value and list of parameters.

## Factory

Each property type defines a factory that may be used for creating new instances. Where the factory
differs from typical constructor usage is that constant immutable instances will be returned
where applicable.

```java
new Clazz.Factory().createProperty(new ParameterList(), "PUBLIC") == ImmutableClazz.PUBLIC
```

## Immutable Collections

In iCal4j we use specific collection implementations to improve support for functional
programming. The `PropertyList` is one such implementation that will return a new collection
instance when applying mutator operations.

```java
PropertyList list1 = new PropertyList();
PropertyList list2 = list1.add(new DtStamp());
// list2 != list1
```

Where an operation does not result in any change, the original instance is returned.

```java
PropertyList list3 = list2.remove(ImmutableClazz.PRIVATE);
// list3 == list2
```
