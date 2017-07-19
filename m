From: Sukadev Bhattiprolu <sukadev-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/1] cmsg.3: Add a scatter/gather buffer to sample code
Date: Wed, 19 Jul 2017 16:49:55 -0700
Message-ID: <20170719234955.GA24570@us.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pradeeps-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org
List-Id: linux-man@vger.kernel.org


>From b2800c8d5dcd8ede89ebccb25f1a9b087dc2684b Mon Sep 17 00:00:00 2001
From: Sukadev Bhattiprolu <sukadev-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Date: Wed, 19 Jul 2017 22:47:14 -0400
Subject: [PATCH 1/1] cmsg.3: Add a scatter/gather buffer to sample code

Add a simple scatter/gather buffer to the cmsg sample code.

It appears that the scatter/gather buffer is required even though it
may not be used. In my testing (on Fedora 24 4.8.7-200.fc24.x86_64 as
well as a 4.11 based kernel) return value of sendmsg() was the number
of bytes in the scatter/gather buffer (1 with the patch below).

Without the iovec buffer, sendmsg() returns 0 which means no bytes
were transferred and the corresponding recvmsg() blocks indefinitely.

Signed-off-by: Sukadev Bhattiprolu <sukadev-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 A sample test case is at:
     https://github.com/sukadev/linux-tests/blob/master/share-fds/share-fds.c

 man3/cmsg.3 | 7 +++++++
 1 file changed, 7 insertions(+)


diff --git a/man3/cmsg.3 b/man3/cmsg.3
index 69af571..2ec87ad 100644
--- a/man3/cmsg.3
+++ b/man3/cmsg.3
@@ -200,12 +200,19 @@ struct msghdr msg = { 0 };
 struct cmsghdr *cmsg;
 int myfds[NUM_FD];  /* Contains the file descriptors to pass */
 int *fdptr;
+char iobuf[1];
+struct iovec io = {
+    .iov_base = iobuf,
+    .iov_len = sizeof(iobuf)
+};
 union {         /* Ancillary data buffer, wrapped in a union
                    in order to ensure it is suitably aligned */
     char buf[CMSG_SPACE(sizeof(myfds))];
     struct cmsghdr align;
 } u;
 
+msg.msg_iov = &io;
+msg.msg_iovlen = 1;
 msg.msg_control = u.buf;
 msg.msg_controllen = sizeof(u.buf);
 cmsg = CMSG_FIRSTHDR(&msg);
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
