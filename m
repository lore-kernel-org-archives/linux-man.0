From: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/9] stime.2, strftime.3, tzset.3, zic.8: GMT -> UTC (where appropriate)
Date: Thu,  3 Dec 2009 16:39:51 -0600
Message-ID: <1259879998-1140-2-git-send-email-mfwitten@gmail.com>
References: <1259879998-1140-1-git-send-email-mfwitten@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1259879998-1140-1-git-send-email-mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/stime.2    |    2 +-
 man3/strftime.3 |    2 +-
 man3/tzset.3    |    4 ++--
 man8/zic.8      |    8 ++++----
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/man2/stime.2 b/man2/stime.2
index 07fef5e..530d223 100644
--- a/man2/stime.2
+++ b/man2/stime.2
@@ -46,7 +46,7 @@ _SVID_SOURCE
 .BR stime ()
 sets the system's idea of the time and date.
 Time, pointed
-to by \fIt\fP, is measured in seconds from 00:00:00 GMT January 1, 1970.
+to by \fIt\fP, is measured in seconds from 00:00:00 UTC January 1, 1970.
 .BR stime ()
 may only be executed by the superuser.
 .SH "RETURN VALUE"
diff --git a/man3/strftime.3 b/man3/strftime.3
index 8dfe58c..e356ccb 100644
--- a/man3/strftime.3
+++ b/man3/strftime.3
@@ -242,7 +242,7 @@ The year as a decimal number without a century (range 00 to 99).
 The year as a decimal number including the century.
 .TP
 .B %z
-The time-zone as hour offset from GMT.
+The time-zone as hour offset from UTC.
 Required to emit RFC\ 822-conformant dates
 (using "%a,\ %d\ %b\ %Y\ %H:%M:%S\ %z"). (GNU)
 .TP
diff --git a/man3/tzset.3 b/man3/tzset.3
index ad496f7..1d74405 100644
--- a/man3/tzset.3
+++ b/man3/tzset.3
@@ -67,7 +67,7 @@ environment variable.
 This function is automatically called by the
 other time conversion functions that depend on the timezone.
 In a System-V-like environment, it will also set the variables \fItimezone\fP
-(to seconds West of GMT) and \fIdaylight\fP (to 0 if this timezone does not
+(to seconds West of UTC) and \fIdaylight\fP (to 0 if this timezone does not
 have any daylight saving time rules, or to non-zero if there is a time during
 the year when daylight saving time applies).
 .PP
@@ -223,7 +223,7 @@ It has been obsolete for many years but is required by SUSv2.
 .BI "char *timezone(" zone ", " dst )
 that returned the
 name of the timezone corresponding to its first argument (minutes
-West of GMT).
+West of UTC).
 If the second argument was 0, the standard name was used,
 otherwise the daylight saving time version.
 .SH "SEE ALSO"
diff --git a/man8/zic.8 b/man8/zic.8
index 949fb62..8cb63bb 100644
--- a/man8/zic.8
+++ b/man8/zic.8
@@ -260,8 +260,8 @@ A zone line has the form
 .sp
 .nf
 .ti +.5i
-.ta \w'Zone\0\0'u +\w'Australia/Adelaide\0\0'u +\w'GMTOFF\0\0'u +\w'RULES/SAVE\0\0'u +\w'FORMAT\0\0'u
-Zone	NAME	GMTOFF	RULES/SAVE	FORMAT	[UNTIL]
+.ta \w'Zone\0\0'u +\w'Australia/Adelaide\0\0'u +\w'UTC_OFFSET\0\0'u +\w'RULES/SAVE\0\0'u +\w'FORMAT\0\0'u
+Zone	NAME	UTC_OFFSET	RULES/SAVE	FORMAT	[UNTIL]
 .sp
 For example:
 .sp
@@ -270,13 +270,13 @@ Zone	Australia/Adelaide	9:30	Aus	CST	1971 Oct 31 2:00
 .sp
 .fi
 The fields that make up a zone line are:
-.TP "\w'GMTOFF'u"
+.TP "\w'UTC_OFFSET'u"
 .B NAME
 The name of the timezone.
 This is the name used in creating the time conversion information file for the
 zone.
 .TP
-.B GMTOFF
+.B UTC_OFFSET
 The amount of time to add to UTC to get standard time in this zone.
 This field has the same format as the
 .B AT
-- 
1.6.5.2.180.gc5b3e

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
