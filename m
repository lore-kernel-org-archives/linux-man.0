From: "penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org" <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] random.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 25 Mar 2014 06:49:51 +0000
Message-ID: <1395730035-1946-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org" <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The functions random(), srandom(), initstate() and setstate()
are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/random.3 | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/man3/random.3 b/man3/random.3
index e1a8e17..dc6fa9f 100644
--- a/man3/random.3
+++ b/man3/random.3
@@ -30,7 +30,7 @@
 .\" Modified Sat Jul 24 18:13:39 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" Modified Sun Aug 20 21:47:07 2000, aeb
 .\"
-.TH RANDOM 3  2013-04-19 "GNU" "Linux Programmer's Manual"
+.TH RANDOM 3  2014-03-25 "GNU" "Linux Programmer's Manual"
 .SH NAME
 random, srandom, initstate, setstate \- random number generator
 .SH SYNOPSIS
@@ -149,6 +149,15 @@ was NULL.
 .B EINVAL
 A state array of less than 8 bytes was specified to
 .BR initstate ().
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR random (),
+.BR srandom (),
+.BR initstate (),
+and
+.BR setstate ()
+functions are thread-safe.
 .SH CONFORMING TO
 4.3BSD, POSIX.1-2001.
 .SH NOTES
-- 
1.8.5.3
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
