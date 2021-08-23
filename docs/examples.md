# iCal4j Examples

This page provides examples that demonstrate how to use iCal4j effectively.

## Parsing a calendar file

    FileInputStream fin = new FileInputStream("mycalendar.ics");
    CalendarBuilder builder = new CalendarBuilder();
    Calendar calendar = builder.build(fin);

## Parsing a calendar string

    String myCalendarString = ...
    StringReader sin = new StringReader(myCalendarString);
    CalendarBuilder builder = new CalendarBuilder();
    Calendar calendar = builder.build(sin);

## Creating a new calendar

    Calendar calendar = new Calendar();
    calendar.getProperties().add(new ProdId("-//Ben Fortuna//iCal4j 1.0//EN"));
    calendar.getProperties().add(Version.VERSION_2_0);
    calendar.getProperties().add(CalScale.GREGORIAN);

    // Add events, etc..

Output:

    BEGIN:VCALENDAR
    PRODID:-//Ben Fortuna//iCal4j 1.0//EN
    VERSION:2.0
    CALSCALE:GREGORIAN
    END:VCALENDAR

## Creating an all day event

    java.util.Calendar calendar = java.util.Calendar.getInstance();
    calendar.set(java.util.Calendar.MONTH, java.util.Calendar.DECEMBER);
    calendar.set(java.util.Calendar.DAY_OF_MONTH, 25);

    // initialise as an all-day event..
    VEvent christmas = new VEvent(new Date(calendar.getTime()), "Christmas Day");

    // Generate a UID for the event..
    UidGenerator ug = new UidGenerator("1");
    christmas.getProperties().add(ug.generateUid());

    net.fortuna.ical4j.model.Calendar cal = new net.fortuna.ical4j.model.Calendar();
    cal.getComponents().add(christmas);

Output:

    BEGIN:VEVENT
    DTSTAMP:20050222T044240Z
    DTSTART;VALUE=DATE:20051225
    SUMMARY:Christmas Day
    UID:20050222T044240Z-1@example.com
    END:VEVENT

## Creating a meeting of four hour duration

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
    meeting.getProperties().add(tz.getTimeZoneId());

    // generate unique identifier..
    UidGenerator ug = new UidGenerator("uidGen");
    Uid uid = ug.generateUid();
    meeting.getProperties().add(uid);

    // add attendees..
    Attendee dev1 = new Attendee(URI.create("mailto:dev1@mycompany.com"));
    dev1.getParameters().add(Role.REQ_PARTICIPANT);
    dev1.getParameters().add(new Cn("Developer 1"));
    meeting.getProperties().add(dev1);

    Attendee dev2 = new Attendee(URI.create("mailto:dev2@mycompany.com"));
    dev2.getParameters().add(Role.OPT_PARTICIPANT);
    dev2.getParameters().add(new Cn("Developer 2"));
    meeting.getProperties().add(dev2);

    // Create a calendar
    net.fortuna.ical4j.model.Calendar icsCalendar = new net.fortuna.ical4j.model.Calendar();
    icsCalendar.getProperties().add(new ProdId("-//Events Calendar//iCal4j 1.0//EN"));
    icsCalendar.getProperties().add(CalScale.GREGORIAN);


    // Add the event and print
    icsCalendar.getComponents().add(meeting);
    System.out.println(icsCalendar);

## Generating a calendar file

    FileOutputStream fout = new FileOutputStream("mycalendar.ics");

    CalendarOutputter outputter = new CalendarOutputter();
    outputter.output(calendar, fout);

## Attaching binary data

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

Output:

    ATTACH;ENCODING=BASE64;VALUE=BINARY:iVBORw0KGgoAAAANSUhEUgAAAUYAAACJCAYAA
     ABQHpElAAAABHNCSVQICAgIfAhkiAAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ
     5vuPBoAABPKSURBVHic7d15tFX1dcDx72aQyQkMqAiIojjFASc0GmOlRqKmcR6XpkaJYtrU1
     LYSp0ZZqxo1SZ2CUZPGqlXRGEdAqzKoqGjqCKgoVFF8DkVEBJRh9499HiGXB /ec3/nnN89d
     3/WOmvx9J599r3vvf3O8Pvtn6gqzrkaiGwPzCw6jTZsjmrLqq9ERgGXFZdOmyajeuCqr0QOB
     ...


## Filtering events

The correct way to filter events according to the spec (RFC2445) would be to construct a VFREEBUSY request that represents the properties of events that you are interested in. You would then pass this request as an argument to the constructor of a new VFREEBUSY, along with the list of components (events) you want to inspect to derive a VFREEBUSY instance that represents the consumed/free time based on the specified events (see the [API Documentation](http://ical4j.github.io/docs/ical4j/api/3.0.19/net/fortuna/ical4j/model/component/VFreeBusy.html) for more information).

If instead you would like to identify specific events occurring within a time frame, you can use iCal4j filters to filter components within a specified period. For example, to filter a list of events only occurring today you might do the following:

    java.util.Calendar today = java.util.Calendar.getInstance();
    today.set(java.util.Calendar.HOUR_OF_DAY, 0);
    today.clear(java.util.Calendar.MINUTE);
    today.clear(java.util.Calendar.SECOND);

    // create a period starting now with a duration of one (1) day..
    Period period = new Period(new DateTime(today.getTime()), new Dur(1, 0, 0, 0));
    Filter filter = new Filter(new PeriodRule(period));

    List eventsToday = filter.filter(calendar.getComponents(Component.VEVENT));

## Generating event dates

    // Reading the file and creating the calendar
    CalendarBuilder builder = new CalendarBuilder();
    Calendar cal = null;
    try {
        cal = builder.build(new FileInputStream("my.ics"));
    } catch (IOException e) {
        e.printStackTrace();
    } catch (ParserException e) {
        e.printStackTrace();
    }


    // Create the date range which is desired.
    DateTime from = new DateTime("20100101T070000Z");
    DateTime to = new DateTime("20100201T070000Z");;
    Period period = new Period(from, to);


    // For each VEVENT in the ICS
    for (Object o : cal.getComponents("VEVENT")) {
        Component c = (Component)o;
        PeriodList list = c.calculateRecurrenceSet(period);

        for (Object po : list) {
            System.out.println((Period)po);
        }
    }

## Creating a simple vCard

    List<Property> props = new ArrayList<Property>();
    props.add(new Source(URI.create("ldap://ldap.example.com/cn=Babs%20Jensen,%20o=Babsco,%20c=US")));
    props.add(new Name("Babs Jensen's Contact Information"));
    props.add(Kind.INDIVIDUAL);
    // add a custom property..
    props.add(new Property("test") {
        @Override
        public String getValue() {
            return null;
        }

        @Override
        public void validate() throws ValidationException {
        }
    });

    VCard vcard = new VCard(props);


Starting with Outlook 2010, Outlook can now recognize HTML formatted content in an iCalendar. 

Here are the steps to add an alternate description in HTML with ical4j:

+ Create a ParameterList containing a XParameter("FMTTYPE", "text/html").
+ Create a XProperty with name "X-ALT-DESC", FMTTYPE parameterList and html.
+ Add the XProperty to your VEvent.

Example code:

        ICalendar iCalendar = new ICalendar();

        HostInfo hostInfo = new SimpleHostInfo("myHostName");
        UidGenerator ug = new UidGenerator(hostInfo, "1");
        TimeZoneRegistry registry = TimeZoneRegistryFactory.getInstance().createRegistry();
        VTimeZone tz = registry.getTimeZone("US/Eastern").getVTimeZone();
        TzId tzParam = new TzId(tz.getProperties().getProperty(Property.TZID).getValue());
        iCalendar.getProperties().add(new ProdId("-//MyCalendarApp v1.0//EN"));
        iCalendar.getProperties().add(Version.VERSION_2_0);
        iCalendar.getProperties().add(CalScale.GREGORIAN);
        iCalendar.getComponents().add(tz);

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

        VEvent vevent = new VEvent(startTime, endTime, "Scott's Birthday Party");
        vevent.getProperties().add(ug.generateUid());
        vevent.getProperties().getProperty(Property.DTSTAMP).getParameters().add(tzParam);
        vevent.getProperties().getProperty(Property.DTSTART).getParameters().add(tzParam);
        vevent.getProperties().getProperty(Property.DTEND).getParameters().add(tzParam);
        vevent.getProperties().add(new Location("Overmountain Shelter on the AT"));
        vevent.getProperties().add(new Description("See ya there!"));

        String html = "<font color=#ff0000>You will this description instead of the text version if you have Outlook!</font>";
        XProperty htmlProp = new XProperty("X-ALT-DESC", htmlParameters, html);
        vevent.getProperties().add(htmlProp);
        iCalendar.getComponents().add(vevent);
        