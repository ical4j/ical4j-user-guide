# iCal4j Services

A collection of iCalendar functions delivered as HTTP services.

## Overview

iCal4j services is a collection of libraries that support deployment as a service. For example:

* [iCal4j Validator](validator.md)
* [iCal4j Serializer](serializer.md)
* [iCal4j FreeBusy](freebusy.md)
* iCal4j Query
* iCal4j User Agent
* ...

Each of these libraries are bundled with an HTTP Servlet and may be deployed either in a Web container or
standalone with an embedded Jetty server. They are stateless services and containerisation will be supported
to provide maximum choice in how they are deployed.
