From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] isgreater.3: ATTRIBUTES: Note macros that are thread-safe
Date: Mon, 27 Jan 2014 14:56:03 +0800
Message-ID: <1390805763-28013-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The macros isgreater(), isgreaterequal(), isless(),
islessequal(), islessgreater() and isunordered() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/isgreater.3 | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/man3/isgreater.3 b/man3/isgreater.3
index d241fde..fc761c1 100644
--- a/man3/isgreater.3
+++ b/man3/isgreater.3
@@ -7,7 +7,7 @@
 .\" 2002-07-27 Walter Harms
 .\" this was done with the help of the glibc manual
 .\"
-.TH ISGREATER 3  2012-05-06 "" "Linux Programmer's Manual"
+.TH ISGREATER 3  2014-01-27 "" "Linux Programmer's Manual"
 .SH NAME
 isgreater, isgreaterequal, isless, islessequal, islessgreater,
 isunordered \- floating-point relational tests without exception for NaN
@@ -122,6 +122,17 @@ or
 is NaN and 0 otherwise.
 .SH ERRORS
 No errors occur.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR isgreater (),
+.BR isgreaterequal (),
+.BR isless (),
+.BR islessequal (),
+.BR islessgreater (),
+and
+.BR isunordered ()
+macros are thread-safe.
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 .SH NOTES
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
