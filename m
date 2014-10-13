From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] tzset.3: grfix
Date: Tue, 14 Oct 2014 00:41:22 +0200
Message-ID: <1413240082-18983-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The sentence is missing a word somewhere.
---
 man3/tzset.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/tzset.3 b/man3/tzset.3
index 1ae47e5..c1c98e1 100644
--- a/man3/tzset.3
+++ b/man3/tzset.3
@@ -196,7 +196,7 @@ the system timezone directory is determined using the
 the environment variable.
 If
 .BR TZDIR
-the default depends on the system setup, but is normally
+is not set, the default depends on the system setup, but is normally
 .IR /usr/share/zoneinfo .
 .LP
 This timezone directory contains the files
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
