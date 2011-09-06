From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ttyname.3: Add description of the function is not thread-safe
Date: Tue, 06 Sep 2011 17:57:59 +0800
Message-ID: <4E65EEA7.5060804@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


The function ttyname() uses a static variable "ttyname_buf", so it is not thread-safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/ttyname.3 |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/man3/ttyname.3 b/man3/ttyname.3
index 08fb2b7..5047e94 100644
--- a/man3/ttyname.3
+++ b/man3/ttyname.3
@@ -23,7 +23,7 @@
 .\" Modified 2001-12-13, Martin Schulze <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org>
 .\" Added ttyname_r, aeb, 2002-07-20
 .\"
-.TH TTYNAME 3 2008-07-14 "Linux" "Linux Programmer's Manual"
+.TH TTYNAME 3 20011-09-06 "Linux" "Linux Programmer's Manual"
 .SH NAME
 ttyname, ttyname_r \- return name of a terminal
 .SH SYNOPSIS
@@ -70,6 +70,15 @@ File descriptor does not refer to a terminal device.
 .B ERANGE
 .I buflen
 was too small to allow storing the pathname.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR ttyname ()
+function is not thread-safe.
+.LP
+The
+.BR ttyname_r ()
+function is thread-safe.
 .SH "CONFORMING TO"
 4.2BSD, POSIX.1-2001.
 .SH "SEE ALSO"
-- 
1.7.1

-- 
Best Regards,
Peng Haitao

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
