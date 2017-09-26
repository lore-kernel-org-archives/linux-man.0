From: mihir-NZpS4cJIG2HvQtjrzfazuQ@public.gmane.org
Subject: [PATCH] ld.so.8: wfix
Date: Tue, 26 Sep 2017 06:23:59 -0500
Message-ID: <1506425039-14243-1-git-send-email-mihir@cs.utexas.edu>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mihir Mehta <mihir-NZpS4cJIG2HvQtjrzfazuQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

From: Mihir Mehta <mihir-NZpS4cJIG2HvQtjrzfazuQ@public.gmane.org>

Someone omitted a word in ld.so.8; this patch fixes that.
---
 man8/ld.so.8 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man8/ld.so.8 b/man8/ld.so.8
index 97faf87..952401e 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -39,7 +39,7 @@ handles a.out binaries, a format used long ago;
 handles ELF,
 which everybody has been using for years now.
 Otherwise, both have the same behavior, and use the same
-support files and programs
+support files and programs as
 .BR ldd (1),
 .BR ldconfig (8),
 and
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
