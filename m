From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] inotify.7 exfix
Date: Wed, 16 Apr 2014 19:00:49 -0400
Message-ID: <1397689249-2743-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/inotify.7 | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/man7/inotify.7 b/man7/inotify.7
index 6579a59..17462c6 100644
--- a/man7/inotify.7
+++ b/man7/inotify.7
@@ -416,13 +416,13 @@ and
 Suppose an application is watching the directories
 .I dir1
 and
-.IR dir ,
+.IR dir2 ,
 and the file
 .IR dir1/myfile .
 The following examples show some events that may be generated.
 .RS 4
 .TP
-link("dir/myfile", "dir2/new");
+link("dir1/myfile", "dir2/new");
 Generates an
 .B IN_ATTRIB
 event for
@@ -469,7 +469,7 @@ the following events:
 .RS 4
 .TP
 unlink("dir2/yy");
-Generates
+Generates an
 .BR IN_ATTRIB
 event for
 .IR xx
@@ -489,7 +489,7 @@ events for
 .IR xx ,
 and an
 .BR IN_DELETE
-for
+event for
 .IR dir1 .
 .RE
 .PP
@@ -506,7 +506,7 @@ Generates an
 event for
 .IR dir .
 .TP
-rmdir("dir/sub");
+rmdir("dir/subdir");
 Generates
 .B IN_DELETE_SELF
 and
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
