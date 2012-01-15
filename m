From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] sigprocmask(2): add EFAULT as a possible errno value
Date: Sat, 14 Jan 2012 19:43:43 -0500
Message-ID: <1326588223-8739-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This func takes pointers, and invalid ones will result in EFAULT.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man2/sigprocmask.2 |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/man2/sigprocmask.2 b/man2/sigprocmask.2
index bd4065d..14222b6 100644
--- a/man2/sigprocmask.2
+++ b/man2/sigprocmask.2
@@ -92,6 +92,14 @@ is unspecified in a multithreaded process; see
 .BR sigprocmask ()
 returns 0 on success and \-1 on error.
 .SH ERRORS
+.TP
+.B EFAULT
+The specified
+.I set
+or
+.I oldset
+pointed outside the process's allocated address space.
+.TP
 .B EINVAL
 The value specified in
 .I how
-- 
1.7.8.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
