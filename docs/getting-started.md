# Getting Started

iCal4j provides solutions for many scenarios involving the iCalendar and vCard specifications. Here you
will find an explanation of some of the features available and when to use them.

## iCal4j

If you are interested in creating iCalendar object definitions (i.e. *.ics format), you can use the core
iCal4j library. This library supports creation of iCalendar object [models](examples/model.md), including
[validation](validation.md) and [export](examples/output.md) to a file. See the [examples](examples/index.md) for
how to build iCalendar objects.

Similarly, if you want to [parse](parser.md) and work with existing iCalendar data the core library also
supports this. In addition to validation you can perform [filtering](filtering.md) and [lookups](indexing.md)
on model data, and [generate](examples/recur.md) temporal information from [recurring](recurrences.md) events, etc.

## iCal4j Extensions

If your object model requires support for extended component or properties, you can include the 
[extensions](extensions/index.md) library in your classpath. This includes support for things like
[CalDAV](extensions/caldav.md) extensions, `X-WR-TIMEZONE`, and more properties not found in the core specifications.

## iCal4j vCard

If you need to create or parse vCard data (i.e. *.vcf format) you can use the [vCard](vcard/index.md) library. This library is
an extension to the core library and shares some of the same foundations, including support for validation
and filtering.

## iCal4j Zoneinfo Outlook

If you have data compatibility concerns regarding [timezones](timezones.md), you might try using the
[Zoneinfo Outlook](zoneinfo-outlook.md) library. This provides an alternate set of timezone data that use 
simplified recurrence definitions.

## iCal4j Template

If you are unsure of which properties you need to use for maximum compatibility with all Calendar User Agents,
you can try the [template](template/index.md) library. This library provides support for creating and modifying 
iCalendar objects to conform with a predefined object type.

## iCal4j Command

The [command](command/index.md) library provides an execution framework for common operations when working with iCalendar.
This library is also distributed as a command-line application that can be used with iCalendar without any
coding required.

## iCal4j Connector

If you want to access a persistent calendar store you can use the [connector](connector/index.md) library. This library
supports [CalDAV/CardDAV](connector/dav.md) repositories, as well as a simple [local](connector/local.md) filesystem store.

## iCal4j Integration

For publishing and consuming iCalendar objects from external actors, the [integration](integration/index.md) library
provides support for common transports such as [email](integration/email.md).

## iCal4j Serializer

iCalendar includes specifications for converting to and from equivalent XML/JSON formats, which is supported
by the [serializer](serializer/index.md) library. This library also includes support for other conversions including 
[JMAP](serializer/jmap.md), Atom, and a custom JSON-based format for API development ([JOTN](serializer/jotn/index.md)).

## iCal4j Streams

If you are implementing workflow automation as part of your iCalendar use-case, you may want to look at the
[streams](streams/index.md) library. This includes a simple workflow definition language and engine for producing tasks that
may be subsequently acted upon by one or more execution agents.

## Adding iCal4j to your project

All libraries are published to Maven Central. See [Installation](installation.md) for the current
coordinates of each library.
