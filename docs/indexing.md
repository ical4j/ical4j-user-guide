==Calendar Indexing==

Indexing of components and properties provides a mechanism to improve the performance of component and property retrieval from calendar data. Typically you might use indexing in situations where you are repeatedly inspecting a calendar for components with specific property values and/or properties with specific parameter values.

==Example==

An example scenario might be where you have regular updates to input calendar data and need to identify if events in that calendar already exist in a master calendar. As you would be repeatedly inspecting the master calendar for events, it would make sense to index the components in this calendar as follows:

<pre>
IndexedComponentList indexedEvents = new IndexedComponentList(myCalendar.getComponents(Component.VEVENT), Property.UID);
</pre>


Note that we are using the UID property to identify unique events. Now we can use the indexed list to quickly identify if an event exists already as follows:

<pre>
for (Iterator i = inputCalendar.getComponents(Component.VEVENT).iterator(); i.hasNext();) {
  VEvent event = (VEvent) i.next();
  if (indexedEvents.getComponent(event.getUid().getValue()) == null) {
    myCalendar.getComponents().add(event);
  }
}
</pre>


We should also incorporate checking for modified events as well, which can be achieved by simply comparing two events for equality as follows:

<pre>
for (Iterator i = inputCalendar.getComponents(Component.VEVENT).iterator(); i.hasNext();) {
  VEvent event = (VEvent) i.next();

  Component existing = indexedEvents.getComponent(event.getUid().getValue());
  if (existing == null) {
    myCalendar.getComponents().add(event);
  }
  else if (!event.equals(existing)) {
    // remove existing event and add modified one..
    myCalendar.getComponents().remove(existing);
    myCalendar.getComponents().add(event);
  }
}
</pre>
