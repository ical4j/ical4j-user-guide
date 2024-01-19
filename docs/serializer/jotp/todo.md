# iCal4j Serializer - JOT ToDo

The JOT ToDo serializer supports the incremental build of workflow-based actions such as tasks.

## Overview

A VTODO component may include the following properties once:

* DTSTAMP
* UID
* CLASS
* CREATED
* DESCRIPTION
* DTSTART
* GEO
* LAST-MODIFIED
* LOCATION
* ORGANIZER
* PERCENT-COMPLETE
* PRIORITY
* RECURRENCE-ID
* SEQUENCE
* STATUS
* SUMMARY
* URL
* RRULE
* DUE
* DURATION

The following properties may occur more than once:

* ATTACH
* ATTENDEE
* CATEGORIES
* COMMENT
* CONTACT
* EXDATE
* RSTATUS
* RELATED
* RESOURCES
* RDATE

## HTTP Payloads

Combined with HTTP verbs an API for workflow management can be created.

