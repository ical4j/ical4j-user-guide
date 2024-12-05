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
