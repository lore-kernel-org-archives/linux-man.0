From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] perror(3): add missing period
Date: Wed, 27 Sep 2017 20:12:59 -0400
Message-ID: <20170928001259.8678-1-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

From: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Signed-off-by: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 man3/perror.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/perror.3 b/man3/perror.3
index e0ee3d1751c9..bbdac61a5d6c 100644
--- a/man3/perror.3
+++ b/man3/perror.3
@@ -89,7 +89,7 @@ The use of
 .IR sys_errlist "[]"
 is nowadays deprecated; use
 .BR strerror (3)
-instead
+instead.
 .PP
 When a system call fails, it usually returns \-1 and sets the
 variable
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
