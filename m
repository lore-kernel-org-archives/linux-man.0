From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strstr.3: ATTRIBUTES: Note function that is thread safe with exceptions
Date: Wed, 15 Jan 2014 15:23:42 +0800
Message-ID: <1389770622-19332-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function strstr() is thread safe.
The function strcasestr() is thread safe with exceptions.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strstr.3 | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/man3/strstr.3 b/man3/strstr.3
index ba03f19..c667da5 100644
--- a/man3/strstr.3
+++ b/man3/strstr.3
@@ -30,7 +30,7 @@
 .\" Added history, aeb, 980113.
 .\" 2005-05-05 mtk: added strcasestr()
 .\"
-.TH STRSTR 3  2014-01-04 "GNU" "Linux Programmer's Manual"
+.TH STRSTR 3  2014-01-15 "GNU" "Linux Programmer's Manual"
 .SH NAME
 strstr, strcasestr \- locate a substring
 .SH SYNOPSIS
@@ -62,6 +62,18 @@ but ignores the case of both arguments.
 .SH RETURN VALUE
 These functions return a pointer to the beginning of the
 located substring, or NULL if the substring is not found.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR strstr ()
+function is thread-safe.
+.LP
+The
+.BR strcasestr ()
+function is thread-safe with exceptions.
+It can be safely used in multithreaded applications, as long as
+.BR setlocale (3)
+is not called to change the locale.
 .SH CONFORMING TO
 The
 .BR strstr ()
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
