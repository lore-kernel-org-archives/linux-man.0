From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] access.2: tfix
Date: Wed,  6 Mar 2013 22:02:53 +0100
Message-ID: <1362603773-11484-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Introduced by commit e0a699c1
---
 man2/access.2 |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/man2/access.2 b/man2/access.2
index 35ee641..b14185d 100644
--- a/man2/access.2
+++ b/man2/access.2
@@ -40,8 +40,7 @@
 .\" Modified 2004-06-23 by Michael Kerrisk
 .\" 2007-06-10, mtk, various parts rewritten, and added BUGS section.
 .\"
-.TH ACCESS 2 2013-02-28
-inux" "Linux Programmer's Manual"
+.TH ACCESS 2 2013-02-28 "Linux" "Linux Programmer's Manual"
 .SH NAME
 access \- check real user's permissions for a file
 .SH SYNOPSIS
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
