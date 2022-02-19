# iCal4j Examples - Recurrences

This page provides examples of using iCal4j to calculate recurrences of iCal4j objects.

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
