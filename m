From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] mq_receive.3, mq_send.3: clarification regarding reasons
 behind EBADF
Date: Wed, 9 Nov 2016 20:30:52 +0300
Message-ID: <20161109173052.GA19634@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man3/mq_receive.3 |    2 +-
 man3/mq_send.3    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/mq_receive.3 b/man3/mq_receive.3
index 57a1f58..f204b98 100644
--- a/man3/mq_receive.3
+++ b/man3/mq_receive.3
@@ -129,7 +129,7 @@ flag was set for the message queue description referred to by
 .B EBADF
 The file descriptor specified in
 .I mqdes
-was invalid.
+was invalid or unavailable for reading.
 .TP
 .B EINTR
 The call was interrupted by a signal handler; see
diff --git a/man3/mq_send.3 b/man3/mq_send.3
index 9d30092..4277c36 100644
--- a/man3/mq_send.3
+++ b/man3/mq_send.3
@@ -134,7 +134,7 @@ flag was set for the message queue description referred to by
 .B EBADF
 The file descriptor specified in
 .I mqdes
-was invalid.
+was invalid or unavailable for writing.
 .TP
 .B EINTR
 The call was interrupted by a signal handler; see
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
