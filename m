From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] mq_receive.3: wfix
Date: Mon, 13 Jan 2014 15:36:46 +0800
Message-ID: <1389598606-13221-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/mq_receive.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/mq_receive.3 b/man3/mq_receive.3
index a644212..3ed7efe 100644
--- a/man3/mq_receive.3
+++ b/man3/mq_receive.3
@@ -23,7 +23,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH MQ_RECEIVE 3 2013-11-08 "Linux" "Linux Programmer's Manual"
+.TH MQ_RECEIVE 3 2014-01-13 "Linux" "Linux Programmer's Manual"
 .SH NAME
 mq_receive, mq_timedreceive \- receive a message from a message queue
 .SH SYNOPSIS
@@ -65,7 +65,7 @@ The
 .I msg_len
 argument specifies the size of the buffer pointed to by
 .IR msg_ptr ;
-this must be greater than or equalt to the
+this must be greater than or equal to the
 .I mq_msgsize
 attribute of the queue (see
 .BR mq_getattr (3)).
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
