From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] stdarg.3: ATTRIBUTES: Note macros that are thread-safe
Date: Tue, 10 Dec 2013 17:47:20 +0800
Message-ID: <1386668840-2571-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The macros va_start(), va_arg(), va_end() and va_copy() are
thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/stdarg.3 | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/man3/stdarg.3 b/man3/stdarg.3
index fb81772..cc170b5 100644
--- a/man3/stdarg.3
+++ b/man3/stdarg.3
@@ -40,7 +40,7 @@
 .\" Converted for Linux, Mon Nov 29 15:11:11 1993, faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org
 .\" Additions, 2001-10-14, aeb
 .\"
-.TH STDARG 3  2013-03-15 "" "Linux Programmer's Manual"
+.TH STDARG 3  2013-12-10 "" "Linux Programmer's Manual"
 .SH NAME
 stdarg, va_start, va_arg, va_end, va_copy \- variable argument lists
 .SH SYNOPSIS
@@ -226,6 +226,15 @@ Some systems that do not supply
 have
 .B __va_copy
 instead, since that was the name used in the draft proposal.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR va_start (),
+.BR va_arg (),
+.BR va_end (),
+and
+.BR va_copy ()
+macros are thread-safe.
 .SH CONFORMING TO
 The
 .BR va_start (),
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
