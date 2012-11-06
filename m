From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] delete_module.2: tfix
Date: Tue,  6 Nov 2012 10:15:37 -0400
Message-ID: <1352211337-13580-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/delete_module.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/delete_module.2 b/man2/delete_module.2
index bab3f66..3e16694 100644
--- a/man2/delete_module.2
+++ b/man2/delete_module.2
@@ -176,7 +176,7 @@ is Linux-specific.
 Glibc does not provide a wrapper for this system call; call it using
 .BR syscall (2).
 
-The unininterruptible sleep that may occur if
+The uninterruptible sleep that may occur if
 .BR O_NONBLOCK
 is omitted from
 .IR flags
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
