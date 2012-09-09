From: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Subject: [PATCH] stat.2: tfix
Date: Sun,  9 Sep 2012 23:46:36 +0200
Message-ID: <1347227196-9772-1-git-send-email-guillem@hadrons.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
---
 man2/stat.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/stat.2 b/man2/stat.2
index 791bfb8..0b82e1d 100644
--- a/man2/stat.2
+++ b/man2/stat.2
@@ -413,7 +413,7 @@ the macros
 etc.
 The
 .BR S_IF*
-constants are present in POSIX.1-2011 and later.
+constants are present in POSIX.1-2001 and later.
 
 The
 .BR S_ISLNK ()
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
