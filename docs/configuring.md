# Configuring iCal4j

This page provides a comprehensive list of all configuration properties for iCal4j libraries and services.

## iCal4j

The following table describes System properties specific to the core iCal4j library.


| System Property                                           | Description                                                                                                        | Value                                                                                   | Default                                                   |
|-----------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------|-----------------------------------------------------------|
| ical4j.unfolding.relaxed                                  | Enables more lenient parsing of folded (split) content lines                                                       | {true/false}                                                                            | false                                                     |
| ical4j.parsing.relaxed                                    | A global hint to enable more lenient parsing of iCalendar data                                                     | {true/false}                                                                            | false                                                     |
| ical4j.validation.relaxed                                 | A global hint that enables lenient validation of iCalendar data                                                    | {true/false}                                                                            | false                                                     |
| ical4j.compatibility.outlook                              | A hint that improves compatibility with iCalendar data produced by MS Outlook                                      | {true/false}                                                                            | false                                                     |
| ical4j.compatibility.notes                                | A hint that improves compatibility with iCalendar data produced by Lotus Notes                                     | {true/false}                                                                            | false                                                     |
| net.fortuna.ical4j.factory.decoder                        | Override the default decoder implementation for working with encoded strings                                       | A fully qualified class that extends `net.fortuna.ical4j.util.DecoderFactory`           | `net.fortuna.ical4j.util.DefaultDecoderFactory`           |
| net.fortuna.ical4j.factory.encoder                        | Override the default encoder implementation for working with encoded strings                                       | A fully qualified class that extends `net.fortuna.ical4j.util.EncoderFactory`           | `net.fortuna.ical4j.util.DefaultEncoderFactory`           |
| net.fortuna.ical4j.parser                                 | Override the default iCalendar parser implementation                                                               | A fully qualified class implementing `net.fortuna.ical4j.data.CalendarParser`           | `net.fortuna.ical4j.data.CalendarParserImpl`              |
| net.fortuna.ical4j.recur.maxincrementcount                | The maximum number of increments applied to a recurrence rule when calculating instances                           | A positive integer value (or -1 for unlimited)                                          | 1000                                                      |
| net.fortuna.ical4j.timezone.cache.impl                    | Override the default cache implementation for timezone definition updates                                          | A fully qualified class implementing `net.fortuna.ical4j.util.TimeZoneCache`            | `net.fortuna.ical4j.util.MapTimeZoneCache`                |
| net.fortuna.ical4j.timezone.date.floating                 | Use the local default timezone for the implementation of `DATE` properties (applicable for iCal4j 3.x and earlier) | {true/false}                                                                            | false                                                     |
| net.fortuna.ical4j.timezone.default.utc                   | Use UTC as the default timezone for `DATE-TIME` properties                                                         | {true/false}                                                                            | false                                                     |
| net.fortuna.ical4j.timezone.offset.negative_dst_supported | As the Java Timezone implementation doesn't support negative offsets, enable to ignore negative offset definitions | {true/false}                                                                            | false                                                     |
| net.fortuna.ical4j.timezone.registry                      | Override the default timezone registry implementation                                                              | A fully qualified class that extends `net.fortuna.ical4j.model.TimeZoneRegistryFactory` | `net.fortuna.ical4j.model.DefaultTimeZoneRegistryFactory` |
| net.fortuna.ical4j.timezone.update.enabled                | Enable automatic update of timezone definitions from [tzurl.org](https://tzurl.org)                                | {true/false}                                                                            | true                                                      |
| net.fortuna.ical4j.timezone.update.host                   | Override the default host for timezone definition updates                                                          | A target host capable of supplying timezone definitions                                 | `www.tzurl.org`                                           |
| net.fortuna.ical4j.timezone.update.port                   | Override the default port for timezone definition updates                                                          | A port number (typically `80` or `443`)                                                 | `443`                                                     |
| net.fortuna.ical4j.timezone.update.proxy.enabled          | Use a proxy for timezone updates                                                                                   | {true/false}                                                                            | false                                                     |
| net.fortuna.ical4j.timezone.update.proxy.host             | Proxy server host name (e.g. `proxy.example.com`)                                                                  | A target proxy host                                                                     | -                                                         |
| net.fortuna.ical4j.timezone.update.proxy.port             | Proxy server port (e.g. `3128`)                                                                                    | A port number                                                                           | -                                                         |
| net.fortuna.ical4j.timezone.update.proxy.type             | Proxy type (e.g. `DIRECT` / `HTTP` / `SOCKS`)                                                                      | {`DIRECT`/`HTTP`/`SOCKS`}                                                               | -                                                         |
| net.fortuna.ical4j.timezone.update.scheme                 | Override the default scheme for timezone definition updates                                                        | A URI scheme (typically `http` or `https`)                                              | `https`                                                   |
| net.fortuna.ical4j.timezone.update.timeout.connect        | Specifiy a connection timeout for timezone updates                                                                 | A timeout in milliseconds, e.g. 10000 - 10s                                             | -                                                         |
| net.fortuna.ical4j.timezone.update.timeout.read           | Specify a read timeout for timezone updates                                                                        | A timeout in milliseconds, e.g. 10000 - 10s                                             | -                                                         |

## iCal4j vCard

The following table describes System properties applicable to the iCal4j vCard library.


| System Property        | Description                                                | Value        | Default |
|------------------------|------------------------------------------------------------|--------------|---------|
| ical4j.parsing.relaxed | A global hint to enable more lenient parsing of vCard data | {true/false} | false   |

## iCal4j Connector

TBD.

## iCal4j Integration

TBD.

