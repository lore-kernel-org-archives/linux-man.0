From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] quotactl(2): rename RETURN VALUE section
Date: Tue,  2 Apr 2013 17:57:34 -0400
Message-ID: <1364939854-12086-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Everywhere else we use the singular form.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man2/quotactl.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/quotactl.2 b/man2/quotactl.2
index b112f02..74578c6 100644
--- a/man2/quotactl.2
+++ b/man2/quotactl.2
@@ -416,7 +416,7 @@ for XFS since
 .BR sync (1)
 writes quota information to disk (in addition to the other file system
 metadata that it writes out).
-.SH RETURN VALUES
+.SH RETURN VALUE
 .LP
 On success,
 .BR quotactl ()
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
