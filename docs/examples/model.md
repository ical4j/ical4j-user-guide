# iCal4j Examples - Model

This page provides examples of using the iCal4j model to build iCalendar objects.

## Creating a new calendar

```java
Calendar calendar = new Calendar();
calendar.add(new ProdId("-//Ben Fortuna//iCal4j 1.0//EN"));
calendar.add(ImmutableVersion.VERSION_2_0);
calendar.add(ImmutableCalScale.GREGORIAN);

// Add events, etc..
calendar.add(...);
```

Output:

    BEGIN:VCALENDAR
    PRODID:-//Ben Fortuna//iCal4j 1.0//EN
    VERSION:2.0
    CALSCALE:GREGORIAN
    END:VCALENDAR


## Creating a calendar with the fluent API

The recent addition of a fluent API means we can also write the above example more succinctly:

```java
Calendar calendar = new Calendar().withProdId("-//Ben Fortuna//iCal4j 1.0//EN")
    .withDefaults().getFluentTarget();

// Add events, etc..
calendar = calendar.withComponent(...).getFluentTarget();
```


## Creating an all day event

```java
java.util.Calendar calendar = java.util.Calendar.getInstance();
calendar.set(java.util.Calendar.MONTH, java.util.Calendar.DECEMBER);
calendar.set(java.util.Calendar.DAY_OF_MONTH, 25);

// initialise as an all-day event..
VEvent christmas = new VEvent(new Date(calendar.getTime()), "Christmas Day");

// Generate a UID for the event..
UidGenerator ug = new UidGenerator("1");
christmas.add(ug.generateUid());

net.fortuna.ical4j.model.Calendar cal = new net.fortuna.ical4j.model.Calendar();
cal.add(christmas);
```

Using fluent API:

```java
...

net.fortuna.ical4j.model.Calendar cal = new net.fortuna.ical4j.model.Calendar()
    .withComponent(
        new VEvent(new Date(calendar.getTime()), "Christmas Day")
            .withProperty(ug.generateUid()).getFluentTarget()).getFluentTarget();
```

Output:

    BEGIN:VEVENT
    DTSTAMP:20050222T044240Z
    DTSTART;VALUE=DATE:20051225
    SUMMARY:Christmas Day
    UID:20050222T044240Z-1@example.com
    END:VEVENT

## Creating a meeting of four hour duration

```java
// Create a TimeZone
TimeZoneRegistry registry = TimeZoneRegistryFactory.getInstance().createRegistry();
TimeZone timezone = registry.getTimeZone("America/Mexico_City");
VTimeZone tz = timezone.getVTimeZone();

 // Start Date is on: April 1, 2008, 9:00 am
java.util.Calendar startDate = new GregorianCalendar();
startDate.setTimeZone(timezone);
startDate.set(java.util.Calendar.MONTH, java.util.Calendar.APRIL);
startDate.set(java.util.Calendar.DAY_OF_MONTH, 1);
startDate.set(java.util.Calendar.YEAR, 2008);
startDate.set(java.util.Calendar.HOUR_OF_DAY, 9);
startDate.set(java.util.Calendar.MINUTE, 0);
startDate.set(java.util.Calendar.SECOND, 0);

 // End Date is on: April 1, 2008, 13:00
java.util.Calendar endDate = new GregorianCalendar();
endDate.setTimeZone(timezone);
endDate.set(java.util.Calendar.MONTH, java.util.Calendar.APRIL);
endDate.set(java.util.Calendar.DAY_OF_MONTH, 1);
endDate.set(java.util.Calendar.YEAR, 2008);
endDate.set(java.util.Calendar.HOUR_OF_DAY, 13);
endDate.set(java.util.Calendar.MINUTE, 0);	
endDate.set(java.util.Calendar.SECOND, 0);

// Create the event
String eventName = "Progress Meeting";
DateTime start = new DateTime(startDate.getTime());
DateTime end = new DateTime(endDate.getTime());
VEvent meeting = new VEvent(start, end, eventName);

// add timezone info..
meeting.add(tz.getTimeZoneId());

// generate unique identifier..
UidGenerator ug = new UidGenerator("uidGen");
Uid uid = ug.generateUid();
meeting.add(uid);

// add attendees..
Attendee dev1 = new Attendee(URI.create("mailto:dev1@mycompany.com"));
dev1.add(Role.REQ_PARTICIPANT);
dev1.add(new Cn("Developer 1"));
meeting.add(dev1);

Attendee dev2 = new Attendee(URI.create("mailto:dev2@mycompany.com"));
dev2.add(Role.OPT_PARTICIPANT);
dev2.add(new Cn("Developer 2"));
meeting.add(dev2);

// Create a calendar
net.fortuna.ical4j.model.Calendar icsCalendar = new net.fortuna.ical4j.model.Calendar();
icsCalendar.add(new ProdId("-//Events Calendar//iCal4j 1.0//EN"));
icsCalendar.add(ImmutableCalScale.GREGORIAN);


// Add the event and print
icsCalendar.add(meeting);
System.out.println(icsCalendar);
```

Using the fluent API:

```java
...

VEvent meeting = new VEvent(start, end, eventName)
    .withProperty(tz.getTimeZoneId())
    .withProperty(ug.generateUid())
    .withProperty(
        new Attendee(URI.create("mailto:dev1@mycompany.com"))
            .withParameter(Role.REQ_PARTICIPANT)
            .withParameter(new Cn("Developer 1").getFluentTarget())
        .getFluentTarget())
    .withProperty(
        new Attendee(URI.create("mailto:dev2@mycompany.com"))
            .withParameter(Role.OPT_PARTICIPANT)
            .withParameter(new Cn("Developer 2").getFluentTarget())
        .getFluentTarget())
    .getFluentTarget();

net.fortuna.ical4j.model.Calendar icsCalendar = new net.fortuna.ical4j.model.Calendar()
    .withProdId("-//Events Calendar//iCal4j 1.0//EN")
    .withDefaults()
    .withComponent(meeting)
    .getFluentTarget();

System.out.println(icsCalendar);
```


## Attaching binary data

```java
FileInputStream fin = new FileInputStream("etc/artwork/logo.png");
ByteArrayOutputStream bout = new ByteArrayOutputStream();
for (int i = fin.read(); i >= 0;) {
    bout.write(i);
    i = fin.read();
}

ParameterList params = new ParameterList();
params.add(Value.BINARY);
params.add(Encoding.BASE64);

Attach attach = new Attach(params, bout.toByteArray());
```

Output:

    ATTACH;ENCODING=BASE64;VALUE=BINARY:iVBORw0KGgoAAAANSUhEUgAAAUYAAACJCAYAA
     ABQHpElAAAABHNCSVQICAgIfAhkiAAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ
     5vuPBoAABPKSURBVHic7d15tFX1dcDx72aQyQkMqAiIojjFASc0GmOlRqKmcR6XpkaJYtrU1
     LYSp0ZZqxo1SZ2CUZPGqlXRGEdAqzKoqGjqCKgoVFF8DkVEBJRh9499HiGXB /ec3/nnN89d
     3/WOmvx9J599r3vvf3O8Pvtn6gqzrkaiGwPzCw6jTZsjmrLqq9ERgGXFZdOmyajeuCqr0QOB
     ...

## HTML Support

Starting with Outlook 2010, Outlook can now recognize HTML formatted content in an iCalendar.

Here are the steps to add an alternate description in HTML with ical4j:

+ Create a ParameterList containing a XParameter("FMTTYPE", "text/html").
+ Create a XProperty with name "X-ALT-DESC", FMTTYPE parameterList and html.
+ Add the XProperty to your VEvent.

Example code:

```java
HostInfo hostInfo = new SimpleHostInfo("myHostName");
UidGenerator ug = new UidGenerator(hostInfo, "1");
TimeZoneRegistry registry = TimeZoneRegistryFactory.getInstance().createRegistry();
VTimeZone tz = registry.getTimeZone("US/Eastern").getVTimeZone();
TzId tzParam = new TzId(tz.getRequiredProperty(Property.TZID).getValue());

Calendar iCalendar = new Calendar().withProdId("-//MyCalendarApp v1.0//EN")
    .withDefaults().withComponent(tz);

//Outlook uses a custom property to display HTML called the X-ALT-DESC property

ParameterList htmlParameters = new ParameterList();
XParameter fmtTypeParameter = new XParameter("FMTTYPE", "text/html");
htmlParameters.add(fmtTypeParameter);

DateTime startTime, endTime;
try {
    startTime = new DateTime("20171127T150000");
    endTime = new DateTime("20171127T160000");
} catch (ParseException pe) {
    // yyyymmddTHHmmss is the correct format, but to make the compiler happy...
    startTime = new DateTime();
    endTime = startTime;
}

VEvent vevent = new VEvent(startTime, endTime, "Scott's Birthday Party")
    .withProperty(ug.generateUid())
    .withProperty(new DtStamp().withParameter(tzParam).getFluentTarget())
    .withProperty(new DtStart().withParameter(tzParam).getFluentTarget())
    .withProperty(new DtEnd().withParameter(tzParam).getFluentTarget())
    .withProperty(new Location("Overmountain Shelter on the AT"))
    .withProperty(new Description("See ya there!"))
    .getFluentTarget();

String html = "<font color=#ff0000>You will this description instead of the text version if you have Outlook!</font>";
XProperty htmlProp = new XProperty("X-ALT-DESC", htmlParameters, html);
vevent.add(htmlProp);
iCalendar.add(vevent);
```
