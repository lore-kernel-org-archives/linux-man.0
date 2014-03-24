From: "penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org" <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] mkfifo.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 24 Mar 2014 01:55:59 +0000
Message-ID: <1395626006-21719-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org" <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The functions mkfifo() and mkfifoat() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/mkfifo.3 | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/man3/mkfifo.3 b/man3/mkfifo.3
index 849efca..e1c0b84 100644
--- a/man3/mkfifo.3
+++ b/man3/mkfifo.3
@@ -25,7 +25,7 @@
 .\"
 .\" changed section from 2 to 3, aeb, 950919
 .\"
-.TH MKFIFO 3 2014-02-21 "GNU" "Linux Programmer's Manual"
+.TH MKFIFO 3 2014-03-24 "GNU" "Linux Programmer's Manual"
 .SH NAME
 mkfifo, mkfifoat \- make a FIFO special file (a named pipe)
 .SH SYNOPSIS
@@ -181,6 +181,13 @@ was added to glibc in version 2.4.
 It is implemented using
 .BR mknodat (2),
 available on Linux since kernel 2.6.16.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR mkfifo ()
+and
+.BR mkfifoat ()
+functions are thread-safe.
 .SH CONFORMING TO
 .BR mkfifo ():
 POSIX.1-2001, POSIX.1-2008.
-- 
1.8.5.3
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
