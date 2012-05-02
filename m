From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] memchr.3: tfix
Date: Tue,  1 May 2012 22:50:51 -0400
Message-ID: <1335927051-17321-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/memchr.3 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/memchr.3 b/man3/memchr.3
index 246815d..82fd5b4 100644
--- a/man3/memchr.3
+++ b/man3/memchr.3
@@ -88,7 +88,7 @@ lies somewhere in the memory area starting at the location pointed to by
 .IR s ,
 and so performs an optimized search for
 .IR c
-(i.e., no use of a count argument argument to limit the range of the search).
+(i.e., no use of a count argument to limit the range of the search).
 If an instance of
 .I c
 is not found, the results are unpredictable.
-- 
1.7.10

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
