# iCal4j Template - Groupware

Object templates for Groupware-related functionality.

## Overview

Groupware is a term used to describe software tools used for communication and collaboration within and across teams.
The most widely adopted use of the iCalendar and vCard standards are in Groupware applications, where almost every
calendar implementation supports the iCalendar format.

## Meeting

Perhaps the most common use of iCalendar is to define and share meeting invites. A Meeting is a closed invitation to
select recipients in order for collaborative discussion or other activities. This template may be used to create
or modify `VEVENT` objects to conform with conventional approaches to defining meeting invites.

### Examples

Assuming we use vCard to represent meeting participants, we can construct a new meeting:

    VCard organizer = ...
    VCard chair = ...

    VEvent meeting = new Meeting().organizer(organizer)
                .chair(new Contact(chair))
                .start(LocalDate.of(2023, 11, 13).atStartOfDay())
                .duration(Duration.ofMinutes(30)).apply();

The result is something like this:

    BEGIN:VEVENT
    DTSTAMP:20231113T000000Z
    ORGANIZER;CN=Big Boss:mailto:boss@example.com
    DTSTART:20231113T000000
    DURATION:PT30M
    CONCEPT:https://ical4j.org/event-types/MEETING
    ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=CHAIR:mailto:lead-by@example.com
    BEGIN:PARTICIPANT
    PARTICIPANT-TYPE:CONTACT
    UID:1234
    CALENDAR-ADDRESS:mailto:lead-by@example.com
    STRUCTURED-DATA;VALUE=BINARY;ENCODING=BASE64;FMTTYPE=text/vcard:QkVHSU46VkNBUkQNClVJRDoxMjM0DQpGTjpUZWFtIExlYWQNCkNBTEFEUlVSSTptYWlsdG86bGVhZC1ieUBleGFtcGxlLmNvbQ0KRU5EOlZDQVJEDQo=
    END:PARTICIPANT
    END:VEVENT    

## Agenda

An Agenda represents one or more objectives for a meeting, or series of meetings. Sometimes a meeting may not
address all the items on an agenda due to lack of time, etc., so it is useful to maintain the Agenda separately
such that it may be shared across multiple meetings if required.

### Examples

Multiple Agenda may be linked in sequence to track items individually. This can be useful where time constraints
require additional meetings to address outstanding Agenda items:

    VToDo item4 = new Agenda().summary("Further business and close").uid(...).apply();
    VToDo item3 = new Agenda().summary("Standing items").uid(...).nextItem(item4).apply();
    VToDo item2 = new Agenda().summary("Business arising").uid(...).nextItem(item3).apply();
    VToDo item1 = new Agenda().summary("ACME Monthly Board Meeting").uid(...).nextItem(item2).apply();

    ComponentList agenda = new ComponentList(Arrays.asList(item1, item2, item3, item4);

The resulting component list looks like this:

    BEGIN:VTODO
    DTSTAMP:20231113T000000Z
    CONCEPT:https://ical4j.org/action-types/ACTION
    SUMMARY:ACME Monthly Board Meeting
    UID:1
    LINK;VALUE=UID;LINKREL=next:2
    END:VTODO
    BEGIN:VTODO
    DTSTAMP:20231113T000000Z
    CONCEPT:https://ical4j.org/action-types/ACTION
    SUMMARY:Business arising
    UID:2
    LINK;VALUE=UID;LINKREL=next:3
    END:VTODO
    BEGIN:VTODO
    DTSTAMP:20231113T000000Z
    CONCEPT:https://ical4j.org/action-types/ACTION
    SUMMARY:Standing items
    UID:3
    LINK;VALUE=UID;LINKREL=next:4
    END:VTODO
    BEGIN:VTODO
    DTSTAMP:20231113T000000Z
    CONCEPT:https://ical4j.org/action-types/ACTION
    SUMMARY:Further business and close
    UID:4
    END:VTODO

## Attendance

A useful metric to track for meetings is how many people actually attended. Each meeting may have one attendance
record associated with it.

## Action

Follow-up actions are a common output of meetings. Action instances may be associated with individual meetings or
where available, the associated Agenda.

## Note

A Note is used to capture useful information such as outcomes of discussions, talking points and anything else
not specifically actionable. Notes may be associated with Meetings or Agenda, and can also exist independently.

## Appointment

An Appointment is similar to a Meeting but is more of an open invitation to recipients. It is used to publish
events to either a broad or narrow audience, and specifically doesn't cater for RSVPs or Attendance tracking.
An Appointment may still have an associated Agenda for planning, but typically wouldn't include follow-up Actions.

## Observance

An Observance is like an Appointment but does not block any time and does not have an Agenda. It is more informative
to recipients as a reminder of important dates and times to be observed.

### Examples

Create a new observance for International Science Week.

    VEvent iwsp = new Observance().title("International Week of Science and Peace")
        .start(LocalDate.of(1988, 11, 6))
        .end(LocalDate.of(1988, 11, 12))
        .url(URI.create("https://www.un.org/en/observances/world-science-day/week"))
        .schedule(new Schedule(Years.ONE)).apply();

Modify an existing observance to override start and end dates for a specific year.

    VEvent iwsp2023 = new Observance(iwsp).recurrence(LocalDate.of(2023, 11, 6))
        .start(LocalDate.of(1988, 11, 5))
        .end(LocalDate.of(1988, 11, 11)).apply();
