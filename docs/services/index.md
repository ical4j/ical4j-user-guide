# iCal4j Services

A collection of iCalendar functions delivered as HTTP services.

## Overview

iCal4j services is a collection of libraries that support deployment as a service. For example:

* [iCal4j Validator]
* [iCal4j Serializer]
* [iCal4j FreeBusy]
* [iCal4j Connector]
* [iCal4j Integration]
* [iCal4j Query]
* [iCal4j User Agent]
* ...

Each of these libraries are bundled with an HTTP Servlet and may be deployed either in a Web container or
standalone with an embedded Jetty server. They are stateless services and containerisation will be supported
to provide maximum choice in how they are deployed.

## Chaining Services

iCal4j services are designed to be able to chain them together to customise according to your requirements.

For example, if you need to send a meeting invitation to a group of individuals you can achieve this as follows:

     ical4j template meeting | ical4j useragent request | ical4j integration send

Here we are using iCal4j template to create a meeting invitation, user agent to format for email, and integration
to send the email to all recipients.

Alternatively, you can listen for requests, validate and add to a calendar store like so:

    ical4j integration receive | ical4j validator check | ical4j connector add --collection=Orders

It is also easy to integrate with other tools, such a JQ for extracting information:

    ical4j connector get --uid 1234 | ical4j serializer serialize | jq '.attendee'


## Examples

The following examples demonstrate how you might use iCal4j services to enhance an application or service.

### Validate (and sanitise) incoming iCalendar data

The issue of calendar spam and other embedded nasties is becoming more of a concern for iCalendar data. The [iCal4j
Validator] can potentially be used to screen incoming data not only for RFC compliance but also against unwanted
or blacklisted content.

### Generate Atom feeds from published iCalendar data

Using the [iCal4j Serializer] you can easily transform iCalendar data to Atom feed data, including expansion of
recurring events.

### Publish free/busy information for published iCalendar data

You may have a need for the [iCal4j FreeBusy] service to generate free/busy data from resource calendars to assist 
with scheduling.

### Query iCalendar data using filter expressions

iCal4j includes support for a filter expression language that may be used to extract information from iCalendar
object data using the [iCal4j Query] service.

### Process iCalendar iTIP for scheduling

The iTIP specification defines how to coordinate iCalendar data between multiple calendar user agents (CUAs), and
the [iCal4j User Agent] simplifies the processing of this data.

### Send and receive iCalendar data asynchronously

TBD.

### Manage iCalendar data with CalDAV

TBD.

[iCal4j Validator]: /validator.md
[iCal4j Serializer]: /serializer.md
[iCal4j FreeBusy]: /freebusy.md
[iCal4j Connector]: /connector.md
[iCal4j Integration]: /integration.md
[iCal4j Query]: /query.md 
[iCal4j User Agent]: /useragent.md
