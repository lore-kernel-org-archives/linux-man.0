From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] idle.2: wfix
Date: Mon, 28 Jan 2013 00:31:13 +0100
Message-ID: <1359329473-686-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Typo introduced by 1330fa295944be7f86f41c5af9cdbb1173418a16
    idle.2: Minor wording fixes
---
 man2/idle.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/idle.2 b/man2/idle.2
index e12a1a5..00c9599 100644
--- a/man2/idle.2
+++ b/man2/idle.2
@@ -57,7 +57,7 @@ never returns for process 0, and always returns \-1 for a user process.
 .B EPERM
 Always, for a user process.
 .SH VERSIONS
-linux Since 2.3.13, this system call does not exist anymore.
+Since Linux 2.3.13, this system call does not exist anymore.
 .SH "CONFORMING TO"
 This function is Linux-specific, and should not be used in programs
 intended to be portable.
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
