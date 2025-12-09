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

## Import/Export
The tool supports importing and exporting iCalendar and vCard files. Use the `import` command to import files
into a collection, and the `export` command to export files from a collection.

## Workspaces
Workspaces are used to manage different sets of collections and data. Use the `chw` command to change the active
workspace, and the `pws` command to print information about the current workspace

## Revisions
The tool supports revision management for calendar and contact objects. Use the `revisions` command to list 
revisions, and the `revert` command to revert to a previous revision.

Each collection can have its own revision history, allowing users to track changes and restore previous versions 
of objects as needed.
