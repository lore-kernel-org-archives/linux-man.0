From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] pthread_attr_setinheritsched.3: Reformat thread-safety information
Date: Mon, 22 Sep 2014 14:58:12 +0800
Message-ID: <1411369092-8990-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/pthread_attr_setinheritsched.3 | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/man3/pthread_attr_setinheritsched.3 b/man3/pthread_attr_setinheritsched.3
index 84c5b40..76ad004 100644
--- a/man3/pthread_attr_setinheritsched.3
+++ b/man3/pthread_attr_setinheritsched.3
@@ -108,12 +108,18 @@ error ("attempt was made to set the attribute to an unsupported value") for
 .\" .SH VERSIONS
 .\" Available since glibc 2.0.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
-.BR pthread_attr_setinheritsched ()
-and
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw31 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR pthread_attr_setinheritsched (),
 .BR pthread_attr_getinheritsched ()
-functions are thread-safe.
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH BUGS
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
