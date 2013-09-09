From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] drand48_r.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 9 Sep 2013 14:15:28 +0800
Message-ID: <1378707328-19625-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions drand48_r(), erand48_r(), lrand48_r(),
nrand48_r(), mrand48_r(), jrand48_r(), srand48_r(), seed48_r(),
and lcong48_r() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/drand48_r.3 | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/man3/drand48_r.3 b/man3/drand48_r.3
index 118a98d..30b85f3 100644
--- a/man3/drand48_r.3
+++ b/man3/drand48_r.3
@@ -24,7 +24,7 @@
 .\"
 .\" Created 2004-10-31. Text taken from a page by Walter Harms, 2003-09-08
 .\"
-.TH DRAND48_R 3 2007-07-26 "GNU" "Linux Programmer's Manual"
+.TH DRAND48_R 3 2013-09-09 "GNU" "Linux Programmer's Manual"
 .SH NAME
 drand48_r, erand48_r, lrand48_r, nrand48_r, mrand48_r, jrand48_r,
 srand48_r, seed48_r, lcong48_r
@@ -95,6 +95,20 @@ or
 .BR lcong48_r ().
 .SH RETURN VALUE
 The return value is 0.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR drand48_r (),
+.BR erand48_r (),
+.BR lrand48_r (),
+.BR nrand48_r (),
+.BR mrand48_r (),
+.BR jrand48_r (),
+.BR srand48_r (),
+.BR seed48_r (),
+and
+.BR lcong48_r ()
+functions are thread-safe.
 .SH CONFORMING TO
 These functions are GNU extensions and are not portable.
 .SH SEE ALSO
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
