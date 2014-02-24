From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] scandir.3: tfix
Date: Tue, 25 Feb 2014 00:41:04 +0100
Message-ID: <1393285264-4984-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Introduced in cadd38ba
---
 man3/scandir.3 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man3/scandir.3 b/man3/scandir.3
index a3e9159..aee2c86 100644
--- a/man3/scandir.3
+++ b/man3/scandir.3
@@ -146,7 +146,7 @@ on the strings \fI(*a)\->d_name\fP and \fI(*b)\->d_name\fP.
 The
 .BR scandirat ()
 function operates in exactly the same way as
-.BR scnadir (),
+.BR scandir (),
 except for the differences described here.
 
 If the pathname given in
@@ -156,7 +156,7 @@ referred to by the file descriptor
 .I dirfd
 (rather than relative to the current working directory of
 the calling process, as is done by
-.BR scnadir ()
+.BR scandir ()
 for a relative pathname).
 
 If
@@ -169,7 +169,7 @@ then
 .I dirp
 is interpreted relative to the current working
 directory of the calling process (like
-.BR scnadir ()).
+.BR scandir ()).
 
 If
 .I dirp
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
