# iCal4j Template - Budget

Budget management templates.

## Overview

Financial management is a common need for projects and other collaborative activities. The ability to track
available funds and expenses are important when deciding how to prioritise activities.

## Funding

A Funding object captures an agreed amount of spend available to specific activities such as projects and teams. The
Funding agreement is tracked via the completion status.

## Expense

An Expense instance outlines the realised funding spend that is ultimately offset by Funding instances. Ideally the
total of all Expenses will not exceed the total Funding available. This can be mitigated by establishing an Approval
workflow that ensures agreed Funding is available prior to Expense fulfilment. 
