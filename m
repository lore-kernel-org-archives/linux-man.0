From: "penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org" <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] random_r.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 25 Mar 2014 08:24:17 +0000
Message-ID: <1395735702-6364-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org" <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The functions random_r(), srandom_r(), initstate_r() and
setstate_r() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/random_r.3 | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/man3/random_r.3 b/man3/random_r.3
index 829eb81..92fe430 100644
--- a/man3/random_r.3
+++ b/man3/random_r.3
@@ -23,7 +23,7 @@
 .\" %%%LICENSE_END
 .\"
 .\"
-.TH RANDOM_R 3  2013-04-19 "GNU" "Linux Programmer's Manual"
+.TH RANDOM_R 3  2014-03-25 "GNU" "Linux Programmer's Manual"
 .SH NAME
 random_r, srandom_r, initstate_r, setstate_r \- reentrant
 random number generator
@@ -125,6 +125,15 @@ or
 argument to
 .BR random_r ()
 was NULL.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR random_r (),
+.BR srandom_r (),
+.BR initstate_r (),
+and
+.BR setstate_r ()
+functions are thread-safe.
 .SH CONFORMING TO
 These functions are nonstandard glibc extensions.
 .\" These functions appear to be on Tru64, but don't seem to be on
-- 
1.8.5.3
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
