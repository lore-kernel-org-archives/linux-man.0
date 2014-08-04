From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] open.2: grfix
Date: Mon,  4 Aug 2014 23:26:22 +0200
Message-ID: <1407187582-25469-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/open.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/open.2 b/man2/open.2
index c413d96..4cd5edd 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -101,8 +101,8 @@ By default, the new file descriptor is set to remain open across an
 (i.e., the
 .B FD_CLOEXEC
 file descriptor flag described in
-.BR fcntl (2))
-is initially disabled; the
+.BR fcntl (2)
+is initially disabled); the
 .B O_CLOEXEC
 flag, described below, can be used to change this default.
 The file offset is set to the beginning of the file (see
-- 
2.0.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
