# iCal4j Serializer - JOT Card


The JOT Card serializer supports the incremental build of entity details such as contacts.

## Overview

A VCARD object may include the following properties once:

* KIND
* N
* BDAY
* ANNIVERSARY
* GENDER
* REV
* UID


The following properties may occur more than once:

* SOURCE
* XML
* FN
* NICKNAME
* PHOTO
* ADR
* TEL
* EMAIL
* IMPP
* LANG
* TZ
* GEO
* TITLE
* ROLE
* LOGO
* ORG
* MEMBER
* RELATED
* CATEGORIES
* NOTE
* SOUND
* CLIENTPIDMAP
* URL
* KEY
* FBURL
* CALADRURI
* CALURI

## HTTP Payloads

Combined with HTTP verbs an API for entity management can be created.

