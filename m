From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] lseek64.3: tfix
Date: Sat,  4 Oct 2014 12:37:58 +0400
Message-ID: <1412411878-5744-1-git-send-email-yuray@komyakino.ru>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/lseek64.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/lseek64.3 b/man3/lseek64.3
index 9e9c0c1..f02b573 100644
--- a/man3/lseek64.3
+++ b/man3/lseek64.3
@@ -126,7 +126,7 @@ is a 64-bit signed type.
 The library routine
 .BR llseek ()
 .\" in libc 5.0.9, not in 4.7.6
-is available and glibc and works without special defines.
+is available in the glibc and works without special defines.
 However, the glibc headers do not provide a prototype.
 Users should add
 the above prototype, or something equivalent, to their own source.
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
