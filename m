From: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] prctl.2: document SECCOMP_MODE_FILTER vs EFAULT
Date: Wed, 16 Jul 2014 14:41:39 -0700
Message-ID: <20140716214139.GA4421@www.outflux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This notes the distinction made between EINVAL and EFAULT when attempting
to use SECCOMP_MODE_FILTER with PR_SET_SECCOMP.

Suggested-by: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Signed-off-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 man2/prctl.2 |   23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/man2/prctl.2 b/man2/prctl.2
index 1199891..b7ddaac 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -825,6 +825,19 @@ is set appropriately.
 .I arg2
 is an invalid address.
 .TP
+.B EFAULT
+.I option
+is
+.BR PR_SET_SECCOMP ,
+.I arg2
+is
+.BR SECCOMP_MODE_FILTER ,
+the system was built with
+.BR CONFIG_SECCOMP_FILTER
+and
+.I arg3
+is an invalid address.
+.TP
 .B EINVAL
 The value of
 .I option
@@ -859,6 +872,16 @@ and the kernel was not configured with
 .B EINVAL
 .I option
 is
+.BR PR_SET_SECCOMP ,
+.I arg2
+is
+.BR SECCOMP_MODE_FILTER ,
+and the kernel was not configured with
+.BR CONFIG_SECCOMP_FILTER .
+.TP
+.B EINVAL
+.I option
+is
 .BR PR_SET_MM ,
 and one of the following is true
 .RS
-- 
1.7.9.5


-- 
Kees Cook
Chrome OS Security
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
