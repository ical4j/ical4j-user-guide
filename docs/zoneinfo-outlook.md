# iCal4j ZoneInfo Outlook

[![javadoc](https://javadoc.io/badge2/org.mnode.ical4j/ical4j-zoneinfo-outlook/javadoc.svg)](https://javadoc.io/doc/org.mnode.ical4j/ical4j-zoneinfo-outlook)

iCal4j ZoneInfo Outlook provides alternate timezone definitions that may provide greater compatibility with certain versions of Microsoft Outlook.

## Usage

To use the alternate timezone definitions you may create a custom TimeZoneRegistry instance using the applicable prefix:

```java
CalendarParser parser = CalendarParserFactory.getInstance().createParser();

PropertyFactoryRegistry propertyFactoryRegistry = new PropertyFactoryRegistry();
propertyFactoryRegistry.register(WrTimezone.PROPERTY_NAME, WrTimezone.FACTORY);
propertyFactoryRegistry.register(WrCalName.PROPERTY_NAME, WrCalName.FACTORY);

ParameterFactoryRegistry parameterFactoryRegistry = new ParameterFactoryRegistry();

TimeZoneRegistry tzRegistry = new TimeZoneRegistryImpl("zoneinfo-outlook/");

builder = new CalendarBuilder(parser, propertyFactoryRegistry, parameterFactoryRegistry, tzRegistry);
```

A convenient factory for the Outlook-compatible definitions is also provided, so in such cases all you need to do is add the following property to your ical4j.properties included in your classpath:

```properties
net.fortuna.ical4j.timezone.registry=net.fortuna.ical4j.zoneinfo.outlook.OutlookTimeZoneRegistryFactory
```

## Minimum requirements

None.

## Project Information

* [Project Home](http://github.com/ical4j/ical4j-zoneinfo-outlook/)
* [Javadocs](http://ical4j.github.io/docs/ical4j-zoneinfo-outlook/api/)

## Download

* [Releases](https://bintray.com/ical4j/maven/ical4j-zoneinfo-outlook)
