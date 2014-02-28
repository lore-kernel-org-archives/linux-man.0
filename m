From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strcpy.3: ATTRIBUTES: Note functions that are thread-safe
Date: Fri, 28 Feb 2014 09:14:55 +0800
Message-ID: <1393550095-14200-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions strcpy() and strncpy() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strcpy.3 | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/man3/strcpy.3 b/man3/strcpy.3
index 675b72e..da027c3 100644
--- a/man3/strcpy.3
+++ b/man3/strcpy.3
@@ -32,7 +32,7 @@
 .\" 2007-06-15, Marc Boyer <marc.boyer-oUYRw6/Rnm9Wj0EZb7rXcA@public.gmane.org> + mtk
 .\"     Improve discussion of strncpy().
 .\"
-.TH STRCPY 3  2012-07-19 "GNU" "Linux Programmer's Manual"
+.TH STRCPY 3  2014-02-28 "GNU" "Linux Programmer's Manual"
 .SH NAME
 strcpy, strncpy \- copy a string
 .SH SYNOPSIS
@@ -113,6 +113,13 @@ and
 functions return a pointer to
 the destination string
 .IR dest .
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR strcpy ()
+and
+.BR strncpy ()
+functions are thread-safe.
 .SH CONFORMING TO
 SVr4, 4.3BSD, C89, C99.
 .SH NOTES
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
