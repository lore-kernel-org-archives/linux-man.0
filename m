From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 2/2] mq_close.3: tfix
Date: Thu, 14 Jan 2016 21:28:38 +0100
Message-ID: <1452803318-7860-2-git-send-email-jwilk@jwilk.net>
References: <1452803318-7860-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452803318-7860-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man3/mq_close.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/mq_close.3 b/man3/mq_close.3
index 6846a00..8457bbb 100644
--- a/man3/mq_close.3
+++ b/man3/mq_close.3
@@ -53,7 +53,7 @@ set to indicate the error.
 .SH ERRORS
 .TP
 .B EBADF
-The message quueue descriptor specified in
+The message queue descriptor specified in
 .I mqdes
 is invalid.
 .SH ATTRIBUTES
-- 
2.7.0.rc3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
