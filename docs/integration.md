# Enterprise Integration

iCal4j Integration provides iCalendar support for Enterprise Integration Pattern frameworks such as Apache Camel.

## Usage

Added the ical4j-integration dependency to your project and configure your routes:

<pre>
from('ical:http://tzurl.org/zoneinfo/Australia/Melbourne')
.to("mock:result")
</pre>

## Project Information

* [Project Home](http://github.com/ical4j/ical4j-integration/)
* [Javadocs](http://ical4j.github.io/docs/ical4j-integration/api/)

## Download

* [Releases](https://sourceforge.net/projects/ical4j/files/ical4j-integration/)
* [Snapshot Builds](https://oss.sonatype.org/content/repositories/snapshots/org/mnode/ical4j/ical4j-integration/)
