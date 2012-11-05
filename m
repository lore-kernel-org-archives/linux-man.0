From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ipc.2: wfix
Date: Mon,  5 Nov 2012 12:36:24 -0400
Message-ID: <1352133384-10588-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/ipc.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/ipc.2 b/man2/ipc.2
index 30ba658..0f471b7 100644
--- a/man2/ipc.2
+++ b/man2/ipc.2
@@ -48,7 +48,7 @@ Only standard library implementors and kernel hackers need to know about
 is Linux-specific, and should not be used in programs
 intended to be portable.
 .SH NOTES
-On a some architectures\(emfor example x86-46 and ARM\(emthere is no
+On some architectures\(emfor example x86-46 and ARM\(emthere is no
 .BR ipc ()
 system call; instead
 .BR msgctl (2),
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
