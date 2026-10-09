## ADDED Requirements

### Requirement: Top-level tabs are one per library plus Home
The first level of the `nav` SHALL consist of a Home tab followed by one tab per iCal4j library: iCalendar, vCard, Extensions, Connector, Integration, Serializer, Command, Streams, Graph, Template, in that order.

#### Scenario: Tab bar rendered
- **WHEN** any page of the built site is viewed
- **THEN** the tab bar shows exactly these eleven tabs in this order

### Requirement: Home tab is a short entry point
The Home tab SHALL contain only Introduction, Getting Started, Installation, Configuration and a References group. It SHALL NOT contain core library feature pages, platform pages or examples.

#### Scenario: Home contents
- **WHEN** the Home tab is expanded
- **THEN** its entries are Introduction (`index.md`), Getting Started (`getting-started.md`), Installation (`installation.md`), Configuration (`configuring.md`) and References

#### Scenario: References group
- **WHEN** the References group under Home is expanded
- **THEN** it contains RFC Compliance, CUAs, Projects using iCal4j, Resources and FAQ

### Requirement: Core library has its own tab
An iCalendar tab SHALL hold all pages documenting the core `ical4j` library, grouped as Overview, Concepts, Features, Timezones, Platforms and Examples.

#### Scenario: Concepts group
- **WHEN** the Concepts group is expanded
- **THEN** it contains Date/Time Concepts, Components, Properties and Parameters

#### Scenario: Features group
- **WHEN** the Features group is expanded
- **THEN** it contains Parsing, Validation, Recurrences, Filtering, Indexing, Transformations, Encoding and Compatibility

#### Scenario: Timezones group
- **WHEN** the Timezones group is expanded
- **THEN** it contains Timezones, ZoneInfo Outlook and tzurl.org

#### Scenario: Platforms group
- **WHEN** the Platforms group is expanded
- **THEN** it contains Android, OSGi and Groovy

#### Scenario: Examples group
- **WHEN** the Examples group is expanded
- **THEN** it contains the existing examples overview, parsing, model, output, recurrences and filtering pages

### Requirement: Installation is a separate page
The Maven coordinates table SHALL live on its own `installation.md` page, and `getting-started.md` SHALL link to it rather than include it.

#### Scenario: Installation page
- **WHEN** a reader opens Installation from the Home tab
- **THEN** they see the table of current and deprecated Maven coordinates for every library

#### Scenario: Getting Started links to Installation
- **WHEN** `getting-started.md` is read
- **THEN** it contains no Maven coordinates table and contains a link to the Installation page

### Requirement: Library tabs expose consolidated pages
Each library tab SHALL include the consolidated pages produced by stub consolidation so that no previously orphaned content remains unreachable.

#### Scenario: Extensions tab
- **WHEN** the Extensions tab is expanded
- **THEN** it contains Overview, CalDAV, Outlook, Participant, Concept, Link and Strategy as single pages

#### Scenario: Command tab
- **WHEN** the Command tab is expanded
- **THEN** it contains Overview, Reference, Agent and MCP

#### Scenario: Template tab
- **WHEN** the Template tab is expanded
- **THEN** it contains Overview, Examples, Thymeleaf and an Object Types group with one entry per group: Groupware, Project, Agile, Budget, Catalog, Wiki, Workflow

#### Scenario: Serializer JOTN group
- **WHEN** the JOTN group under Serializer is expanded
- **THEN** it contains Overview, Calendar, Event, ToDo, Journal, Availability and Card, and no entries for Alarm, Available, Location, Participant or Resource
