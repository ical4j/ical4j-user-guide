## Context

The guide is a MkDocs Material site (`mkdocs.yml` at repo root, content under `docs/`) published at https://www.ical4j.org. It uses `navigation.tabs`, so the first level of `nav` becomes the tab bar. There are currently ten tabs: Home, vCard, Extensions, Connector, Integration, Serializer, Command, Streams, Graph, Template.

Audit findings (as of October 2026):

| Finding | Count |
|---|---|
| Nav entries whose file does not exist (all `extensions/link/*`) | 17 |
| Pages on disk not reachable from the nav | 59 |
| Pages of 4 lines or fewer | ~70 |
| Broken relative links | 2 |
| Legacy pages describing Java 1.4 / Bintray / 1.0 roadmap | 5 |

Content is a mix of three eras: the original 2008-era library docs (faq, maven, roadmap), a per-tool CLI era (`ical4j-query`, `ical4j-freebusy`, `services`), and the current era (`ict` CLI, agent, MCP, connectors). The nav only exposes the current era, but the older pages still ship and are indexed by search engines.

Internal links use a mix of site-absolute paths (`/examples/model`) and relative paths (`./parsing.md`). MkDocs is not installed in the local environment, so no build has been run against the current tree.

## Goals / Non-Goals

**Goals:**

- A strict build passes: no missing nav targets, no broken links, every page on disk reachable from the nav or deliberately deleted.
- The core `ical4j` library has its own tab, parallel to the other libraries.
- Home is a short entry point: Introduction, Getting Started, Installation, Configuration, References.
- No page exists that is only a title plus one sentence. Topics with that little content live as sections on a parent page.
- Legacy content that is false today (Java 1.4, Bintray, draft vCard spec) is removed or corrected.
- Readers with old bookmarks are redirected rather than shown a 404.

**Non-Goals:**

- Writing new substantive content for stubs. Consolidation preserves the existing sentences; it does not expand them.
- Resolving whether the template object-type taxonomy should merge with `extensions/concept`. That is an open question captured below, not decided here.
- Migrating analytics from Universal Analytics to GA4.
- Changing the Makefile, Mermaid diagrams or theme.
- Reorganising the CLI narrative beyond consolidating the orphaned command sub-pages.

## Decisions

**D1. Enable `strict: true` and link validation rather than relying on manual audits.**
MkDocs `strict` turns warnings (missing nav files, unrecognised relative links) into build failures. With MkDocs 1.6+ the `validation` block can also set `absolute_links: relative_to_docs` so site-absolute links are validated instead of ignored. Implementation note: MkDocs only resolves links that name a `.md` file, so the existing extensionless links (`/examples/model`, `examples`) cannot be validated as-is. The 42 such links in `index.md`, `getting-started.md`, `extensions/index.md`, `timezones.md` and `extensions/strategy/event.md` were converted to relative `.md` links. Material for MkDocs also prints a "MkDocs 2.0" banner as a warning, which strict mode treats as a failure; the build is run with `DISABLE_MKDOCS_2_WARNING=true`, documented in the README.

**D2. Remove the 17 `extensions/link/*` nav entries; do not create 17 stub pages.**
The link types come from the Semantic Calendaring proposal and a single table on `extensions/link/index.md` conveys the same information as 17 one-line pages. Pages can be split out later if any link type gains enough content to warrant it.

**D3. Delete superseded legacy pages instead of marking them historical.**
`roadmap.md`, `maven.md`, `external-resources.md`, `query.md`, `freebusy.md` and `services/index.md` describe things that no longer exist or are duplicated elsewhere (Maven coordinates in Getting Started, resources in `resources.md`). Keeping them "for history" keeps them in search results. Git history preserves them. `faq.md` is the exception: two answers (charset output, GEO with BigDecimal) remain true, so it is pruned and kept under References.

**D4. Use the `mkdocs-redirects` plugin for every moved or deleted URL.**
Every consolidation changes a public URL. A `redirect_maps` block in `mkdocs.yml` maps each old path to its new page (or anchor on a consolidated page). Deleted legacy pages redirect to the nearest replacement (`maven.md` → `installation.md`, `query.md` and `freebusy.md` → `command/index.md`, `services/index.md` → `command/index.md`). Alternative: accept 404s. Rejected; the site is long-lived and widely linked.

**D5. Stub threshold: a topic gets its own page only when it has more than a heading and a short paragraph.**
Concretely: fewer than roughly 10 lines of body with no code sample or table becomes a `##` section on its parent. Applied to:

| Source | Result |
|---|---|
| `extensions/strategy/*` (12 files) | `extensions/strategy.md`, one section per strategy; `entity.md` and `event.md` content kept intact as sections |
| `extensions/concept/*` (9 files) | `extensions/concept.md` (already exists as an orphan), one section per concept |
| `serializer/jotn/{alarm,available,location,participant,resource}.md` | sections on `serializer/jotn/index.md`; the six substantive JOTN pages stay |
| `template/{agile,budget,catalog,groupware,project,wiki,workflow}/*` (45 files) | one page per group, e.g. `template/groupware.md`, with one section per type; `agenda.md`, `attendance.md`, `meeting.md` (33 to 49 lines) keep their content as sections |
| `command/{calendar,card,channel,collection,itip,store,template}.md` | `command/reference.md` with one section per command group |

**D6. Give the core library a tab named "iCalendar".**
The tab name matches the Active Projects table in the introduction, where the core library is described as iCalendar model and parsing support. The tab groups pages as Concepts, Features, Timezones, Platforms, Examples. "Core" and "ical4j" were considered; "ical4j" is ambiguous with the site name, and "Core" means nothing to a new reader.

Target nav (first two levels):

```
Home        Introduction · Getting Started · Installation · Configuration · References
iCalendar   Overview · Concepts · Features · Timezones · Platforms · Examples
vCard       Overview · Examples
Extensions  Overview · CalDAV · Outlook · Participant · Concept · Link · Strategy
Connector   Overview · Local · DAV · Google Calendar · Microsoft Graph
Integration Overview · Email · Websub · Webhooks · XMPP
Serializer  Overview · XML · JSON · JSON-LD · JMAP · JOTN
Command     Overview · Reference · Agent · MCP
Streams     Overview · Workflow
Graph       Overview
Template    Overview · Examples · Thymeleaf · Object Types
```

**D7. Split Installation out of Getting Started.**
Getting Started is a prose guide to choosing a library; the Maven coordinates table is a lookup reference that readers return to. Separating them lets Getting Started link to Installation and lets the deleted `maven.md` redirect somewhere accurate.

**D8. Keep `transformations.md`, `osgi.md`, `tzurl.md`, and the Integration stubs as pages despite being short.**
They are each the only page for a real, current feature or library, have a javadoc link or a distinct URL readers may already use, and have nowhere natural to fold into. They are flagged in Open Questions as needing content, which is outside this change.

## Risks / Trade-offs

- [Strict mode fails on something not in the audit, such as an absolute link to a path that does not resolve] → Run the build early in implementation, before consolidation, to get the full warning list; fix in the hygiene tasks.
- [Consolidating template pages pre-empts the unresolved question of whether they belong with `extensions/concept`] → Consolidation is reversible; the one-page-per-group form is easier to move or merge later than 45 files.
- [Redirect map is large and easy to get wrong] → Generate the map from the list of deleted and moved files during implementation and spot-check a sample in the built site.
- [Readers lose the per-type pages they may have bookmarked] → Redirects target anchors on the consolidated pages, so bookmarks land on the right section.
- [`mkdocs-redirects` is a new dependency for the build] → It is a widely used, single-purpose plugin; document it in the README alongside the install step.
- [No local MkDocs install] → First task installs MkDocs Material and the redirects plugin into a virtual environment and records the command in the README.

## Migration Plan

1. Install MkDocs Material and `mkdocs-redirects` locally; run a non-strict build to capture the baseline warning list.
2. Hygiene tasks: fix nav targets, broken links, legacy pages, analytics key. Build with `strict: true` and confirm it passes before any restructuring.
3. Consolidation tasks, one group at a time, adding redirect entries as each group is merged. Build after each group.
4. Nav restructure, then final strict build and manual click-through of each tab.
5. Rollback: the change is a single branch; revert the branch. Redirects make partial rollout safe because old URLs continue to resolve either way.

## Open Questions

- Should the template object-type taxonomy (groupware, project, agile, etc.) eventually merge with `extensions/concept`, which describes the same nouns? Deferred; consolidated pages make either outcome easy.
- Which short pages kept under D8 are worth writing up next (`transformations`, `osgi`, `tzurl`, `connector/dav`, `connector/local`, `serializer/{xml,json,jsonld,jmap}`)? Out of scope here; candidates for a follow-up change.
- Is the `services` pipeline vision (`ical4j template meeting | ical4j useragent request | ...`) still a direction for the project, or fully superseded by `ict`? This change deletes the page on the assumption it is superseded; confirm before implementation.
