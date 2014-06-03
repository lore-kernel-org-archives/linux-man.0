From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] posix_fallocate.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 3 Jun 2014 10:03:09 +0800
Message-ID: <1401760989-14814-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function posix_fallocate() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/posix_fallocate.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/posix_fallocate.3 b/man3/posix_fallocate.3
index 6bf4f7c..921ae83 100644
--- a/man3/posix_fallocate.3
+++ b/man3/posix_fallocate.3
@@ -22,7 +22,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH POSIX_FALLOCATE 3  2013-02-12 "GNU" "Linux Programmer's Manual"
+.TH POSIX_FALLOCATE 3  2014-06-03 "GNU" "Linux Programmer's Manual"
 .SH NAME
 posix_fallocate \- allocate file space
 .SH SYNOPSIS
@@ -100,6 +100,11 @@ refers to a pipe.
 .SH VERSIONS
 .BR posix_fallocate ()
 is available since glibc 2.1.94.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR posix_fallocate ()
+function is thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
