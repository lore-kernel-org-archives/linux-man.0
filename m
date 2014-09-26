From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] mq_getattr.3: Reformat thread-safety information
Date: Fri, 26 Sep 2014 16:11:45 +0800
Message-ID: <1411719105-2191-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/mq_getattr.3 | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/man3/mq_getattr.3 b/man3/mq_getattr.3
index 1c2321f..f81f189 100644
--- a/man3/mq_getattr.3
+++ b/man3/mq_getattr.3
@@ -135,12 +135,18 @@ is invalid.
 contained set bits other than
 .BR O_NONBLOCK .
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
-.BR mq_getattr ()
-and
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw26 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR mq_getattr (),
 .BR mq_setattr ()
-functions are thread-safe.
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
