# Getting Started

iCal4j provides solutions for many scenarios involving the iCalendar and vCard specifications. Here you
will find an explanation of some of the features available and when to use them.

## iCal4j

If you are interested in creating iCalendar object definitions (i.e. *.ics format), you can use the core
iCal4j library. This library supports creation of iCalendar object [models](/examples/model), including
[validation](/validation) and [export](/examples/output) to a file. See the [examples](/examples) for
how to build iCalendar objects.

Similarly, if you want to [parse](/parser) and work with existing iCalendar data the core library also
supports this. In addition to validation you can perform [filtering](/filtering) and [lookups](/indexing)
on model data, and [generate](/examples/recur) temporal information from [recurring](/recurrences) events, etc.

## iCal4j Extensions

If your object model requires support for extended component or properties, you can include the 
[extensions](/extensions) library in your classpath. This includes support for things like
[CalDAV](/extensions/caldav) extensions, `X-WR-TIMEZONE`, and more properties not found in the core specifications.

## iCal4j vCard

If you need to create or parse vCard data (i.e. *.vcf format) you can use the [vCard](/vcard) library. This library is
an extension to the core library and shares some of the same foundations, including support for validation
and filtering.

## iCal4j Zoneinfo Outlook

If you have data compatibility concerns regarding [timezones](/timezones), you might try using the
[Zoneinfo Outlook](/zoneinfo-outlook) library. This provides an alternate set of timezone data that use 
simplified recurrence definitions.

## iCal4j Template

If you are unsure of which properties you need to use for maximum compatibility with all Calendar User Agents,
you can try the [template](/template) library. This library provides support for creating and modifying 
iCalendar objects to conform with a predefined object type.

## iCal4j Command

The [command](/command) library provides an execution framework for common operations when working with iCalendar.
This library is also distributed as a command-line application that can be used with iCalendar without any
coding required.

## iCal4j Connector

If you want to access a persistent calendar store you can use the [connector](/connector) library. This library
supports [CalDAV/CardDAV](/connector/dav) repositories, as well as a simple [local](/connector/local) filesystem store.

## iCal4j Integration

For publishing and consuming iCalendar objects from external actors, the [integration](/integration) library
provides support for common transports such as [email](/integration/email).

## iCal4j Serializer

iCalendar includes specifications for converting to and from equivalent XML/JSON formats, which is supported
by the [serializer](/serializer) library. This library also includes support for other conversions including 
[JMAP](/serializer/jmap), Atom, and a custom JSON-based format for API development ([JOTN](/serializer/jotn)).

## iCal4j Streams

If you are implementing workflow automation as part of your iCalendar use-case, you may want to look at the
[streams](/streams) library. This includes a simple workflow definition language and engine for producing tasks that
may be subsequently acted upon by one or more execution agents.


## Maven Dependencies

iCal4j libraries are currently published directly to [Maven Central](https://search.maven.org). Use the following
table to identify current coordinates for iCal4j libraries:

   | Name                    | Current Coordinates                                                                                                    | Deprecated Coordinates                                                                                                                                                                                         |
|-------------------------|------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ical4j                  | [org.mnode.ical4j:ical4j](https://search.maven.org/artifact/org.mnode.ical4j/ical4j)                                   | -                                                                                                                                                                                                              |
| ical4j-vcard            | [org.mnode.ical4j:ical4j-vcard](https://search.maven.org/artifact/org.mnode.ical4j/ical4j-vcard)                       | -                                                                                                                                                                                                              |
| ical4j-extensions       | [org.mnode.ical4j:ical4j-extensions](https://search.maven.org/artifact/org.mnode.ical4j/ical4j-extensions)             | -                                                                                                                                                                                                              |
| ical4j-zoneinfo-outlook | [org.mnode.ical4j:ical4j-zoneinfo-outlook](https://search.maven.org/artifact/org.mnode.ical4j/ical4j-zoneinfo-outlook) | -                                                                                                                                                                                                              |
| ical4j-template         | <a href="https://search.maven.org/artifact/org.ical4j/ical4j-template" target="_blank">org.ical4j:ical4j-template</a>  | -                                                                                                                                                                                                              |
| ical4j-command          | <a href="https://search.maven.org/artifact/org.ical4j/ical4j-command" target="_blank">org.ical4j:ical4j-command</a>    | ~~[org.ical4j:ical4j-validator](https://search.maven.org/artifact/org.ical4j/ical4j-validator)~~                                                                                                               |
| ical4j-connector        | [org.ical4j:ical4j-connector](https://search.maven.org/search?q=g:org.ical4j%20a:ical4j-connector*)                    | [org.mnode.ical4j:ical4j-connector](https://search.maven.org/artifact/org.mnode.ical4j/ical4j-connector)                                                                                                       |
| ical4j-integration      | [org.ical4j:ical4j-integration](https://search.maven.org/search?q=g:org.ical4j%20a:ical4j-integration*)                | [org.mnode.ical4j:ical4j-integration](https://search.maven.org/artifact/org.mnode.ical4j/ical4j-integration)                                                                                                   |
| ical4j-serializer       | [org.ical4j:ical4j-serializer](https://search.maven.org/artifact/org.ical4j/ical4j-serializer)                         | [org.mnode.ical4j:ical4j-serializer](https://search.maven.org/artifact/org.mnode.ical4j/ical4j-serializer), ~~[org.mnode.ical4j:ical4j-json](https://search.maven.org/artifact/org.mnode.ical4j/ical4j-json)~~ |
| ical4j-actions          | Coming Soon                                                                                                            | -                                                                                                                                                                                                              |

