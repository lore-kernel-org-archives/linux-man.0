From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] semget.2: tfix
Date: Sat, 17 May 2014 21:19:01 +0200
Message-ID: <1400354341-15351-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/semget.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/semget.2 b/man2/semget.2
index df4007a..82bd3a0 100644
--- a/man2/semget.2
+++ b/man2/semget.2
@@ -168,7 +168,7 @@ capability.
 and
 .BR IPC_EXCL
 were specified in
-.IR shmflg ,
+.IR semflg ,
 but a semaphore set already exists for
 .IR key .
 .\" .TP
-- 
2.0.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
