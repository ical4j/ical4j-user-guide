# iCal4j Extensions - Concept

The iCalendar property `CONCEPT` was recently ratified as a standard way to classify iCalendar objects. These extensions
provide some suggested classifications that represent common use-cases for different types of iCalendar objects.

## Events

`VEVENT` is perhaps the most implemented object from the iCalendar specification, and supports a variety of use
cases. Some of these are represented by the following concepts:

* Meeting - a private event where attendees are explicitly invited and a chair is nominated.
* Appointment - a private event representing a block of time for individual pursuits.
* Seminar - a public interactive event involving one or more speakers.
* Conference - an extended public event with limited interaction of attendees
* Performance - a public event with one or more performers and no active participation of attendees
* Subscription - a recurring transparent event representing an active subscription to a resource
* Invitation - a transparent event representing eligibility to participate in an activity

## Actions

Action is a collective term used to represent an activity or task. Actions are typically represented by `VTODO`
iCalendar objects. Action concepts include:

* Agenda - the intended purpose or planning for a collaborative activity or event.
* Approval - a prompt for review and acceptance of a request or other activity
* ..

## Issues

TBD.

## Requests

Requests are often associated with a Service Desk or similar function intended to provide a service.

## Records

TBD.

## Metrics

TBD.

## Availability

TBD.
