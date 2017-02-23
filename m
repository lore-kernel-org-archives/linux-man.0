From: Andreas Gruenbacher <agruenba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] getxattr.2, listxattr.2: Document E2BIG errors
Date: Thu, 23 Feb 2017 22:56:41 +0100
Message-ID: <1487887001-11203-1-git-send-email-agruenba@redhat.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Andreas Gruenbacher <agruenba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "J. Bruce Fields" <bfields-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Andreas Gruenbacher <agruenba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man2/getxattr.2  | 5 +++++
 man2/listxattr.2 | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/man2/getxattr.2 b/man2/getxattr.2
index c06c92f..83945fe 100644
--- a/man2/getxattr.2
+++ b/man2/getxattr.2
@@ -127,6 +127,11 @@ The
 of the
 .I value
 buffer is too small to hold the result.
+.TP
+.B E2BIG
+The size of the attribute value is larger than the maximum size allowed; the
+attribute cannot be retrieved. This can happen on filesystems that support
+very large attribute values such as NFSv4, for example.
 .PP
 In addition, the errors documented in
 .BR stat (2)
diff --git a/man2/listxattr.2 b/man2/listxattr.2
index 9c14679..e923af4 100644
--- a/man2/listxattr.2
+++ b/man2/listxattr.2
@@ -149,6 +149,12 @@ The
 of the
 .I list
 buffer is too small to hold the result.
+.TP
+.B E2BIG
+The size of the list of extended attribute names is larger than the maximum
+size allowed; the list cannot be retrieved. This can happen on filesystems that
+support an unlimited number of extended attributes per file such as XFS, for
+example.
 .PP
 In addition, the errors documented in
 .BR stat (2)
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
