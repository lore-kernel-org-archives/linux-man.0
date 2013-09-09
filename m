From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] seekdir.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 9 Sep 2013 11:48:48 +0800
Message-ID: <1378698528-14408-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function seekdir() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/seekdir.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/seekdir.3 b/man3/seekdir.3
index 768dcbd..7eeb822 100644
--- a/man3/seekdir.3
+++ b/man3/seekdir.3
@@ -28,7 +28,7 @@
 .\"     386BSD man pages
 .\" Modified Sat Jul 24 18:25:21 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\"
-.TH SEEKDIR 3  2013-03-24 "" "Linux Programmer's Manual"
+.TH SEEKDIR 3  2013-09-09 "" "Linux Programmer's Manual"
 .SH NAME
 seekdir \- set the position of the next readdir() call in the directory
 stream.
@@ -61,6 +61,11 @@ argument should be a value returned by a previous call to
 The
 .BR seekdir ()
 function returns no value.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR seekdir ()
+function is thread-safe.
 .SH CONFORMING TO
 4.3BSD, POSIX.1-2001.
 .SH NOTES
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
