You can use iCal4j directly in your Android applications. Instructions for adding third-party libraries in Eclipse available [here](http://code.google.com/android/kb/commontasks.html#addexternallibrary).

# Gradle/AndroidStudio

You can use iCal4j with your AndroidStudio/gradle buildfile.
This is a working build.gradle example taken from https://github.com/k3b/CalendarIcsAdapter

<pre>
apply plugin: 'android'

configurations {
	// referenced in some portable lib. use android internal instead
	compile.exclude group: 'commons-logging' 
}

android {
	compileSdkVersion 19
	buildToolsVersion '20'

	packagingOptions {
		// prevent duplicate files
		exclude 'META-INF/LICENSE.txt'
		exclude 'META-INF/NOTICE.txt'

		//!!! andoird buildToolsVersion 19.0.3 does not support exclude with wildcards yet :-(
		exclude('org/apache/commons/codec/language/bm/*.txt')		//  124 files (uncompressed 215kb) with unused language specific rules
	}

	defaultConfig {
		minSdkVersion 7
		targetSdkVersion 19
	}
}

dependencies {
	compile 'org.mnode.ical4j:ical4j:1.0.5'
	compile 'backport-util-concurrent:backport-util-concurrent:3.1'
	compile 'commons-codec:commons-codec:1.8'
	compile 'commons-lang:commons-lang:2.6'
}
</pre>

# Eclipse

The [Android eclipse plugin](http://developer.android.com/sdk/eclipse-adt.html) is quite useful for creating Android projects, just remember that to make resources visible to the iCal4j library they should be added to the 'src' directory rather than 'res'. For example;

<pre>
<project_root>
- src
+- ical4j.properties
+- <your Android source>
- res
+- <your Android app resources>
- lib
+- ical4j.jar
+- commons-logging.jar
+- commons-lang.jar
+- commons-codec.jar
+- backport-util-concurrent.jar
</pre>


# Maven

The [Android maven plugin](http://code.google.com/p/maven-android-plugin/) allows you to configure your dependencies, such as iCal4j in the usual way. The important parts to your pom.xml are as follows:

<pre>
<project ..>
        ...
	<packaging>apk</packaging>
	<dependencies>
		<dependency>
			<groupId>net.fortuna.ical4j</groupId>
			<artifactId>ical4j</artifactId>
			<version>1.0-SNAPSHOT</version>
		</dependency>
		<dependency>
			<groupId>com.google.android</groupId>
			<artifactId>android</artifactId>
			<version>1.6_r2</version>
			<scope>provided</scope>
		</dependency>
	</dependencies>
	<build>
		<sourceDirectory>src</sourceDirectory>
		<testSourceDirectory>test</testSourceDirectory>

		<plugins>
			<plugin>
				<groupId>com.jayway.maven.plugins.android.generation2</groupId>
				<artifactId>maven-android-plugin</artifactId>
				<version>2.6.0</version>
				<configuration>
					<sdk>
						<platform>4</platform>
					</sdk>
					<emulator>
						<avd>SE_X10_Mini</avd>
					</emulator>
					<deleteConflictingFiles>true</deleteConflictingFiles>
					<undeployBeforeDeploy>true</undeployBeforeDeploy>
				</configuration>
				<extensions>true</extensions>
			</plugin>
			<plugin>
				<artifactId>maven-compiler-plugin</artifactId>
				<configuration>
					<source>5</source>
					<target>5</target>
				</configuration>
			</plugin>
		</plugins>
	</build>
</project>
</pre>

A simple Android test project has been created to demonstrate iCal4j usage. You can browse the contents of this project [here](http://ical4j.cvs.sourceforge.net/viewvc/ical4j/android-test/).

# Caveats

Note that there are a couple of library dependencies that are required by iCal4j that are also included in Android (but not exposed in the API docs). These are:

* commons-logging
* commons-codec
* backport-util-current (not required for Java 5+)

As a result I *believe* (untested) that you won't need to include these dependencies in your APK. The easiest way to exclude them using maven is to change the scope to provided for these dependences. ie:

<pre>
<project ..>
        ...
	<dependencies>
		<dependency>
			<groupId>net.fortuna.ical4j</groupId>
			<artifactId>ical4j</artifactId>
			<version>1.0</version>
		</dependency>
		<dependency>
			<groupId>commons-logging</groupId>
			<artifactId>commons-logging</artifactId>
			<version>1.1.1</version>
			<scope>provided</scope>
		</dependency>
		<dependency>
			<groupId>commons-codec</groupId>
			<artifactId>commons-codec</artifactId>
			<version>1.2</version>
			<scope>provided</scope>
		</dependency>
		<dependency>
			<groupId>backport-util-concurrent</groupId>
			<artifactId>backport-util-concurrent</artifactId>
			<version>3.1</version>
			<scope>provided</scope>
		</dependency>
		<dependency>
			<groupId>com.google.android</groupId>
			<artifactId>android</artifactId>
			<version>2.3.3</version>
			<scope>provided</scope>
		</dependency>
	</dependencies>
</project>
</pre>

# Reducing Android-footprint by using proguard

ical4j has several groovy classes that are not supported by android
and fortunately you can live without them under android.

You can remove unused staff from your android app using proguard.

Here is a working example from https://github.com/k3b/CalendarIcsAdapter

<pre>
#  proguard-rules.txt
#
## ical4j also contains groovy code which is not used in android
-dontwarn groovy.**
-dontwarn org.codehaus.groovy.**
-dontwarn org.apache.commons.logging.**
-dontwarn sun.misc.Perf

-dontnote com.google.vending.**
-dontnote com.android.vending.licensing.**

###################
# Get rid of #can't find referenced method in library class java.lang.Object# warnings for clone() and finalize()
# Warning: net.fortuna.ical4j.model.CalendarFactory: can't find referenced method 'void finalize()' in library class java.lang.Object
# Warning: net.fortuna.ical4j.model.ContentBuilder: can't find referenced method 'java.lang.Object clone()' in library class java.lang.Object
# for details see http://stackoverflow.com/questions/23883028/how-to-fix-proguard-warning-cant-find-referenced-method-for-existing-methods
-dontwarn net.fortuna.ical4j.model.**

###############
# I use proguard only to remove unused stuff and to keep the app small.
# I donot want to obfuscate (rename packages, classes, methods, ...) since this is open source
-keepnames class ** { *; }
-keepnames interface ** { *; }
-keepnames enum ** { *; }

</pre>

Statistics:

* without proguard obfuscation: 932 classes; apk 911kb.
* with proguard obfuscation: 365 classes;apk 505kb

Note: If you want to use proguard with gradle your build.gradle also needs this:

<pre>
    buildTypes {
        release {
            minifyEnabled true
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.txt'
        }
        debug {
            minifyEnabled true
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.txt'
        }
    }
</pre>

Further instructions on reducing the size of your APK using Proguard are available [here](http://code.google.com/p/maven-android-plugin/wiki/ProGuard).
