# Compatibility with other CUAs

To increase interoperability with other CUAs a number of _Compatibility Hints_ are provided in iCal4j. You can enable these hints in one of three (3) ways:

## Enabling Compatibility Hints programmatically

Compatibility Hints can be enabled and disabled by calling the static method [CompatibilityHints.setHintEnabled()](http://ical4j.github.io/docs/ical4j/api/3.0.19/net/fortuna/ical4j/util/CompatibilityHints.html#setHintEnabled(java.lang.String,%20boolean)). For example:

    CompatibilityHints.setHintEnabled(KEY_RELAXED_UNFOLDING, true);

## Specifying Compatibility Hints in a properties file

1. Create a file called `ical4j.properties` and include it in the root of your classpath (alternatively you can copy a [sample file](http://ical4j.cvs.sourceforge.net/viewvc/*checkout*/ical4j/iCal4j/test/ical4j.properties) from CVS).

2. Add appropriate lines for enabling hints. So for example, to enable relaxed unfolding add the following:

        ical4j.unfolding.relaxed=true

The complete list of Compatibility Hint properties is as follows:

    ical4j.unfolding.relaxed={true|false}

    ical4j.parsing.relaxed={true|false}

    ical4j.validation.relaxed={true|false}

    ical4j.compatibility.outlook={true|false}

    ical4j.compatibility.notes={true|false}

## Specifying Compatibility Hints as System properties

You may also specify the same Compatibility Hints above as System properties. For example:

    java -Dical4j.unfolding.relaxed=true <some_program>

## Related

See [Configuring iCal4j](configuring.md) for a full list of configuration options.