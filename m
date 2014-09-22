From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] pthread_attr_setschedpolicy.3: Reformat thread-safety information
Date: Mon, 22 Sep 2014 14:42:01 +0800
Message-ID: <1411368121-7238-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/pthread_attr_setschedpolicy.3 | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/man3/pthread_attr_setschedpolicy.3 b/man3/pthread_attr_setschedpolicy.3
index 4eb2594..14a9d46 100644
--- a/man3/pthread_attr_setschedpolicy.3
+++ b/man3/pthread_attr_setschedpolicy.3
@@ -98,12 +98,18 @@ error ("attempt was made to set the attribute to an unsupported value") for
 .\" .SH VERSIONS
 .\" Available since glibc 2.0.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
-.BR pthread_attr_setschedpolicy ()
-and
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw30 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR pthread_attr_setschedpolicy (),
 .BR pthread_attr_getschedpolicy ()
-functions are thread-safe.
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH EXAMPLE
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
