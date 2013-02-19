From: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Subject: [PATCH] socket.7: Add info about SO_PEEK_OFF option
Date: Tue, 19 Feb 2013 23:10:09 +0400
Message-ID: <5123CE11.5060900@parallels.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Since Linux 3.4 there appeared an ability to specify the
offset in bytes from which the data will be MSG_PEEK-ed.
Describe this socket option in the socket(7) page, where
all the other socket options are described.

Signed-off-by: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>

---

diff --git a/man7/socket.7 b/man7/socket.7
index 2f915da..6177ab1 100644
--- a/man7/socket.7
+++ b/man7/socket.7
@@ -618,6 +618,33 @@ for details on control messages.
 Gets the socket type as an integer (e.g.,
 .BR SOCK_STREAM ).
 This socket option is read-only.
+.TP
+.BR SO_PEEK_OFF " (since Linux 3.4)"
+This option controls the behavior of
+.BR recv(2)
+system call when used with
+.BR MSG_PEEK
+flag.
+
+When this value is negative (kernel sets -1 to all new sockets by default)
+the behavior of the
+.BR recv(2)
+is not affected at all.
+When it's set to zero or positive value, peeking the data would occur from
+the respective position in bytes. At the same time this offset will be
+incremented on the amount of bytes peeked from queue, so that the
+subsequent attempt to peek the data would result in next data in queue
+(similarly, receiving the data from queue without the
+.BR MSG_PEEK
+flag will result in respectively decreased offset value).
+For datagram sockets, if the offset points to the middle of a packet,
+the data returned will be marked with the
+.BR MSG_TRUNC
+flag.
+
+Since Linux 3.4 this option is supported for
+.BR unix(7)
+sockets only.
 .SS Signals
 When writing onto a connection-oriented socket that has been shut down
 (by the local or the remote end)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
