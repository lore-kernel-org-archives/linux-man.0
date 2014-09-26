From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] mq_receive.3: Reformat thread-safety information
Date: Fri, 26 Sep 2014 16:03:14 +0800
Message-ID: <1411718594-1600-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/mq_receive.3 | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/man3/mq_receive.3 b/man3/mq_receive.3
index b139f44..a45bc09 100644
--- a/man3/mq_receive.3
+++ b/man3/mq_receive.3
@@ -154,12 +154,18 @@ attribute of the message queue.
 .B ETIMEDOUT
 The call timed out before a message could be transferred.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
-.BR mq_receive ()
-and
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw31 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR mq_receive (),
 .BR mq_timedreceive ()
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
