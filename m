From: Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH man-pages] packet.7: improve PACKET_QDISC_BYPASS description
Date: Fri, 14 Feb 2014 11:34:26 +0100
Message-ID: <e28f3b491ae1d2e4538ef6b84871eb773185f089.1392373992.git.dborkman@redhat.com>
References: <cover.1392373992.git.dborkman@redhat.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1392373992.git.dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Improve the description resp. provide some more details.

Signed-off-by: Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man7/packet.7 | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/man7/packet.7 b/man7/packet.7
index 1d3f222..7a2ce1e 100644
--- a/man7/packet.7
+++ b/man7/packet.7
@@ -431,9 +431,14 @@ integer option before creating the ring.
 .BR PACKET_QDISC_BYPASS " (since Linux 3.14)"
 .\" commit d346a3fae3ff1d99f5d0c819bf86edf9094a26a1
 By default, packets sent through packet sockets pass through the kernel's
-qdisc (traffic control) layer.
-This can be bypassed by setting this integer option to 1;
-this is useful for usage scenarios similar to pktgen.
+qdisc (traffic control) layer, which is fine for the vast majority of use
+cases.
+For traffic generator appliances using packet socket that intend to flood
+the network with brute force i.e., to test devices under load in a similar
+fashion to pktgen, this layer can be bypassed by setting this integer option
+to 1. Side-effects are that packet buffering in qdisc layer is avoided
+which will lead to increased drops when net device transmit queues are busy;
+therefore, use at your own risk.
 .SS Ioctls
 .B SIOCGSTAMP
 can be used to receive the timestamp of the last received packet.
-- 
1.7.11.7

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
