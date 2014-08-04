From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] readv.2: tfix
Date: Mon,  4 Aug 2014 23:11:29 +0200
Message-ID: <1407186689-24626-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/readv.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/readv.2 b/man2/readv.2
index 6cd4486..c19b729 100644
--- a/man2/readv.2
+++ b/man2/readv.2
@@ -240,7 +240,7 @@ However, the glibc wrapper functions do some extra work if
 they detect that the underlying kernel system call failed because this
 limit was exceeded.
 In the case of
-.BR readv ().
+.BR readv (),
 the wrapper function allocates a temporary buffer large enough
 for all of the items specified by
 .IR iov ,
-- 
2.0.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
