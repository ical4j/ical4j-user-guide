## 1. Build environment and baseline

- [x] 1.1 Create a Python virtual environment and install `mkdocs-material` and `mkdocs-redirects`; record the install and build commands in `README.md`
- [x] 1.2 Run a non-strict `mkdocs build` and save the full warning list to the change directory as the baseline
- [x] 1.3 Add `strict: true`, a `validation` block treating absolute links as relative to `docs/`, and the `redirects` plugin (empty `redirect_maps`) to `mkdocs.yml`; remove the top-level `google_analytics` key

## 2. Hygiene: nav targets and links

- [x] 2.1 Remove the 17 `extensions/link/*` nav entries and add a table of all 17 link types to `extensions/link/index.md`
- [x] 2.2 Fix the `./vcard.md` link in `examples/index.md` to point at `../vcard/examples.md`
- [x] 2.3 Fix any further unresolved links reported by the baseline build
- [x] 2.4 Run `mkdocs build` and confirm the only remaining failures are orphan-related

## 3. Hygiene: legacy content

- [x] 3.1 Create `installation.md` from the Maven coordinates table in `getting-started.md`; replace the table in Getting Started with a link
- [x] 3.2 Delete `roadmap.md`, `maven.md`, `external-resources.md`, `query.md`, `freebusy.md`, `services/index.md`; remove the commented-out Services nav block; add redirects for each
- [x] 3.3 Prune `faq.md` to the charset and GEO BigDecimal entries and any other still-accurate answers
- [x] 3.4 Rewrite the overview, requirements and download sections of `vcard/index.md` to reference RFC 6350 and Maven Central

## 4. Stub consolidation: Extensions

- [x] 4.1 Create `extensions/strategy.md` from `extensions/strategy/index.md` plus one section per strategy (Event, Observance, Action, Issue, Request, Note, Report, Availability, Entity, Group, Individual); delete the directory; add redirects to section anchors
- [x] 4.2 Merge `extensions/concept/*` into `extensions/concept.md` with one section per concept; delete the directory; add redirects

## 5. Stub consolidation: Serializer, Command, Template

- [x] 5.1 Fold `serializer/jotn/{alarm,available,location,participant,resource}.md` into `serializer/jotn/index.md` as sections; delete the files; add redirects
- [x] 5.2 Create `command/reference.md` from the seven `command/*` sub-pages with one section per command group; delete the sources; add redirects
- [x] 5.3 Create `template/groupware.md` from `template/groupware/*` (preserving Agenda, Attendance and Meeting bodies); delete the directory; add redirects
- [x] 5.4 Create `template/project.md`, `template/agile.md`, `template/budget.md`, `template/catalog.md`, `template/wiki.md`, `template/workflow.md` the same way; delete the directories; add redirects
- [x] 5.5 Fix the retrospective section's Meeting and Agenda links to point at `groupware.md` anchors

## 6. Nav restructure

- [x] 6.1 Rewrite the Home tab in `mkdocs.yml` to Introduction, Getting Started, Installation, Configuration, References (RFC Compliance, CUAs, Projects, Resources, FAQ)
- [x] 6.2 Add the iCalendar tab with Overview, Concepts, Features, Timezones, Platforms and Examples groups per the design
- [x] 6.3 Update the Extensions, Serializer, Command and Template tabs to reference the consolidated pages and the Template Object Types group
- [x] 6.4 Update internal links in `getting-started.md` and `index.md` that pointed at moved pages

## 7. Verification

- [x] 7.1 Run a strict `mkdocs build` and confirm it passes with no warnings
- [x] 7.2 Script a check that every `docs/**/*.md` file is referenced in `nav` and that every deleted or moved path from tasks 3 to 5 has a `redirect_maps` entry
- [x] 7.3 Serve the site locally and click through every tab, confirming the tab order and group contents match the site-navigation spec
- [x] 7.4 Spot-check at least five redirects (one deleted page, one strategy, one concept, one template type, one command sub-page) in the served site
