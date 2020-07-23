Date and time types in iCal4j are all extensions of the Iso8601 type. This type uses a date format instance (with an associated timezone) for string parsing and formatting.

==Date==

A Date represents a day of the year, with no time component. As time is irrelevant for a Date instance, no timezone information is associated with a Date (*).

* Note that with the iCal4j implementation this is not entirely true. As dates are represented using Java's java.text.DateFormat, a timezone is inherently associated with dates. For this reason, by default Date implementations will use the GMT timezone for formatting and parsing. You can override this to use the local timezone by specifying the following flag as a system property or in the ical4j.properties file:

<pre>net.fortuna.ical4j.timezone.date.floating=true</pre>

==DateTime==

A DateTime represents a time of day on a specific day of the year. There are three (3) variants of DateTime representation.

===Date with Local Time===

A date with local time does not explicitly specify an associated timezone, and is said to be "floating" in the sense that it represents a time in the local timezone of the CUA. For this reason, floating DateTime instances will always use the default timezone for parsing and formatting string representations. An example of a floating DateTime instance is as follows:

<pre>DTSTART:19980118T230000</pre>

===Date with UTC Time===

A DateTime may be specified as in UTC time by appending a 'Z' to the string representation as follows:

<pre>DTSTART:19980119T070000Z</pre>

In iCal4j, a DateTime instance parsed from such a string representation, or explicitly defined as a UTC instance, will use the "Etc/UTC" timezone for parsing and formatting string representations.

===Date with Local Time and a Timezone reference===

A DateTime may also be specified with a timezone reference, meaning that the time is associated with an explicit timezone. For example:

<pre>DTSTART;TZID=US-Eastern:19980119T020000</pre>

In iCal4j, DateTime instances generated from parsing such a string, or explicitly defined with an associated timezone, will use the specified timezone for parsing and formatting string representations.
