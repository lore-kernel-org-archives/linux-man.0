From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] difftime.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 28 Oct 2013 16:57:25 +0800
Message-ID: <1382950645-9759-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function difftime() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/difftime.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/difftime.3 b/man3/difftime.3
index 16280e4..189469a 100644
--- a/man3/difftime.3
+++ b/man3/difftime.3
@@ -27,7 +27,7 @@
 .\"     Lewine's _POSIX Programmer's Guide_ (O'Reilly & Associates, 1991)
 .\"     386BSD man pages
 .\" Modified Sat Jul 24 19:48:17 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
-.TH DIFFTIME 3  2012-12-22 "GNU" "Linux Programmer's Manual"
+.TH DIFFTIME 3  2013-10-28 "GNU" "Linux Programmer's Manual"
 .SH NAME
 difftime \- calculate time difference
 .SH SYNOPSIS
@@ -45,6 +45,11 @@ between time \fItime1\fP and time \fItime0\fP, represented as a
 Each of the times is specified in calendar time, which means its
 value is a measurement (in seconds) relative to the
 Epoch, 1970-01-01 00:00:00 +0000 (UTC).
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR difftime ()
+function is thread-safe.
 .SH CONFORMING TO
 SVr4, 4.3BSD, C89, C99.
 .SH NOTES
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
