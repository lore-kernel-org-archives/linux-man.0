From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] tzset.3: Clarify "daylight" and remove erroneous note.
Date: Thu, 10 Dec 2015 17:05:02 -0500
Message-ID: <5669F70E.9000904@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

When tzset is run the value of daylight is computed
by looking at all available rules for the application
of daylight savings. This includes reading the tzdata
files to determine if there is a transition or not for
the current timezone. It also includes parsing TZ env
to see if it specifies custom rules which are used in
precedence to any tzdata rules. Therefore daylight is
going to be set if there is a daylight saving rule past,
present, or future that indicates a transition. We clarify
that in the man page.

Lastly, the note about tz_dsttime is not correct and is
removed. The earlier paragraph about daylight makes it
clear that it doesn't mean "daylight saving rule applies
now", and the interaction with tz_dsttime is not correct
for glibc on Linux (as outlined in my gettimeofday.3 patch
sent here: http://marc.info/?l=linux-man&m=144977768703615&w=2).

Signed-off-by: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
Cheers,
Carlos.

diff --git a/man3/tzset.3 b/man3/tzset.3
index 545bd9c..4786dd9 100644
--- a/man3/tzset.3
+++ b/man3/tzset.3
@@ -70,8 +70,8 @@ This function is automatically called by the
 other time conversion functions that depend on the timezone.
 In a System-V-like environment, it will also set the variables \fItimezone\fP
 (seconds West of UTC) and \fIdaylight\fP (to 0 if this timezone does not
-have any daylight saving time rules, or to nonzero if there is a time during
-the year when daylight saving time applies).
+have any daylight saving time rules, or to nonzero if there is a time,
+past, present or future when daylight saving time applies).
 .PP
 If the
 .B TZ
@@ -223,12 +223,6 @@ T}	Thread safety	MT-Safe env locale
 .SH CONFORMING TO
 POSIX.1-2001, POSIX.1-2008, SVr4, 4.3BSD.
 .SH NOTES
-Note that the variable \fIdaylight\fP does not indicate that daylight
-saving time applies right now.
-It used to give the number of some
-algorithm (see the variable \fItz_dsttime\fP in
-.BR gettimeofday (2)).
-It has been obsolete for many years but is required by SUSv2.
 .LP
 4.3BSD had a function
 .BI "char *timezone(" zone ", " dst )
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
