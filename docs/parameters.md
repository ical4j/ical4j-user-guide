# iCalendar Parameters

[[Javadoc]](https://javadoc.io/doc/org.mnode.ical4j/ical4j/latest/ical4j.core/net/fortuna/ical4j/model/parameter/package-summary.html)

The iCalendar specification defines parameters that may be added to properties to define metadata
such as value type or classification.

## Immutable Classes

In iCal4j parameters are represented by immutable classes. This means that parameters may be shared across
multiple properties as there value will never change.

```java
FmtType format = new FmtType("application/pdf");

Attach attachment1 = new Attach("https://files.example.com/attachments/1.pdf")
        .add(format);
Attach attachment2 = new Attach("https://files.example.com/attachments/2.pdf")
        .add(format);
```

## Predefined Constants

Some parameters are defined with a finite set of possible values, in which case constants are provided.

```java
Attendee attendee1 = new Attendee("mailto:joe@example.com")
        .add(CuType.INDIVIDUAL).add(Role.REQ_PARTICIPANT).add(Rsvp.TRUE);

Attendee attendee2 = new Attendee("mailto:sally@example.com")
        .add(CuType.INDIVIDUAL).add(Role.OPT_PARTICIPANT).add(Rsvp.TRUE);

```
