From: Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH man-page] packet.7: document PACKET_QDISC_BYPASS
Date: Tue, 10 Dec 2013 16:31:25 +0100
Message-ID: <1386689485-18833-1-git-send-email-dborkman@redhat.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, brouer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Add a comment about PACKET_QDISC_BYPASS' socket option to the kernel.

Signed-off-by: Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 Michael, this patch is on top of Willem's resend for packet.7:
 http://www.spinics.net/lists/linux-man/msg04576.html

 Kernel part of this man page update:
 https://git.kernel.org/cgit/linux/kernel/git/davem/net-next.git/commit/?id=d346a3fae3ff1d99f5d0c819bf86edf9094a26a1

 Thanks!

 man7/packet.7 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man7/packet.7 b/man7/packet.7
index e0993d2..100f876 100644
--- a/man7/packet.7
+++ b/man7/packet.7
@@ -426,6 +426,11 @@ creates a packet receive ring of variant
 .BR TPACKET_V1 .
 To create another variant, configure the desired variant by setting this
 integer option before creating the ring.
+.TP
+.BR PACKET_QDISC_BYPASS " (since Linux 3.14)"
+By default, packets sent through packet sockets pass through the kernel's
+qdisc (traffic control) layer. This can be bypassed by setting this integer
+option to one for usage scenarios similar to pktgen.
 
 .SS Ioctls
 .B SIOCGSTAMP
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
