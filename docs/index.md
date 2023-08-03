[iCalendar]: http://en.wikipedia.org/wiki/ICalendar

[Bintray Releases]: https://bintray.com/ical4j/maven/ical4j

[Java Legacy Date-Time Code]: https://docs.oracle.com/javase/tutorial/datetime/iso/legacy.html

[RFC4791]: https://www.rfc-editor.org/rfc/rfc4791.html
[RFC5545]: https://tools.ietf.org/html/rfc5545
[RFC5546]: https://tools.ietf.org/html/rfc5546
[RFC6047]: https://datatracker.ietf.org/doc/html/rfc6047
[RFC6321]: https://www.rfc-editor.org/rfc/rfc6321.html
[RFC6350]: https://www.rfc-editor.org/rfc/rfc6350.html
[RFC6351]: https://www.rfc-editor.org/rfc/rfc6351.html
[RFC6352]: https://www.rfc-editor.org/rfc/rfc6352.html
[RFC6473]: https://www.rfc-editor.org/rfc/rfc6473.html
[RFC6474]: https://www.rfc-editor.org/rfc/rfc6474.html
[RFC6868]: https://datatracker.ietf.org/doc/html/rfc6868
[RFC6869]: https://www.rfc-editor.org/rfc/rfc6869.html
[RFC7095]: https://www.rfc-editor.org/rfc/rfc7095.html
[RFC7265]: https://www.rfc-editor.org/rfc/rfc7265.html
[RFC7953]: https://datatracker.ietf.org/doc/html/rfc7953
[RFC7986]: https://datatracker.ietf.org/doc/html/rfc7986
[RFC7529]: https://datatracker.ietf.org/doc/html/rfc7529
[RFC8984]: https://www.rfc-editor.org/rfc/rfc8984.html
[RFC9073]: https://datatracker.ietf.org/doc/html/rfc9073
[RFC9074]: https://datatracker.ietf.org/doc/html/rfc9074
[RFC9253]: https://www.rfc-editor.org/rfc/rfc9253.html

# Introduction

The iCal4j project is a collection of Open Source Java libraries providing support for the iCalendar
specifications (RFCs).

The core iCal4j library provides an implementation of the iCalendar [specifications](https://www.ical4j.org/rfcs/) that
are designed to facilitate interoperability between calendaring and scheduling software systems.

iCalendar provides a common data format used to store scheduling information such as events, appointments, to-do lists, etc.
Most calendaring tools include some level of support for the iCalendar standard.

## Active Projects

The following table provides an overview of the currently active projects in iCal4j.

   | Name                                         | Description                                                                           | References                                                                               |
|----------------------------------------------|---------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------|
| [ical4j](/examples)                          | Support for the iCalendar standard                                                    | [RFC5545], [RFC5546], [RFC6868], [RFC7953], [RFC7986], [RFC7529], [RFC9073], [RFC9074], [RFC9253] |
| [ical4j-extensions](/extensions)             | Support for non-standard iCalendar components and properties                          | -                                                                                        |
| [ical4j-zoneinfo-outlook](/zoneinfo-outlook) | Alternate timezone definitions to improve support for MS Outlook                      | -                                                                                        |
| [ical4j-vcard](/vcard)                       | Support for the vCard standard                                                        | [RFC6350], [RFC6473], [RFC6474], [RFC6868], [RFC6869]                                    |
| [ical4j-template](/template)                 | Template calendar and card object builders to assist with data creation               | -                                                                                        |
| [ical4j-connector](/connector)               | Support for connecting to calendar and card store implementations (e.g. CalDAV)       | [RFC4791], [RFC6352]                                                                     |
| [ical4j-integration](/integration)           | Support for delivery of calendar and card objects via common transports (e.g Email)   | [RFC6047]                                                                                |
| [ical4j-command](/command)                   | Command-line support for calendar and card operations                                 | -                                                                                        |
| [ical4j-serializer](/serializer)             | Serialization of calendar data to standard formats (e.g xCal, jCal, JSCalendar, etc.) | [RFC6321], [RFC6351], [RFC7095], [RFC7265], [RFC8984]                                    |
| [tzurl](/tzurl)                              | Generation and hosting of timezone data in iCalendar format                           | -                                                                                        |


## Further Links

 - For a concise description of the goals and directions of iCal4j please
 take a look at the [open issues](https://github.com/ical4j/ical4j/issues).

 - In this guide You will find [examples](https://www.ical4j.org/examples/) of how to use iCal4j, as well as throughout the [API documentation](https://ical4j.github.io/docs/ical4j/api).

 - Detailed descriptions of changes included in each release may be found
 in the [CHANGELOG](https://ical4j.github.io/docs/ical4j/release-notes).
 
 - iCal4j was created with the help of [Open Source](http://opensource.org) software.
