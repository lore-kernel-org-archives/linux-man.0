From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] recv.2: equivalence to read
Date: Fri,  8 Jan 2016 22:02:23 +0100
Message-ID: <1452286943-26340-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Describe the recv.2-read.2 and the recvfrom.2-recv.2 equivalences for
zero valued arguments.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/recv.2 | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/man2/recv.2 b/man2/recv.2
index a789256..1bdeb7a 100644
--- a/man2/recv.2
+++ b/man2/recv.2
@@ -68,6 +68,26 @@ to receive data on both connectionless and connection-oriented sockets.
 This page first describes common features of all three system calls,
 and then describes the differences between the calls.
 .PP
+The only difference between
+.BR recv ()
+and
+.BR read (2)
+is the presence of
+.IR flags .
+With a zero
+.I flags
+argument,
+.BR recv ()
+is equivalent to
+.BR read (2).
+Also, the following call
+
+    recv(sockfd, buf, len, flags);
+
+is equivalent to
+
+    recvfrom(sockfd, buf, len, flags, NULL, NULL);
+.PP
 All three calls return the length of the message on successful
 completion.
 If a message is too long to fit in the supplied buffer, excess
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
