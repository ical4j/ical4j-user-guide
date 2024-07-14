# iCal4j Actions

Reactive programming for iCalendar and vCard.

![actions.mmd.svg](../images/actions.mmd.svg)

## Overview

Calendaring and scheduling applications may typically include responding to
conditions that trigger certain actions. For example, notifications must be sent for
approaching events, overdue tasks, and other conditions that require human interaction.

Automated processes also may be triggered by similar conditions, such as updating
participation status in a calendar when a response from an attendee is received.

This library provides a simple framework for implementing responses to trigger conditions
common to the iCalendar and vCard specifications. It uses Java Reactive Streams to implement
a resilient observer pattern that won't negatively impact performance of the observable target.

## Trigger

A trigger is an immutable object instance containing relevant details of a condition or
state change in an iCalendar or vCard model. A trigger includes a reference to the source
object, a URI representing the context of the object (e.g. a collection, a channel, etc.),
the type of condition/change, and a timestamp indicating when it occurred.

Applications supporting triggers will implement the `Flow.Publisher<Trigger>` interface in
order to notify subscribers of model or state changes.

## Trigger Handler

A trigger handler implements the custom logic required to respond to changes in conditions
or state. A trigger handler is similar to an event handler, with the main difference being
each handler instance is associated with a separate trigger subscriber.

## Trigger Subscriber

A trigger subscriber listens for new triggers and notifies its associated trigger handler.
A trigger subscriber may be configured to control the flow of triggers depending on the
requirements of the trigger handler (e.g. handlers that take a long time to complete
may require tuning in the subscriber).
