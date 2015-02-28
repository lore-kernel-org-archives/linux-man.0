From: Duncan Smith <Duncan-QHpCrFqKTQg@public.gmane.org>
Subject: [PATCH] mq_open.3: Add EINVAL error case for invalid name.
Date: Sat, 28 Feb 2015 01:04:02 -0800
Message-ID: <20150228090402.GA23727@lira.corp.xrtc.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This behavior is implementation-defined by POSIX.  If the name doesn't
start with a '/', glibc returns EINVAL without attempting the syscall.
---
 man3/mq_open.3 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man3/mq_open.3 b/man3/mq_open.3
index e5f74d4..243aca0 100644
--- a/man3/mq_open.3
+++ b/man3/mq_open.3
@@ -168,6 +168,11 @@ but a queue with this
 already exists.
 .TP
 .B EINVAL
+.I name
+doesn't follow the format in
+.BR mq_overview (7).
+.TP
+.B EINVAL
 .B O_CREAT
 was specified in
 .IR oflag ,
-- 
2.1.4
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
