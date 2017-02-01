From: Wei Wang <weiwan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [patch] send.2: Add MSG_FASTOPEN flag
Date: Tue, 31 Jan 2017 17:37:03 -0800
Message-ID: <20170201013703.92907-1-tracywwnj@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Wang <weiwan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

From: Wei Wang <weiwan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

Add MSG_FASTOPEN flag description for send.2

Signed-off-by: Wei Wang <weiwan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
---
 man2/send.2 | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/man2/send.2 b/man2/send.2
index 7f2340666..4b1902f75 100644
--- a/man2/send.2
+++ b/man2/send.2
@@ -255,6 +255,22 @@ data on sockets that support this notion (e.g., of type
 the underlying protocol must also support
 .I out-of-band
 data.
+.TP
+.BR MSG_FASTOPEN " (since Linux 3.7)"
+Marks the attempt to send data in SYN like a combination of
+.BR connect (2)
+operation. It blocks until the handshake has completed and data is
+buffered.
+
+For a non-blocking socket, it returns the number of bytes buffered
+and sent in the SYN packet. If the cookie is not available locally,
+it returns
+.B EINPROGRESS
+, and sends a SYN with a Fast Open cookie request automatically.
+The caller needs to write the data again when the socket is connected.
+On errors, it returns the same errno as
+.BR connect (2)
+if the handshake fails.
 .SS sendmsg()
 The definition of the
 .I msghdr
-- 
2.11.0.483.g087da7b7c-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
