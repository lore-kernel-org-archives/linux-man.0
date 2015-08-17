From: Nikola =?ISO-8859-1?Q?Forr=F3?= <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Proposition to extend strftime(3) manpage
Date: Mon, 17 Aug 2015 17:04:30 +0200
Message-ID: <1439823870.3119.28.camel@redhat.com>
Reply-To: nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

I'm proposing to extend strftime(3) manpage so that each conversion
specification description contains information about which tm structure
member(s) is its resulting value determined from. Please see [1].
Inspiration comes from [2]. Information was obtained by reading glibc
source code.
I'm pretty sure that the attached patch is not perfect, and I'll
welcome any suggestions on how to improve it.

Best regards,
Nikola Forr=C3=B3


[1] https://bugzilla.redhat.com/show_bug.cgi?id=3D1162218
[2] http://pubs.opengroup.org/onlinepubs/9699919799/functions/strftime.=
html

---
 man3/strftime.3 | 55 +++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
 1 file changed, 55 insertions(+)

diff --git a/man3/strftime.3 b/man3/strftime.3
index c816a0a..d906302 100644
--- a/man3/strftime.3
+++ b/man3/strftime.3
@@ -78,24 +78,30 @@ of conversion specifications are replaced as follow=
s:
 .TP
 .B %a
 The abbreviated name of the day of the week according to the current l=
ocale.
+ (glibc: determined from \fItm_wday\fP member of \fItm\fP\ structure)
 .TP
 .B %A
 The full name of the day of the week according to the current locale.
+ (glibc: determined from \fItm_wday\fP member of \fItm\fP\ structure)
 .TP
 .B %b
 The abbreviated month name according to the current locale.
+ (glibc: determined from \fItm_mon\fP member of \fItm\fP\ structure)
 .TP
 .B %B
 The full month name according to the current locale.
+ (glibc: determined from \fItm_mon\fP member of \fItm\fP\ structure)
 .TP
 .B %c
 The preferred date and time representation for the current locale.
 .TP
 .B %C
 The century number (year/100) as a 2-digit integer. (SU)
+ (glibc: determined from \fItm_year\fP member of \fItm\fP\ structure)
 .TP
 .B %d
 The day of the month as a decimal number (range 01 to 31).
+ (glibc: determined from \fItm_mday\fP member of \fItm\fP\ structure)
 .TP
 .B %D
 Equivalent to
@@ -106,12 +112,15 @@ Americans should note that in other countries
 is rather common.
 This means that in international context this format is
 ambiguous and should not be used.) (SU)
+ (glibc: determined from \fItm_mday\fP, \fItm_mon\fP and \fItm_year\fP
+members of \fItm\fP\ structure)
 .TP
 .B %e
 Like
 .BR %d ,
 the day of the month as a decimal number, but a leading
 zero is replaced by a space. (SU)
+ (glibc: determined from \fItm_mday\fP member of \fItm\fP\ structure)
 .TP
 .B %E
 Modifier: use alternative format, see below. (SU)
@@ -120,6 +129,8 @@ Modifier: use alternative format, see below. (SU)
 Equivalent to
 .B %Y-%m-%d
 (the ISO\ 8601 date format). (C99)
+ (glibc: determined from \fItm_mday\fP, \fItm_mon\fP and \fItm_year\fP
+members of \fItm\fP\ structure)
 .TP
 .B %G
 The ISO\ 8601 week-based year (see NOTES) with century as a decimal nu=
mber.
@@ -129,25 +140,33 @@ This has the same format and value as
 .BR %Y ,
 except that if the ISO week number belongs to the previous or next yea=
r,
 that year is used instead. (TZ)
+ (glibc: determined from \fItm_year\fP, \fItm_wday\fP and \fItm_yday\f=
P
+members of \fItm\fP\ structure)
 .TP
 .B %g
 Like
 .BR %G ,
 but without century, that is, with a 2-digit year (00-99). (TZ)
+ (glibc: determined from \fItm_year\fP, \fItm_wday\fP and \fItm_yday\f=
P
+members of \fItm\fP\ structure)
 .TP
 .B %h
 Equivalent to
 .BR %b .
 (SU)
+ (glibc: determined from \fItm_mon\fP member of \fItm\fP\ structure)
 .TP
 .B %H
 The hour as a decimal number using a 24-hour clock (range 00 to 23).
+ (glibc: determined from \fItm_hour\fP member of \fItm\fP\ structure)
 .TP
 .B %I
 The hour as a decimal number using a 12-hour clock (range 01 to 12).
+ (glibc: determined from \fItm_hour\fP member of \fItm\fP\ structure)
 .TP
 .B %j
 The day of the year as a decimal number (range 001 to 366).
+ (glibc: determined from \fItm_yday\fP member of \fItm\fP\ structure)
 .TP
 .B %k
 The hour (24-hour clock) as a decimal number (range 0 to 23);
@@ -155,6 +174,7 @@ single digits are preceded by a blank.
 (See also
 .BR %H .)
 (TZ)
+ (glibc: determined from \fItm_hour\fP member of \fItm\fP\ structure)
 .TP
 .B %l
 The hour (12-hour clock) as a decimal number (range 1 to 12);
@@ -162,12 +182,15 @@ single digits are preceded by a blank.
 (See also
 .BR %I .)
 (TZ)
+ (glibc: determined from \fItm_hour\fP member of \fItm\fP\ structure)
 .TP
 .B %m
 The month as a decimal number (range 01 to 12).
+ (glibc: determined from \fItm_mon\fP member of \fItm\fP\ structure)
 .TP
 .B %M
 The minute as a decimal number (range 00 to 59).
+ (glibc: determined from \fItm_min\fP member of \fItm\fP\ structure)
 .TP
 .B %n
 A newline character. (SU)
@@ -179,12 +202,14 @@ Modifier: use alternative format, see below. (SU)
 Either "AM" or "PM" according to the given time value, or the
 corresponding strings for the current locale.
 Noon is treated as "PM" and midnight as "AM".
+ (glibc: determined from \fItm_hour\fP member of \fItm\fP\ structure)
 .TP
 .B %P
 Like
 .B %p
 but in lowercase: "am" or "pm" or a corresponding
 string for the current locale. (GNU)
+ (glibc: determined from \fItm_hour\fP member of \fItm\fP\ structure)
 .TP
 .B %r
 The time in a.m. or p.m. notation.
@@ -199,13 +224,19 @@ The time in 24-hour notation
 For a version including the seconds, see
 .B %T
 below.
+ (glibc: determined from \fItm_min\fP and \fItm_hour\fP members
+of \fItm\fP\ structure)
 .TP
 .B %s
 The number of seconds since the Epoch, 1970-01-01 00:00:00 +0000 (UTC)=
=2E (TZ)
+ (glibc: determined from \fItm_sec\fP, \fItm_min\fP, \fItm_hour\fP,
+\fItm_mday\fP, \fItm_mon\fP, \fItm_year\fP and \fItm_isdst\fP members
+of \fItm\fP\ structure)
 .TP
 .B %S
 The second as a decimal number (range 00 to 60).
 (The range is up to 60 to allow for occasional leap seconds.)
+ (glibc: determined from \fItm_sec\fP member of \fItm\fP\ structure)
 .TP
 .B %t
 A tab character. (SU)
@@ -214,12 +245,15 @@ A tab character. (SU)
 The time in 24-hour notation
 .RB ( %H:%M:%S ).
 (SU)
+ (glibc: determined from \fItm_sec\fP, \fItm_min\fP and \fItm_hour\fP =
members
+of \fItm\fP\ structure)
 .TP
 .B %u
 The day of the week as a decimal, range 1 to 7, Monday being 1.
 See also
 .BR %w .
 (SU)
+ (glibc: determined from \fItm_wday\fP member of \fItm\fP\ structure)
 .TP
 .B %U
 The week number of the current year as a decimal number,
@@ -229,6 +263,8 @@ See also
 .B %V
 and
 .BR %W .
+ (glibc: determined from \fItm_wday\fP and \fItm_yday\fP members
+of \fItm\fP\ structure)
 .TP
 .B %V
 The ISO\ 8601 week number (see NOTES) of the current year as a decimal=
 number,
@@ -239,15 +275,20 @@ See also
 and
 .BR %W .
 (SU)
+ (glibc: determined from \fItm_year\fP,\ \fItm_wday\fP and \fItm_yday\=
fP
+members of \fItm\fP\ structure)
 .TP
 .B %w
 The day of the week as a decimal, range 0 to 6, Sunday being 0.
 See also
 .BR %u .
+ (glibc: determined from \fItm_wday\fP member of \fItm\fP\ structure)
 .TP
 .B %W
 The week number of the current year as a decimal number,
 range 00 to 53, starting with the first Monday as the first day of wee=
k 01.
+ (glibc: determined from \fItm_wday\fP and \fItm_yday\fP members
+of \fItm\fP\ structure)
 .TP
 .B %x
 The preferred date representation for the current locale without the t=
ime.
@@ -257,9 +298,11 @@ The preferred time representation for the current =
locale without the date.
 .TP
 .B %y
 The year as a decimal number without a century (range 00 to 99).
+ (glibc: determined from \fItm_year\fP member of \fItm\fP\ structure)
 .TP
 .B %Y
 The year as a decimal number including the century.
+ (glibc: determined from \fItm_year\fP member of \fItm\fP\ structure)
 .TP
 .B %z
 The
@@ -267,9 +310,11 @@ The
 or
 .I -hhmm
 numeric timezone (that is, the hour and minute offset from UTC). (SU)
+ (glibc: determined from \fItm_isdst\fP member of \fItm\fP\ structure)
 .TP
 .B %Z
 The timezone name or abbreviation.
+ (glibc: determined from \fItm_isdst\fP member of \fItm\fP\ structure)
 .TP
 .B %+
 .\" Nov 05 -- Not in Linux/glibc, but is in some BSDs (according to
@@ -324,6 +369,16 @@ is defined in
 .IR <time.h> .
 See also
 .BR ctime (3).
+.BR mktime (3)
+can be used prior calling
+.BR strftime ()
+to calculate correct values for
+.IR tm_wday ,
+.I tm_yday
+and possibly
+.I tm_isdst
+members of
+.IR tm .
 .SH RETURN VALUE
 Provided that the result string,
 including the terminating null byte, does not exceed
--=20
2.4.3
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
