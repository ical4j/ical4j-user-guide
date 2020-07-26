<strong>Q.</strong> Why does iCal4j use Jakarta Commons Logging?

<strong>A.</strong> I guess this is a question everyone is confronted with these days - I think much of the hostility towards commons logging is way overdone, but here are my reasons anyway: 
 
# I like log4j. I think its easier to use than java.util.logging. That's not to say that java.util.logging won't get better, or maybe another logging API will surpass log4j. So I'd like to leave the option open. 
# Following on from that, I also believe that the users of iCal4j should be free to choose what logging API they use. I don't want to force iCal4j users to use log4j just because I prefer it. 
# Commons logging is much smaller than log4j, so it is more friendly to include in the iCal4j distribution. Adding log4j would add an extra few hundred kilobytes. 
# I have seen many of the arguments against commons logging, and to some extent I agree: if you have a controlled development environment you may as well impose a concrete logging implementation (e.g. log4j). But with iCal4j I want to leave the choice up to the users (see 2. again!).



<strong>Q.</strong> Why does iCal4j provide its own Date and Timezone implementations rather than using something like Joda Time?

<strong>A.</strong> I have looked into it (especially for timezones) but found Joda Time to be a bit too heavy-weight for iCal4j. I also believe that for iCal4j its better to stick to the standard Java API that everyone knows rather than forcing people to learn a new Date/Time API. I think if Sun had used a few more interfaces in defining their Date/Time API we would all be better off, but unfortunately we have to make do with what we have.


<strong>Q.</strong> Where does iCal4j get timezone information from?

<strong>A.</strong> Timezone definitions in iCal4j are generated from the [Olson] [http://en.wikipedia.org/wiki/Zoneinfo Zoneinfo] database. Each release of iCal4j is updated with the latest Olson definitions. [http://java.sun.com/developer/technicalArticles/Intl/FAQ_appendix.html This](http://www.twinsun.com/tz/tz-link.htm) article from Sun appears to offer some details about the changes introduced in each release of the Olson data.


<strong>Q.</strong> Why does iCal4j have a minimum requirement of Java 1.4? Is it possible to use iCal4j with a pre-1.4 Java runtime?

<strong>A.</strong> Choosing Java 1.4 as the minimum required JVM was initially slightly arbitrary, and probably based on the fact that most people were using 1.4 as a minimum. 
 
Since then, however, there are three features of 1.4 I can think of that iCal4j requires: the URI class, the java.util.regex.* package (used in StringUtils) and the java.nio.charset package. 
 
If you don't think you will be needing these features in your own code, you may want to try compiling iCal4j with JDK 1.4 using the "-target 1.3" option but without specifying an alternative "-bootclasspath" option. From what I can tell, this should generate 1.3 bytecode that you can run on a 1.3 JVM. Note however, that if your code does cause iCal4j to load the URI or java.util.regex.* references then it will fail on a 1.3 JVM (as these APIs aren't available).


<strong>Q.</strong> When I create a GEO property using BigDecimals the string representation is incorrect. e.g:

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


<strong>Q.</strong> How do I generate calendar data using a non-standard charset?

<strong>A.</strong> The default charset used by the CalendarOutputter is UTF-8. If you would like to generate calendar data using a different charset you can do so by creating an instance of OutputStreamWriter (or whatever type of Writer you prefer), specifying the charset via the constructor. The CalendarOutputter will respect the charset specified for a Writer provided via the method:
<pre>CalendarOutputter.output(Calendar calendar, Writer out)</pre>


<strong>Q.</strong> Does iCal4j work with Android? I tried using it in my Android project but I get a <em>"verifier rejected class"</em> error.

<strong>A.</strong> iCal4j does works with Android, however you must remember to include the following iCal4j dependencies in addition to the iCal4j library:

* commons-lang
* commons-logging (Possibly optional - due to unofficial inclusion with Android)
* commons-codec (Possibly optional - due to unofficial inclusion with Android)

For more details see https://github.com/ical4j/ical4j/wiki/Android.

<strong>Q.</strong> How do I create a meeting request in MS Outlook that can be accepted by the Organizer?

<strong>A.</strong> It appears there is a bug in MS Outlook that can be solved by a hotfix. See [here](http://stackoverflow.com/questions/4349836/how-can-i-add-an-ics-meeting-automatically-to-the-organizers-calendar) for details.


<strong>Q.</strong> I cannot find the answer to my question. What should I do now?

<strong>A.</strong> If you cannot find what you need on this Wiki, the next best thing is to post a question in the [forums](http://sourceforge.net/forum/?group_id=107024).
