# iCal4j Command - Reference

## Calendar

Calendar commands are used to parse, transform and validate existing iCalendar data.

### Validate Object

#### Generate validation report

    ical4j calendar validate -file ./OZMovies.ics

Result:

```
- ERROR: VCALENDAR - If one is present, ALL others MUST NOT be present: VEVENT,VFREEBUSY,VTODO,VJOURNAL
```

### Serialize Object

TBD.

### Filter Components

TBD.

### Replace Component UIDs

TBD.

### Free/Busy Report

TBD.

## Card

Card commands are used to parse, transform and validate existing vCard data.

## Channel

Channel commands interact with configured channels to send or receive iCalendar and vCard data.

### Publish Content

TBD.

### Poll Content

TBD.

## Collection

Collection commands interact with configured collections to create, update, retrieve, etc. iCalendar and vCard data.

### Add Content

TBD.

### Remove Content

TBD.

### Export Content

TBD.

## iTIP

iTIP commands relate to the [iCalendar Transport-Independent Interoperability Protocol (iTIP)](https://www.rfc-editor.org/rfc/rfc5546.html).

### Publish Object

TBD.

### Request Participation

TBD.

### Participation Reply

TBD.

### Add Object Instances

TBD.

### Cancel Object Instances

TBD.

### Object Refresh

TBD.

### Counter Proposal

TBD>

### Decline Counter Proposal

TBD.

## Store

Store commands interact with configured store to create, update, etc. iCalendar and vCard collections.

### Create Collection

TBD.

### Update Collection

TBD.

### Delete Collection

TBD.

### Export Collection

TBD.

## Template

Template commands are used to generate iCalendar and vCard data from predefined blueprints.
