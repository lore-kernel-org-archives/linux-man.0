From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 2/3] readdir_r.3: tfix
Date: Sun, 13 Mar 2016 19:00:58 +0100
Message-ID: <1457892059-7685-2-git-send-email-jwilk@jwilk.net>
References: <1457892059-7685-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457892059-7685-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man3/readdir_r.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/readdir_r.3 b/man3/readdir_r.3
index 478ee79..bc2fb22 100644
--- a/man3/readdir_r.3
+++ b/man3/readdir_r.3
@@ -138,7 +138,7 @@ returns 0, and returns NULL in
 .B EBADF
 Invalid directory stream descriptor \fIdirp\fP.
 .TP
-.B ENAMETOOLOMG
+.B ENAMETOOLONG
 A directory entry whose name was too long to be read was encountered.
 .SH ATTRIBUTES
 For an explanation of the terms used in this section, see
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
