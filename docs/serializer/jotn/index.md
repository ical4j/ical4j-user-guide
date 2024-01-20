# iCal4j Serializer - JOT Notation

The JOT notation is JSON format dervied from iCalendar and vCard properties, that may be used to construct and modify
iCalendar and vCard objects.

## Overview

JOT does not provide a lossless complete representation of iCalendar and vCard, but rather is used to convey
concise information used to construct and modify data as would be commonly found in a REST-ful API.

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

