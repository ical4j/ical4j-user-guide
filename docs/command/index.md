# iCal4j Command-line Tool

A command-line interface (CLI) for working with iCalendar and vCard files.

[![javadoc](https://javadoc.io/badge2/org.ical4j/ical4j-command-cli/javadoc.svg)](https://javadoc.io/doc/org.ical4j/ical4j-command-cli)


* [Installation](#installation)
* [Overview](#overview)
* [Collections](#collections)
* [Strategies](#strategies)
* [Editing](#editing)
* [Metadata](#metadata)
* [Import/Export](#importexport)
* [Filters](#filters)
* [Workspaces](#workspaces)
* [Revisions](#revisions)
* [Settings](#settings)

## Installation

To install the iCal4j command-line tool, ensure you have Java installed on your system.
Download the latest release from [here](https://files.ical4j.org/releases/ical4j-0.1.1-develop-SNAPSHOT.zip).


## Overview

This tool supports creation and manipulation of iCalendar and vCard data, managing collections,
and linking related objects.

Running the tool with no arguments displays a list of available collections in the current workspace.

```shell
> ict
No collections. Use  'mkcol' to create a new collection.

> ict mkcol birthdays
Collection 'birthdays' created.
```

Use the `ls` command to list collections and their contents.

```shell
> ict ls birthdays
No items found in collection 'birthdays'. Use 'new' or 'import' to add items.

> ict new reminder birthdays -summary "Mom's Birthday" -due 2024-12-01
Created reminder with UID '1234567890' in collection 'birthdays'.
```

Refine object metadata like 'participants', 'status', 'link', etc.

```shell
> ict add participants birthdays:1234567890 Dad Sister
Added participants to 'birthdays:1234567890'.

> ict set status birthdays:1234567890 "confirmed"
Set status of 'birthdays:1234567890' to 'confirmed'.

> ict add link birthdays:1234567890 "https://example.com/birthday-info"
Added link to 'birthdays:1234567890'.
```

List subcomponents and customized recurrences of an object using its UID.

```shell
> ict ls birthdays:1234567890
Found 3 sub-components in 'birthdays:1234567890':
- Participant: Dad
- Participant: Sister
- Notification: https://example.com/birthday-info

Found 0 custom occurrences for 'birthdays:1234567890'.
```

Use filters to find objects based on metadata.

```shell
> ict ls birthdays -filter "status=confirmed"
Found 1 item in collection 'birthdays':
- UID: 1234567890, Summary: "Mom's Birthday", Due: 2024-12-01, Status: confirmed

> ict ls my-todo-list -filter "parent=birthdays:1234567890"
Found 2 items in collection 'my-todo-list' linked to 'birthdays:1234567890':
- UID: 9876543210, Summary: "Buy gift", Due: 2024-11-30
- UID: 8765432109, Summary: "Plan party", Due: 2024-12-01
```

Use the `print` command to display full details of an object in various formats.

```shell
> ict print birthdays:1234567890
🎂 Mom's Birthday - December 1, 2024
Status: confirmed
Participants: Dad, Sister
Link: https://example.com/birthday-info

> ict print -format=markdown birthdays:1234567890
# 🎂 Mom's Birthday
- **Due Date:** December 1, 2024
- **Status:** confirmed
- **Participants:** Dad, Sister
- **Link:** [https://example.com/birthday-info](https://example.com/birthday-info)
```

Core commands include:

* `chw` - Activate workspace
* `pws` - Print workspace info
* `lc` - List collections
* `mkcol` - Create a collection
* `rmcol` - Remove collections
* `ls <collection>[:<uid>] [-filter <filter>]` - list calendars and cards
* `rm <collection>[:<uid>] [-filter <filter>]` - Delete calendars and cards
* `cp <collection>[:<uid>] <destination> [-filter <filter>]` - Copy calendars and cards
* `mv <collection>[:<uid>] <destination> [-filter <filter>]` - Move calendars and cards to other collections
* `import -file=<file>, ... <collection>` - Import files
* `export -file=<file> <collection>[:<uid>] [-filter <filter>]` - Export files

Creation commands include:

* `strategies` - list known strategies
* `new -target=<col>[/<uid>] <strategy> [<properties>, ...]` - create components and entities using predefined strategies
* `put <collection>[/<uid>] [<properties>, ...]` - set properties on existing objects
* `get <collection>[/<uid>] [<filter>]` - read properties from existing objects
* `delete <collection>[/<uid>] [<filter>]` - delete properties from existing objects

Workflow commands include:

* `participants <collection>/<uid> [<entity>, ...]`
* `status <collection>/<uid> [<status>]`
* `link <collection>/<uid> [<link>]`
* `resources <collection>/<uid> [<resource>]`
* `locations <collection>/<uid> [<location>]`
* `notify <collection>/<uid> [<notify>]`
* `repeats <collection>/<uid> [<repeats>]`


## Collections

Collections are used to group related calendar and contact data. The following collection types are supported:
* `calendars` - iCalendar collections
* `addressbooks` - vCard collections
* `tasks` - To-do collections
* `journals` - Journal collections
* `notes` - Note collections

You can set the default collection type using the `settings` command, or override upon creation.

```shell
> ict mkcol -type=tasks my-todo-list
Collection 'my-todo-list' of type 'tasks' created.

> ict mkcol my-calendar
Collection 'my-calendar' of type 'calendars' created.
```

Collections may be customized by updating metadata.

```shell
> ict set my-calendar name "My remote calendar"
Updated collection 'my-calendar' with name 'My remote calendar'.

> ict set my-calendar color "#FF0000"
Updated collection 'my-calendar' with color '#FF0000'.

> ict set my-todo-list description "My personal to-do list"
Updated collection 'my-todo-list' with description 'My personal to-do list'.

> ict set my-calendar timezone "America/New_York"
Updated collection 'my-calendar' with timezone 'America/New_York'.
```


## Strategies
Strategies are predefined templates for creating calendar and contact objects. The following strategies are available:
* `event` - Create a calendar event
* `todo` - Create a to-do item
* `journal` - Create a journal entry
* `note` - Create a note
* `contact` - Create a contact
* `group` - Create a contact group
* `organization` - Create an organization contact
* `location` - Create a location contact
* `resource` - Create a resource contact

Strategies incorporate default metadata and properties to streamline object creation.

```shell
> ict new event my-calendar -summary "Team Meeting" -dtstart "2024-07-01T10:00:00" -dtend "2024-07-01T11:00:00"
Created event with UID '0987654321' in collection 'my-calendar'.

> ict new todo my-todo-list -summary "Finish Report" -due "2024-07-05"
Created to-do item with UID '1122334455' in collection 'my-todo-list'.
```

Use strategies to add subcomponents to existing objects.

```shell
> ict new participant my-calendar:0987654321 @joeb@example.com -required
Added participant 'joeb' as required to 'my-calendar:0987654321'.

> ict new notify my-calendar:0987654321 "email:30m"
Added notification for 'my-calendar:0987654321' to email 30 minutes before start.
```

You can also customize subcomponents of specific occurrences of a recurring event using the recurrence ID.

```shell
> ict new notify birthdays:1234567890:20241201 "sms:1h"
Added notification for occurrence on 2024-12-01 of 'birthdays:1234567890' to SMS 1 hour before start.
```

By default, object UIDs are generated using a random UUID generator. You can customize the UID generation
strategy using the `settings` command.

```shell
> ict configure set uid-strategy "sequential"
Set UID generation strategy to 'sequential'.
> ict new event my-calendar -summary "Project Kickoff" -dtstart "2024-07-02T09:00:00" -dtend "2024-07-02T10:00:00"
Created event with UID '0987654322' in collection 'my-calendar'.
```


## Editing

Further refinements can be made using `edit` to update the description using the configured editor.

```shell
> ict edit my-calendar:0987654321 # opens the event description in the default editor
Edited event 'my-calendar:0987654321'.
```

The `edit` command can also be used to customize specific occurrences of recurring events.

```shell
> ict edit my-calendar:0987654321:20240715 # opens the occurrence on 2024-07-15 in the default editor
Edited occurrence on 2024-07-15 of event 'my-calendar:0987654321'.
```


## Metadata
The tool supports managing metadata for calendar and contact objects, including:
* Status
* Links
* Repeats
* Revisions

Update attachments, comments, categories, etc. using the `add` command.

```shell
> ict add attach my-calendar:0987654321 "/path/to/agenda.pdf"
Added attachment to 'my-calendar:0987654321'.

> ict add comment my-calendar:0987654321 "Discuss project updates"
Added comment to 'my-calendar:0987654321'.

> ict add categories my-calendar:0987654321 "Work" "Important"
Added categories to 'my-calendar:0987654321'.
```

Set status, conference links and other properties using the `set` command.

```shell
> ict set status my-todo-list:1122334455 "in-progress"
Set status of 'my-todo-list:1122334455' to 'in-progress'.

> ict set conference my-calendar:0987654321 "https://meet.example.com/meeting123"
Set conference link to 'my-calendar:0987654321'.
```

Custom metadata properties may also be added via the `add` and `set` commands.

```shell
> ict add x-property my-calendar:0987654321 "X-CUSTOM-PROP:Custom Value"
Added custom property 'X-CUSTOM-PROP' to 'my-calendar:0987654321'.

> ict set x-property my-calendar:0987654321 "X-CUSTOM-PROP:Updated Value"
Set custom property 'X-CUSTOM-PROP' on 'my-calendar:0987654321' to 'Updated Value'.
```

## Import/Export
The tool supports importing and exporting iCalendar and vCard files. Use the `import` command to import files
into a collection, and the `export` command to export files from a collection.

```shell
> ict import -file="/path/to/calendar.ics" my-calendar
Imported 10 events into collection 'my-calendar' from '/path/to/calendar.ics'.

> ict export -file="/path/to/exported_calendar.ics" my-calendar
Exported 10 events from collection 'my-calendar' to '/path/to/exported_calendar.ics'.
```

You can also export individual objects by specifying their UID.

```shell
> ict export -file="/path/to/exported_event.ics" my-calendar:0987654321
Exported event 'my-calendar:0987654321' to '/path/to/exported_event.ics'.
```

## Filters
Filters can be applied when listing, exporting, or deleting objects in a collection. Use the `-filter` option
to specify filter criteria based on metadata properties.

```shell
> ict ls my-calendar -filter "status=confirmed"
Found 3 confirmed events in collection 'my-calendar':
- UID: 0987654321, Summary: "Team Meeting", Start: 2024-07-01T10:00:00
- UID: 1234567890, Summary: "Project Kickoff", Start: 2024-07-02T09:00:00
- UID: 1122334455, Summary: "Client Presentation", Start: 2024-07-03T14:00:00

> ict rm my-todo-list -filter "due<2024-07-01"
Deleted 2 overdue to-do items from collection 'my-todo-list'.
```

Setting a default filter for supporting commands can be done using the `settings` command.

```shell
> ict configure set default-filter "status=confirmed"
Set default filter to 'status=confirmed'.

> ict ls my-calendar
Found 3 confirmed events in collection 'my-calendar':
- UID: 0987654321, Summary: "Team Meeting", Start: 2024-07-01T10:00:00
- UID: 1234567890, Summary: "Project Kickoff", Start: 2024-07-02T09:00:00
- UID: 1122334455, Summary: "Client Presentation", Start: 2024-07-03T14:00:00
```

You can also create named filters using the `configure` command.

```shell
> ict configure set filter "upcoming-events=status=confirmed;start>now"
Set named filter 'upcoming-events' to 'status=confirmed;start>now'.
> ict ls my-calendar -filter "upcoming-events"
Found 2 upcoming confirmed events in collection 'my-calendar':
- UID: 1234567890, Summary: "Project Kickoff", Start: 2024-07-02T09:00:00
- UID: 1122334455, Summary: "Client Presentation", Start: 2024-07-03T14:00:00
```


As a convenience you can also filter by strategy type using a shorthand syntax.

```shell
> ict ls my-todo-list:actions
Found 2 actions in collection 'my-todo-list':
- UID: 2233445566, Summary: "Prepare slides", Due: 2024-06-30
- UID: 3344556677, Summary: "Send invites", Due: 2024-06-29

> ict ls my-calendar:appointments
Found 2 appointments in collection 'my-calendar':
- UID: 4455667788, Summary: "Doctor's Appointment", Start: 2024-07-04T15:00:00
- UID: 5566778899, Summary: "Dentist Appointment", Start: 2024-07-05T10:00:00

> ict ls my-calendar:1234567890:participant -filter=optional
Found 2 optional participants for 'my-calendar:1234567890':
- UID: 6677889900, Summary: "Optional Attendee 1"
- UID: 7788990011, Summary: "Optional Attendee 2"
```

## Workspaces
Workspaces are used to manage different sets of collections and data. Use the `chw` command to change the active
workspace, and the `pws` command to print information about the current workspace

```shell
> ict chw work-project-a
Switched to workspace 'work-project-a'.

> ict pws
Workspace: work-project-a
Collections:
 - my-calendar (calendars)
 - my-todo-list (tasks)
```


## Revisions
The tool supports revision management for calendar and contact objects. Use the `revisions` command to list 
revisions, and the `revert` command to revert to a previous revision.

```shell
> ict revisions my-calendar:0987654321
Revisions for 'my-calendar:0987654321':
 - Rev 1: Created on 2024-06-01 10:00:00
 - Rev 2: Updated summary on 2024-06-02 12:00:00
 - Rev 3: Added participant on 2024-06-03 14:00:00

> ict revert my-calendar:0987654321 2
Reverted 'my-calendar:0987654321' to revision 2.
```

Use the `undo` command to revert the most recent change.

```shell
> ict undo my-calendar:0987654321
Undid the most recent change to 'my-calendar:0987654321'.
```

Each workspace has its own revision history (technically, revisions for cards and calendars are separate though),
allowing users to track changes and restore previous versions 
of objects and collections as needed.

Use the `configure` command to set remote repository settings for workspace synchronization.

```shell
> ict configure set remote.calendars "https://github.com/nodelogicau/calendars.git"
Set remote repository to 'https://github.com/nodelogicau/calendars.git'.

> ict configure set remote.addressbooks "https://github.com/nodelogicau/cards.git"
Set remote repository to 'https://github.com/nodelogicau/cards.git'.
```

It is also possible to clone a remote repository into a new workspace.

```shell
> ict clone https://github.com/nodelogicau/calendars.git work-project-b
Cloned remote repositories into new workspace 'work-project-b'.
```


Use the `sync` command to synchronize the current workspace with a remote repository.

```shell
> ict sync
Synchronized calendars in workspace 'work-project-a' with remote repository.
Synchronized cards in workspace 'work-project-a' with remote repository.
```


## Settings
The tool supports various settings that can be configured using the `configure` command. Settings include:
* Active workspace
* Username and email for revision tracking
* Default content type for different strategies
* Default editor for content types
* Default color for different strategies and collection types
* Default icon (emoji) for different strategies and collection types
* Workspace synchronization settings for remote repositories
* Default and named filters for listing and exporting objects
* UID generation strategy

```shell
> ict configure set username "John Doe"
Set username to 'John Doe'.

> ict configure set email "jdoe@example.com"
Set email to 'jdoe@example.com'.
```
