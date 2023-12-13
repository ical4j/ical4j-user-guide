# iCal4j Extensions - Link

The iCalendar `LINK` property was recently ratified as a standard way of linking iCalendar objects with each other
or with externally addressable content. These extensions identify a subset of potentially useful types of linking
extracted from the list of registered link relations.

## Alternate

An Alternate link property provides the location of an alternate representation of the enclosing component. This
could be interpreted as a duplication of the `URL` property, however `LINK` property allows more freedom to
specify multiple representations of a component.

## Author

Identifies a component author, which can be important when a single component can be modified by multiple
collaborators.

## Bookmark

A permalink (bookmark) to the enclosing component.

## Copyright

A link to copyright notices for the enclosing component.

## Edit

A link to a form or application that supports editing of the enclosing component.
