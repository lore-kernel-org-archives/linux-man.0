From: JWP <elseifthen-KK0ffGbhmjU@public.gmane.org>
Subject: [PATCH] tzset.3: correct file paths and TZ use
Date: Sat, 17 Jan 2015 19:34:54 -0500
Message-ID: <54BAFFAE.2020106@gmx.com>
References: <54BAFE98.2090402@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54BAFE98.2090402-KK0ffGbhmjU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Remove references to /usr/share/zoneinfo/{localtime,posixrules}
as they are not used.

Add information on invalid TZ values.
Add information on a TZ filespec that omits the colon.
Add information on system timezone configuration.
Add an ENVIRONMENT section.
Update the FILES section.

Signed-off-by: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
---

The following changes since commit dc70d1eaef1643ae48a9b67fcde0cd0b59bf1f20:

  ld.so.8: tfix (2015-01-16 15:07:43 +0100)

are available in the git repository at:

  git-9UaJU3cA/F/QT0dZR+AlfA@public.gmane.org:jwpi/man-pages.git tzset

for you to fetch changes up to 13f95862d88f041ce652ff846b2706c3d1fccf6a:

  tzset.3: correct file paths and TZ use (2015-01-17 16:51:42 -0500)


 man3/tzset.3 | 81 +++++++++++++++++++++++++++---------------------------------
 1 file changed, 37 insertions(+), 44 deletions(-)

diff --git a/man3/tzset.3 b/man3/tzset.3
index c1c98e1..1058d2c 100644
--- a/man3/tzset.3
+++ b/man3/tzset.3
@@ -30,7 +30,7 @@
 .\" Modified 2001-11-13, aeb
 .\" Modified 2004-12-01 mtk and Martin Schulze <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org>
 .\"
-.TH TZSET 3  2014-08-19 "" "Linux Programmer's Manual"
+.TH TZSET 3  2015-01-16 "" "Linux Programmer's Manual"
 .SH NAME
 tzset, tzname, timezone, daylight \- initialize time conversion information
 .SH SYNOPSIS
@@ -75,15 +75,14 @@ the year when daylight saving time applies).
 .PP
 If the
 .B TZ
-variable does not appear in the environment, the \fItzname\fP
-variable is initialized with the best approximation of local wall clock
-time, as specified by the
-.BR tzfile (5)-format
-file \fIlocaltime\fP
-found in the system timezone directory (see below).
-(One also often sees
-.I /etc/localtime
-used here, a symlink to the right file in the system timezone directory.)
+variable does not appear in the environment, the system timezone is used.
+The system timezone is configured by copying, or linking, a file in the
+.BR tzfile "(5) format to"
+.IR /etc/localtime .
+A timezone database of these files may be located in the system
+timezone directory (see the \fBFILES\fP section below).
+
+
 .PP
 If the
 .B TZ
@@ -118,7 +117,7 @@ The second format is used when there is daylight saving time:
 .I std offset dst [offset],start[/time],end[/time]
 .RE
 .sp
-There are no spaces in the specification.
+There are no spaces in either specification.
 The initial \fIstd\fP and
 \fIoffset\fP specify the standard timezone, as described above.
 The \fIdst\fP string and \fIoffset\fP specify the name and offset for the
@@ -170,47 +169,41 @@ from a file:
 :[filespec]
 .RE
 .sp
-If the file specification \fIfilespec\fP is omitted, the timezone
-information is read from the file
-.I localtime
-in the system timezone directory, which nowadays usually is
-.IR /usr/share/zoneinfo .
-This file is in
+If the file specification \fIfilespec\fP is omitted, or its value cannot
+be interpreted, Coordinated Universal Time (UTC) is used.  A correct
+\%\fIfilespec\fP will be a path pointing to a file in the
 .BR tzfile (5)
-format.
-If \fIfilespec\fP is given, it specifies another
-.BR tzfile (5)-format
-file to read the timezone information from.
-If \fIfilespec\fP does not begin with a \(aq/\(aq, the file specification is
-relative to the system timezone directory.
+format. A timezone database of these files may be located in the system
+timezone directory (see the \fBFILES\fP section below).  If
+\fIfilespec\fP does not begin with a \(aq/\(aq, the file specification
+is relative to the system timezone directory. If the colon is omitted
+each of the above three \fBTZ\fP formats will be tried in order.
 .PP
 Here's an example, once more for New Zealand:
 .nf
 
     TZ=":Pacific/Auckland"
 .fi
+.SH ENVIRONMENT
+.TP
+.B TZ
+.RB If \ TZ
+is set, its value takes precedence over the system configured timezone.
+.TP
+.B TZDIR
+.RB If \ TZDIR
+is set, its value takes precedence over the system configured timezone
+database directory path.
 .SH FILES
-Under glibc,
-the system timezone directory is determined using the
-.BR TZDIR
-the environment variable.
-If
-.BR TZDIR
-is not set, the default depends on the system setup, but is normally
-.IR /usr/share/zoneinfo .
-.LP
-This timezone directory contains the files
