From: Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>
Subject: [PATCH] clone.2: Document that clone silently ignores CLONE_PID and
 CLONE_STOPPED
Date: Thu, 26 Feb 2015 16:41:20 -0800
Message-ID: <20150227004118.GA15530@jtriplet-mobl1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Normally, system calls return EINVAL for flags they don't support.
Explicitly document that clone does *not* produce an error for these two
obsolete flags.

Signed-off-by: Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>
---
 man2/clone.2 | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/man2/clone.2 b/man2/clone.2
index 91c3684..10cef7d 100644
--- a/man2/clone.2
+++ b/man2/clone.2
@@ -534,7 +534,8 @@ This is good for hacking the system, but otherwise
 of not much use.
 Since 2.3.21 this flag can be
 specified only by the system boot process (PID 0).
-It disappeared in Linux 2.5.16.
+It disappeared in Linux 2.5.16.  Since then, the kernel silently ignores it
+without error.
 .TP
 .BR CLONE_PTRACE " (since Linux 2.2)"
 If
@@ -599,7 +600,8 @@ This flag was
 from Linux 2.6.25 onward,
 and was
 .I removed
-altogether in Linux 2.6.38.
+altogether in Linux 2.6.38.  Since then, the kernel silently ignores it without
+error.
 .\" glibc 2.8 removed this defn from bits/sched.h
 .TP
 .BR CLONE_SYSVSEM " (since Linux 2.5.10)"
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
