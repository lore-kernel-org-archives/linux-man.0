From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] isatty.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 27 Jan 2014 13:46:36 +0800
Message-ID: <1390801596-24329-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function isatty() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/isatty.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/isatty.3 b/man3/isatty.3
index f890329..03533cd 100644
--- a/man3/isatty.3
+++ b/man3/isatty.3
@@ -23,7 +23,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH ISATTY 3 2008-12-03 "Linux" "Linux Programmer's Manual"
+.TH ISATTY 3 2014-01-27 "Linux" "Linux Programmer's Manual"
 .SH NAME
 isatty \- test whether a file descriptor refers to a terminal
 .SH SYNOPSIS
@@ -59,6 +59,11 @@ POSIX.1-2001 specifies the error
 .BR ENOTTY
 .\" FIXME File a bug for this?
 for this case.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR isatty ()
+function is thread-safe.
 .SH CONFORMING TO
 SVr4, 4.3BSD, POSIX.1-2001.
 .SH SEE ALSO
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
