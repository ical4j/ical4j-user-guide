# iCal4j Extensions - Strategy

A strategy is an opinionated formula for populating iCalendar and vCard objects with
properties specific to a certain use-case.

iCal4j Extensions includes strategies for popular scenarios, such as scheduling
meetings or appointments, as well as organizational management strategies for
teams and individuals.

## Strategy Features

The following tables outline the different features of various strategies, which may help when choosing
an appropriate strategy to use.

### VEvent Strategies

 | Strategy    | Participants | Transparency | Recurring | Precision | Classification | Links |
|-------------|--------------|--------------|-----------|-----------|----------------|--------|
| Meeting     | 2+           | Opaque       | Optional  | Time      | Private        | Agenda, Location |
| Appointment | 1            | Opaque       | Optional  | Time      | Confidential   | Location |
| Anniversary | 1            | Transparent  | Annually  | Date      | Public         | Individual |
| Observance  | 1            | Transparent  | Required | Time      | Public         | Location |
| Conference  | 1+            | Transparent  | No | Date      | Public         | Organization, Location |
| Performance  | 1+            | Opaque  | Optional | Time      | Public         | Agenda, Individual+, Organization, Location |
| Seminar  | 1+            | Opaque  | Optional | Time      | Public         | Agenda, Individual+, Organization, Location |

### VToDo Strategies

 | Strategy  | Participants | Transparency | Recurring | Precision | Classification | Links |
|-----------|--------------|--------------|-----------|-----------|----------------|--------|
| Task      | 1+           | Opaque       | Optional  | Time      | Private        | Location, Milestone |
| Action    | 1            | Transparent  | Optional  | Date      | Private        | Meeting |
| Agenda    | 1+           | Transparent  | Optional  | Time      | Private        ||
| Issue     | 1+           | Transparent  | No        | Date      | Public         ||
| Milestone | 1+           | Transparent  | Optional  | Date      | Public         ||
| Request   | 1            | Transparent  | No        | Time      | Public         ||
| Approval  | 1            | Transparent  | No        | Time      | Public         | Request |

### VJournal Strategies

| Strategy   | Participants | Transparency | Recurring | Precision | Classification | Links |
|------------|--------------|--------------|-----------|-----------|----------------|--------|
| Note       | 1+           | Transparent  | No        | Time      | Private        ||
| Attendance | 1+           | Transparent  | No        | Time      | Public         | Meeting |
| Decision   | 1+           | Transparent  | No        | Date      | Public         ||
| Risk       | 1+           | Transparent  | No        | Time      | Public         | Objective |
| Objective  | 1+           | Transparent  | Optional  | Time      | Public         ||
| Timesheet  | 1            | Transparent  | Required | Time      | Public         | Task |


### VAvailability Strategies

| Strategy   | Participants | Priority | Recurring | Location | Classification | Links |
|------------|--------------|--------------|-----------|-----------|----------------|--------|
| Office Hours       | 1           | Default  | Required        | Optional      | Public        | Location |
| Out of Office       | 1           | High  | No        | No      | Public        ||
| Offer       | 0           | Default  | No        | Optional      | Public        | Location|


### vCard Strategies

| Strategy     | Structured Name | Members | Geographic Position | Delivery Address | Language | Links |
|--------------|-----------------|---------|---------------------|------------------|----------|--------|
| Individual   | Yes             | No      | No                  | Optional         | Optional | Organization |
| Organization | No              | No      | Yes                 | Optional         | No       | Location |
| Team         | No              | Yes     | Optional            | Optional         | Optional | Individual, Location |
| Location     | No              | No      | Yes                 | No               | No       ||

