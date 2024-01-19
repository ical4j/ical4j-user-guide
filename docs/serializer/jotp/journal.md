# iCal4j Serializer - JOT Journal

The JOT Journal serializer supports the incremental build of records such as notes and annotations.

## Overview

A JOURNAL component may include the following properties once:

* DTSTAMP
* UID
* CLASS
* CREATED
* DTSTART
* LAST-MODIFIED
* ORGANIZER
* RECURRENCE-ID
* SEQUENCE
* STATUS
* SUMMARY
* URL
* RRULE

The following properties may occur more than once:

* ATTACH
* ATTENDEE
* CATEGORIES
* COMMENT
* CONTACT
* DESCRIPTION
* EXDATE
* RELATED
* RDATE
* RSTATUS

## HTTP Payloads

Combined with HTTP verbs an API for knowledge management can be created.


