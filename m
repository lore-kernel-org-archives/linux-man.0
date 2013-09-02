From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] telldir.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 2 Sep 2013 13:30:51 +0800
Message-ID: <1378099851-7755-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function telldir() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/telldir.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/telldir.3 b/man3/telldir.3
index 1b241b6..c61f1f2 100644
--- a/man3/telldir.3
+++ b/man3/telldir.3
@@ -27,7 +27,7 @@
 .\"     Lewine's _POSIX Programmer's Guide_ (O'Reilly & Associates, 1991)
 .\"     386BSD man pages
 .\" Modified Sat Jul 24 17:48:42 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
-.TH TELLDIR 3  2013-03-24 "" "Linux Programmer's Manual"
+.TH TELLDIR 3  2013-09-02 "" "Linux Programmer's Manual"
 .SH NAME
 telldir \- return current location in directory stream
 .SH SYNOPSIS
@@ -61,6 +61,11 @@ is set appropriately.
 .TP
 .B EBADF
 Invalid directory stream descriptor \fIdirp\fP.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR telldir ()
+function is thread-safe.
 .SH CONFORMING TO
 4.3BSD, POSIX.1-2001.
 .SH NOTES
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
