From: chrubis-AlSwsSmVLrQ@public.gmane.org
Subject: [PATCH] clock_getres.2: Add linux specific clock ids
Date: Wed, 20 Feb 2013 18:01:23 +0100
Message-ID: <20130220170123.GA4969@rei>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="3V7upXqbjpZ4EhLz"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jiri Bohac <jbohac-AlSwsSmVLrQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!
Attached patch adds following clock ids:

CLOCK_REALTIME_COARSE
CLOCK_MONOTONIC_COARSE
CLOCK_BOOTTIME

-- 
Cyril Hrubis
chrubis-AlSwsSmVLrQ@public.gmane.org

--3V7upXqbjpZ4EhLz
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-clock_getres.2-Add-linux-specific-clocks.patch"

>From 2cf31b0e19c15f093e060ef1b5f2f9ca0f42888d Mon Sep 17 00:00:00 2001
From: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Date: Wed, 20 Feb 2013 17:52:52 +0100
Subject: [PATCH] clock_getres.2: Add linux specific clocks.

Add following linux specific clocks:

CLOCK_REALTIME_COARSE
CLOCK_MONOTONIC_COARSE
CLOCK_BOOTTIME

Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
---
 man2/clock_getres.2 |   21 +++++++++++++++++++--
 1 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/man2/clock_getres.2 b/man2/clock_getres.2
index 794dd65..d82e883 100644
--- a/man2/clock_getres.2
+++ b/man2/clock_getres.2
@@ -27,8 +27,6 @@
 .\" 2003-08-24 aeb, large parts rewritten
 .\" 2004-08-06 Christoph Lameter <clameter-sJ/iWh9BUns@public.gmane.org>, SMP note
 .\"
-.\" FIXME: Linux 2.6.39 adds CLOCK_BOOTTIME
-.\"
 .TH CLOCK_GETRES 2 2012-11-07 "" "Linux Programmer's Manual"
 .SH NAME
 clock_getres, clock_gettime, clock_settime \- clock and time functions
@@ -130,6 +128,12 @@ and by the incremental adjustments performed by
 .BR adjtime (3)
 and NTP.
 .TP
+.BR CLOCK_REALTIME_COARSE " (since Linux 2.6.32; Linux-specific)"
+.\" Added in commit da15cfdae03351c689736f8d142618592e3cebc3
+Faster but less precise version of
+.BR CLOCK_REALTIME.
+Use when you need very fast, but not fine-grained timestamps.
+.TP
 .B CLOCK_MONOTONIC
 Clock that cannot be set and represents monotonic time since
 some unspecified starting point.
@@ -148,6 +152,19 @@ that is not subject to NTP adjustments or
 the incremental adjustments performed by
 .BR adjtime (3).
 .TP
+.BR CLOCK_MONOTONIC_COARSE " (since Linux 2.6.32; Linux-specific)"
+.\" Added in commit da15cfdae03351c689736f8d142618592e3cebc3
+Faster but less precise version of
+.BR CLOCK_MONOTONIC.
+Use when you need very fast, but not fine-grained timestamps.
+.TP
+.BR CLOCK_BOOTTIME " (since Linux 2.6.39; Linux-specific)"
+.\" Added in commit 7fdd7f89006dd5a4c702fa0ce0c272345fa44ae0
+Identical to
+.BR CLOCK_MONOTONIC ,
+except it also includes any time spent in suspend. This allows applications to
+get a suspend aware monotonic clock.
+.TP
 .B CLOCK_PROCESS_CPUTIME_ID
 High-resolution per-process timer from the CPU.
 .TP
-- 
1.7.8.6


--3V7upXqbjpZ4EhLz--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
