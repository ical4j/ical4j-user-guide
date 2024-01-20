# iCal4j Serializer - JOT Calendar

The JOT Calendar serializer may be used to create or update Calendar object properties.

## Overview

An iCalendar object may include the following properties once:

* UID
* LAST-MODIFIED
* URL
* REFRESH
* SOURCE
* COLOR

An iCalendar object may include the following properties multiple times:

* NAME
* DESCRIPTION
* CATEGORIES
* IMAGE

An example using all of these properties may look like this:

```json
{
  "uid": "1234-abcd",
  "last-modified": "2024-01-17T10:59:00Z",
  "url": "https://example.com/public_holidays",
  "refresh-interval": "P1W",
  "source": "https://example.com/public_holidays.ics",
  "color": "orange",
  "name": "International Public Holidays",
  "description": "Globally recognised public holidays",
  "categories": ["holidays", "global"],
  "image": "https://example.com/images/holiday.png"
}
```

## HTTP Payloads

Such a payload may be used to add, remove or update properties. For example, used in conjunction with HTTP verbs
full CRUD operations may be implemented:

### Create a calendar

```json
POST https://api.example.com/v1/calendars
{
  "name": "International Public Holidays",
  "description": "Globally recognised public holidays",
  "categories": "holidays"
}

RESPONSE:

{
  "uid": "1234-abcd",
  "last-modified": "2024-01-17T10:59:00Z",
  "name": "International Public Holidays",
  "description": "Globally recognised public holidays",
  "categories": "holidays"
}
```

### Update a calendar by adding additional properties

```json
POST https://api.example.com/v1/calendars/1234-abcd
{
  "categories": "global"
}

RESPONSE:

{
  "uid": "1234-abcd",
  "last-modified": "2024-01-17T10:59:00Z",
  "name": "International Public Holidays",
  "description": "Globally recognised public holidays",
  "categories": ["holidays", "global"]
}
```

### Update a calendar by removing existing properties

```json
DELETE https://api.example.com/v1/calendars/1234-abcd
{
  "categories": ["global"]
}

RESPONSE:

{
  "uid": "1234-abcd",
  "last-modified": "2024-01-17T10:59:00Z",
  "name": "International Public Holidays",
  "description": "Globally recognised public holidays",
  "categories": "holidays"
}
```

### Replace one or more properties

```json
PUT https://api.example.com/v1/calendars/1234-abcd
{
  "name": "Public Holidays",
  "description": "International public holidays",
  "categories": ["international", "breaks"]
}

RESPONSE:

{
  "uid": "1234-abcd",
  "last-modified": "2024-01-17T10:59:00Z",
  "name": "Public Holidays",
  "description": "International public holidays",
  "categories": ["international", "breaks"]
}
```
