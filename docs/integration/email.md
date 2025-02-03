# iCal4j Integration - Email

[![javadoc](https://javadoc.io/badge2/org.ical4j/ical4j-integration-mail/javadoc.svg)](https://javadoc.io/doc/org.ical4j/ical4j-integration-mail)

Email is typically used to implement the iCalendar iTIP scheduling specification for sharing and negotiating events
such as meetings, etc.

iCal4j provides support for both sending and receiving iTIP attachments via email.

## Receiving Email

When receiving email this library can be used to generate iCalendar data for a number of different use cases. These
are listed below.

### Extract iTIP attachments

The most common scenario is when you receive an event invitation in the form of an iCalendar iTIP email attachment.
The `iTIPEmailProcessor` is used to extract these attachments from a message or folder.

### Generate objects for individual messages

It is also possible to produce a new message object (i.e. a type of `VJOURNAL`) by mapping the following message
headers to properties:

| Message Header | Type | iCalendar Property |
|----------------|------|--------------------|
| From           | Email address | ORGANIZER |
| To             | Email address(es) | ATTENDEE |
| Subject        | String            | SUMMARY |
| Date           | DATE-TIME | DTSTART |
| Message-Id     | URI      | UID |

In addition the following message parts are also mapped:

| Content Type | iCalendar Property |
|--------------|--------------------|
| text/plain | DESCRIPTION |
| text/html | STYLED-DESCRIPTION |
| application/pdf | ATTACH |

### Generate objects for mailing lists

Messages from mailing list can be combined into a single object representing the list. In such cases the same mappings
as individual messages are applied, except for the following replacements for Message-Id and Date:

| Message Header | Type | iCalendar Property |
|----------------|------|--------------------|
| Date           | DATE-TIME | RDATE |
| List-Id     | URI      | UID |
| List-URL | URI | URL/LINK |

In this way each list message is represented as a separate occurence of the list object.
