From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] realpath.3: update EINVAL description
Date: Thu, 01 Sep 2011 00:20:51 +0900
Message-ID: <4E5E5153.8030101@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

man-pages version: latest git repository
why: The argument resolved_path can be NULL and it's not
a error condition any more. See the last paragraph of the
DESCRIPTION, and the last paragraph of CONFORMING TO.
See also the commit c49e8fc9.


diff --git a/man3/realpath.3 b/man3/realpath.3
--- a/man3/realpath.3
+++ b/man3/realpath.3
@@ -104,13 +104,9 @@ is set to indicate the error.
Read or search permission was denied for a component of the path prefix.
.TP
.B EINVAL
-Either
.I path
-or
-.I resolved_path
is NULL.
(In libc5 this would just cause a segfault.)
-But, see NOTES below.
.TP
.B EIO
An I/O error occurred while reading from the file system.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
