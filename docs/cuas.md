A Calendar User Agent (CUA) is software that supports the [http://www.ietf.org/rfc/rfc2445.txt iCalendar] specification. This page provides information regarding the different categories of CUAs.

==Rich Clients==

===[http://www.microsoft.com/outlook/ Microsoft Outlook]===
<strong>Language:</strong> C   (?)
<br/>
<strong>License:</strong> Proprietary
<br/><br/>
<strong>RFC2445 Deviations:</strong>
* allows DATE-TIME representation without specifying a VALUE=DATE-TIME parameter
* Outlook will not read files that don't contain the mandatory UID and DTSTAMP properties in VEVENT, etc. components
* provides quoted TZID parameters, and as such does not conform with RFC2445
* generates additional spaces in recurrence rules containing a BYDAY component
* 2003 will only accept folded lines of exactly 75 octets
* 2007 will fold lines with all folded lines starting with a tab instead of spaces
<br/>
<strong>Non-standard Properties:</strong>
* <em>X-MICROSOFT-CDO-BUSYSTATUS:TENTATIVE </em>
* <em>X-MICROSOFT-CDO-IMPORTANCE:1 </em>
* <em>X-MICROSOFT-CDO-INTENDEDSTATUS:BUSY </em>
* <em>X-MICROSOFT-DISALLOW-COUNTER:FALSE </em>
* <em>X-MS-OLK-ALLOWEXTERNCHECK:TRUE </em>
* <em>X-MS-OLK-AUTOSTARTCHECK:FALSE </em>
* <em>X-MS-OLK-CONFTYPE:0 </em>
* <em>X-MS-OLK-SENDER;CN=Test:mailto:user@example.com</em>
<br/>

===[http://www.ibm.com/software/lotus Lotus Notes]===
<strong>Language:</strong> C   (?)
<br/>
<strong>License:</strong> Proprietary
<br/><br/>
<strong>RFC2445 Deviations:</strong>
* Requires METHOD:REQUEST for non-optional attendees
<br/>
<strong>Non-standard Properties:</strong>
* <em>X-LOTUS-BROADCAST:FALSE</em> (required for non-optional organizer?)
* <em>X-LOTUS-CHARSET:UTF-8 </em>
* <em>X-LOTUS-UPDATE-SEQ:1 </em>
* <em>X-LOTUS-UPDATE-WISL:$S:1;$L:1;$B:1;$R:1;$E:1;$W:1;$O:1;$M:1 </em>
* <em>X-LOTUS-NOTESVERSION:2 </em>
* <em>X-LOTUS-NOTICETYPE:I </em>
* <em>X-LOTUS-APPTTYPE:3 </em>
* <em>X-LOTUS-CHILD_UID:9DA9112BB4438073C125750E004B7055 </em>
<br/>

===[http://www.mozilla.org/projects/calendar/ Mozilla Calendar]===
<strong>Language:</strong> C   (?)
<br/>
<strong>License:</strong> [http://www.mozilla.org/MPL/MPL-1.1.html MPL]
<br/><br/>
<strong>RFC2445 Deviations:</strong>
* long content lines are folded with a single LF character (should be CRLF)
* folds all property parameters and values
* Generates non-standard "X" properties
<br/>

===[http://www.apple.com/ical/ Apple iCal]===
<strong>Language:</strong> Unknown
<br/>
<strong>License:</strong> Proprietary
<br/><br/>
<strong>RFC2445 Deviations:</strong>
* uses VALUE=TEXT on some X-properties (NOTE: this is valid behaviour)
* iCal events don't include the mandatory DTSTAMP property
* iCal 1.0 doesn't appear to include VTIMEZONE definitions where applicable (this appears fixed as of 1.5)
<br/>

===[http://www.gnome.org/projects/evolution/ Evolution]===
<strong>Language:</strong> C   (?)
<br/>
<strong>License:</strong> [http://www.gnu.org/licenses/gpl.html GPL]
<br/>

===[http://korganizer.kde.org/ KOrganizer]===
<strong>Language:</strong> C   (?)
<br/>
<strong>License:</strong> [http://www.gnu.org/licenses/gpl.html GPL]
<br/><br/>
<strong>RFC2445 Deviations:</strong>
* long content lines are folded with a single LF character (should be CRLF)
* folds all property parameters and values
<br/>

===[http://chandler.osafoundation.org/ Chandler]===
<strong>Language:</strong> Python
<br/>
<strong>License:</strong> [http://www.gnu.org/licenses/gpl.html GPL]

<br/>

===[http://www.k5n.us/k5ncal.php k5n Desktop Calendar (k5nCal)]===
<strong>Language:</strong> Java 1.5
<br/>
<strong>License:</strong> [http://www.k5n.us/k5ncal.php?topic=Licensing GPL] (3rd party libraries with other licenses)

==Web Applications==

===[http://phpicalendar.net/ PHP iCalendar]===
<strong>Language:</strong> PHP
<br/>
<strong>License:</strong> [http://www.gnu.org/licenses/gpl.html GPL]
<br/><br/>
<strong>RFC2445 Deviations:</strong>
* long content lines are folded with a single LF character (should be CRLF)
<br/>

===[http://www.webical.org/ Webical]===
<strong>Language:</strong> Java
<br/>
<strong>License:</strong> [http://www.gnu.org/licenses/gpl.html GPL]
<br/>

===[http://calendar.google.com/ Google Calendar]===
<strong>Language:</strong> Unknown
<br/>
<strong>License:</strong> N/A
<br/><br/>
<strong>RFC2445 Deviations:</strong>
* Generates DTSTART properties in DATE format without specifying the required VALUE=DATE parameter

===[http://www.k5n.us/webcalendar.php WebCalendar]===
<strong>Language:</strong> PHP
<br/>
<strong>License:</strong> GPL
<br/><br/>
<strong>RFC2445 Deviations:</strong>
* Generates invalid ATTENDEE lines

==Calendar Servers==

===[http://www.hula-project.org/ Hula Project]===
<strong>Language:</strong> Unknown
<br/>
<strong>License:</strong> [http://www.gnu.org/licenses/gpl.html GPL]

===[http://cosmo.osafoundation.org/ Cosmo]===
<strong>Language:</strong> Java
<br/>
<strong>License:</strong> [http://apache.org/licenses/LICENSE-2.0 Apache 2.0]
