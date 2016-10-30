From: "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] readlink.2: tfix
Date: Sun, 30 Oct 2016 16:58:25 +0100
Message-ID: <1477843105-11701-1-git-send-email-toddy@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man2/readlink.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/readlink.2 b/man2/readlink.2
index 936b494..aa8d33b 100644
--- a/man2/readlink.2
+++ b/man2/readlink.2
@@ -155,7 +155,7 @@ for an explanation of the need for
 On success, these calls return the number of bytes placed in
 .IR buf .
 (If the returned value equals
-.IR busiz ,
+.IR bufsiz ,
 then truncation may have occurred.)
 On error, \-1 is returned and
 .I errno
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
