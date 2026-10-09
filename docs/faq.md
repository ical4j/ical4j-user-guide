# Frequently Asked Questions

### <strong>Q.</strong> When I create a GEO property using BigDecimals the string representation is incorrect. e.g:

<pre>
        BigDecimal latitude = new BigDecimal(65.35);
        BigDecimal longitude = new BigDecimal(22.01);
        Geo geo = new Geo(latitude, longitude);

Output:

        GEO:65.349999999999994315658113919198513031005859375;22.01000000000000156
</pre>

<strong>A.</strong> This problem occurs when the number specified cannot accurately be represented by a double value in Java. More on this effect [here]. The solution is to use either a string representation of the specified number, or [http://java.sun.com/j2se/1.5.0/docs/api/java/math/BigDecimal.html#valueOf(double) BigDecimal.valueOf(double)](http://java.sun.com/j2se/1.5.0/docs/api/java/math/BigDecimal.html#BigDecimal(double)) to create your BigDecimal. i.e:

<pre>
        BigDecimal latitude = BigDecimal.valueOf(65.35);
        BigDecimal longitude = BigDecimal.valueOf(22.01);
        
        Geo geo = new Geo(latitude, longitude);
</pre>


### <strong>Q.</strong> How do I generate calendar data using a non-standard charset?

<strong>A.</strong> The default charset used by the CalendarOutputter is UTF-8. If you would like to generate calendar data using a different charset you can do so by creating an instance of OutputStreamWriter (or whatever type of Writer you prefer), specifying the charset via the constructor. The CalendarOutputter will respect the charset specified for a Writer provided via the method:
<pre>CalendarOutputter.output(Calendar calendar, Writer out)</pre>
