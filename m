From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strchr.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 20 Jan 2014 12:09:32 +0800
Message-ID: <1390190972-31176-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions strchr(), strrchr() and strchrnul() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strchr.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/strchr.3 b/man3/strchr.3
index ee2c56c..068d695 100644
--- a/man3/strchr.3
+++ b/man3/strchr.3
@@ -30,7 +30,7 @@
 .\" 2006-05-19, Justin Pryzby <pryzbyj-4haIdLZGnXT/8jPEf8fH3w@public.gmane.org>
 .\"	Document strchrnul(3).
 .\"
-.TH STRCHR 3  2012-04-24 "GNU" "Linux Programmer's Manual"
+.TH STRCHR 3  2014-01-20 "GNU" "Linux Programmer's Manual"
 .SH NAME
 strchr, strrchr, strchrnul \- locate character in string
 .SH SYNOPSIS
@@ -104,6 +104,14 @@ if the character is not found.
 .SH VERSIONS
 .BR strchrnul ()
 first appeared in glibc in version 2.1.1.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR strchr (),
+.BR strrchr (),
+and
+.BR strchrnul ()
+functions are thread-safe.
 .SH CONFORMING TO
 .BR strchr ()
 and
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
