From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] stpcpy.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 13 Jan 2014 14:01:08 +0800
Message-ID: <1389592868-11320-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function stpcpy() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/stpcpy.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/stpcpy.3 b/man3/stpcpy.3
index 09d74b7..4718a96 100644
--- a/man3/stpcpy.3
+++ b/man3/stpcpy.3
@@ -22,7 +22,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH STPCPY 3  2012-03-15 "GNU" "Linux Programmer's Manual"
+.TH STPCPY 3  2014-01-13 "GNU" "Linux Programmer's Manual"
 .SH NAME
 stpcpy \- copy a string returning a pointer to its end
 .SH SYNOPSIS
@@ -68,6 +68,11 @@ of the string
 .I dest
 (that is, the address of the terminating null byte)
 rather than the beginning.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR stpcpy ()
+function is thread-safe.
 .SH CONFORMING TO
 This function was added to POSIX.1-2008.
 Before that, it was not part of
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
