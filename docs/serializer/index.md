# iCal4j Serializer

[[Javadoc]](https://javadoc.io/doc/org.ical4j/ical4j-serializer)

Support for serialization of iCalendar objects to and from XML and JSON-based formats.

## Overview

Serialization support is built upon the Jackson JSON ObjectMapper used to convert Java POJOs to and from JSON
(and XML).

A number of JSON-based specifications are available for representing iCalendar data, with the following supported in
this library:

* jCal/jCard
* jsCalendar/jsCard
* Schema.org (JSON-LD)

## Command Line Usage

### Serialize a calendar to default output (jCal)

    ical4j-serializer/bin/ical4j-serializer calendar -F ./Australian32Holidays.ics

Result:

```json
["vcalendar",[["calscale",{},"text","GREGORIAN"],["method",{},"text","PUBLISH"],["prodid",{},"text","-//Apple Computer, Inc//iCal 1.0//EN"],["x-wr-calname",{"value":"text"},"text","Australian Holidays"],["x-wr-relcalid",{"value":"text"},"text","D4167B74-C414-11D6-BA97-003065F198AC"],["x-wr-timezone",{"value":"text"},"text","Asia/Hong_Kong"],["version",{},"text","2.0"]],[["vtimezone",[["tzid",{},"text","Asia/Hong_Kong"],["last-modified",{},"date-time","2006-01-17T16:36:57Z"]],[["standard",[["dtstart",{},"date-time","1932-12-13T20:45:52"],["tzoffsetto",{},"utc-offset","+08:00"],["tzoffsetfrom",{},"utc-offset","Z"],["tzname",{},"text","HKT"]],[]],["daylight",[["dtstart",{},"date-time","1946-04-20T03:30:00"],["tzoffsetto",{},"utc-offset","+09:00"],["tzoffsetfrom",{},"utc-offset","+08:00"],["tzname",{},"text","HKST"]],[]],["standard",[["dtstart",{},"date-time","1946-12-01T03:30:00"],["tzoffsetto",{},"utc-offset","+08:00"],["tzoffsetfrom",{},"utc-offset","+09:00"],["tzname",{},"text","HKT"]],[]]]],["vevent",[["uid",{},"text","D416469E-C414-11D6-BA97-003065F198AC"],["dtstamp",{},"date-time","2002-09-06T09:44:59Z"],["summary",{},"text","Australia Day"],["rrule",{},"recur","FREQ=YEARLY;INTERVAL=1;BYMONTH=1"],["dtstart",{"value":"date"},"date","2002-01-26"],["dtend",{"value":"date"},"date","2002-01-27"]],[]],["vevent",[["uid",{},"text","D4164CA4-C414-11D6-BA97-003065F198AC"],["dtstamp",{},"date-time","2002-09-06T09:44:59Z"],["summary",{},"text","Good Friday"],["dtstart",{"value":"date"},"date","2002-03-29"],["dtend",{"value":"date"},"date","2002-03-30"]],[]],["vevent",[["uid",{},"text","D416509A-C414-11D6-BA97-003065F198AC"],["dtstamp",{},"date-time","2002-09-06T09:44:59Z"],["summary",{},"text","Easter Monday"],["dtstart",{"value":"date"},"date","2002-04-01"],["dtend",{"value":"date"},"date","2002-04-02"]],[]],["vevent",[["uid",{},"text","D41654CC-C414-11D6-BA97-003065F198AC"],["dtstamp",{},"date-time","2002-09-06T09:44:59Z"],["summary",{},"text","ANZAC Day"],["rrule",{},"recur","FREQ=YEARLY;INTERVAL=1;BYMONTH=4"],["dtstart",{"value":"date"},"date","2002-04-25"],["dtend",{"value":"date"},"date","2002-04-26"]],[]],["vevent",[["uid",{},"text","D41658EB-C414-11D6-BA97-003065F198AC"],["dtstamp",{},"date-time","2002-09-06T09:44:59Z"],["summary",{},"text","Queen's Birthday"],["rrule",{},"recur","FREQ=YEARLY;INTERVAL=1;BYMONTH=6"],["dtstart",{"value":"date"},"date","2002-06-10"],["dtend",{"value":"date"},"date","2002-06-11"]],[]],["vevent",[["uid",{},"text","D41661F7-C414-11D6-BA97-003065F198AC"],["dtstamp",{},"date-time","2002-09-06T09:44:59Z"],["summary",{},"text","Christmas"],["rrule",{},"recur","FREQ=YEARLY;INTERVAL=1;BYMONTH=12"],["dtstart",{"value":"date"},"date","2002-12-25"],["dtend",{"value":"date"},"date","2002-12-26"]],[]],["vevent",[["uid",{},"text","D41666AF-C414-11D6-BA97-003065F198AC"],["dtstamp",{},"date-time","2002-09-06T09:44:59Z"],["summary",{},"text","Boxing Day"],["rrule",{},"recur","FREQ=YEARLY;INTERVAL=1;BYMONTH=12"],["dtstart",{"value":"date"},"date","2002-12-26"],["dtend",{"value":"date"},"date","2002-12-27"]],[]],["vevent",[["uid",{},"text","D4166AA4-C414-11D6-BA97-003065F198AC"],["dtstamp",{},"date-time","2002-09-06T09:44:59Z"],["summary",{},"text","Good Friday"],["dtstart",{"value":"date"},"date","2003-04-18"],["dtend",{"value":"date"},"date","2003-04-19"]],[]],["vevent",[["uid",{},"text","D4166EA4-C414-11D6-BA97-003065F198AC"],["dtstamp",{},"date-time","2002-09-06T09:44:59Z"],["summary",{},"text","Easter Monday"],["dtstart",{"value":"date"},"date","2003-04-21"],["dtend",{"value":"date"},"date","2003-04-22"]],[]],["vevent",[["uid",{},"text","D41658EB-C414-11D6-BA97-003065F198AC"],["dtstamp",{},"date-time","2002-09-06T09:45:00Z"],["recurrence-id",{"tzid":"asia/hong_kong"},"date-time","2003-06-10T00:00:00"],["dtstart",{"value":"date"},"date","2003-06-09"],["dtend",{"value":"date"},"date","2003-06-10"]],[]],["vevent",[["uid",{},"text","D41672C8-C414-11D6-BA97-003065F198AC"],["dtstamp",{},"date-time","2002-09-06T09:45:00Z"],["summary",{},"text","New Year"],["rrule",{},"recur","FREQ=YEARLY;INTERVAL=1;BYMONTH=1"],["dtstart",{"value":"date"},"date","2002-01-01"],["dtend",{"value":"date"},"date","2002-01-02"]],[]]]]
```

### Serialize a calendar to XML (xCal)

    ical4j-serializer/bin/ical4j-serializer calendar -F ./Australian32Holidays.ics --pretty-print -X XCAL

Result:

```xml
<icalendar xmlns="urn:ietf:params:xml:ns:icalendar-2.0">
  <vcalendar>
    <properties>
      <calscale>
        <parameters/>
        <text>GREGORIAN</text>
      </calscale>
      <method>
        <parameters/>
        <text>PUBLISH</text>
      </method>
      <prodid>
        <parameters/>
        <text>-//Apple Computer, Inc//iCal 1.0//EN</text>
      </prodid>
      <x-wr-calname>
        <parameters>
          <value>text</value>
        </parameters>
        <text>Australian Holidays</text>
      </x-wr-calname>
      <x-wr-relcalid>
        <parameters>
          <value>text</value>
        </parameters>
        <text>D4167B74-C414-11D6-BA97-003065F198AC</text>
      </x-wr-relcalid>
      <x-wr-timezone>
        <parameters>
          <value>text</value>
        </parameters>
        <text>Asia/Hong_Kong</text>
      </x-wr-timezone>
      <version>
        <parameters/>
        <text>2.0</text>
      </version>
    </properties>
    <components>
      <vtimezone>
        <properties>
          <tzid>
            <parameters/>
            <text>Asia/Hong_Kong</text>
          </tzid>
          <last-modified>
            <parameters/>
            <date-time>2006-01-17T16:36:57Z</date-time>
          </last-modified>
        </properties>
        <components>
          <standard>
            <properties>
              <dtstart>
                <parameters/>
                <date-time>1932-12-13T20:45:52</date-time>
              </dtstart>
              <tzoffsetto>
                <parameters/>
                <utc-offset>+08:00</utc-offset>
              </tzoffsetto>
              <tzoffsetfrom>
                <parameters/>
                <utc-offset>Z</utc-offset>
              </tzoffsetfrom>
              <tzname>
                <parameters/>
                <text>HKT</text>
              </tzname>
            </properties>
            <components/>
          </standard>
          <daylight>
            <properties>
              <dtstart>
                <parameters/>
                <date-time>1946-04-20T03:30:00</date-time>
              </dtstart>
              <tzoffsetto>
                <parameters/>
                <utc-offset>+09:00</utc-offset>
              </tzoffsetto>
              <tzoffsetfrom>
                <parameters/>
                <utc-offset>+08:00</utc-offset>
              </tzoffsetfrom>
              <tzname>
                <parameters/>
                <text>HKST</text>
              </tzname>
            </properties>
            <components/>
          </daylight>
        </components>
      </vtimezone>
      <vevent>
        <properties>
          <uid>
            <parameters/>
            <text>D416469E-C414-11D6-BA97-003065F198AC</text>
          </uid>
          <dtstamp>
            <parameters/>
            <date-time>2002-09-06T09:44:59Z</date-time>
          </dtstamp>
          <summary>
            <parameters/>
            <text>Australia Day</text>
          </summary>
          <rrule>
            <parameters/>
            <recur>FREQ=YEARLY;INTERVAL=1;BYMONTH=1</recur>
          </rrule>
          <dtstart>
            <parameters>
              <value>date</value>
            </parameters>
            <date>2002-01-26</date>
          </dtstart>
          <dtend>
            <parameters>
              <value>date</value>
            </parameters>
            <date>2002-01-27</date>
          </dtend>
        </properties>
        <components/>
      </vevent>
    </components>
  </vcalendar>
</icalendar>
```
