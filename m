From: Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] prctl.2: EINAL when no CONFIG_SECCOMP_FILTER, also excess "TP" typo
Date: Wed,  6 Feb 2013 11:16:09 -0800
Message-ID: <1360178170-9381-1-git-send-email-shawnlandden@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/prctl.2 |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/man2/prctl.2 b/man2/prctl.2
index fd78f48..e9ad0a5 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -803,6 +803,16 @@ and the kernel was not configured with
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
@@ -850,7 +860,6 @@ is not 0,
 .BR PR_SET_PTRACER_ANY ,
 or the PID of an existing process.
 .TP
-TP
 .B EPERM
 .I option
 is
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
