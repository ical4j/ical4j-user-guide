# iCal4j Extensions - Concept: Event

An Event is a planned activity, scheduled in the future for one or more active participants. This may be used to 
represent activities such as meetings, appointments, seminars, conferences, etc.

## Event information

An Event required the following property information:

* Informational properties such as summary, (rich) description, attachments, etc.
* Geographical properties such as location, timezone, etc.
* Schedule properties such as date (range), time, recurrence rules, etc.
* Participant properties such as active participants, inactive participants (e.g. watchers), etc.

## Event occurrences

For repeating events each occurrence may override properties in the series in order to provide additional/alternative
details specific to the occurrence.
