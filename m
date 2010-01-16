From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 7/9] "timezone" -> "time zone"
Date: Sun, 17 Jan 2010 07:53:58 +1300
Message-ID: <cfd18e0f1001161053v578caf62n590853c9851867f1@mail.gmail.com>
References: <1263080737-2868-1-git-send-email-mfwitten@gmail.com>
	 <1263080737-2868-8-git-send-email-mfwitten@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1263080737-2868-8-git-send-email-mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael

On Sun, Jan 10, 2010 at 12:45 PM, Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> Well, I was flabbergasted to discover that `timezone' is not
> a word; two words are required: `time zone'.
>
> Indeed, even The Free On-line Dictionary of Computing provides
> a definition for just `time zone'.
>
> Hence, all relevant occurrences of `timezone' have been replaced
> by `time zone'.

Whether one includes or elides space in terms like this tends to vary
across sources, but generally there is a tendency over tiume to elide
in English. I'm rejecting this patch. Like you, I am inclined to
accept "timezone" as a word.

Cheers,

Michael


>
> Signed-off-by: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0man2/gettimeofday.2 | =A0 =A04 ++--
> =A0man3/ctime.3 =A0 =A0 =A0 =A0| =A0 10 +++++-----
> =A0man3/ftime.3 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0man3/getdate.3 =A0 =A0 =A0| =A0 =A02 +-
> =A0man3/strftime.3 =A0 =A0 | =A0 =A06 +++---
> =A0man3/strptime.3 =A0 =A0 | =A0 =A04 ++--
> =A0man3/sysconf.3 =A0 =A0 =A0| =A0 =A02 +-
> =A0man3/tzset.3 =A0 =A0 =A0 =A0| =A0 38 +++++++++++++++++++----------=
---------
> =A0man5/tzfile.5 =A0 =A0 =A0 | =A0 18 +++++++++---------
> =A0man7/environ.7 =A0 =A0 =A0| =A0 =A02 +-
> =A0man7/hier.7 =A0 =A0 =A0 =A0 | =A0 =A02 +-
> =A0man8/tzselect.8 =A0 =A0 | =A0 10 +++++-----
> =A0man8/zdump.8 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0man8/zic.8 =A0 =A0 =A0 =A0 =A0| =A0 22 +++++++++++-----------
> =A014 files changed, 62 insertions(+), 62 deletions(-)
>
> diff --git a/man2/gettimeofday.2 b/man2/gettimeofday.2
> index d036876..2384b0c 100644
> --- a/man2/gettimeofday.2
> +++ b/man2/gettimeofday.2
> @@ -62,7 +62,7 @@ The functions
> =A0.BR gettimeofday ()
> =A0and
> =A0.BR settimeofday ()
> -can get and set the time as well as a timezone.
> +can get and set the time as well as a time zone.
> =A0The
> =A0.I tv
> =A0argument is a
> @@ -160,7 +160,7 @@ Daylight Saving Time is in force cannot be given
> =A0by a simple algorithm, one per country; indeed,
> =A0this period is determined by unpredictable political
> =A0decisions.
> -So this method of representing timezones
> +So this method of representing time zones
> =A0has been abandoned.
> =A0Under Linux, in a call to
> =A0.BR settimeofday ()
> diff --git a/man3/ctime.3 b/man3/ctime.3
> index f31f3d9..75e2f76 100644
> --- a/man3/ctime.3
> +++ b/man3/ctime.3
> @@ -164,7 +164,7 @@ functions.
> =A0The function also sets the external
> =A0variables \fItzname\fP, \fItimezone\fP, and \fIdaylight\fP (see
> =A0.BR tzset (3))
> -with information about the current timezone.
> +with information about the current time zone.
> =A0The reentrant version
> =A0.BR ctime_r ()
> =A0does the same, but stores the
> @@ -190,11 +190,11 @@ The
> =A0.BR localtime ()
> =A0function converts the calendar time \fItimep\fP to
> =A0broken-time representation, expressed relative to the user's speci=
fied
> -timezone.
> +time zone.
> =A0The function acts as if it called
> =A0.BR tzset (3)
> =A0and sets the external variables \fItzname\fP with
> -information about the current timezone, \fItimezone\fP with the diff=
erence
> +information about the current time zone, \fItimezone\fP with the dif=
ference
> =A0between Coordinated Universal Time (UTC) and local standard time i=
n
> =A0seconds, and \fIdaylight\fP to a non-zero value if daylight saving=
s
> =A0time rules apply during some part of the year.
> @@ -240,7 +240,7 @@ a positive value means DST is in effect;
> =A0zero means that DST is not in effect;
> =A0and a negative value means that
> =A0.BR mktime ()
> -should (use timezone information and system databases to)
> +should (use time zone information and system databases to)
> =A0attempt to determine whether DST is in effect at the specified tim=
e.
>
> =A0The
> @@ -261,7 +261,7 @@ to indicate whether DST is or is not in effect at=
 the specified time.
> =A0Calling
> =A0.BR mktime ()
> =A0also sets the external variable \fItzname\fP with
> -information about the current timezone.
> +information about the current time zone.
>
> =A0If the specified broken-down
> =A0time cannot be represented as calendar time (seconds since the Epo=
ch),
> diff --git a/man3/ftime.3 b/man3/ftime.3
> index 4df11bd..ce01574 100644
> --- a/man3/ftime.3
> +++ b/man3/ftime.3
> @@ -56,7 +56,7 @@ struct timeb {
> =A0Here \fItime\fP is the number of seconds since the Epoch,
> =A0and \fImillitm\fP is the number of milliseconds since \fItime\fP
> =A0seconds since the Epoch.
> -The \fItimezone\fP field is the local timezone measured in minutes
> +The \fItimezone\fP field is the local time zone measured in minutes
> =A0of time west of Greenwich (with a negative value indicating minute=
s
> =A0east of Greenwich).
> =A0The \fIdstflag\fP field
> diff --git a/man3/getdate.3 b/man3/getdate.3
> index d87e1f0..28773aa 100644
> --- a/man3/getdate.3
> +++ b/man3/getdate.3
> @@ -87,7 +87,7 @@ When
> =A0.B %Z
> =A0is given, the structure containing the broken-down time
> =A0is initialized with values corresponding to the current
> -time in the given timezone.
> +time in the given time zone.
> =A0Otherwise, the structure is initialized to the broken-down time
> =A0corresponding to the current local time (as by a call to
> =A0.BR localtime (3)).
> diff --git a/man3/strftime.3 b/man3/strftime.3
> index 38f3afb..ee7b097 100644
> --- a/man3/strftime.3
> +++ b/man3/strftime.3
> @@ -48,7 +48,7 @@ The
> =A0function formats the broken-down time \fItm\fP
> =A0according to the format specification \fIformat\fP and places the
> =A0result in the character array \fIs\fP of size \fImax\fP.
> -.\" FIXME POSIX says: Local timezone information is used as though
> +.\" FIXME POSIX says: Local time zone information is used as though
> =A0.\" strftime() called tzset(). =A0But this doesn't appear to be th=
e case
> =A0.PP
> =A0The format specification is a null-terminated string and may conta=
in
> @@ -250,7 +250,7 @@ The year as a decimal number including the centur=
y.
> =A0The +hhmm or -hhmm numeric time zone (that is, the hour and minute=
 offset from UTC). (SU)
> =A0.TP
> =A0.B %Z
> -The timezone or name or abbreviation.
> +The time zone or name or abbreviation.
> =A0.TP
> =A0.B %+
> =A0.\" Nov 05 -- Not in Linux/glibc, but is in some BSDs (according t=
o
> @@ -327,7 +327,7 @@ are used.
> =A0SVr4, C89, C99.
> =A0There are strict inclusions between the set of conversions
> =A0given in ANSI C (unmarked), those given in the Single Unix Specifi=
cation
> -(marked SU), those given in Olson's timezone package (marked TZ),
> +(marked SU), those given in Olson's zoneinfo package (marked TZ),
> =A0and those given in glibc (marked GNU), except that
> =A0.B %+
> =A0is not supported in glibc2.
> diff --git a/man3/strptime.3 b/man3/strptime.3
> index 99897f1..aaba1d1 100644
> --- a/man3/strptime.3
> +++ b/man3/strptime.3
> @@ -352,10 +352,10 @@ Otherwise, it is the last week
> =A0of the previous year, and the next week is week 1.
> =A0.TP
> =A0.B %z
> -An RFC-822/ISO 8601 standard timezone specification.
> +An RFC-822/ISO 8601 standard time zone specification.
> =A0.TP
> =A0.B %Z
> -The timezone name.
> +The time zone name.
> =A0.LP
> =A0Similarly, because of GNU extensions to
> =A0.BR strftime (3),
> diff --git a/man3/sysconf.3 b/man3/sysconf.3
> index 690f904..0486bb0 100644
> --- a/man3/sysconf.3
> +++ b/man3/sysconf.3
> @@ -206,7 +206,7 @@ Must not be less than
> =A0(9).
> =A0.TP
> =A0.BR TZNAME_MAX " - " _SC_TZNAME_MAX
> -The maximum number of bytes in a timezone name.
> +The maximum number of bytes in a time zone name.
> =A0Must not be less than
> =A0.B _POSIX_TZNAME_MAX
> =A0(6).
> diff --git a/man3/tzset.3 b/man3/tzset.3
> index 1d74405..e8590b1 100644
> --- a/man3/tzset.3
> +++ b/man3/tzset.3
> @@ -65,9 +65,9 @@ function initializes the \fItzname\fP variable from=
 the
> =A0.B TZ
> =A0environment variable.
> =A0This function is automatically called by the
> -other time conversion functions that depend on the timezone.
> +other time conversion functions that depend on the time zone.
> =A0In a System-V-like environment, it will also set the variables \fI=
timezone\fP
> -(to seconds West of UTC) and \fIdaylight\fP (to 0 if this timezone d=
oes not
> +(to seconds West of UTC) and \fIdaylight\fP (to 0 if this time zone =
does not
> =A0have any daylight saving time rules, or to non-zero if there is a =
time during
> =A0the year when daylight saving time applies).
> =A0.PP
> @@ -78,10 +78,10 @@ variable is initialized with the best approximati=
on of local wall clock
> =A0time, as specified by the
> =A0.BR tzfile (5)-format
> =A0file \fIlocaltime\fP
> -found in the system timezone directory (see below).
> +found in the system time zone directory (see below).
> =A0(One also often sees
> =A0.I /etc/localtime
> -used here, a symlink to the right file in the system timezone direct=
ory.)
> +used here, a symlink to the right file in the system time zone direc=
tory.)
> =A0.PP
> =A0If the
> =A0.B TZ
> @@ -93,19 +93,19 @@ The value of
> =A0.B TZ
> =A0can be one of three formats.
> =A0The first format is used
> -when there is no daylight saving time in the local timezone:
> +when there is no daylight saving time in the local time zone:
> =A0.sp
> =A0.RS
> =A0.I std offset
> =A0.RE
> =A0.sp
> -The \fIstd\fP string specifies the name of the timezone and must be
> +The \fIstd\fP string specifies the name of the time zone and must be
> =A0three or more alphabetic characters.
> =A0The \fIoffset\fP string immediately
> =A0follows \fIstd\fP and specifies the time value to be added to the =
local
> =A0time to get Coordinated Universal Time (UTC).
> =A0The \fIoffset\fP is positive
> -if the local timezone is west of the Prime Meridian and negative if =
it is
> +if the local time zone is west of the Prime Meridian and negative if=
 it is
> =A0east.
> =A0The hour must be between 0 and 24, and the minutes and seconds
> =A00 and 59.
> @@ -118,9 +118,9 @@ The second format is used when there is daylight =
saving time:
> =A0.sp
> =A0There are no spaces in the specification.
> =A0The initial \fIstd\fP and
> -\fIoffset\fP specify the standard timezone, as described above.
> +\fIoffset\fP specify the standard time zone, as described above.
> =A0The \fIdst\fP string and \fIoffset\fP specify the name and offset =
for the
> -corresponding daylight saving timezone.
> +corresponding daylight saving time zone.
> =A0If the offset is omitted,
> =A0it default to one hour ahead of standard time.
> =A0.PP
> @@ -159,26 +159,26 @@ and the changeovers happen at the default time =
of 02:00:00:
> =A0 =A0 TZ=3D"NZST-12.00:00NZDT-13:00:00,M10.1.0,M3.3.0"
> =A0.fi
> =A0.PP
> -The third format specifies that the timezone information should be r=
ead
> +The third format specifies that the time zone information should be =
read
> =A0from a file:
> =A0.sp
> =A0.RS
> =A0:[filespec]
> =A0.RE
> =A0.sp
> -If the file specification \fIfilespec\fP is omitted, the timezone
> +If the file specification \fIfilespec\fP is omitted, the time zone
> =A0information is read from the file
> =A0.I localtime
> -in the system timezone directory, which nowadays usually is
> +in the system time zone directory, which nowadays usually is
> =A0.IR /usr/share/zoneinfo .
> =A0This file is in
> =A0.BR tzfile (5)
> =A0format.
> =A0If \fIfilespec\fP is given, it specifies another
> =A0.BR tzfile (5)-format
> -file to read the timezone information from.
> +file to read the time zone information from.
> =A0If \fIfilespec\fP does not begin with a \(aq/\(aq, the file specif=
ication is
> -relative to the system timezone directory.
> +relative to the system time zone directory.
> =A0.PP
> =A0Here's an example, once more for New Zealand:
> =A0.nf
> @@ -186,7 +186,7 @@ Here's an example, once more for New Zealand:
> =A0 =A0 TZ=3D":Pacific/Auckland"
> =A0.fi
> =A0.SH FILES
> -The system timezone directory used depends on the (g)libc version.
> +The system time zone directory used depends on the (g)libc version.
> =A0Libc4 and libc5 use
> =A0.IR /usr/lib/zoneinfo ,
> =A0and, since libc-5.4.6,
> @@ -198,9 +198,9 @@ when that exists.
> =A0Its default depends on how it was installed, but normally is
> =A0.IR /usr/share/zoneinfo .
> =A0.LP
> -This timezone directory contains the files
> +This time zone directory contains the files
> =A0.nf
> -localtime =A0 =A0 =A0local timezone file
> +localtime =A0 =A0 =A0local time zone file
> =A0posixrules =A0 =A0 rules for POSIX-style TZ's
> =A0.fi
> =A0.LP
> @@ -208,7 +208,7 @@ Often
> =A0.I /etc/localtime
> =A0is a symlink to the file
> =A0.I localtime
> -or to the correct timezone file in the system timezone directory.
> +or to the correct time zone file in the system time zone directory.
> =A0.SH "CONFORMING TO"
> =A0SVr4, POSIX.1-2001, 4.3BSD.
> =A0.SH NOTES
> @@ -222,7 +222,7 @@ It has been obsolete for many years but is requir=
ed by SUSv2.
> =A04.3BSD had a function
> =A0.BI "char *timezone(" zone ", " dst )
> =A0that returned the
> -name of the timezone corresponding to its first argument (minutes
> +name of the time zone corresponding to its first argument (minutes
> =A0West of UTC).
> =A0If the second argument was 0, the standard name was used,
> =A0otherwise the daylight saving time version.
> diff --git a/man5/tzfile.5 b/man5/tzfile.5
> index 1e41c7e..6ec7561 100644
> --- a/man5/tzfile.5
> +++ b/man5/tzfile.5
> @@ -3,14 +3,14 @@
> =A0.\" 1996-06-05 by Arthur David Olson <arthur_david_olson-2zaOuxCdfhg@public.gmane.org>.
> =A0.TH TZFILE 5 1996-06-05 "" "Linux Programmer's Manual"
> =A0.SH NAME
> -tzfile \- timezone information
> +tzfile \- time zone information
> =A0.SH SYNOPSIS
> =A0.B #include <tzfile.h>
> =A0.SH DESCRIPTION
> -The timezone information files used by
> +The time zone information files used by
> =A0.BR tzset (3)
> =A0begin with the magic characters "TZif" to identify then as
> -timezone information files,
> +time zone information files,
> =A0followed by sixteen bytes reserved for future use,
> =A0followed by six four-byte values of type
> =A0.IR long ,
> @@ -37,7 +37,7 @@ The number of "local time types" for which data is =
stored
> =A0in the file (must not be zero).
> =A0.TP
> =A0.I tzh_charcnt
> -The number of characters of "timezone abbreviation strings"
> +The number of characters of "time zone abbreviation strings"
> =A0stored in the file.
> =A0.PP
> =A0The above header is followed by
> @@ -88,7 +88,7 @@ should be set by
> =A0.BR localtime (3),
> =A0and
> =A0.I tt_abbrind
> -serves as an index into the array of timezone abbreviation character=
s
> +serves as an index into the array of time zone abbreviation characte=
rs
> =A0that follow the
> =A0.I ttinfo
> =A0structure(s) in the file.
> @@ -110,16 +110,16 @@ Then there are
> =A0standard/wall indicators, each stored as a one-byte value;
> =A0they tell whether the transition times associated with local time =
types
> =A0were specified as standard time or wall clock time,
> -and are used when a timezone file is used in handling POSIX-style
> -timezone environment variables.
> +and are used when a time zone file is used in handling POSIX-style
> +time zone environment variables.
> =A0.PP
> =A0Finally, there are
> =A0.I tzh_ttisgmtcnt
> =A0UTC/local indicators, each stored as a one-byte value;
> =A0they tell whether the transition times associated with local time =
types
> =A0were specified as UTC or local time,
> -and are used when a timezone file is used in handling POSIX-style
> -timezone environment variables.
> +and are used when a time zone file is used in handling POSIX-style
> +time zone environment variables.
> =A0.PP
> =A0.I Localtime
> =A0uses the first standard-time
> diff --git a/man7/environ.7 b/man7/environ.7
> index 2ffb12a..9929279 100644
> --- a/man7/environ.7
> +++ b/man7/environ.7
> @@ -163,7 +163,7 @@ to be used with
> =A0.BR gethostbyname (3).
> =A0.LP
> =A0.BR TZ " and " TZDIR
> -give timezone information used by
> +give time zone information used by
> =A0.BR tzset (3)
> =A0and through that by functions like
> =A0.BR ctime (3),
> diff --git a/man7/hier.7 b/man7/hier.7
> index 8acfbfe..e5e0b2e 100644
> --- a/man7/hier.7
> +++ b/man7/hier.7
> @@ -358,7 +358,7 @@ The database for terminfo.
> =A0Troff macros that are not distributed with groff.
> =A0.TP
> =A0.I /usr/share/zoneinfo
> -Files for timezone information.
> +Files for time zone information.
> =A0.TP
> =A0.I /usr/src
> =A0Source files for different parts of the system, included with some=
 packages
> diff --git a/man8/tzselect.8 b/man8/tzselect.8
> index 717eaee..c843781 100644
> --- a/man8/tzselect.8
> +++ b/man8/tzselect.8
> @@ -2,21 +2,21 @@
> =A0.\"
> =A0.TH TZSELECT 8 2007-05-18 "" "Linux System Administration"
> =A0.SH NAME
> -tzselect \- select a timezone
> +tzselect \- select a time zone
> =A0.SH SYNOPSIS
> =A0.B tzselect
> =A0.SH DESCRIPTION
> =A0The
> =A0.B tzselect
> =A0program asks the user for information about the current location,
> -and outputs the resulting timezone description to standard output.
> +and outputs the resulting time zone description to standard output.
> =A0The output is suitable as a value for the
> =A0.B TZ
> =A0environment variable.
> =A0.PP
> =A0All interaction with the user is done via standard input and stand=
ard error.
> =A0.SH "EXIT STATUS"
> -The exit status is zero if a timezone was successfully obtained
> +The exit status is zero if a time zone was successfully obtained
> =A0from the user, non-zero otherwise.
> =A0.SH ENVIRONMENT
> =A0.TP
> @@ -27,7 +27,7 @@ program (default:
> =A0.BR awk ).
> =A0.TP
> =A0\fBTZDIR\fP
> -Name of the directory containing timezone data files (default:
> +Name of the directory containing time zone data files (default:
> =A0.IR /usr/share/zoneinfo ).
> =A0.\" or perhaps /usr/local/etc/zoneinfo in some older systems.
> =A0.SH FILES
> @@ -40,7 +40,7 @@ Table of country codes, latitude and longitude, TZ =
values, and
> =A0descriptive comments.
> =A0.TP
> =A0\fBTZDIR\fP\fI/\fP\fITZ\fP
> -Time zone data file for timezone \fITZ\fP.
> +Time zone data file for time zone \fITZ\fP.
> =A0.SH "SEE ALSO"
> =A0.BR tzfile (5),
> =A0.BR zdump (8),
> diff --git a/man8/zdump.8 b/man8/zdump.8
> index d9e9d7e..f216569 100644
> --- a/man8/zdump.8
> +++ b/man8/zdump.8
> @@ -2,7 +2,7 @@
> =A0.\"
> =A0.TH ZDUMP 8 2007-05-18 "" "Linux System Administration"
> =A0.SH NAME
> -zdump \- timezone dumper
> +zdump \- time zone dumper
> =A0.SH SYNOPSIS
> =A0.B zdump
> =A0[
> diff --git a/man8/zic.8 b/man8/zic.8
> index 8cb63bb..1d09884 100644
> --- a/man8/zic.8
> +++ b/man8/zic.8
> @@ -2,7 +2,7 @@
> =A0.\"
> =A0.TH ZIC 8 2007-05-18 "" "Linux System Administration"
> =A0.SH NAME
> -zic \- timezone compiler
> +zic \- time zone compiler
> =A0.SH SYNOPSIS
> =A0.B zic
> =A0[
> @@ -51,7 +51,7 @@ Create time conversion information files in the nam=
ed directory rather than
> =A0in the standard directory named below.
> =A0.TP
> =A0.BI "\-l " timezone
> -Use the given timezone as local time.
> +Use the given time zone as local time.
> =A0.I Zic
> =A0will act as if the input contained a link line of the form
> =A0.sp
> @@ -59,8 +59,8 @@ will act as if the input contained a link line of t=
he form
> =A0Link =A0 \fItimezone\fP =A0 =A0 =A0 =A0 =A0localtime
> =A0.TP
> =A0.BI "\-p " timezone
> -Use the given timezone's rules when handling POSIX-format
> -timezone environment variables.
> +Use the given time zone's rules when handling POSIX-format
> +time zone environment variables.
> =A0.I Zic
> =A0will act as if the input contained a link line of the form
> =A0.sp
> @@ -251,7 +251,7 @@ in
> =A0.q EST
> =A0or
> =A0.q EDT )
> -of timezone abbreviations to be used when this rule is in effect.
> +of time zone abbreviations to be used when this rule is in effect.
> =A0If this field is
> =A0.BR \- ,
> =A0the variable part is null.
> @@ -272,7 +272,7 @@ Zone =A0 =A0 =A0 =A0Australia/Adelaide =A0 =A0 =A0=
9:30 =A0 =A0Aus =A0 =A0 CST =A0 =A0 1971 Oct 31 2:00
> =A0The fields that make up a zone line are:
> =A0.TP "\w'UTC_OFFSET'u"
> =A0.B NAME
> -The name of the timezone.
> +The name of the time zone.
> =A0This is the name used in creating the time conversion information =
file for the
> =A0zone.
> =A0.TP
> @@ -286,19 +286,19 @@ fields of rule lines;
> =A0begin the field with a minus sign if time must be subtracted from =
UTC.
> =A0.TP
> =A0.B RULES/SAVE
> -The name of the rule(s) that apply in the timezone or,
> +The name of the rule(s) that apply in the time zone or,
> =A0alternately, an amount of time to add to local standard time.
> =A0If this field is
> =A0.B \-
> -then standard time always applies in the timezone.
> +then standard time always applies in the time zone.
> =A0.TP
> =A0.B FORMAT
> -The format for timezone abbreviations in this timezone.
> +The format for time zone abbreviations in this time zone.
> =A0The pair of characters
> =A0.B %s
> =A0is used to show where the
> =A0.q "variable part"
> -of the timezone abbreviation goes.
> +of the time zone abbreviation goes.
> =A0Alternately,
> =A0a slash (/)
> =A0separates standard and daylight abbreviations.
> @@ -307,7 +307,7 @@ separates standard and daylight abbreviations.
> =A0The time at which the UTC offset or the rule(s) change for a locat=
ion.
> =A0It is specified as a year, a month, a day, and a time of day.
> =A0If this is specified,
> -the timezone information is generated from the given UTC offset
> +the time zone information is generated from the given UTC offset
> =A0and rule change until the time specified.
> =A0The month, day, and time of day have the same format as the IN, ON=
, and AT
> =A0columns of a rule; trailing columns can be omitted, and default to=
 the
> --
> 1.6.6.102.gd6f8f
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
