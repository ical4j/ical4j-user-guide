# iCal4j Command-line Tool

A command-line interface (CLI) for working with iCalendar and vCard files.

* [Installation](#installation)
* [Overview](#overview)
* [Collections](#collections)
* [Strategies](#strategies)
* [Metadata](#metadata)
* [Import/Export](#importexport)
* [Workspaces](#workspaces)
* [Revisions](#revisions)
* [Settings](#settings)

## Installation

To install the iCal4j command-line tool, ensure you have Java installed on your system.
Download the latest release from [here]().


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

Use the 'ls' command to list collections and their contents.

```shell
> ict ls birthdays

No items found in collection 'birthdays'. Use 'new' or 'import' to add items.

> ict new reminder birthdays -summary "Mom's Birthday" -due 2024-12-01

Created reminder with UID '1234567890' in collection 'birthdays'.
```

Refine object metadata using commands like 'participants', 'status', 'link', etc.

```shell
> ict participants birthdays/1234567890 -add "Dad, Sister"

Added participants to 'birthdays/1234567890'.

> ict status birthdays/1234567890 -set "confirmed"

Set status of 'birthdays/1234567890' to 'confirmed'.

> ict link birthdays/1234567890 -add "https://example.com/birthday-info"

Added link to 'birthdays/1234567890'.
```


Core commands include:

* `chw` - Activate workspace
* `pws` - Print workspace info
* `lc` - List collections
* `mkcol` - Create a collection
* `rmcol` - Remove collections
* `ls <collection> [<uid> | <filter>]` - list calendars and cards
* `rm <collection> [<uid> | <filter>]` - Delete calendars and cards
* `cp -target=<col> <collection> [<uid> | <filter>]` - Copy calendars and cards
* `mv -target=<col> <collection> [<uid> | <filter>]` - Move calendars and cards to other collections
* `import -file=<file>, ... <collection>` - Import files
* `export -file=<file> <collection> [<uid> | <filter>]` - Export files

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
Further refinements can be made using `edit` to update the description using the configured editor.

```shell
> ict edit my-calendar/0987654321 # opens the event description in the default editor
Edited event 'my-calendar/0987654321'.
```


## Metadata
The tool supports managing metadata for calendar and contact objects, including:
* Participants
* Status
* Links
* Resources
* Locations
* Notifications
* Repeats
* Revisions

Update participants, attachments, notifications, etc. using the `add` command.

```shell
> ict add participants my-calendar/0987654321 @joebloggs@example.com -required
Added participant 'joebloggs' as required to 'my-calendar/0987654321'.

> ict add attach my-calendar/0987654321 "/path/to/agenda.pdf"
Added attachment to 'my-calendar/0987654321'.

> ict add notify my-calendar/0987654321 "email:15m"
Add notification for 'my-calendar/0987654321' to email 15 minutes before start.
```

Set status, conference links and other properties using the `set` command.

```shell
> ict set status my-todo-list/1122334455 "in-progress"
Set status of 'my-todo-list/1122334455' to 'in-progress'.

> ict set conference my-calendar/0987654321 "https://meet.example.com/meeting123"
Set conference link to 'my-calendar/0987654321'.
```

Custom metadata properties may also be added via the `add` and `set` commands.

```shell
> ict add x-property my-calendar/0987654321 "X-CUSTOM-PROP:Custom Value"
Added custom property 'X-CUSTOM-PROP' to 'my-calendar/0987654321'.

> ict set x-property my-calendar/0987654321 "X-CUSTOM-PROP:Updated Value"
Set custom property 'X-CUSTOM-PROP' on 'my-calendar/0987654321' to 'Updated Value'.
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
> ict revisions my-calendar/0987654321
Revisions for 'my-calendar/0987654321':
 - Rev 1: Created on 2024-06-01 10:00:00
 - Rev 2: Updated summary on 2024-06-02 12:00:00
 - Rev 3: Added participant on 2024-06-03 14:00:00

> ict revert my-calendar/0987654321 2
Reverted 'my-calendar/0987654321' to revision 2.
```

Use the `undo` command to revert the most recent change.

```shell
> ict undo my-calendar/0987654321
Undid the most recent change to 'my-calendar/0987654321'.
```

Each workspace has its own revision history, allowing users to track changes and restore previous versions 
of objects and collections as needed.

## Settings
The tool supports various settings that can be configured using the `configure` command. Settings include:
* Active workspace
* Username and email for revision tracking
* Default content type for different strategies
* Default color for different strategies and collection types
* Workspace synchronization settings for remote repositories

```shell
> ict configure set username "John Doe"
Set username to 'John Doe'.

> ict configure set email "jdoe@example.com"
Set email to 'jdoe@example.com'.
```
