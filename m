From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] chown.2: tfix
Date: Thu,  7 Feb 2013 20:21:57 +0100
Message-ID: <1360264917-19511-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/chown.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/chown.2 b/man2/chown.2
index deb87c7..05e362d 100644
--- a/man2/chown.2
+++ b/man2/chown.2
@@ -66,7 +66,7 @@ _XOPEN_SOURCE\ &&\ _XOPEN_SOURCE_EXTENDED
 .PD
 .SH DESCRIPTION
 These system calls change the owner and group of a file.
-The differ only in how the file is specified:
+They differ only in how the file is specified:
 .IP * 2
 .BR chown ()
 changes the ownership of the file specified by
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
