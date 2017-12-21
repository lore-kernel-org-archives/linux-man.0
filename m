From: Ahmad Fatoum <ahmad-WDeAlZut61o@public.gmane.org>
Subject: [PATCH] List ENOMSG as possible errno for recvmsg(2)
Date: Thu, 21 Dec 2017 19:40:33 +0100
Message-ID: <20171221184033.46656-1-ahmad@a3f.at>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Ahmad Fatoum <ahmad-WDeAlZut61o@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

See kernel's Documentation/networking/timestamping.txt
2.1.1 Transmit timestamps with MSG_ERRQUEUE

Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Ahmad Fatoum <ahmad-WDeAlZut61o@public.gmane.org>
---
 man2/recv.2 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man2/recv.2 b/man2/recv.2
index 85074abe2..da1cc2f79 100644
--- a/man2/recv.2
+++ b/man2/recv.2
@@ -495,6 +495,12 @@ and
 The file descriptor
 .I sockfd
 does not refer to a socket.
+.PP
+Following additional error can occur for
+.BR recvmsg ():
+.TP
+.B ENOMSG
+A packet was looped back to the error queue along with its transmit timestamp.
 .SH CONFORMING TO
 POSIX.1-2001, POSIX.1-2008,
 4.4BSD (these interfaces first appeared in 4.2BSD).
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
