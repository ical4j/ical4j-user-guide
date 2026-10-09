## Why

The user guide has accumulated three generations of content in one MkDocs site and only the newest is reachable: the nav references 17 pages that do not exist, 59 pages on disk are unreachable from the nav, roughly 70 pages are one-sentence stubs, and several legacy pages still describe Java 1.4, Bintray and a 1.0 roadmap. Readers looking for the core library land on a "Home" tab that mixes the site entry point with core library features, platform notes and references, while every other library has its own tab.

## What Changes

**Hygiene pass**

- Enable `strict: true` in `mkdocs.yml` so missing nav targets and broken links fail the build instead of warning.
- Remove the 17 `extensions/link/*` nav entries whose files do not exist; describe link types in a table on the existing `extensions/link/index.md` instead.
- Fix the two broken relative links (examples index to a missing vCard examples page; agile retrospective to a directory).
- **REMOVED** legacy pages that are superseded: `roadmap.md`, `maven.md`, `external-resources.md`, `query.md`, `freebusy.md`, `services/index.md` (and its commented-out nav block). Still-valid dependency coordinates already live in `getting-started.md`.
- Prune `faq.md` to entries that are still true (charset output, GEO with BigDecimal) and surface it under References.
- Rewrite the `vcard/index.md` overview to reference RFC 6350, Maven Central and current Java requirements, dropping Retroweaver and Bintray.
- Remove the deprecated top-level `google_analytics` key from `mkdocs.yml` (the `extra.analytics` block already carries the property).

**Nav restructure**

- Add a dedicated **iCalendar** tab for the core `ical4j` library, grouping concepts (date/time, components, properties, parameters), features (parsing, output, validation, recurrences, timezones, filtering, indexing, transformations), platforms (Android, OSGi, Groovy) and examples.
- Slim the **Home** tab to Introduction, Getting Started, Installation, Configuration and References.
- Move `zoneinfo-outlook.md` and `tzurl.md` under the iCalendar tab's Timezones group, and `cuas.md`, `rfcs.md`, `projects.md`, `resources.md`, `faq.md` under Home → References.
- Split the Maven coordinates table out of `getting-started.md` into a new `installation.md` page, leaving Getting Started as the "which library do I need" guide.

**Stub consolidation**

- Collapse `extensions/strategy/*` (12 pages, 1 to 17 lines) into a single `extensions/strategy.md` with one section per strategy.
- Collapse `extensions/concept/*` (9 pages) into the existing `extensions/concept.md` with one section per concept.
- Fold the five JOTN stub pages (alarm, available, location, participant, resource) into `serializer/jotn/index.md` as sections; keep the six substantive JOTN pages.
- Consolidate the orphaned `template/{agile,budget,catalog,groupware,project,wiki,workflow}` trees (45 pages) into one page per group under a new Template → Object Types nav section.
- Consolidate the seven orphaned `command/*` sub-pages (calendar, card, channel, collection, itip, store, template), which are almost entirely "TBD", into a single `command/reference.md` reachable from the Command tab.

## Capabilities

### New Capabilities

- `site-build-integrity`: The site builds without missing nav targets, broken internal links or unreachable pages, and the build is configured to fail on these conditions.
- `site-navigation`: The top-level tab structure and the grouping of pages within each tab, including the new iCalendar tab and the slimmed Home tab.
- `stub-page-consolidation`: Rules for when a topic gets its own page versus a section on a parent page, and the consolidated pages that result.

### Modified Capabilities

None. There are no existing specs in `openspec/specs/`.

## Impact

- `mkdocs.yml`: nav rewritten, `strict: true` added, deprecated analytics key removed.
- `docs/`: around 80 files deleted or merged, 4 new pages created (`installation.md`, `extensions/strategy.md`, `command/reference.md`, 7 template group pages), several pages edited for links and stale content.
- Published URLs change for every moved or merged page. Inbound links from ical4j.org, GitHub READMEs and search engines to paths such as `/extensions/strategy/event/` will 404 unless redirects are configured. The design covers this.
- No change to the Makefile or Mermaid diagram sources.
- Verification requires a local MkDocs Material install, which is not currently present in the environment.
