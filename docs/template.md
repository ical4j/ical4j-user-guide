# iCal4j Template

iCal4j Template provide prototypes and custom validation for common iCalendar and vCard use-cases.

## Overview

Whilst the iCalendar and vCard specifications provide generalized component and property constraints, some applications
may require further constraints to fulfill the requirements of the use-case. iCal4j Templates provides some
opinionated prototyping and validation for common use-cases, and a portable definition language for constructing
your own.

## Calendar Templates

A template is a construct for building iCalendar and vCard objects for common use-cases.

### Roster

A roster is a `VCALENDAR` prototype consisting of `VTODO` components with one or more `ATTENDEE`s.

    Calendar roster = new Roster().toCalendar();

### Sports fixture

A sport fixture is a `VCALENDAR` prototype of `VEVENT` components with a `LOCATION` and embedded Schema.org
`STRUCTURED-DATA`.

    Calendar fixture = new SportsFixture().toCalendar();

### Timetable

A timetable is a `VCALENDAR` prototype of `VEVENT` components.

    Calendar timetable = new Timetable().toCalendar();

### Timesheet

A timesheet is a `VCALENDAR` prototype of `VJOURNAL` components.

    Calendar timesheet = new Timesheet().toCalendar();

### Project Schedule

A project schedule is a `VCALENDAR` prototype of `VTODO` and `VEVENT` components representing tasks and
milestones.


## VEvent Templates

### Anniversary

A common use-case for `VEVENT` components is to define anniversary-style events (i.e. recurring, date-based, 
etc.).

* DTSTART - VALUE=DATE
* RRULE/RDATE (required)


    Calendar anniversary = new Anniversary().withMonthDay(MonthDay.of(Month.DECEMBER, 25)).toCalendar();

### Meeting

A meeting is a `VCALENDAR` prototype of `VEVENT` components.

    Agenda agenda = ...
    Calendar meeting = new Meeting().withAgenda(agenda).toCalendar();


## VToDo Templates

### Project Task

A project task is a `VTODO` prototype.

    Calendar task = new Task().toCalendar();


## VJournal Templates

### Meeting Minutes

Meeting minutes is a `VJOURNAL` prototype with `RELATED-TO` property referencing the meeting.

    Calendar minutes = new MeetingMinutes().toCalendar();
