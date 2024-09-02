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

 | Strategy    | Participants | Transparency | Recurring | Precision | Classification |
|-------------|--------------|--------------|-----------|-----------|----------------|
| Meeting     | 2+           | Opaque       | Optional  | Time      | Private        |
| Appointment | 1            | Opaque       | Optional  | Time      | Confidential   |
| Anniversary | 1            | Transparent  | Annually  | Date      | Public         |
| Observance  | 1            | Transparent  | Mandatory | Time      | Public         |

### VToDo Strategies

 | Strategy  | Participants | Transparency | Recurring | Precision | Classification |
|-----------|--------------|--------------|-----------|-----------|----------------|
| Task      | 1+           | Opaque       | Optional  | Time      | Private        |
| Action    | 1            | Transparent  | Optional  | Date      | Private        |
| Agenda    | 1+           | Transparent  | Optional  | Time      | Private        |
| Issue     | 1+           | Transparent  | No        | Date      | Public         |
| Milestone | 1+           | Transparent  | Optional  | Date      | Public         |
| Request   | 1            | Transparent  | No        | Time      | Public         |
| Approval  | 1            | Transparent  | No        | Time      | Public         |

### VJournal Strategies

| Strategy   | Participants | Transparency | Recurring | Precision | Classification |
|------------|--------------|--------------|-----------|-----------|----------------|
| Note       | 1+           | Transparent  | No        | Time      | Private        |
| Attendance | 1+           | Transparent  | No        | Time      | Public         |
| Decision   | 1+           | Transparent  | No        | Date      | Public         |
| Risk       | 1+           | Transparent  | No        | Time      | Public         |
| Objective  | 1+           | Transparent  | Optional  | Time      | Public         |
| Timesheet  | 1            | Transparent  | Mandatory | Time      | Public         |

### vCard Strategies

| Strategy     | Structured Name | Members | Geographic Position | Delivery Address | Language |
|--------------|-----------------|---------|---------------------|------------------|----------|
| Individual   | Yes             | No      | No                  | Optional         | Optional |
| Organization | No              | No      | Yes                 | Optional         | No       |
| Team         | No              | Yes     | Optional            | Optional         | Optional |
| Location     | No              | No      | Yes                 | No               | No       |

