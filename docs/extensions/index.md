# iCal4j Extensions

[![javadoc](https://javadoc.io/badge2/org.mnode.ical4j/ical4j-extensions/javadoc.svg)](https://javadoc.io/doc/org.mnode.ical4j/ical4j-extensions)

## Overview

iCal4j Extensions is a Java library that provides support for extension (and some non-standard) iCalendar properties
and components. This includes support for [CalDAV](caldav.md) properties, common Calendar User Agents (CUAs) such as
[Microsoft Outlook](outlook.md), and convenience implementations of components and properties not explicitly defined in the core
specifications.

This library also defines a collection of [strategies](strategy.md), which are opinionated approaches to constructing iCalendar
and vCard objects for common use-cases.

## Experimental Properties

| Name | Description | References |
|------|-------------|------------|
| X-CALSTART |||
| X-LIC-LOCATION |||
| X-WR-ALARMID |||
| X-WR-CALDESC |||
| X-WR-CALNAME |||
| X-WR-RELCALID |||
| X-WR-TIMEZONE |||

## Usage

To add support for extensions you may register the required factories with your CalendarBuilder instance:

```java
CalendarParser parser = CalendarParserFactory.getInstance().createParser();

PropertyFactoryRegistry propertyFactoryRegistry = new PropertyFactoryRegistry();
propertyFactoryRegistry.register(WrTimezone.PROPERTY_NAME, WrTimezone.FACTORY);
propertyFactoryRegistry.register(WrCalName.PROPERTY_NAME, WrCalName.FACTORY);

ParameterFactoryRegistry parameterFactoryRegistry = new ParameterFactoryRegistry();

TimeZoneRegistry tzRegistry = TimeZoneRegistryFactory.getInstance().createRegistry();

builder = new CalendarBuilder(parser, propertyFactoryRegistry, parameterFactoryRegistry, tzRegistry);
```

## Minimum requirements

iCal4j Extensions requires a minimum of Java 5 due to the use of features introduced in this version. If you need to run on an earlier version of Java, consider using [Retroweaver](http://retroweaver.sourceforge.net).

## Project Information

* [Project Home](http://github.com/ical4j/ical4j-extensions/)
* [Javadocs](http://ical4j.github.io/docs/ical4j-extensions/api/)

## Download

* [Releases](https://bintray.com/ical4j/maven/ical4j-extensions)

Traditionally any components, properties and parameters not defined by [RFC2445](http://www.ietf.org/rfc/rfc2445.txt) are classified as <em>non-standard</em> or <em>extension</em> objects. These objects must include the <strong>"X-"</strong> name prefix to be compliant with the specification.

In the iCal4j object model, these objects are represented by the XComponent, XProperty and XParameter classes respectively. Names that do not conform to the <strong>"X-"</strong> name prefix requirement may be supported by enabling the following Compatibility Hint:

```properties
ical4j.parsing.relaxed=true
```

##  Extension Factory Registration 

There are a number of deficiences with above approach, most notably that only <em>String</em> values are supported by X{Component|Property|Parameter}, and there is no option for supporting some well-known non-standard objects.

###  PropertyFactoryRegistry 

You can now add support for extension properties by registering custom <em>PropertyFactory</em> implementations:

```java
PropertyFactory somePropertyFactory = ...

PropertyFactoryRegistry propertyFactoryRegistry = new PropertyFactoryRegistry();
propertyFactoryRegistry.register(somePropertyFactory);

CalendarBuilder builder = new CalendarBuilder(CalendarParserFactory.getInstance().createParser(),
    ComponentFactory.getInstance(),
    propertyFactoryRegistry,
    new ParameterFactoryRegistry(),
    TimeZoneRegistryFactory.getInstance().createRegistry());

Calendar calendar = builder.build(..);
```

###  ParameterFactoryRegistry 

Extension parameters are also supported:

```java
ParameterFactory someParameterFactory = ...

ParameterFactoryRegistry parameterFactoryRegistry = new ParameterFactoryRegistry();
parameterFactoryRegistry.register(someParameterFactory);

CalendarBuilder builder = new CalendarBuilder(CalendarParserFactory.getInstance().createParser(),
    ComponentFactory.getInstance(),
    new PropertyFactoryRegistry(),
    parameterFactoryRegistry,
    TimeZoneRegistryFactory.getInstance().createRegistry());

Calendar calendar = builder.build(..);
```

##  Common Extensions 

A collection of commonly used iCalendar extension objects are available in the [[Extensions|ical4j-extensions]] sub-project.
