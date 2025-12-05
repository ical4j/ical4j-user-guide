# iCal4j Command-line Tool

A command-line interface (CLI) for working with iCalendar and vCard files.

## Overview

This tool supports creation and manipulation of iCalendar and vCard data, managing collections,
and linking related objects.

Core commands include:

* `chw` - Activate workspace
* `pws` - Print workspoce info
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

