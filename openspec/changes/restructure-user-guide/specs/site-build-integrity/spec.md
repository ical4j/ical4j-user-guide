## ADDED Requirements

### Requirement: Strict build
The site build SHALL run with MkDocs `strict: true` enabled, so that any warning about a missing nav target, an unresolvable internal link or an unrecognised page fails the build.

#### Scenario: Clean tree builds
- **WHEN** `mkdocs build` is run against the repository
- **THEN** it exits with status 0 and emits no warnings

#### Scenario: Missing nav target fails the build
- **WHEN** a `nav` entry in `mkdocs.yml` references a file that does not exist under `docs/`
- **THEN** `mkdocs build` exits with a non-zero status naming the missing file

### Requirement: Every nav entry resolves to a file
Every path referenced in the `nav` section of `mkdocs.yml` SHALL correspond to an existing file under `docs/`.

#### Scenario: Link extension entries
- **WHEN** the `Extensions → Link` nav group is inspected
- **THEN** it contains only entries whose files exist, and the link types formerly listed as separate pages are described in a table on `extensions/link/index.md`

### Requirement: Every page is reachable or deleted
Every Markdown file under `docs/` SHALL be reachable from the `nav`, either directly or as a section of a page that is in the nav. Files that are neither reachable nor merged SHALL be deleted.

#### Scenario: Orphan audit
- **WHEN** the list of `docs/**/*.md` files is compared against paths referenced in `nav`
- **THEN** every file is either referenced in `nav` or no longer exists

### Requirement: Internal links resolve
All relative and site-absolute Markdown links between pages SHALL resolve to an existing page or anchor, and the build SHALL validate site-absolute links by treating them as relative to the `docs/` directory.

#### Scenario: Examples index vCard link
- **WHEN** a reader follows the "VCard Model" link on `examples/index.md`
- **THEN** they land on `vcard/examples.md`

#### Scenario: Retrospective link to groupware
- **WHEN** a reader follows the Meeting or Agenda links on the agile retrospective section
- **THEN** they land on the corresponding section of the consolidated groupware page

#### Scenario: Absolute link validation
- **WHEN** a page contains a link such as `/examples/model` and no page exists at `docs/examples/model.md`
- **THEN** `mkdocs build` reports the link as unresolved and fails under strict mode

### Requirement: Legacy content is removed or corrected
Pages whose content describes retired infrastructure or superseded tooling SHALL be removed, and pages with partially stale content SHALL be corrected so that no page states a requirement or location that is no longer true.

#### Scenario: Superseded pages deleted
- **WHEN** the `docs/` tree is listed after the change
- **THEN** `roadmap.md`, `maven.md`, `external-resources.md`, `query.md`, `freebusy.md` and `services/index.md` do not exist, and `mkdocs.yml` contains no commented-out `Services` nav block

#### Scenario: FAQ pruned
- **WHEN** `faq.md` is read
- **THEN** it contains only entries that are accurate for the current release, including the charset output and GEO BigDecimal answers, and contains no reference to Java 1.4, Jakarta Commons Logging or Joda Time

#### Scenario: vCard overview current
- **WHEN** `vcard/index.md` is read
- **THEN** it references RFC 6350 as the vCard specification, Maven Central for releases, and contains no reference to Retroweaver, Bintray, Java 5 or a vCard internet draft

### Requirement: Deprecated configuration removed
`mkdocs.yml` SHALL NOT contain the deprecated top-level `google_analytics` key; analytics configuration SHALL live only under `extra.analytics`.

#### Scenario: Config inspected
- **WHEN** `mkdocs.yml` is parsed
- **THEN** no top-level `google_analytics` key is present and `extra.analytics.property` is unchanged

### Requirement: Moved and deleted URLs redirect
Every page URL that existed before this change and is moved, merged or deleted SHALL redirect to the page or section that now holds its content, or to the nearest replacement page for deleted content.

#### Scenario: Merged page redirect
- **WHEN** a reader requests `/extensions/strategy/event/`
- **THEN** they are redirected to the Event section of `/extensions/strategy/`

#### Scenario: Deleted page redirect
- **WHEN** a reader requests `/maven/`
- **THEN** they are redirected to `/installation/`

#### Scenario: Redirect map complete
- **WHEN** the list of files deleted or moved by this change is compared with the `redirect_maps` entries in `mkdocs.yml`
- **THEN** every old path has an entry

### Requirement: Local build is documented
The repository README SHALL state the command needed to install the build dependencies and run a strict build locally.

#### Scenario: New contributor
- **WHEN** a contributor reads `README.md`
- **THEN** they find the install command for MkDocs Material and the redirects plugin, and the command to run a strict build
