# Groovy Support

## Content Builder

Constructing iCalendar and vCard object models can be quite a tedious process in Java, however the Groovy-based ContentBuilder simplifies this task:

### vCard

```groovy
def builder = new ContentBuilder()
def card = builder.vcard() {
    version '4.0'
    fn 'test'
    n 'example'
    photo 'http://example.com/photo', parameters: [value('uri')]
}
card.validate()
```

Where a property doesn't require any parameters the syntax may be even more concise:

```groovy
def builder = new ContentBuilder()
def card = builder.vcard() {
    version '4.0'
    fn 'test'
    n 'example'
    photo 'http://example.com/photo', parameters: [value('uri')]
}
card.validate()
```

Property parameters that are not required for property construction may also be nested:

```groovy
def builder = new ContentBuilder()
def card = builder.vcard() {
    version '4.0'
    fn 'test'
    n 'example' {
        value('text')
    }
    photo 'http://example.com/photo', parameters: [value('uri')]
}
card.validate()
```

Attach a photo as encoded binary data:

```groovy
def builder = new ContentBuilder()
def card = builder.vcard() {
    version '4.0'
    fn 'test'
    n 'example' {
        value 'text'
    }
    photo(new File('http://example.com/photo.png').bytes.encodeBase64() as String)
}
card.validate()
```

### iCalendar

```groovy
def builder = new ContentBuilder()
def calendar = builder.calendar() {
    prodid '-//Ben Fortuna//iCal4j 1.0//EN'
    version '2.0'
    vevent {
        uid '1'
        dtstamp new DtStamp()
        dtstart '20090810', parameters: parameters() {
            value 'DATE'
        }
        action 'DISPLAY'
        attach 'http://example.com/attachment', parameters: parameters() {
            value 'URI'
        }
    }
}
```

Attach a vCard to an iCalendar object:

```groovy
import net.fortuna.ical4j.model.property.DtStamp

def icalendar = new net.fortuna.ical4j.model.ContentBuilder();
def vcard = new net.fortuna.ical4j.vcard.ContentBuilder();

def card = vcard.vcard() {
    version '4.0'
    fn 'test'
    n 'example'
    photo 'http://example.com/photo', parameters: [value('uri')]
}
card.validate()
//println(card)

def calendar = icalendar.calendar() {
    prodid '-//Ben Fortuna//iCal4j 1.0//EN'
    version '2.0'
    vevent {
        uid '1'
        dtstamp new DtStamp()
        dtstart '20090810', parameters: parameters() {
            value 'DATE'
        }
        action 'DISPLAY'
        attach 'http://example.com/attachment', parameters: parameters() {
            value 'URI'
        }
        attach card.toString(), parameters: parameters() {
            fmttype 'text/vcard'
            encoding '8BIT'
            value 'TEXT'
        }
    }
}

calendar.validate()
println(calendar)
```

## Groovlet

Here is an example [Groovlet](http://groovy.codehaus.org/Groovlets) that parses a specified calendar and outputs all of the event summaries in HTML:

```groovy
import net.fortuna.ical4j.data.CalendarBuilder
import net.fortuna.ical4j.model.Calendar
import net.fortuna.ical4j.model.Component
import net.fortuna.ical4j.model.component.VEvent

html.html {
    head {
        title "Event Summary"
    }
    
    body {
    	def builder = new CalendarBuilder()
    	def calendar = builder.build(new URL(request.getParameter("u")).openStream())
    	
		if (calendar.getProperty("X-WR-CALNAME")) {
			h1 calendar.getProperty("X-WR-CALNAME").getValue()
		}
		else if (calendar.getProperty("X-WR-CALDESC")) {
			h1 calendar.getProperty("X-WR-CALDESC").getValue()
		}
		else {
			h1 "Event Summary"
		}
    	
    	table {
    		tbody {
	    		for (event in calendar.getComponents(Component.VEVENT)) {
	    			if (event.getSummary()) {
	    				tr {
		    				td event.getSummary().getValue()
		    				td event.getStartDate().getDate()
	    				}
	    			}
	    		}
	    	}
    	}
    }
}
```

## GSP

Here is an [article] demonstrating iCal4j and [http://groovy.codehaus.org/GSP GSP](http://www.gr8conf.org/blog/2009/01/31/4) integration.

## Grails - iCalendar Plugin
Here is an introduction how to use iCal4j and Grails with the [iCalendar Grails Plugin](http://grails.org/plugin/ic-alendar).

##  Using Grape 

You can also use [Grape] to manage your iCal4j dependencies, however you will need to add the Modularity Maven repositories to your [http://groovy.codehaus.org/Grape#Grape-CustomizeIvysettings Grape config](http://groovy.codehaus.org/Grape) as follows:

```xml
<ivysettings>
  ...
  <resolvers>
    <chain name="downloadGrapes">
      ...
      <ibiblio name="mvnrepo" root="https://mvnrepository.com/" m2compatible="true" />
    </chain>
  </resolvers>
</ivysettings>
```

Then you can use scripts like this without any dependency configuration required:

```groovy
import net.fortuna.ical4j.vcard.ContentBuilder
import net.fortuna.ical4j.model.property.DtStamp

@Grab(group='org.mnode.ical4j', module='ical4j', version='1.0.2')
@Grab(group='org.mnode.ical4j', module='ical4j-vcard', version='0.9.6.2')
def getCalendar() {
    def builder = new ContentBuilder()
    builder.calendar() {
        prodid('-//Ben Fortuna//iCal4j 1.0//EN')
        version('2.0')
        vevent() {
            uid('1')
            dtstamp(new DtStamp())
            dtstart('20090810', parameters: parameters() {
                value('DATE')})
            action('DISPLAY')
            attach('http://example.com/attachment', parameters: parameters() {
                value('URI')})
        }
    }
}

println(calendar)
```

##  Connecting to a CalDAV Store 

You can also use the iCal4j connector to connect to a CalDAV store (e.g. Google Calendar). For example:

```groovy
import net.fortuna.ical4j.connector.dav.CalDavCalendarStore
import net.fortuna.ical4j.connector.dav.PathResolver
import org.apache.commons.httpclient.protocol.Protocol

class GCalPathResolver extends PathResolver {
  String getPrincipalPath(String username) {
    return "/calendar/dav/" + username + "/events/"
  }
  
  String getUserPath(String username) {
    return "/calendar/dav/" + username + "/user/"
  }
}

@Grab(group='net.fortuna.ical4j', module='ical4j-connector', version='0.9.1-SNAPSHOT')
@Grab(group='org.slf4j', module='slf4j-simple', version='1.5.3')
def getCollections() {
  def PRODID = "-//Ben Fortuna//iCal4j Connector 1.0//EN"
  def host = "www.google.com"
  def port = 443
  def path = "/calendar/dav/"
  def protocol = Protocol.getProtocol("https")
  def pathResolver = new GCalPathResolver()
  def store = new CalDavCalendarStore(PRODID, host, port, protocol, pathResolver)
  store.connect('<username>', '<password>'.toCharArray())
  def collections = store.collections
}

collections.each() {
  println "${it.description}: ${it.components.size()}"
}
```
