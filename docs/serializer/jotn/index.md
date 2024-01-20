# iCal4j Serializer - JOT Notation

The JOT notation is JSON format derived from iCalendar and vCard properties, that may be used to construct and modify
iCalendar and vCard objects.

## Overview

JOT does not provide a complete representation of iCalendar and vCard, but rather is used to convey
concise information to construct and modify object data as would be commonly found in a REST-ful API.

For example, if we want to create a new event, rather than providing a complete iCalendar object (as would be
the case with xCal/jCal/JSCalendar, etc.) we can provide just the required information:

```json
{
  "summary": "Monthly financial debrief",
  "rrule": "FREQ=MONTHLY;BYDAY=-1FR"
}
```

Obviously there is a lot of missing information required to construct a complete iCalendar object, but the
serializer implementation may be used to fill in those blanks.

## JSON Structure

JOT notation represents a list of properties that may be used to construct a calendar, component or card object
from the iCalendar and vCard specifications. 

Each property may take one of two forms: Scalar and Object.

### Scalar Notation

Scalar notation is used to represent a simple property or parameter consisting of a name/value pair. This notation
supports string values for all properties, in addition to boolean and integer where applicable. Binary values 
should be encoded as a BASE64 string.

```json
{
  "summary": "Monthly financial debrief",
  "priority": 6,
  "attendee": {
    "rsvp": true
  }
}
```

### Object Notation

Object notation is used to represent a complex property that contains one or more parameters. This notation defines
properties as nested JSON objects with scalar notation used to describe parameters and the property value.

```json
{
  "dtstart": {
    "value": "date",
    "date": "2024-01-01"
  },
  "organizer": {
    "cn": "John Doe",
    "cal-address": "mailto:jdoe@example.com"
  }
}
```
