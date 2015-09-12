From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] user_namespaces.7: drop spurious period
Date: Sat, 12 Sep 2015 14:03:00 -0400
Message-ID: <1442080980-18130-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man7/user_namespaces.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/user_namespaces.7 b/man7/user_namespaces.7
index 9e6ef49..56a73ec 100644
--- a/man7/user_namespaces.7
+++ b/man7/user_namespaces.7
@@ -700,7 +700,7 @@ in the user namespace),
 it is no longer possible to disallow
 .BR setgroups (2)
 by writing
-.RI \(dq deny \(dq.
+.RI \(dq deny \(dq
 to
 .IR /proc/[pid]/setgroups
 (the write fails with the error
-- 
2.5.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
