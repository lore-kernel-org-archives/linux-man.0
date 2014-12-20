From: David Wilson <dw-ahVZHQAumb4sV2N9l4h3zg@public.gmane.org>
Subject: [PATCH] socket.7: document SO_REUSEPORT socket option.
Date: Sat, 20 Dec 2014 05:14:29 +0000
Message-ID: <1419052469-43586-1-git-send-email-dw@botanicus.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dw-ahVZHQAumb4sV2N9l4h3zg@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: David Wilson <dw-ahVZHQAumb4sV2N9l4h3zg@public.gmane.org>
---
 man7/socket.7 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man7/socket.7 b/man7/socket.7
index ff98e3e..ff4c46b 100644
--- a/man7/socket.7
+++ b/man7/socket.7
@@ -662,6 +662,20 @@ with a specific port then it is not possible
 to bind to this port for any local address.
 Argument is an integer boolean flag.
 .TP
+.BR SO_REUSEPORT " (since Linux 3.9)"
+Indicates that attempts to bind an identical listening address to
+multiple
+.B AF_INET
+or
+.B AF_INET6
+sockets by the same UID may succeed. This option allows
+.BR accept (2)
+load distribution in a multi-threaded server to be improved by
+using a distinct listener socket for each thread. This must be set
+on each socket prior to calling
+.BR bind (2)
+on the socket.
+.TP
 .BR SO_RXQ_OVFL " (since Linux 2.6.33)"
 .\" commit 3b885787ea4112eaa80945999ea0901bf742707f
 Indicates that an unsigned 32-bit value ancillary message (cmsg)
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
