From: Andy Isaacson <adi-psgPW5cihnJWk0Htik3J/w@public.gmane.org>
Subject: [patch] document CLOCK_MONOTONIC_COARSE
Date: Thu, 31 May 2012 16:59:55 -0700
Message-ID: <20120531235955.GA18876@cloudera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Let's try that again without using gmail.

-andy

commit 782f8fd7a4ecd601d46e13e6a55a04662bae2f27
Author: Andy Isaacson <adi-psgPW5cihnJWk0Htik3J/w@public.gmane.org>
Date:   Thu May 31 16:36:30 2012 -0700

    clock_getres.2: document CLOCK_MONOTONIC_COARSE

diff --git a/man2/clock_getres.2 b/man2/clock_getres.2
index 67713c7..01289d6 100644
--- a/man2/clock_getres.2
+++ b/man2/clock_getres.2
@@ -136,6 +136,13 @@ Similar to
 but provides access to a raw hardware-based time
 that is not subject to NTP adjustments.
 .TP
+.BR CLOCK_MONOTONIC_COARSE " (since Linux 2.6.32; Linux-specific)"
+.\" Added in commit da15cfdae03351c689736f8d142618592e3cebc3, John Stultz, Aug 19 2009
+Similar to
+.BR CLOCK_MONOTONIC ,
+but provides only the time at the most recent clock tick.  This can be
+faster to access.
+.TP
 .B CLOCK_PROCESS_CPUTIME_ID
 High-resolution per-process timer from the CPU.
 .TP
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
