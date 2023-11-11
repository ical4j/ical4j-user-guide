# iCal4j Template

iCal4j Template provides prototypes for common iCalendar and vCard use-cases.

## Overview

Whilst the iCalendar and vCard specifications provide generalized component and property constraints, some applications
may require further constraints to fulfill the requirements of the use-case. iCal4j Templates provides some
opinionated prototyping and validation for common use-cases, and a portable definition language for constructing
your own.

## Template Domains

Templates are group by specific problem domains, or common scenarios that could benefit from the use of the
iCalendar and vCard standards. These domains include:

* Groupware - applications for communicating and collaborating within and across teams
* ...

A template is a construct for building iCalendar and vCard objects for common use-cases.

### Roster

A roster is a `VCALENDAR` prototype consisting of `VAVAILABILITY` components with one or more `ATTENDEE`s.

    VAvailability roster = new Roster().apply();

### Sports fixture

A sport fixture is a `VCALENDAR` prototype of `VEVENT` components with a `LOCATION` and embedded Schema.org
`STRUCTURED-DATA`.

    VEvent fixture = new SportsFixture().apply();

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


    VEvent anniversary = new Anniversary().withDate(MonthDay.of(Month.DECEMBER, 25)).apply();

### Meeting

A meeting is a `VCALENDAR` prototype of `VEVENT` components.

    Agenda agenda = ...
    VEvent meeting = new Meeting().withAgenda(agenda).apply();


## VToDo Templates

### Project Task

A project task is a `VTODO` prototype.

    VTodo task = new Task().apply();


## VJournal Templates

### Meeting Minutes

Meeting minutes is a `VJOURNAL` prototype with `RELATED-TO` property referencing the meeting.

    VJournal minutes = new MeetingMinutes().apply();