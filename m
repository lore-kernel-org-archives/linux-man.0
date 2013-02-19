From: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Subject: [PATCH] socket.7: Add info about SO_BINDTODEVICE being readable
Date: Tue, 19 Feb 2013 20:52:52 +0400
Message-ID: <5123ADE4.4040604@parallels.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The sockoption in question can be getsockopt-ed since kernel 3.8.
Mention this fact in the respective section of socket(7) page.

Signed-off-by: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>

---

diff --git a/man7/socket.7 b/man7/socket.7
index 32ec131..2f915da 100644
--- a/man7/socket.7
+++ b/man7/socket.7
@@ -308,6 +308,14 @@ sockets.
 It is not supported for packet sockets (use normal
 .BR bind (2)
 there).
+
+This option is available for getting since Linux 3.8. The option
+length should contain the buffer size to receive the device name
+and is recommended to be
+.BR IFNAMSZ
+bytes. The real device name length is reported back in the option
+length argument.
+
 .TP
 .B SO_BROADCAST
 Set or get the broadcast flag.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
