# Android Support

You can use iCal4j directly in your Android applications. 
Instructions for adding third-party libraries in Eclipse available [here](http://code.google.com/android/kb/commontasks.html#addexternallibrary).

**NOTE: Recent changes to example gradle build and proguard configs provided in this [issue](https://github.com/ical4j/ical4j/issues/665)**

## Gradle/AndroidStudio

You can use iCal4j with your AndroidStudio/gradle buildfile.

This is a working build.gradle example taken from https://github.com/k3b/calef/blob/master/app/build.gradle

```groovy
apply plugin: 'com.android.application'

android {
    compileSdk 34
    packagingOptions {
        jniLibs {
            excludes += ['META-INF/groovy/**', 'zoneinfo-global/**']
        }
        resources {
            excludes += ['META-INF/LICENSE.txt', 'META-INF/NOTICE.txt', '**/package-info.java', 'META-INF/groovy-release-info.properties', 'META-INF/INDEX.LIST', 'META-INF/groovy/**', 'zoneinfo-global/**', 'org/apache/commons/codec/language/bm/*.txt']
        }
    }


    defaultConfig {
        applicationId "de.k3b.android.calef"
        // Android 4.0 (api14)
        minSdkVersion 14
        //noinspection EditedTargetSdkVersion
        targetSdkVersion 34

        versionCode 6
        versionName "1.1.2.1"

        // 1.1.2.1 (6) maintanance Updated libs and compileSdk
        // 1.1.2 (5) Fixed Initialisation Error
        // 1.1.1 (4) reordered Settings; Fixed Initialisation Error
        // 1.1.0 (3) added optional message prefix ("I have added this to my calendar")
        // 1.0.1 (2) fixed translation issues
        // 1.0.0 (1) initial Release translated in en and de
    }

    buildTypes {
        release {
            minifyEnabled true
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
            resValue "string", "debug_title", ""

        }
        debug {
            minifyEnabled false
            applicationIdSuffix ".debug"
            versionNameSuffix "-DEBUG"
            resValue "string", "debug_title", "DEBUG-" + getDate()
        }
    }
    compileOptions {
        // java 8 needed for android-4.x
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
    namespace 'de.k3b.android.calef'
    lint {
        abortOnError false
        // checkReleaseBuilds false

        // http://stackoverflow.com/questions/31350350/generating-signed-apk-error7-missingtranslation-in-build-generated-res-gen
        // MissingTranslation : not all crowdwin translations are complete so ignore them
        // ValidFragment : local (dialog-)fragment class for customized directory picker is fragile but on rotation code makes sure that dialog is closed.
        // disable 'MissingTranslation','ValidFragment', 'ContentDescription', 'AndroidLintPluralsCandidate', 'AndroidLintRtlHardcoded'
        // disable 'MissingTranslation','ValidFragment', 'ContentDescription', 'ExpiredTargetSdkVersion'
        disable 'MissingTranslation', 'ContentDescription', 'ExpiredTargetSdkVersion'
    }
}

dependencies {
    implementation 'androidx.annotation:annotation:1.7.0'

    // ical4j see https://ical4j.github.io/ical4j-user-guide/examples/
//    implementation 'org.mnode.ical4j:ical4j:3.1.0' // requires api-26 + java11
//    implementation 'org.mnode.ical4j:ical4j:3.0.29' // requires api-26 + java11
//    implementation 'org.mnode.ical4j:ical4j:1.0.8' // most recent version 1.x: compiles with api-7 + java6

    //noinspection GradleDependency
    // most recent version 2.x: compiles with api-14 + java8
    implementation 'org.mnode.ical4j:ical4j:2.2.7'

    // required by ical4j R8-minify: must be present in order to be removed :-/
    implementation 'javax.cache:cache-api:1.1.1'

    implementation 'backport-util-concurrent:backport-util-concurrent:3.1'

    // do not automatically update to 20041127.091804 which is much older that 1.16.0
    //noinspection GradleDependency
    implementation 'commons-codec:commons-codec:1.16.0'

    // do not automatically update to 20030203.000129 which is much older that 2.6
    //noinspection GradleDependency
    implementation 'commons-lang:commons-lang:2.6'

    testImplementation 'junit:junit:4.13.2'

    implementation 'org.slf4j:slf4j-api:2.0.9'
    testImplementation 'org.slf4j:slf4j-simple:2.0.9'
    // causes warning in unittests: "SLF4J: Class path contains multiple SLF4J bindings."
    implementation 'uk.uuid.slf4j:slf4j-android:2.0.9-0'
    // uses app/src/main/resources/uk/uuid/slf4j/android/config.properties
}


static def getDate() {
    def date = new Date()
    def formattedDate = date.format('yyyyMMdd-HH:mm')
    return formattedDate
}
```

## Eclipse

The [Android eclipse plugin](http://developer.android.com/sdk/eclipse-adt.html) is quite useful for creating Android projects, just remember that to make resources visible to the iCal4j library they should be added to the 'src' directory rather than 'res'. For example;

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


## Maven

The [Android maven plugin](http://code.google.com/p/maven-android-plugin/) allows you to configure your dependencies, such as iCal4j in the usual way. The important parts to your pom.xml are as follows:

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

A simple Android test project has been created to demonstrate iCal4j usage. You can browse the contents of this project [here](http://ical4j.cvs.sourceforge.net/viewvc/ical4j/android-test/).

## Caveats

Note that there are a couple of library dependencies that are required by iCal4j that are also included in Android (but not exposed in the API docs). These are:

* commons-logging
* commons-codec
* backport-util-current (not required for Java 5+)

As a result I *believe* (untested) that you won't need to include these dependencies in your APK. The easiest way to exclude them using maven is to change the scope to provided for these dependences. ie:

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

## Reducing Android-footprint by using proguard

iCal4j has several groovy classes that are not supported by android,
and fortunately you can live without them under android.

You can remove unused classes from your android app using proguard.

Here is a working example from https://github.com/k3b/calef/blob/master/app/proguard-rules.pro

```
# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

#
## ical4j also contains groovy code which is not used in android
-dontwarn groovy.**
-dontwarn org.codehaus.groovy.**
-dontwarn org.apache.commons.logging.**

-dontnote com.google.vending.**
-dontnote com.android.vending.licensing.**

## log4j: remove net.fortuna.ical4j.util.JCacheTimeZoneCache.** that requires javax.cache.**
## use MapTimeZoneCache instead
-assumenosideeffects class net.fortuna.ical4j.util.JCacheTimeZoneCache
-assumenosideeffects class javax.cache.Cache
-assumenosideeffects class javax.cache.CacheManager
-assumenosideeffects class javax.cache.Caching
-assumenosideeffects class javax.cache.configuration.Configuration
-assumenosideeffects class javax.cache.configuration.MutableConfiguration
-assumenosideeffects class javax.cache.spi.CachingProvider
-keep class net.fortuna.ical4j.util.MapTimeZoneCache

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

```

Statistics:

* without proguard obfuscation: 932 classes; apk 911kb.
* with proguard obfuscation: 365 classes;apk 505kb

Note: If you want to use proguard with gradle your build.gradle also needs this:

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

Further instructions on reducing the size of your APK using Proguard are available [here](http://code.google.com/p/maven-android-plugin/wiki/ProGuard).
