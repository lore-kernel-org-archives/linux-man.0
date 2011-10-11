From: Clemens Ladisch <clemens-P6GI/4k7KOmELgA04lAiVw@public.gmane.org>
Subject: [PATCH] sched_rr_get_interval.2: update Linux notes
Date: Tue, 11 Oct 2011 13:40:20 +0200
Message-ID: <4E942B24.2080608@ladisch.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Clemens Ladisch <clemens-P6GI/4k7KOmELgA04lAiVw@public.gmane.org>

--- a/man2/sched_rr_get_interval.2
+++ b/man2/sched_rr_get_interval.2
@@ -98,18 +98,24 @@
 .\" for SCHED_RR processes.  For RR processes the timeslice is always
 .\" DEF_TIMESLICE, or 0.1 secs.
 .\" Was the following really true for older kernels?
-.\" Must build a 2.6.8 kernel and retest, and rewrite the following text
-.\" appropriately.
+.\" It is again true for at least Linux 2.6.12, but stopped in 2.6.24.
 POSIX does not specify any mechanism for controlling the size of the
 round-robin time quantum.
 However, Linux provides a (nonportable) method of doing this.
-The quantum can be controlled by adjusting the process's nice value (see
+The quantum of both
+.B SCHED_RR
+and
+.B SCHED_OTHER
+processes can be controlled by adjusting the process's nice value (see
 .BR setpriority (2)).
 Assigning a negative (i.e., high) nice value results in a longer quantum;
 assigning a positive (i.e., low) nice value results in a shorter quantum.
 The default quantum is 0.1 seconds;
 the degree to which changing the nice value affects the
 quantum has varied somewhat across kernel versions.
+Since Linux 2.6.24, the
+.B SCHED_RR
+quantum cannot be modified.
 .\" .SH BUGS
 .\" As of Linux 1.3.81
 .\" .BR sched_rr_get_interval ()
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
