# iCal4j Serializer - JOT Event

The JOT Event serializer supports the incremental build of events.

## Overview

A VEVENT component may include the following properties once:

* DTSTAMP
* UID
* DTSTART
* CLASS
* CREATED
* DESCRIPTION
* GEO
* LAST-MODIFIED
* LOCATION
* ORGANIZER
* PRIORITY
* SEQUENCE
* STATUS
* SUMMARY
* TRANSP
* URL
* RECURRENCE-ID
* RRULE
* DTEND
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

Combined with HTTP verbs an API for event management can be created.

### Create a new event

```json
POST https://api.example.com/v1/events
{
  "dtstart": "20240101",
  "summary": "New Years Day",
  "categories": "holidays"
}

RESPONSE:

{
  "uid": "1234-abcd",
  "dtstamp": "20240117T105900Z",
  "created": "20240117T105900Z",
  "last-modified": "20240117T105900Z",
  "dtstart": "20240101",
  "summary": "New Years Day",
  "categories": "holidays"
}
```

### Add a recurrence rule to an event

```json
POST https://api.example.com/v1/events/1234-abcd
{
  "rrule": "FREQ=YEARLY"
}

RESPONSE:

{
  "uid": "1234-abcd",
  "dtstamp": "20240117T105900Z",
  "created": "20240117T105900Z",
  "last-modified": "20240117T105900Z",
  "dtstart": "20240101",
  "summary": "New Years Day",
  "categories": "holidays",
  "rrule": "FREQ=YEARLY"
}
```

### Customize an occurrence of a recurring event

```json
POST https://api.example.com/v1/events/1234-abcd/20250101
{
  "description": "New Years Day (2025)"
}

RESPONSE:

{
    "uid": "1234-abcd",
    "recurrence-id": "20250101",
    "dtstamp": "20240117T105900Z",
    "created": "20240117T105900Z",
    "last-modified": "20240117T105900Z",
    "dtstart": "20240101",
    "summary": "New Years Day",
    "categories": "holidays",
    "description": "New Years Day (2025)"
}

```

### Cancel an occurrence of a recurring event

```json
POST https://api.example.com/v1/events/1234-abcd
{
  "exdate": "20260101"
}

RESPONSE:

{
    "uid": "1234-abcd",
    "dtstamp": "20240117T105900Z",
    "created": "20240117T105900Z",
    "last-modified": "20240117T105900Z",
    "dtstart": "20240101",
    "summary": "New Years Day",
    "categories": "holidays",
    "rrule": "FREQ=YEARLY",
    "exdate": "20260101"
}
```

### Retrieve all occurrences of a recurring event

```json
GET https://api.example.com/v1/events/1234-abcd

RESPONSE:

[
    {
        "uid": "1234-abcd",
        "dtstamp": "20240117T105900Z",
        "created": "20240117T105900Z",
        "last-modified": "20240117T105900Z",
        "dtstart": "20240101",
        "summary": "New Years Day",
        "categories": "holidays",
        "rrule": "FREQ=YEARLY",
        "exdate": "20260101"
    },
    {
        "uid": "1234-abcd",
        "recurrence-id": "20250101",
        "dtstamp": "20240117T105900Z",
        "created": "20240117T105900Z",
        "last-modified": "20240117T105900Z",
        "dtstart": "20240101",
        "summary": "New Years Day",
        "categories": "holidays",
        "description": "New Years Day (2025)"
    }
]
```

### Update an existing event (idemptotently)

```json
PATCH https://api.example.com/v1/events/1234-abcd
{
  "summary": "New Years Day (Public Holiday)"
}

RESPONSE:

{
    "uid": "1234-abcd",
    "dtstamp": "20240117T105900Z",
    "created": "20240117T105900Z",
    "last-modified": "20240117T105900Z",
    "dtstart": "20240101",
    "summary": "New Years Day (Public Holiday)"
    "categories": "holidays",
    "rrule": "FREQ=YEARLY",
    "exdate": "20260101"
}
```
