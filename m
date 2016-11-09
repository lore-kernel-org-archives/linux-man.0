From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] mq_open.3: clarification regarding usage of mq_flags
 attribute in mq_open()
Date: Wed, 9 Nov 2016 20:31:06 +0300
Message-ID: <20161109173106.GA19836@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man3/mq_open.3 |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/man3/mq_open.3 b/man3/mq_open.3
index 771a263..ba70ada 100644
--- a/man3/mq_open.3
+++ b/man3/mq_open.3
@@ -123,7 +123,14 @@ The
 argument specifies attributes for the queue.
 See
 .BR mq_getattr (3)
-for details.
+for details (except for
+.I mq_flags
+field which is currently ignored by
+.BR mq_open() ;
+.B O_NONBLOCK
+flag should be set in
+.I oflag
+parameter instead).
 If
 .I attr
 is NULL, then the queue is created with implementation-defined
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
