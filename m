From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strlen.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 25 Feb 2014 15:56:19 +0800
Message-ID: <1393314979-7715-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function strlen() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strlen.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/strlen.3 b/man3/strlen.3
index ed058e0..13ad631 100644
--- a/man3/strlen.3
+++ b/man3/strlen.3
@@ -27,7 +27,7 @@
 .\"     Lewine's _POSIX Programmer's Guide_ (O'Reilly & Associates, 1991)
 .\"     386BSD man pages
 .\" Modified Sat Jul 24 18:02:26 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
-.TH STRLEN 3  2012-05-04 "GNU" "Linux Programmer's Manual"
+.TH STRLEN 3  2014-02-25 "GNU" "Linux Programmer's Manual"
 .SH NAME
 strlen \- calculate the length of a string
 .SH SYNOPSIS
@@ -47,6 +47,11 @@ The
 .BR strlen ()
 function returns the number of bytes in the string
 .IR s .
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR strlen ()
+function is thread-safe.
 .SH CONFORMING TO
 SVr4, 4.3BSD, C89, C99.
 .SH SEE ALSO
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
