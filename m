From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strspn.3: ATTRIBUTES: Note functions that are thread-safe
Date: Fri, 28 Feb 2014 10:21:10 +0800
Message-ID: <1393554070-18450-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions strspn() and strcspn() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strspn.3 | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/man3/strspn.3 b/man3/strspn.3
index 80eaf30..f05b8a2 100644
--- a/man3/strspn.3
+++ b/man3/strspn.3
@@ -27,7 +27,7 @@
 .\"     Lewine's _POSIX Programmer's Guide_ (O'Reilly & Associates, 1991)
 .\"     386BSD man pages
 .\" Modified Sat Jul 24 17:57:50 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
-.TH STRSPN 3  2013-12-30 "" "Linux Programmer's Manual"
+.TH STRSPN 3  2014-02-28 "" "Linux Programmer's Manual"
 .SH NAME
 strspn, strcspn \- get length of a prefix substring
 .SH SYNOPSIS
@@ -71,6 +71,13 @@ the initial segment of
 .I s
 which are not in the string
 .IR reject .
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR strspn ()
+and
+.BR strcspn ()
+functions are thread-safe.
 .SH CONFORMING TO
 SVr4, 4.3BSD, C89, C99.
 .SH SEE ALSO
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
