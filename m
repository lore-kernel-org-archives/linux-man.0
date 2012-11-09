From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] time.7: tfix
Date: Thu,  8 Nov 2012 22:24:52 -0400
Message-ID: <1352427892-13987-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/time.7 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/time.7 b/man7/time.7
index 5d8fedc..03a00ea 100644
--- a/man7/time.7
+++ b/man7/time.7
@@ -177,7 +177,7 @@ value for a thread.
 The timer slack is the length of time by
 which the kernel may delay the wake-up of certain
 system calls that block with a timeout.
-Permitting this delay allows the kernel to coallesce wake-up events,
+Permitting this delay allows the kernel to coalesce wake-up events,
 thus possibly reducing the number of system wake-ups and saving power.
 For more details, see the description of
 .B PR_SET_TIMERSLACK
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
