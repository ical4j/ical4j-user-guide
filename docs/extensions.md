=Extensions=

iCal4j Extensions is a Java library that provides support for widely used non-standard iCalendar objects (i.e. properties and parameters). These model extensions are implemented via the [[ModelExtensions|custom object registry]] support in iCal4j.

===Usage===

To add support for extensions you may register the required factories with your CalendarBuilder instance:

<pre>
        CalendarParser parser = CalendarParserFactory.getInstance().createParser();
        
        PropertyFactoryRegistry propertyFactoryRegistry = new PropertyFactoryRegistry();
        propertyFactoryRegistry.register(WrTimezone.PROPERTY_NAME, WrTimezone.FACTORY);
        propertyFactoryRegistry.register(WrCalName.PROPERTY_NAME, WrCalName.FACTORY);
        
        ParameterFactoryRegistry parameterFactoryRegistry = new ParameterFactoryRegistry();
        
        TimeZoneRegistry tzRegistry = TimeZoneRegistryFactory.getInstance().createRegistry();
        
        builder = new CalendarBuilder(parser, propertyFactoryRegistry, parameterFactoryRegistry, tzRegistry);
</pre>

===Minimum requirements===

iCal4j Extensions requires a minimum of Java 5 due to the use of features introduced in this version. If you need to run on an earlier version of Java, consider using [http://retroweaver.sourceforge.net Retroweaver].

===Project Information===

* [http://github.com/ical4j/ical4j-extensions/ Project Home]
* [http://ical4j.github.io/docs/ical4j-extensions/api/ Javadocs]

===Download===

* [https://sourceforge.net/projects/ical4j/files/ical4j-extensions/ Releases]
* [http://m2.modularity.net.au/snapshots/net/fortuna/ical4j/ical4j-extensions/ Snapshot Builds]

Traditionally any components, properties and parameters not defined by [http://www.ietf.org/rfc/rfc2445.txt RFC2445] are classified as <em>non-standard</em> or <em>extension</em> objects. These objects must include the <strong>"X-"</strong> name prefix to be compliant with the specification.

In the iCal4j object model, these objects are represented by the XComponent, XProperty and XParameter classes respectively. Names that do not conform to the <strong>"X-"</strong> name prefix requirement may be supported by enabling the following Compatibility Hint:

<pre>ical4j.parsing.relaxed</pre>

=== Extension Factory Registration ===

There are a number of deficiences with above approach, most notably that only <em>String</em> values are supported by X{Component|Property|Parameter}, and there is no option for supporting some well-known non-standard objects.

== PropertyFactoryRegistry ==

You can now add support for extension properties by registering custom <em>PropertyFactory</em> implementations:

<pre>
PropertyFactory somePropertyFactory = ...

PropertyFactoryRegistry propertyFactoryRegistry = new PropertyFactoryRegistry();
propertyFactoryRegistry.register(somePropertyFactory);

CalendarBuilder builder = new CalendarBuilder(CalendarParserFactory.getInstance().createParser(),
    ComponentFactory.getInstance(),
    propertyFactoryRegistry,
    new ParameterFactoryRegistry(),
    TimeZoneRegistryFactory.getInstance().createRegistry());

Calendar calendar = builder.build(..);
</pre>

== ParameterFactoryRegistry ==

Extension parameters are also supported:

<pre>
ParameterFactory someParameterFactory = ...

ParameterFactoryRegistry parameterFactoryRegistry = new ParameterFactoryRegistry();
parameterFactoryRegistry.register(someParameterFactory);

CalendarBuilder builder = new CalendarBuilder(CalendarParserFactory.getInstance().createParser(),
    ComponentFactory.getInstance(),
    new PropertyFactoryRegistry(),
    parameterFactoryRegistry,
    TimeZoneRegistryFactory.getInstance().createRegistry());

Calendar calendar = builder.build(..);
</pre>

== Common Extensions ==

A collection of commonly used iCalendar extension objects are available in the [[Extensions|ical4j-extensions]] sub-project.
