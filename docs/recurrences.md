# iCal4j Recurrence Support

Events that occur more than once are supported in the iCalendar specification, and are defined by either a sequence of dates (RDATE) or a recurrence rule (RRULE).

## Recurrence (RRULE) Examples

Below are some examples of how to represent recurring events using the RRULE format:

* A rule occurring on the third Sunday of April would be as follows: 
 
`RRULE:FREQ=YEARLY;BYMONTH=4;BYDAY=SU;BYSETPOS=3`
 
* An event occurring on the first and second Monday of October would be specified by the rule: 
 
`RRULE:FREQ=YEARLY;BYMONTH=10;BYDAY=MO;BYSETPOS=1,2`

* Event that repeats monthly: every 29th of every other month!

`RRULE:FREQ=MONTHLY;INTERVAL=2;BYMONTHDAY=29`

_NOTE: As February does not have 29 days in non-leap years, this rule would potentially have a gap between December of the previous year and April of the current year. For this reason it makes more sense to use negative SETPOS values when you need to specify the end of a month._
 
* Event that repeats monthly: every last Sunday of every 3 months 

`RRULE:FREQ=MONTHLY;INTERVAL=3;BYDAY=SU;BYSETPOS=-1`
 
* Event that repeats monthly: every fourth Sunday of every 3 months

`RRULE:FREQ=MONTHLY;INTERVAL=3;BYDAY=SU;BYSETPOS=4`
 
* Event that repeats yearly: every 5th of February:

`RRULE:FREQ=YEARLY;BYMONTH=2;BYDAY=5`
