From: "penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org" <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] memcpy.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 17 Mar 2014 01:44:04 +0000
Message-ID: <1395020506-9244-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org" <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The function memcpy() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/memcpy.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/memcpy.3 b/man3/memcpy.3
index 7a0b890..9a19286 100644
--- a/man3/memcpy.3
+++ b/man3/memcpy.3
@@ -27,7 +27,7 @@
 .\"     Lewine's _POSIX Programmer's Guide_ (O'Reilly & Associates, 1991)
 .\"     386BSD man pages
 .\" Modified Sun Jul 25 10:41:09 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
-.TH MEMCPY 3  2010-11-15 "" "Linux Programmer's Manual"
+.TH MEMCPY 3  2014-03-17 "" "Linux Programmer's Manual"
 .SH NAME
 memcpy \- copy memory area
 .SH SYNOPSIS
@@ -49,6 +49,11 @@ if the memory areas do overlap.
 The
 .BR memcpy ()
 function returns a pointer to \fIdest\fP.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR memcpy ()
+function is thread-safe.
 .SH CONFORMING TO
 SVr4, 4.3BSD, C89, C99, POSIX.1-2001.
 .SH SEE ALSO
-- 
1.8.5.3
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
