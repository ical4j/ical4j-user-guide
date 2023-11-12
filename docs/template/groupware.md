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

TBD.

## Agenda

An Agenda represents one or more objectives for a meeting, or series of meetings. Sometimes a meeting may not
address all the items on an agenda due to lack of time, etc., so it is useful to maintain the Agenda separately
such that it may be shared across multiple meetings if required.

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

An Observance is like an Appointment but does not block any time. It is more informative to recipients as a reminder
of important dates and times to be observed.
