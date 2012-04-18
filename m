From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] mallopt.3: ffix
Date: Thu, 19 Apr 2012 00:06:36 +0200
Message-ID: <1334786796-13418-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/mallopt.3 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man3/mallopt.3 b/man3/mallopt.3
index 1f69875..ddb1aed 100644
--- a/man3/mallopt.3
+++ b/man3/mallopt.3
@@ -497,7 +497,7 @@ Aborted (core dumped)
 .in
 .PP
 The following runs show the results when employing other values for
-.BR M_CHECK_ACTION:
+.BR M_CHECK_ACTION :
 .PP
 .in +4n
 .nf
-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
