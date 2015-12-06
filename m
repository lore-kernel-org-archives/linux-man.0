From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 07/19] clog.3: tfix
Date: Sun,  6 Dec 2015 19:47:20 +0100
Message-ID: <1449427652-3585-7-git-send-email-jwilk@jwilk.net>
References: <1449427652-3585-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449427652-3585-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man3/clog.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/clog.3 b/man3/clog.3
index b31c532..5de60ab 100644
--- a/man3/clog.3
+++ b/man3/clog.3
@@ -18,7 +18,7 @@ clog, clogf, clogl \- natural logarithm of a complex number
 .sp
 Link with \fI\-lm\fP.
 .SH DESCRIPTION
-These functions calcualte the complex natural logarithm of
+These functions calculate the complex natural logarithm of
 .IR z ,
 with a branch cut along the negative real axis.
 
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
