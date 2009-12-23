From: "Smith, GeoffX" <geoffx.smith-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] prctl: Add timerslack options to man pages
Date: Tue, 22 Dec 2009 18:06:14 -0800
Message-ID: <354B2877CF17F44BB3FA44EB4DB0E5470C91CE1843@orsmsx510.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This patch adds text to describe the PR_SET/GET_TIMERSLACK options.

Signed-off-by: Geoff Smith <geoffx.smith-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>


diff --git a/man2/prctl.2 b/man2/prctl.2
index 26d5e7e..798179b 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -262,6 +262,19 @@ the "securebits" flags of the calling thread.
 See
 .BR capabilities (7).
 .TP
+.BR PR_SET_TIMERSLACK " (since Linux 2.6.32)"
+Set the minimum permitted delay beyond the nominal value of
+a timer timer expiration, i.e., explicitly allow the system to delay
+extra time before returning from a timed-out operation such as
+sleep(), select(), or poll().  The intent is to reduce the
+overhead of timer operations and system wakeups for machines
+that have a low-power sleep mode.  The value is specified
+in arg2, in nanoseconds.
+.TP
+.BR PR_GET_TIMERSLACK " (since Linux 2.6.32)"
+Return the timer slack value in the location pointed to by
+(unsigned long *) arg2.
+.TP
 .BR PR_SET_TIMING " (since Linux 2.6.0-test4)"
 Set whether to use (normal, traditional) statistical process timing or
 accurate timestamp based process timing, by passing
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
