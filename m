From: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 7/9] "timezone" -> "time zone"
Date: Thu,  3 Dec 2009 16:39:56 -0600
Message-ID: <1259879998-1140-7-git-send-email-mfwitten@gmail.com>
References: <1259879998-1140-1-git-send-email-mfwitten@gmail.com>
 <1259879998-1140-2-git-send-email-mfwitten@gmail.com>
 <1259879998-1140-3-git-send-email-mfwitten@gmail.com>
 <1259879998-1140-4-git-send-email-mfwitten@gmail.com>
 <1259879998-1140-5-git-send-email-mfwitten@gmail.com>
 <1259879998-1140-6-git-send-email-mfwitten@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1259879998-1140-6-git-send-email-mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Well, I was flabbergasted to discover that `timezone' is not
a word; two words are required: `time zone'.

Indeed, even The Free On-line Dictionary of Computing provides
a definition for just `time zone'.

Hence, all relevant occurrences of `timezone' have been replaced
by `time zone'.

Signed-off-by: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/gettimeofday.2 |    4 ++--
 man3/ctime.3        |   10 +++++-----
 man3/ftime.3        |    2 +-
 man3/getdate.3      |    2 +-
 man3/strftime.3     |    6 +++---
 man3/strptime.3     |    4 ++--
 man3/sysconf.3      |    2 +-
 man3/tzset.3        |   38 +++++++++++++++++++-------------------
 man5/tzfile.5       |   18 +++++++++---------
 man7/environ.7      |    2 +-
 man7/hier.7         |    2 +-
 man8/tzselect.8     |   10 +++++-----
 man8/zdump.8        |    2 +-
 man8/zic.8          |   22 +++++++++++-----------
 14 files changed, 62 insertions(+), 62 deletions(-)

diff --git a/man2/gettimeofday.2 b/man2/gettimeofday.2
index d036876..2384b0c 100644
--- a/man2/gettimeofday.2
+++ b/man2/gettimeofday.2
@@ -62,7 +62,7 @@ The functions
 .BR gettimeofday ()
 and
 .BR settimeofday ()
-can get and set the time as well as a timezone.
+can get and set the time as well as a time zone.
 The
 .I tv
 argument is a
@@ -160,7 +160,7 @@ Daylight Saving Time is in force cannot be given
 by a simple algorithm, one per country; indeed,
 this period is determined by unpredictable political
 decisions.
-So this method of representing timezones
+So this method of representing time zones
 has been abandoned.
 Under Linux, in a call to
 .BR settimeofday ()
diff --git a/man3/ctime.3 b/man3/ctime.3
index f31f3d9..75e2f76 100644
--- a/man3/ctime.3
+++ b/man3/ctime.3
@@ -164,7 +164,7 @@ functions.
 The function also sets the external
 variables \fItzname\fP, \fItimezone\fP, and \fIdaylight\fP (see
 .BR tzset (3))
-with information about the current timezone.
+with information about the current time zone.
 The reentrant version
 .BR ctime_r ()
 does the same, but stores the
@@ -190,11 +190,11 @@ The
 .BR localtime ()
 function converts the calendar time \fItimep\fP to
 broken-time representation, expressed relative to the user's specified
-timezone.
+time zone.
 The function acts as if it called
 .BR tzset (3)
 and sets the external variables \fItzname\fP with
-information about the current timezone, \fItimezone\fP with the difference
+information about the current time zone, \fItimezone\fP with the difference
 between Coordinated Universal Time (UTC) and local standard time in
 seconds, and \fIdaylight\fP to a non-zero value if daylight savings
 time rules apply during some part of the year.
@@ -240,7 +240,7 @@ a positive value means DST is in effect;
 zero means that DST is not in effect;
 and a negative value means that
 .BR mktime ()
-should (use timezone information and system databases to)
+should (use time zone information and system databases to)
 attempt to determine whether DST is in effect at the specified time.
 
 The
@@ -261,7 +261,7 @@ to indicate whether DST is or is not in effect at the specified time.
 Calling
 .BR mktime ()
 also sets the external variable \fItzname\fP with
-information about the current timezone.
+information about the current time zone.
 
 If the specified broken-down
 time cannot be represented as calendar time (seconds since the Epoch),
diff --git a/man3/ftime.3 b/man3/ftime.3
index 4df11bd..ce01574 100644
--- a/man3/ftime.3
+++ b/man3/ftime.3
@@ -56,7 +56,7 @@ struct timeb {
 Here \fItime\fP is the number of seconds since the Epoch,
 and \fImillitm\fP is the number of milliseconds since \fItime\fP
 seconds since the Epoch.
-The \fItimezone\fP field is the local timezone measured in minutes
+The \fItimezone\fP field is the local time zone measured in minutes
 of time west of Greenwich (with a negative value indicating minutes
 east of Greenwich).
 The \fIdstflag\fP field
diff --git a/man3/getdate.3 b/man3/getdate.3
index d87e1f0..28773aa 100644
--- a/man3/getdate.3
+++ b/man3/getdate.3
@@ -87,7 +87,7 @@ When
 .B %Z
 is given, the structure containing the broken-down time
 is initialized with values corresponding to the current
-time in the given timezone.
+time in the given time zone.
 Otherwise, the structure is initialized to the broken-down time
 corresponding to the current local time (as by a call to
 .BR localtime (3)).
diff --git a/man3/strftime.3 b/man3/strftime.3
index c42607a..b327cef 100644
--- a/man3/strftime.3
+++ b/man3/strftime.3
@@ -48,7 +48,7 @@ The
 function formats the broken-down time \fItm\fP
 according to the format specification \fIformat\fP and places the
 result in the character array \fIs\fP of size \fImax\fP.
-.\" FIXME POSIX says: Local timezone information is used as though
+.\" FIXME POSIX says: Local time zone information is used as though
 .\" strftime() called tzset().  But this doesn't appear to be the case
 .PP
 The format specification is a null-terminated string and may contain
@@ -250,7 +250,7 @@ The year as a decimal number including the century.
 The +hhmm or -hhmm numeric time zone (that is, the hour and minute offset from UTC). (SU)
 .TP
 .B %Z
-The timezone or name or abbreviation.
+The time zone or name or abbreviation.
 .TP
 .B %+
 .\" Nov 05 -- Not in Linux/glibc, but is in some BSDs (according to
@@ -327,7 +327,7 @@ are used.
 SVr4, C89, C99.
 There are strict inclusions between the set of conversions
 given in ANSI C (unmarked), those given in the Single Unix Specification
-(marked SU), those given in Olson's timezone package (marked TZ),
+(marked SU), those given in Olson's zoneinfo package (marked TZ),
 and those given in glibc (marked GNU), except that
 .B %+
 is not supported in glibc2.
diff --git a/man3/strptime.3 b/man3/strptime.3
index 99897f1..aaba1d1 100644
--- a/man3/strptime.3
+++ b/man3/strptime.3
@@ -352,10 +352,10 @@ Otherwise, it is the last week
 of the previous year, and the next week is week 1.
 .TP
 .B %z
-An RFC-822/ISO 8601 standard timezone specification.
+An RFC-822/ISO 8601 standard time zone specification.
 .TP
 .B %Z
-The timezone name.
+The time zone name.
 .LP
 Similarly, because of GNU extensions to
 .BR strftime (3),
diff --git a/man3/sysconf.3 b/man3/sysconf.3
index 690f904..0486bb0 100644
--- a/man3/sysconf.3
+++ b/man3/sysconf.3
@@ -206,7 +206,7 @@ Must not be less than
 (9).
 .TP
 .BR TZNAME_MAX " - " _SC_TZNAME_MAX
-The maximum number of bytes in a timezone name.
+The maximum number of bytes in a time zone name.
 Must not be less than
 .B _POSIX_TZNAME_MAX
 (6).
diff --git a/man3/tzset.3 b/man3/tzset.3
index 1d74405..e8590b1 100644
--- a/man3/tzset.3
+++ b/man3/tzset.3
@@ -65,9 +65,9 @@ function initializes the \fItzname\fP variable from the
 .B TZ
 environment variable.
 This function is automatically called by the
-other time conversion functions that depend on the timezone.
+other time conversion functions that depend on the time zone.
 In a System-V-like environment, it will also set the variables \fItimezone\fP
-(to seconds West of UTC) and \fIdaylight\fP (to 0 if this timezone does not
+(to seconds West of UTC) and \fIdaylight\fP (to 0 if this time zone does not
 have any daylight saving time rules, or to non-zero if there is a time during
 the year when daylight saving time applies).
 .PP
@@ -78,10 +78,10 @@ variable is initialized with the best approximation of local wall clock
 time, as specified by the
 .BR tzfile (5)-format
 file \fIlocaltime\fP
-found in the system timezone directory (see below).
+found in the system time zone directory (see below).
 (One also often sees
 .I /etc/localtime
-used here, a symlink to the right file in the system timezone directory.)
+used here, a symlink to the right file in the system time zone directory.)
 .PP
 If the
 .B TZ
@@ -93,19 +93,19 @@ The value of
 .B TZ
 can be one of three formats.
 The first format is used
-when there is no daylight saving time in the local timezone:
+when there is no daylight saving time in the local time zone:
 .sp
 .RS
 .I std offset
 .RE
 .sp
-The \fIstd\fP string specifies the name of the timezone and must be
+The \fIstd\fP string specifies the name of the time zone and must be
 three or more alphabetic characters.
 The \fIoffset\fP string immediately
 follows \fIstd\fP and specifies the time value to be added to the local
 time to get Coordinated Universal Time (UTC).
 The \fIoffset\fP is positive
-if the local timezone is west of the Prime Meridian and negative if it is
+if the local time zone is west of the Prime Meridian and negative if it is
 east.
 The hour must be between 0 and 24, and the minutes and seconds
 0 and 59.
@@ -118,9 +118,9 @@ The second format is used when there is daylight saving time:
 .sp
 There are no spaces in the specification.
 The initial \fIstd\fP and
-\fIoffset\fP specify the standard timezone, as described above.
+\fIoffset\fP specify the standard time zone, as described above.
 The \fIdst\fP string and \fIoffset\fP specify the name and offset for the
-corresponding daylight saving timezone.
+corresponding daylight saving time zone.
 If the offset is omitted,
 it default to one hour ahead of standard time.
 .PP
@@ -159,26 +159,26 @@ and the changeovers happen at the default time of 02:00:00:
     TZ="NZST-12.00:00NZDT-13:00:00,M10.1.0,M3.3.0"
 .fi
 .PP
-The third format specifies that the timezone information should be read
+The third format specifies that the time zone information should be read
 from a file:
 .sp
 .RS
 :[filespec]
 .RE
 .sp
-If the file specification \fIfilespec\fP is omitted, the timezone
+If the file specification \fIfilespec\fP is omitted, the time zone
 information is read from the file
 .I localtime
-in the system timezone directory, which nowadays usually is
+in the system time zone directory, which nowadays usually is
 .IR /usr/share/zoneinfo .
 This file is in
 .BR tzfile (5)
 format.
 If \fIfilespec\fP is given, it specifies another
 .BR tzfile (5)-format
-file to read the timezone information from.
+file to read the time zone information from.
 If \fIfilespec\fP does not begin with a \(aq/\(aq, the file specification is
-relative to the system timezone directory.
+relative to the system time zone directory.
 .PP
 Here's an example, once more for New Zealand:
 .nf
@@ -186,7 +186,7 @@ Here's an example, once more for New Zealand:
     TZ=":Pacific/Auckland"
 .fi
 .SH FILES
-The system timezone directory used depends on the (g)libc version.
+The system time zone directory used depends on the (g)libc version.
 Libc4 and libc5 use
 .IR /usr/lib/zoneinfo ,
 and, since libc-5.4.6,
@@ -198,9 +198,9 @@ when that exists.
 Its default depends on how it was installed, but normally is
 .IR /usr/share/zoneinfo .
 .LP
-This timezone directory contains the files
+This time zone directory contains the files
 .nf
-localtime      local timezone file
+localtime      local time zone file
 posixrules     rules for POSIX-style TZ's
 .fi
 .LP
@@ -208,7 +208,7 @@ Often
 .I /etc/localtime
 is a symlink to the file
 .I localtime
-or to the correct timezone file in the system timezone directory.
+or to the correct time zone file in the system time zone directory.
 .SH "CONFORMING TO"
 SVr4, POSIX.1-2001, 4.3BSD.
 .SH NOTES
@@ -222,7 +222,7 @@ It has been obsolete for many years but is required by SUSv2.
 4.3BSD had a function
 .BI "char *timezone(" zone ", " dst )
 that returned the
-name of the timezone corresponding to its first argument (minutes
+name of the time zone corresponding to its first argument (minutes
 West of UTC).
 If the second argument was 0, the standard name was used,
 otherwise the daylight saving time version.
diff --git a/man5/tzfile.5 b/man5/tzfile.5
index 1e41c7e..6ec7561 100644
--- a/man5/tzfile.5
+++ b/man5/tzfile.5
@@ -3,14 +3,14 @@
 .\" 1996-06-05 by Arthur David Olson <arthur_david_olson-2zaOuxCdfhg@public.gmane.org>.
 .TH TZFILE 5 1996-06-05 "" "Linux Programmer's Manual"
 .SH NAME
-tzfile \- timezone information
+tzfile \- time zone information
 .SH SYNOPSIS
 .B #include <tzfile.h>
 .SH DESCRIPTION
-The timezone information files used by
+The time zone information files used by
 .BR tzset (3)
 begin with the magic characters "TZif" to identify then as
-timezone information files,
+time zone information files,
 followed by sixteen bytes reserved for future use,
 followed by six four-byte values of type
 .IR long ,
@@ -37,7 +37,7 @@ The number of "local time types" for which data is stored
 in the file (must not be zero).
 .TP
 .I tzh_charcnt
-The number of characters of "timezone abbreviation strings"
+The number of characters of "time zone abbreviation strings"
 stored in the file.
 .PP
 The above header is followed by
@@ -88,7 +88,7 @@ should be set by
 .BR localtime (3),
 and
 .I tt_abbrind
-serves as an index into the array of timezone abbreviation characters
+serves as an index into the array of time zone abbreviation characters
 that follow the
 .I ttinfo
 structure(s) in the file.
@@ -110,16 +110,16 @@ Then there are
 standard/wall indicators, each stored as a one-byte value;
 they tell whether the transition times associated with local time types
 were specified as standard time or wall clock time,
-and are used when a timezone file is used in handling POSIX-style
-timezone environment variables.
+and are used when a time zone file is used in handling POSIX-style
+time zone environment variables.
 .PP
 Finally, there are
 .I tzh_ttisgmtcnt
 UTC/local indicators, each stored as a one-byte value;
 they tell whether the transition times associated with local time types
 were specified as UTC or local time,
-and are used when a timezone file is used in handling POSIX-style
-timezone environment variables.
+and are used when a time zone file is used in handling POSIX-style
+time zone environment variables.
 .PP
 .I Localtime
 uses the first standard-time
diff --git a/man7/environ.7 b/man7/environ.7
index 2ffb12a..9929279 100644
--- a/man7/environ.7
+++ b/man7/environ.7
@@ -163,7 +163,7 @@ to be used with
 .BR gethostbyname (3).
 .LP
 .BR TZ " and " TZDIR
-give timezone information used by
+give time zone information used by
 .BR tzset (3)
 and through that by functions like
 .BR ctime (3),
diff --git a/man7/hier.7 b/man7/hier.7
index 8acfbfe..e5e0b2e 100644
--- a/man7/hier.7
+++ b/man7/hier.7
@@ -358,7 +358,7 @@ The database for terminfo.
 Troff macros that are not distributed with groff.
 .TP
 .I /usr/share/zoneinfo
-Files for timezone information.
+Files for time zone information.
 .TP
 .I /usr/src
 Source files for different parts of the system, included with some packages
diff --git a/man8/tzselect.8 b/man8/tzselect.8
index 717eaee..c843781 100644
--- a/man8/tzselect.8
+++ b/man8/tzselect.8
@@ -2,21 +2,21 @@
 .\"
 .TH TZSELECT 8 2007-05-18 "" "Linux System Administration"
 .SH NAME
-tzselect \- select a timezone
+tzselect \- select a time zone
 .SH SYNOPSIS
 .B tzselect
 .SH DESCRIPTION
 The
 .B tzselect
 program asks the user for information about the current location,
-and outputs the resulting timezone description to standard output.
+and outputs the resulting time zone description to standard output.
 The output is suitable as a value for the
 .B TZ
 environment variable.
 .PP
 All interaction with the user is done via standard input and standard error.
 .SH "EXIT STATUS"
-The exit status is zero if a timezone was successfully obtained
+The exit status is zero if a time zone was successfully obtained
 from the user, non-zero otherwise.
 .SH ENVIRONMENT
 .TP
@@ -27,7 +27,7 @@ program (default:
 .BR awk ).
 .TP
 \fBTZDIR\fP
-Name of the directory containing timezone data files (default:
+Name of the directory containing time zone data files (default:
 .IR /usr/share/zoneinfo ).
 .\" or perhaps /usr/local/etc/zoneinfo in some older systems.
 .SH FILES
@@ -40,7 +40,7 @@ Table of country codes, latitude and longitude, TZ values, and
 descriptive comments.
 .TP
 \fBTZDIR\fP\fI/\fP\fITZ\fP
-Time zone data file for timezone \fITZ\fP.
+Time zone data file for time zone \fITZ\fP.
 .SH "SEE ALSO"
 .BR tzfile (5),
 .BR zdump (8),
diff --git a/man8/zdump.8 b/man8/zdump.8
index d9e9d7e..f216569 100644
--- a/man8/zdump.8
+++ b/man8/zdump.8
@@ -2,7 +2,7 @@
 .\"
 .TH ZDUMP 8 2007-05-18 "" "Linux System Administration"
 .SH NAME
-zdump \- timezone dumper
+zdump \- time zone dumper
 .SH SYNOPSIS
 .B zdump
 [
diff --git a/man8/zic.8 b/man8/zic.8
index 8cb63bb..1d09884 100644
--- a/man8/zic.8
+++ b/man8/zic.8
@@ -2,7 +2,7 @@
 .\"
 .TH ZIC 8 2007-05-18 "" "Linux System Administration"
 .SH NAME
-zic \- timezone compiler
+zic \- time zone compiler
 .SH SYNOPSIS
 .B zic
 [
@@ -51,7 +51,7 @@ Create time conversion information files in the named directory rather than
 in the standard directory named below.
 .TP
 .BI "\-l " timezone
-Use the given timezone as local time.
+Use the given time zone as local time.
 .I Zic
 will act as if the input contained a link line of the form
 .sp
@@ -59,8 +59,8 @@ will act as if the input contained a link line of the form
 Link	\fItimezone\fP		localtime
 .TP
 .BI "\-p " timezone
-Use the given timezone's rules when handling POSIX-format
-timezone environment variables.
+Use the given time zone's rules when handling POSIX-format
+time zone environment variables.
 .I Zic
 will act as if the input contained a link line of the form
 .sp
@@ -251,7 +251,7 @@ in
 .q EST
 or
 .q EDT )
-of timezone abbreviations to be used when this rule is in effect.
+of time zone abbreviations to be used when this rule is in effect.
 If this field is
 .BR \- ,
 the variable part is null.
@@ -272,7 +272,7 @@ Zone	Australia/Adelaide	9:30	Aus	CST	1971 Oct 31 2:00
 The fields that make up a zone line are:
 .TP "\w'UTC_OFFSET'u"
 .B NAME
-The name of the timezone.
+The name of the time zone.
 This is the name used in creating the time conversion information file for the
 zone.
 .TP
@@ -286,19 +286,19 @@ fields of rule lines;
 begin the field with a minus sign if time must be subtracted from UTC.
 .TP
 .B RULES/SAVE
-The name of the rule(s) that apply in the timezone or,
+The name of the rule(s) that apply in the time zone or,
 alternately, an amount of time to add to local standard time.
 If this field is
 .B \-
-then standard time always applies in the timezone.
+then standard time always applies in the time zone.
 .TP
 .B FORMAT
-The format for timezone abbreviations in this timezone.
+The format for time zone abbreviations in this time zone.
 The pair of characters
 .B %s
 is used to show where the
 .q "variable part"
-of the timezone abbreviation goes.
+of the time zone abbreviation goes.
 Alternately,
 a slash (/)
 separates standard and daylight abbreviations.
@@ -307,7 +307,7 @@ separates standard and daylight abbreviations.
 The time at which the UTC offset or the rule(s) change for a location.
 It is specified as a year, a month, a day, and a time of day.
 If this is specified,
-the timezone information is generated from the given UTC offset
+the time zone information is generated from the given UTC offset
 and rule change until the time specified.
 The month, day, and time of day have the same format as the IN, ON, and AT
 columns of a rule; trailing columns can be omitted, and default to the
-- 
1.6.5.2.180.gc5b3e

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
