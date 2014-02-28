From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] access.2n chmod.2, chown.2: ffix regression
Date: Fri, 28 Feb 2014 22:04:20 +0100
Message-ID: <1393621460-19801-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Introduced in my previous commit 9d3ea7a2995cbae483742f0f572b6e9dc4e0a58f
---
 man2/access.2 | 4 ++--
 man2/chmod.2  | 2 +-
 man2/chown.2  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/man2/access.2 b/man2/access.2
index f909848..050fbc9 100644
--- a/man2/access.2
+++ b/man2/access.2
@@ -138,7 +138,7 @@ then
 .I pathname
 is interpreted relative to the current working
 directory of the calling process (like
-.BR access () ).
+.BR access ()).
 
 If
 .I pathname
@@ -154,7 +154,7 @@ Perform access checks using the effective user and group IDs.
 By default,
 .BR faccessat ()
 uses the real IDs (like
-.BR access () ).
+.BR access ()).
 .TP
 .B AT_SYMLINK_NOFOLLOW
 If
diff --git a/man2/chmod.2 b/man2/chmod.2
index f4636d5..b46c0fa 100644
--- a/man2/chmod.2
+++ b/man2/chmod.2
@@ -206,7 +206,7 @@ then
 .I pathname
 is interpreted relative to the current working
 directory of the calling process (like
-.BR chmod () ).
+.BR chmod ()).
 
 If
 .I pathname
diff --git a/man2/chown.2 b/man2/chown.2
index b1ef4a5..c7b2bd6 100644
--- a/man2/chown.2
+++ b/man2/chown.2
@@ -169,7 +169,7 @@ then
 .I pathname
 is interpreted relative to the current working
 directory of the calling process (like
-.BR chown () ).
+.BR chown ()).
 
 If
 .I pathname
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
