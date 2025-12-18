# iCal4j Template - Examples

This page includes examples demonstrating some of the available templates for rendering calendar data.

## Events

- **Basic Event Rendering**: Demonstrates how to render a simple event with start and end times, summary, and description.

```java
EventModel model = new EventModel(event);

// no format
model.toString();
// Output:
// Event: Team Meeting
// When: 2024-07-01T10:00 to 2024-07-01T11:00
// Description: Monthly team sync-up meeting.

// markdown format
TemplateEngine engine = new TemplateEngineFactory().newInstance();
StringOutput output = new StringOutput();
engine.render("event/markdown.jte", model, output);
output.toString();

// Output:
// # Event: Team Meeting
// **When:** 2024-07-01T10:00 to 2024-07-01T11:00
// **Description:** Monthly team sync-up meeting.

// html format
output = new StringOutput();
engine.render("event/html.jte", model, output);
output.toString();

// Output:
// <div class="event">
//   <h1>Event: Team Meeting</h1>
//   <p><strong>When:</strong> 2024-07-01T10:00 to 2024-07-01T11:00</p>
//   <p><strong>Description:</strong> Monthly team sync-up meeting.</p>
// </div>
```

- **Recurring Events**: Shows how to render events that occur on a recurring basis, including rules for recurrence.

```java
EventModel model = new EventModel(event, periodStart, periodEnd);

// no format
model.toString();

// Output:
// Event: Weekly Standup
// When: Recurs every week on Monday at 09:00 from 2024-07-01 to 2024-12-31
// Description: Weekly team standup meeting.

// markdown format
TemplateEngine engine = new TemplateEngineFactory().newInstance();
StringOutput output = new StringOutput();
engine.render("event/markdown-occurrences.jte", model, output);
output.toString();

// Output:
// # Event: Weekly Standup
// **When:** Monday 21 May, Monday 28 May, Monday 4 June, ...
// **Description:** Weekly team standup meeting.

```
- **Event with Attachments**: Example of rendering an event that includes attachments, such as documents or images.

```java
EventModel model = new EventModel(eventWithAttachments);
// no format
model.toString();
// Output:
// Event: Project Kickoff
// When: 2024-07-05T14:00 to 2024-07-05T15:00
// Description: Initial project kickoff meeting.
// Attachments:
// - ProjectPlan.pdf
// - Agenda.docx

// markdown format
TemplateEngine engine = new TemplateEngineFactory().newInstance();
StringOutput output = new StringOutput();
engine.render("event/markdown.jte", model, output);
output.toString();
// Output:
// # Event: Project Kickoff
// **When:** 2024-07-05T14:00 to 2024-07-05T15:00
// **Description:** Initial project kickoff meeting.
// **Attachments:**
// - [ProjectPlan.pdf](link-to-attachment)
// - [Agenda.docx](link-to-attachment)

```

- **Event with Location**: Illustrates how to render an event with a specified location, including a map link.

```java
EventModel model = new EventModel(eventWithLocation);
// no format
model.toString();
// Output:
// Event: Client Meeting
// When: 2024-07-10T13:00 to 2024-07-10T14:00
// Description: Meeting with client to discuss project updates.
// Location: 123 Business St, Cityville
// Map: [View on Map](https://maps.google.com/?q=123+Business+St,+Cityville)

// markdown format
TemplateEngine engine = new TemplateEngineFactory().newInstance();
StringOutput output = new StringOutput();
engine.render("event/markdown.jte", model, output);
output.toString();
// Output:
// # Event: Client Meeting
// **When:** 2024-07-10T13:00 to 2024-07-10T14:00
// **Description:** Meeting with client to discuss project updates.
// **Location:** 123 Business St, Cityville
// **Map:** [View on Map](https://maps.google.com/?q=123+Business+St,+Cityville)

```

- **Event with Attendees**: Demonstrates rendering an event that includes multiple attendees, showing their RSVP status.

```java
EventModel model = new EventModel(eventWithAttendees);
// no format
model.toString();
// Output:
// Event: Team Lunch
// When: 2024-07-15T12:00 to 2024-07-15T13:00
// Description: Team lunch at local restaurant.
// Attendees:
// - Alice (Accepted)
// - Bob (Declined)
// - Charlie (Tentative)

// markdown format
TemplateEngine engine = new TemplateEngineFactory().newInstance();
StringOutput output = new StringOutput();
engine.render("event/markdown.jte", model, output);
output.toString();
// Output:
// # Event: Team Lunch
// **When:** 2024-07-15T12:00 to 2024-07-15T13:00
// **Description:** Team lunch at local restaurant.
// **Attendees:**
// - [Alice](mailto:alice@example.com) (Accepted)
// - [Bob](mailto:bob@example.com) (Declined)
// - [Charlie](mailto:charlie@example.com) (Tentative)
```

- **Event with Alarms**: Example of rendering an event that includes alarms or reminders.

```java
EventModel model = new EventModel(eventWithAlarms);
// no format
model.toString();
// Output:
// Event: Doctor Appointment
// When: 2024-07-20T09:00 to 2024-07-20T10:00
// Description: Annual check-up with Dr. Smith.
// Alarms:
// - 30 minutes before
// - 1 day before

// markdown format
TemplateEngine engine = new TemplateEngineFactory().newInstance();
StringOutput output = new StringOutput();
engine.render("event/markdown.jte", model, output);
output.toString();
// Output:
// # Event: Doctor Appointment
// **When:** 2024-07-20T09:00 to 2024-07-20T10:00
// **Description:** Annual check-up with Dr. Smith.
// **Alarms:**
// - 30 minutes before
// - 1 day before
```

- **Event with Categories**: Shows how to render an event categorized under multiple categories.

```java
EventModel model = new EventModel(eventWithCategories);
// no format
model.toString();
// Output:
// Event: Marketing Meeting
// When: 2024-07-25T11:00 to 2024-07-25T12:00
// Description: Monthly marketing strategy meeting.
// Categories: Marketing, Strategy, Team

// markdown format
TemplateEngine engine = new TemplateEngineFactory().newInstance();
StringOutput output = new StringOutput();
engine.render("event/markdown.jte", model, output);
output.toString();
// Output:
// # Event: Marketing Meeting
// **When:** 2024-07-25T11:00 to 2024-07-25T12:00
// **Description:** Monthly marketing strategy meeting.
// **Categories:** Marketing, Strategy, Team
```

- **Event with Status**: Illustrates rendering an event with different statuses (e.g., confirmed, tentative, cancelled).

```java
EventModel model = new EventModel(eventWithStatus);
// no format
model.toString();
// Output:
// Event: Conference Call
// When: 2024-07-30T15:00 to 2024-07-30T16:00
// Description: Quarterly business review call.
// Status: Confirmed

// markdown format
TemplateEngine engine = new TemplateEngineFactory().newInstance();
StringOutput output = new StringOutput();
engine.render("event/markdown.jte", model, output);
output.toString();
// Output:
// # Event: Conference Call
// **When:** 2024-07-30T15:00 to 2024-07-30T16:00
// **Description:** Quarterly business review call.
// **Status:** Confirmed
```

- **Event with Priority**: Example of rendering an event with a specified priority level.
```java
EventModel model = new EventModel(eventWithPriority);
// no format
model.toString();
// Output:
// Event: Urgent Meeting
// When: 2024-08-01T09:00 to 2024-08-01T10:00
// Description: Meeting to address urgent issues.
// Priority: High

// markdown format
TemplateEngine engine = new TemplateEngineFactory().newInstance();
StringOutput output = new StringOutput();
engine.render("event/markdown.jte", model, output);
output.toString();
// Output:
// # Event: Urgent Meeting
// **When:** 2024-08-01T09:00 to 2024-08-01T10:00
// **Description:** Meeting to address urgent issues.
// **Priority:** High
```

- **Event with Geo Location**: Demonstrates how to render an event that includes geographical coordinates.

```java
EventModel model = new EventModel(eventWithGeoLocation);
// no format
model.toString();
// Output:
// Event: Outdoor Team Building
// When: 2024-08-05T10:00 to 2024-08-05T16:00
// Description: Team building activities in the park.
// Geo Location: Latitude 37.7749, Longitude -122.4194

// markdown format
TemplateEngine engine = new TemplateEngineFactory().newInstance();
StringOutput output = new StringOutput();
engine.render("event/markdown.jte", model, output);
output.toString();
// Output:
// # Event: Outdoor Team Building
// **When:** 2024-08-05T10:00 to 2024-08-05T16:00
// **Description:** Team building activities in the park.
// **Geo Location:** Latitude 37.7749, Longitude -122.4194
```

## To-Dos

- **Basic To-Do Rendering**: Demonstrates how to render a simple to-do item with due date, summary, and description.

```java
ToDoModel model = new ToDoModel(todo);
// no format
model.toString();
// Output:
// To-Do: Submit Report
// Due: 2024-07-15
// Description: Submit the quarterly financial report.

// markdown format
TemplateEngine engine = new TemplateEngineFactory().newInstance();
StringOutput output = new StringOutput();
engine.render("todo/markdown.jte", model, output);
output.toString();
// Output:
// # To-Do: Submit Report
// **Due:** 2024-07-15
// **Description:** Submit the quarterly financial report.

// html format
output = new StringOutput();
engine.render("todo/html.jte", model, output);
output.toString();
// Output:
// <div class="todo">
//   <h1>To-Do: Submit Report</h1>
//   <p><strong>Due:</strong> 2024-07-15</p>
//   <p><strong>Description:</strong> Submit the quarterly financial report.</p>
// </div>

```

- **Recurring To-Dos**: Shows how to render to-do items that occur on a recurring basis.

```java
ToDoModel model = new ToDoModel(recurringTodo, periodStart, periodEnd);
// no format
model.toString();
// Output:
// To-Do: Weekly Backup
// Due: Recurs every week on Friday from 2024-07-01 to 2024-12-31
// Description: Perform weekly system backup.
// markdown format
TemplateEngine engine = new TemplateEngineFactory().newInstance();
StringOutput output = new StringOutput();
engine.render("todo/markdown-occurrences.jte", model, output);
output.toString();
// Output:
// # To-Do: Weekly Backup
// **Due:** Friday 5 July, Friday 12 July, Friday 19 July, ...
// **Description:** Perform weekly system backup.
```

- **To-Do with Priority**: Example of rendering a to-do item with a specified priority level.

- **To-Do with Status**: Illustrates rendering a to-do item with different statuses (e.g., needs action, completed, cancelled).
- **To-Do with Categories**: Shows how to render a to-do item categorized under multiple categories.
- **To-Do with Alarms**: Example of rendering a to-do item that includes alarms or reminders.

## Journals

- **Basic Journal Entry Rendering**: Demonstrates how to render a simple journal entry with date, summary, and description.

```java
JournalModel model = new JournalModel(journal);
// no format
model.toString();
// Output:
// Journal Entry: Project Reflection
// Date: 2024-07-01
// Description: Reflected on the successes and challenges of the recent project.
// markdown format
TemplateEngine engine = new TemplateEngineFactory().newInstance();
StringOutput output = new StringOutput();
engine.render("journal/markdown.jte", model, output);
output.toString();
// Output:
// # Journal Entry: Project Reflection
// **Date:** 2024-07-01
// **Description:** Reflected on the successes and challenges of the recent project.
// html format
output = new StringOutput();
engine.render("journal/html.jte", model, output);
output.toString();
// Output:
// <div class="journal">
//   <h1>Journal Entry: Project Reflection</h1>
//   <p><strong>Date:</strong> 2024-07-01</p>
//   <p><strong>Description:</strong> Reflected on the successes and challenges of the recent project.</p>
// </div>

```

- **Journal with Categories**: Shows how to render a journal entry categorized under multiple categories.
- **Journal with Attachments**: Example of rendering a journal entry that includes attachments, such as documents or images.
- **Journal with Status**: Illustrates rendering a journal entry with different statuses (e.g., draft, final).
- **Journal with Priority**: Example of rendering a journal entry with a specified priority level.
- **Journal with Geo Location**: Demonstrates how to render a journal entry that includes geographical coordinates.
- **Journal with Alarms**: Example of rendering a journal entry that includes alarms or reminders.
- **Journal with Attendees**: Demonstrates rendering a journal entry that includes multiple attendees, showing their RSVP status.
- **Journal with Location**: Illustrates how to render a journal entry with a specified location, including a map link.
- **Journal with Recurrence**: Shows how to render journal entries that occur on a recurring basis.
- **Journal with Time Zones**: Example of rendering a journal entry that includes time zone information for date and time fields.
- **Journal with Comments**: Demonstrates how to render a journal entry that includes comments or notes from multiple users.
- **Journal with Links**: Example of rendering a journal entry that includes hyperlinks to related resources or references.
- **Journal with Tags**: Shows how to render a journal entry that includes user-defined tags for categorization and searchability.

## Contacts

- **Basic Contact Rendering**: Demonstrates how to render a simple contact with name, email, and phone number.

```java
ContactModel model = new ContactModel(contact);
// no format
model.toString();
// Output:
// Contact: John Doe
// Email: jdoe@example.com
// Phone: +1-555-1234

// markdown format
TemplateEngine engine = new TemplateEngineFactory().newInstance();
StringOutput output = new StringOutput();
engine.render("contact/markdown.jte", model, output);
output.toString();
// Output:
// # Contact: John Doe
// **Email:** [jdoe@example.com](mailto:jdoe@example.com)
// **Phone:** [+1-555-1234](tel:+1-555-1234)

// html format
output = new StringOutput();
engine.render("contact/html.jte", model, output);
output.toString();
// Output:
// <div class="contact">
//   <h1>Contact: John Doe</h1>
//   <p><strong>Email:</strong> <a href="mailto:jdoe@example">jdoe@example.com</a></p>
//   <p><strong>Phone:</strong> <a href="tel:+1-555-1234">+1-555-1234</a></p>
// </div>
```

- **Contact with Address**: Shows how to render a contact that includes a physical address.
- **Contact with Photo**: Example of rendering a contact that includes a photo or avatar.
- **Contact with Organization**: Illustrates how to render a contact that includes organization details, such as company name and job title.
- **Contact with Social Media Links**: Demonstrates rendering a contact that includes links to social media profiles.
- **Contact with Notes**: Example of rendering a contact that includes additional notes or comments.
- **Contact with Categories**: Shows how to render a contact categorized under multiple categories.
- **Contact with Birthday**: Illustrates how to render a contact that includes a birthday field.
- **Contact with Anniversary**: Example of rendering a contact that includes an anniversary field.

## Availability

- **Basic Availability Rendering**: Demonstrates how to render a simple availability entry with start and end times, and status.

```java
AvailabilityModel model = new AvailabilityModel(availability);
// no format
model.toString();
// Output:
// Availability: Available
// When: 2024-07-01T09:00 to 2024-07-01T17:00
// Status: Free

// markdown format
TemplateEngine engine = new TemplateEngineFactory().newInstance();
StringOutput output = new StringOutput();
engine.render("availability/markdown.jte", model, output);
output.toString();
// Output:
// # Availability: Available
// **When:** 2024-07-01T09:00 to 2024-07-01T17:00
// **Status:** Free

// html format
output = new StringOutput();
engine.render("availability/html.jte", model, output);
output.toString();
// Output:
// <div class="availability">
//   <h1>Availability: Available</h1>
//   <p><strong>When:</strong> 2024-07-01T09:00 to 2024-07-01T17:00</p>
//   <p><strong>Status:</strong> Free</p>
// </div>

```

- **Recurring Availability**: Shows how to render availability entries that occur on a recurring basis.
- **Availability with Comments**: Example of rendering an availability entry that includes comments or notes.
- **Availability with Time Zones**: Illustrates how to render an availability entry that includes time zone information for date and time fields.
- **Availability with Categories**: Shows how to render an availability entry categorized under multiple categories.
- **Availability with Status**: Example of rendering an availability entry with different statuses (e.g., free, busy, tentative, out of office).
- **Availability with Geo Location**: Demonstrates how to render an availability entry that includes geographical coordinates.
- **Availability with Alarms**: Example of rendering an availability entry that includes alarms or reminders.
- **Availability with Links**: Example of rendering an availability entry that includes hyperlinks to related resources or references.
