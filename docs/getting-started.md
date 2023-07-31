# Getting Started

These instructions are designed to help you get a basic setup, to be able to start coding with iCal4j.

## Download

iCal4j libraries are currently published directly to [Maven Central](https://search.maven.org). Use the following
table to identify current coordinates for iCal4j libraries:

   | Name                    | Current Coordinates                                                                 | Deprecated Coordinates                                                         |
|-------------------------|-------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| ical4j                  | [Maven](https://search.maven.org/artifact/org.mnode.ical4j/ical4j)                  | -                                                                              |
| ical4j-vcard            | [Maven](https://search.maven.org/artifact/org.mnode.ical4j/ical4j-vcard)            | -                                                                              |
| ical4j-extensions       | [Maven](https://search.maven.org/artifact/org.mnode.ical4j/ical4j-extensions)       | -                                                                              |
| ical4j-zoneinfo-outlook | [Maven](https://search.maven.org/artifact/org.mnode.ical4j/ical4j-zoneinfo-outlook) | -                                                                              |
| ical4j-template | <a href="https://search.maven.org/artifact/org.mnode.ical4j/ical4j-template" target="_blank">Maven</a> | -                                                                              |
| ical4j-connector        | [Maven](https://search.maven.org/search?q=g:org.ical4j%20a:ical4j-connector*)       | [Maven](https://search.maven.org/artifact/org.mnode.ical4j/ical4j-connector)   |
| ical4j-integration      | [Maven](https://search.maven.org/search?q=g:org.ical4j%20a:ical4j-integration*)     | [Maven](https://search.maven.org/artifact/org.mnode.ical4j/ical4j-integration) |
| ical4j-serializer       | [Maven](https://search.maven.org/artifact/org.ical4j/ical4j-serializer)             | [Maven](https://search.maven.org/artifact/org.mnode.ical4j/ical4j-serializer)  |


## Extract

Extract the files included in the zip archive to a folder on your hard drive.

## Build (Optional)

If you choose to download the source distribution you will need to build the library. This can be done using the [Gradle](http://gradle.org/) build script (build.gradle) found in the root directory.


## Include in your Classpath

Including iCal4j in your classpath depends on how you are developing your software. Typically an IDE such as [Eclipse] is used, in which case you would right-click on your Eclipse project and add the ical4j.jar to the Build Path. Note that you will also need to include all compile-time [https://github.com/ical4j/ical4j#system-requirements dependencies](http://www.eclipse.org/) in your classpath also.

## Add Import Statements to Your Classes

Add import statements in your classes to reference the appropriate net.fortuna.ical4j.* packages or the specific classes you'll be using.  For example, to use the Calendar class, add:

import net.fortuna.ical4j.model.*;

or

import net.fortuna.ical4j.model.Calendar;

## Ready to go!

You should now be ready to start working with iCal4j.
