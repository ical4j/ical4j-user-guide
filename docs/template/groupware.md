# iCal4j Template - Groupware

Object templates for Groupware-related functionality.

## Overview

Groupware is a term used to describe software tools used for communication and collaboration within and across teams. The most widely adopted use of
the iCalendar and vCard standards are in Groupware applications, where almost every calendar implementation supports the iCalendar format.

## Meeting

Perhaps the most common use of iCalendar is to define and share meeting invites. This template may be used to create or modify `VEVENT` objects to
conform with conventional approaches to defining meeting invites.

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
