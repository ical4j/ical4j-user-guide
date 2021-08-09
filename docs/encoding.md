# Content Encoding

## Supported Encodings

By default, iCal4j supports the MIME encodings specified in [RFC2045](http://www.ietf.org/rfc/rfc2045.txt) as follows:

* 7BIT - An "indicator" that the data is 7bit data.
* 8BIT - An "indicator" that the data is 8bit data.
* BINARY - An "indicator" that the data is binary data.
* QUOTED-PRINTABLE - Transforms data into printable ASCII characters.
* BASE64 - Transforms data into the Base64 representation of its bytes.

## Additional Encodings

You may add support for additional encodings by providing an implementation of <pre>net.fortuna.ical4j.util.EncoderFactory</pre> and/or <pre>net.fortuna.ical4j.util.DecoderFactory</pre>. You can instruct iCal4j to use these factories by specifying the following system properties:

<pre>net.fortuna.ical4j.factory.encoder=<encoder_factory_class_name></pre>

<pre>net.fortuna.ical4j.factory.decoder=<decoder_factory_class_name></pre>
