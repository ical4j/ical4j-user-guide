# iCal4j Template

[[Javadoc]](https://javadoc.io/doc/org.ical4j/ical4j-template)

iCal4j Template provides prototypes for common iCalendar and vCard use-cases.

## Overview

Whilst the iCalendar and vCard specifications provide generalized component and property constraints, some applications
may require further constraints to fulfill the requirements of the use-case. iCal4j Templates provides some
opinionated prototyping and templating for common use-cases.

## Usage

iCal4j template currently provides model and view support for iCalendar and vCard prototypes. The model
is used to create and manipulate iCalendar and vCard objects that conform with the included prototypes.
The view provides helpers for rendering data with [Handlebars](http://jknack.github.io/handlebars.java/),
which may be useful rendering objects in HTML or other formats.

### Prototypes

Prototyping consists of three features that may be used to create or update objects. Instantiating a
prototype template instance supports providing an existing component instance that is used to configure
the baseline properties and subcomponents.

The template itself supports the builder pattern to configure applicable properties and subcomponents.

And finally when a prototype template is applied, you can optionally supply an existing component
instance that will be modified in-place.

#### Create a default object using the meeting prototype template

```java
VEvent meeting = new Meeting().apply();
```

#### Create a meeting, using an existing event as the baseline

```java
VEvent baseline = ...
VEvent meeting = new Meeting(baseline).apply();
```

#### Update an existing meeting to comply with the prototype

```java
VEvent existing = ...
existing = new Meeting().apply(existing);
```

### Handlebars

TBD.


## Semantic Calendaring

iCal4j supports prototype definitions defined by [Semantic Calendaring](https://www.semcal.org/concepts).
