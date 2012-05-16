From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] open.2: ffix
Date: Tue, 15 May 2012 20:10:27 -0400
Message-ID: <1337127028-4505-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/open.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/open.2 b/man2/open.2
index 7fe6602..5ea16f6 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -799,7 +799,7 @@ flag.
 Nor does this restriction apply when the memory buffer has been advised as
 .B MADV_DONTFORK
 with
-.BR madvise(2),
+.BR madvise (2),
 ensuring that it will not be available
 to the child after
 .BR fork (2).
-- 
1.7.10

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
