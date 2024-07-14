# iCal4j Actions - Workflow

A workflow automation library using iCalendar to define workflow definitions and state.

## Overview

A typical workflow system supports the creation of workflow rules that control how tasks
are generated and fulfilled.

The iCal4j Actions Workflow Engine builds on the trigger framework with support for
configurable workflows defined as iCalendar actions.

## Time-based workflows

Such workflow definitions can be expressed as time-based recurring actions:

    BEGIN:VCALENDAR
    BEGIN:VTODO
    DTSTART:20250101T080000
    DURATION:PT1H
    SUMMARY:Turn on the lights
    RRULE:FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR
    END:VTODO
    END:VCALENDAR

The workflow engine will generate a list of occurrences from this definition (for a specific
period of time) to schedule tasks:

    BEGIN:VCALENDAR
    BEGIN:VTODO
    DTSTART:20250101T080000
    DURATION:PT1H
    SUMMARY:Turn on the lights
    RRULE:FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR
    RECURRENCE-ID:20250101T080000
    STATUS:NEEDS-ACTION
    LAST-MODIFIED:20241231T210000Z
    END:VTODO
    END:VCALENDAR

A task executor may specifically check for tasks that it can complete, and update the status
accordingly:

    BEGIN:VCALENDAR
    BEGIN:VTODO
    DTSTART:20250101T080000
    DURATION:PT1H
    SUMMARY:Turn on the lights
    RRULE:FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR
    RECURRENCE-ID:20250101T080000
    STATUS:IN-PROCESS
    ATTENDEE:mailto:joeb@example.com
    LAST-MODIFIED:20250101T080130Z
    END:VTODO
    END:VCALENDAR

_Note that the "task executor" may be a human or an automated system_

Once completed the task can be marked as such:

    BEGIN:VCALENDAR
    BEGIN:VTODO
    DTSTART:20250101T080000
    DURATION:PT1H
    SUMMARY:Turn on the lights
    RRULE:FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR
    RECURRENCE-ID:20250101T080000
    STATUS:COMPLETED
    ATTENDEE:mailto:joeb@example.com
    LAST-MODIFIED:20250101T080500Z
    COMPLETED:20250101T080500Z
    END:VTODO
    END:VCALENDAR

If a task is not fulfilled in the required timeframe a dedicated task reaper can close it
automatically:

    BEGIN:VCALENDAR
    BEGIN:VTODO
    DTSTART:20250101T080000
    DURATION:PT1H
    RECURRENCE-ID:20250101T080000
    STATUS:CANCELLED
    SUMMARY:Turn on the lights
    RRULE:FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR
    LAST-MODIFIED:20250101T090100Z
    END:VTODO
    END:VCALENDAR

This approach to workflows fulfills the following necessary features:

* Workflow tasks are durable, in that if the workflow system has
an outage the currently active tasks are preserved.
* State of tasks is also tracked and durable.
* Timers are implicitly defined in the workflow definition such that
incomplete tasks are automatically expired.

## Other workflow triggers

Some workflows may not define a recurring time component, in which case they
would only be triggered by some condition:

    BEGIN:VCALENDAR
    BEGIN:VTODO
    DTSTART:20250101T080000
    DURATION:PT1D
    SUMMARY:Approve funding request
    UID:9999
    END:VTODO
    END:VCALENDAR

For such workflows the engine would recognise the conditions required to generate
a new task:

    BEGIN:VCALENDAR
    BEGIN:VTODO
    DTSTART:20250101T080000
    DURATION:PT1D
    SUMMARY:Approve funding request
    RELATED;RELTYPE=PARENT;VALUE=UID:9999
    RELATED;VALUE=UID:1234
    STATUS:NEEDS-ACTION
    LAST-MODIFIED:20241231T210000Z
    END:VTODO
    END:VCALENDAR
