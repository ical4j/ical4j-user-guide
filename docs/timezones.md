# TimeZone

iCal4j provides it's own TimeZone implementation as opposed to using the default Java timezone implementation. This is to ensure that all timezones in iCal4j can be accurately represented using a VTIMEZONE component in calendar data.

The iCal4j timezone is essentially an implementation of <em>java.util.TimeZone</em> that is backed by a <em>net.fortuna.ical4j.component.VTimeZone</em> instance. Whilst a timezone instance may be created explicitly, typical usage is to obtain a TimeZoneRegistry instance and retrieve the timezone instance from the registry.

# TimeZoneRegistry

The iCal4j TimeZoneRegistry is a repository for instance of <em>net.fortuna.ical4j.model.TimeZone</em>, which are essentially implementations of <em>java.util.TimeZone</em> that are backed by a VTIMEZONE definition. The registry concept allows for the use of a different set of timezone definitions depending on the situation.

A custom TimeZoneRegistry implementation may also be provided to replace the default implementation. This may be required in situations where you maintain a common set of timezone definitions in a database or some other backing store. To specify an alternate implementation you need to implement a TimeZoneRegistryFactory and specify it via the following system property:

<pre>net.fortuna.ical4j.timezone.registry=<custom_factory_classname></pre>

## Loading registry data

To access timezone information provided in calendar form, you must first initialise a timezone registry with the data provided. This initialisation process is performed automatically when using the <em>net.fortuna.ical4j.data.CalendarBuilder</em> to load calendar data, such that obtaining an initialised registry is quite simple:

<pre>
CalendarBuilder builder = new CalendarBuilder();
Calendar calendar = builder.build(new FileInputStream("mycalendar.ics"));

TimeZoneRegistry registry = builder.getRegistry();
</pre>

TimeZone data is then retrievable as follows:

<pre>
TimeZone tz = registry.getTimeZone("Australia/Melbourne");
</pre>

<em>NOTE: If a timezone with the specified identifier is not available in the registry instance an attempt is made to load a timezone from the default ZoneInfo data included with iCal4j.</em>


## Referencing the default registry

In scenarios where you need to generate new iCalendar data and are required to explicitly specify timezone information you would need a reference to the default timezone registry. You do this by creating a new registry instance, but not loading any timezone data as follows:

<pre>
TimeZoneRegistry registry = TimeZoneRegistryFactory.getInstance().createRegistry();
</pre>

To add a VTimeZone definition to your calendar you would do something like this:

<pre>
VTimeZone tz = registry.getTimeZone("Australia/Melbourne").getVTimeZone();
calendar.getComponents().add(tz);
</pre>

# ZoneInfo

iCal4j includes a set of timezone definitions based on the latest [Olson database] [http://en.wikipedia.org/wiki/Zoneinfo ZoneInfo](http://www.iana.org/time-zones) data. These definitions are used by iCal4j for both interpreting calendar data that does not explicitly specify timezone information, and to include timezone information when generating new calendar data. Note that if a timezone is provided in the calendar data it will always take precedence over the built-in definitions.

Four different sets of timezone data are provided as follows:

* etc/zoneinfo - timezone data that uses common timezone identifiers (e.g. "Australia/Melbourne") <strong>(default)</strong>
* etc/zoneinfo-outlook - timezone data that is compatible with MS Outlook, and uses common timezone identifiers
* etc/zoneinfo-global - timezone data that uses globally-unique timezone identifiers (e.g. "/ical4j_1_0/Australia/Melbourne")
* etc/zoneinfo-outlook-global - timezone data that is compatible with MS Outlook, and uses globally-unique timezone identifiers

To use a zoneinfo set other than the default you will need to create a TimeZoneRegistryImpl instance as follows:

<pre>TimeZoneRegistry registry = new TimeZoneRegistryImpl("zoneinfo-outlook/")</pre>

## TzUrl

These timezone definitions are generated using [tzurl](http://code.google.com/p/tzurl/) - a fork of the vzic tool that now appears to be inactive (?).

As of 1.0-rc2 iCal4j will include support for automatically updating the built-in timezone definitions from the [tzurl.org](http://tzurl.org) site. In some cases this functionality may be undesirable (e.g. applications without Internet access), and as such automatic updating may be disabled by specifying the following directive in the ical4j.properties file or as a System property:

<pre>net.fortuna.ical4j.timezone.update.enabled=false</pre>

<em>NOTE: It is recommend that you create a custom TimeZoneRegistryFactory, as described above, to create such a TimeZoneRegistryImpl instance</em>

# Creating events with timezones

When creating Events, make sure, that you properly set the time zone within the DateTime object:

<pre>
TimeZoneRegistry registry = TimeZoneRegistryFactory.getInstance().createRegistry();
TimeZone timezone = registry.getTimeZone("Europe/Berlin");
VTimeZone tz = timezone.getVTimeZone();
[..]
DateTime start = new DateTime(startDate, timezone);
DateTime end = new DateTime(endDate, timezone);
VEvent meeting = new VEvent(start, end, "text");
</pre>
