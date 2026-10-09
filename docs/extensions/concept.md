# iCal4j Extensions - Concepts

A concept is type definition for iCalendar components used to refine object data for specific scenarios.

iCal4j Extensions includes concepts for common use-cases, as outlined in the table below.

| Concept | Component | Scheduled | Planned | Participants (Active) | Repeats |
|---------|-----------|-----------|---------|-----------------------|---------|
| Event   | VEVENT | Yes | Yes | Yes | Optional |
| Observance | VEVENT | Yes | Yes | No | Optional |
| Action  | VTODO | No | Yes | Yes | Optional |
| Issue | VTODO | No | No | Yes | No |
| Request | VTODO | No | No | Yes | No |
| Note | VJOURNAL | No | No | No | No |
| Report | VJOURNAL | Yes | Yes | No | Optional |
| Availability | VAVAILABILITY | Yes | Yes | No | Optional |

* Scheduled - occurs on a specific date/time
* Planned - represents a future activity or target (where not scheduled will typically have a due date)
* Participants (Active) - requires actors to participate in order to resolve
* Repeats - represents multiple related activities or targets

## Event

An Event is a planned activity, scheduled in the future for one or more active participants. This may be used to 
represent activities such as meetings, appointments, seminars, conferences, etc.

### Event information

An Event required the following property information:

* Informational properties such as summary, (rich) description, attachments, etc.
* Geographical properties such as location, timezone, etc.
* Schedule properties such as date (range), time, recurrence rules, etc.
* Participant properties such as active participants, inactive participants (e.g. watchers), etc.

### Event occurrences

For repeating events each occurrence may override properties in the series in order to provide additional/alternative
details specific to the occurrence.

## Observance

An Observance is a planned event with no active participation, used for informational purposes only.

## Action

An Action is a planned, unscheduled activity for one or more participants. This concept may be used
to represent tasks, work items, and agenda for scheduled events.

## Issue

An Issue represents an unplanned, unscheduled activity for one or more participants. This concept is typically
used to report impediments and risks that may be resolved or mitigated by one or more active participants.

## Request

A Request represents an unplanned, unscheduled activity for one or more participants. This concept is typically
used to track  by one or more active participants.

## Note

A Note is an unplanned record used for informational purposes only.

## Report

A Report is a planned record used for informational purposes only.

## Availability

Availability defines a block of time when a participant or resource is available.
