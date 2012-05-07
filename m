From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] clock_getres.2: tfix
Date: Mon,  7 May 2012 15:34:56 -0400
Message-ID: <1336419296-4823-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Introduced in 63f0f3d and 22594a3.
---
 man2/clock_getres.2 |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/man2/clock_getres.2 b/man2/clock_getres.2
index 40c44a2..a1e27ad 100644
--- a/man2/clock_getres.2
+++ b/man2/clock_getres.2
@@ -127,7 +127,7 @@ Setting this clock requires appropriate privileges.
 This clock is affected by discontinuous jumps in the system time
 (e.g., if the system administrator manually changes the clock),
 and by the incremental adjustments performed by
-.BR adjtime (2)
+.BR adjtime (3)
 and NTP.
 .TP
 .B CLOCK_MONOTONIC
@@ -136,7 +136,7 @@ some unspecified starting point.
 This clock is not affected by discontinuous jumps in the system time
 (e.g., if the system administrator manually changes the clock),
 but is affected by the incremental adjustments performed by
-.BR adjtime (2)
+.BR adjtime (3)
 and NTP.
 .TP
 .BR CLOCK_MONOTONIC_RAW " (since Linux 2.6.28; Linux-specific)"
@@ -146,7 +146,7 @@ Similar to
 but provides access to a raw hardware-based time
 that is not subject to NTP adjustments or
 the incremental adjustments performed by
-.BR adjtime (2).
+.BR adjtime (3).
 .TP
 .B CLOCK_PROCESS_CPUTIME_ID
 High-resolution per-process timer from the CPU.
@@ -239,7 +239,7 @@ On Linux, these clocks are not settable
 .\" See http://bugzilla.kernel.org/show_bug.cgi?id=11972
 .SH "SEE ALSO"
 .BR date (1),
-.BR adjtime (2),
+.BR adjtime (3),
 .BR gettimeofday (2),
 .BR settimeofday (2),
 .BR time (2),
-- 
1.7.10

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
