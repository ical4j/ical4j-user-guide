# iCal4j Templates

iCal4j Templates provide prototypes and custom validation for common iCalendar and vCard use-cases.

## Overview

Whilst iCalendar and vCard specification provide general component and property constraints, some applications
may require further constraints to fulfill the requirements of the use-case. iCal4j Templates provides some
opinionated prototyping and validation for common use-cases, and a portable definition language for constructing
your own.

### Anniversary

A common use-case for `VEVENT` components is to define anniversary-style events (i.e. recurring, date-based, 
etc.).

* DTSTART - VALUE=DATE
* RRULE/RDATE (required)

### Roster

A roster is a `VCALENDAR` prototype consisting of `VTODO` components with one or more `ATTENDEE`s. 

### Sports fixture

A sport fixture is a `VCALENDAR` prototype of `VEVENT` components with a `LOCATION` and embedded Schema.org
`STRUCTURED-DATA`.

### Timetable

A timetable is a `VCALENDAR` prototype of `VEVENT` components.

### Timesheet

A timesheet is a `VCALENDAR` prototype of `VJOURNAL` components.

### Meeting

A meeting is a `VCALENDAR` prototype of `VEVENT` components.

### Meeting Minutes

Meeting minutes is a `VJOURNAL` prototype with `RELATED-TO` property referencing the meeting.

### Project Task

A project task is a `VTODO` prototype.

### Project Schedule

A project schedule is a `VCALENDAR` prototype of `VTODO` and `VEVENT` components representing tasks and 
milestones.
