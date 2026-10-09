## ADDED Requirements

### Requirement: Minimum content for a standalone page
A topic SHALL have its own page only when its body contains more than a heading and a short paragraph: at least one code sample, table or roughly ten lines of prose. Topics below this threshold SHALL be `##` sections on their parent page. Pages that are the sole documentation for a current library or feature and have no natural parent are exempt.

#### Scenario: Stub audit after consolidation
- **WHEN** every `docs/**/*.md` file reachable from the nav is measured
- **THEN** no page consists solely of a title and at most one sentence, except the exempt pages listed in the design (`transformations.md`, `osgi.md`, `tzurl.md`, `connector/dav.md`, `connector/local.md`, `serializer/xml.md`, `serializer/json.md`, `serializer/jsonld.md`, `serializer/jmap.md`, `integration/websub.md`, `integration/webhooks.md`, `integration/xmpp.md`)

### Requirement: Consolidation preserves content
When pages are merged into a parent, the full body of each merged page SHALL appear under a `##` section on the parent whose heading is the merged page's topic name, and the source files SHALL be deleted.

#### Scenario: Substantive page merged
- **WHEN** `extensions/strategy/entity.md` is merged into `extensions/strategy.md`
- **THEN** `extensions/strategy.md` contains an `## Entity` section with the complete original body, and `extensions/strategy/entity.md` no longer exists

#### Scenario: Empty page merged
- **WHEN** `extensions/strategy/action.md`, which contains only a title, is merged
- **THEN** `extensions/strategy.md` contains an `## Action` section, and the section may be empty or carry a one-line placeholder

### Requirement: Strategy consolidation
The twelve `extensions/strategy/*` pages SHALL be merged into a single `extensions/strategy.md` with the existing overview content first, followed by one section per strategy: Event, Observance, Action, Issue, Request, Note, Report, Availability, Entity, Group, Individual.

#### Scenario: Strategy page structure
- **WHEN** `extensions/strategy.md` is read
- **THEN** it begins with the former `extensions/strategy/index.md` overview and contains the eleven strategy sections in that order

### Requirement: Concept consolidation
The nine `extensions/concept/*` pages SHALL be merged into the existing `extensions/concept.md`, with one section per concept: Event, Observance, Action, Issue, Request, Note, Report, Availability.

#### Scenario: Concept page structure
- **WHEN** `extensions/concept.md` is read
- **THEN** it begins with the former `extensions/concept/index.md` overview, retains the Semantic Calendaring reference, and contains the eight concept sections

### Requirement: Link types table
`extensions/link/index.md` SHALL contain a table listing each link type formerly referenced in the nav (Alternate, Author, Bookmark, Copyright, Edit, External, Help, Hub, Icon, License, Next, Prev, Related, Replies, Self, Status, Webmention) with a one-line description.

#### Scenario: Link page read
- **WHEN** `extensions/link/index.md` is read
- **THEN** all seventeen link types appear as rows in a table

### Requirement: JOTN stub consolidation
The JOTN pages Alarm, Available, Location, Participant and Resource SHALL become sections of `serializer/jotn/index.md`; the pages Calendar, Event, ToDo, Journal, Availability and Card SHALL remain standalone.

#### Scenario: JOTN index read
- **WHEN** `serializer/jotn/index.md` is read
- **THEN** it contains sections for Alarm, Available, Location, Participant and Resource, and `serializer/jotn/alarm.md` no longer exists

### Requirement: Template object-type consolidation
Each of the seven `template/<group>/` directories SHALL be replaced by a single `template/<group>.md` page containing the former `index.md` overview followed by one section per type in that group, with pages of substantive length merged intact.

#### Scenario: Groupware page
- **WHEN** `template/groupware.md` is read
- **THEN** it contains sections Action, Agenda, Appointment, Attendance, Meeting and Note, with the Agenda, Attendance and Meeting bodies complete, and no `template/groupware/` directory exists

#### Scenario: All groups consolidated
- **WHEN** the `docs/template/` directory is listed
- **THEN** it contains `index.md`, `examples.md`, `thymeleaf.md` and exactly seven group pages: `agile.md`, `budget.md`, `catalog.md`, `groupware.md`, `project.md`, `wiki.md`, `workflow.md`

### Requirement: Command reference consolidation
The seven `command/*` sub-pages (calendar, card, channel, collection, itip, store, template) SHALL be merged into a single `command/reference.md` with one section per command group, preserving the existing sub-headings and examples.

#### Scenario: Command reference read
- **WHEN** `command/reference.md` is read
- **THEN** it contains sections Calendar, Card, Channel, Collection, iTIP, Store and Template, the Calendar section retains the validation example, and none of the seven source files exist
