# iCal4j - FreeBusy

The iCal4j FreeBusy service provides support for generating iCalendar free/busy information from existing
iCalendar data.

## Overview

The iCalendar specification defines the `VFREEBUSY` component that may be used to request, respond or publish
resource availability.

## Command Line Usage

### Query for free one hour slots

    ical4j-freebusy/bin/ical4j-freebusy request -F ./Australian32Holidays.ics

Result:

```
BEGIN:VCALENDAR
BEGIN:VFREEBUSY
DTSTAMP:20230113T130148Z
DTSTART:20230113T130148Z
DTEND:20230120T130148Z
DURATION:PT1H
FREEBUSY;FBTYPE=FREE:20230113T130148Z/P1W
END:VFREEBUSY
END:VCALENDAR
```
