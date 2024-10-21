# iCal4j Template - Thymeleaf

Thymeleaf is a popular templating framework for Java, with good support also built into the Spring framework.
This library provides templates and template fragments for rendering iCalendar and vCard data as HTML and
other formats.

## iCalendar

The following table outlines the supported iCalendar properties that are supported, and may be used to construct
custom UIs for calendar components.

| Property | Datatype | Readonly | Writable |
|----------|----------|----------|----------|
| ATTACH | URL or Binary | Icon with link (optional preview) | URL input or file upload control |
| CATEGORIES | Text list | List of Badges | Autocomplete text input field |
| CLASS | Text list | List of Badges | Dropdown selection |
| COMMENT | Multiline text | Rendered text (e.g. links with optional preview, dates and times, email, etc.) | Multiline text input |
| DESCRIPTION | Multiline text | Rendered text (e.g. links with optional preview, dates and times, email, etc.) | Multiline text input |
| GEO | Latitude/longitude pair | Map pin | Searchable geocode selection |
| LOCATION | Text | Formatted text with optional link (e.g. to a map) | Autocomplete text input field |
| PERCENT-COMPLETE | Integer (0-100) | Text or progress icon | Number input field |
| PRIORITY | Integer (0-9) | Badge (text corresponding to value) | Range slider field |
| RESOURCES | Text list | List of Badges with optional link | Autocomplete text input field |
| STATUS | Text | Badge | Dropdown selection |
| SUMMARY | Text | Rendered text (e.g. links with optional preview, dates and times, email, etc.) | Single line text input |
| COMPLETED | UTC timestamp | 
