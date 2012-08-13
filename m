From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 4/5] strcpy.3: tfix
Date: Sun, 12 Aug 2012 21:34:27 -0400
Message-ID: <1344821668-11324-5-git-send-email-taffit@debian.org>
References: <1344821668-11324-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1344821668-11324-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/strcpy.3 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/strcpy.3 b/man3/strcpy.3
index 0a222dd..0664335 100644
--- a/man3/strcpy.3
+++ b/man3/strcpy.3
@@ -116,7 +116,7 @@ One valid (and intended) use of
 is to copy a C string to a fixed-length buffer
 while ensuring both that the buffer is not overflowed
 and that unused bytes in the target buffer are zeroed out
-(perhaps to prevent information leaks if the buffer is to
+(perhaps to prevent information leaks if the buffer is to be
 written to media or transmitted to another process via an
 interprocess communication technique).
 
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
