From: Vincent Bernat <vincent-5wNQGcxKXm8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] tcp.7: tcp_tw_recycle is removed from Linux 4.12
Date: Thu,  7 Sep 2017 07:32:43 +0200
Message-ID: <20170907053243.20052-1-vincent@bernat.im>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vincent Bernat <vincent-5wNQGcxKXm8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

And it is completely broken.

Signed-off-by: Vincent Bernat <vincent-5wNQGcxKXm8AvxtiuMwx3w@public.gmane.org>
---
 man7/tcp.7 | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/man7/tcp.7 b/man7/tcp.7
index 415c7690d5a2..c7d2fcb5362e 100644
--- a/man7/tcp.7
+++ b/man7/tcp.7
@@ -864,16 +864,12 @@ can be consumed by a single TCP Segmentation Offload (TSO) frame.
 The setting of this parameter is a tradeoff between burstiness and
 building larger TSO frames.
 .TP
-.IR tcp_tw_recycle " (Boolean; default: disabled; since Linux 2.4)"
-.\" Since 2.3.15
-Enable fast recycling of TIME_WAIT sockets.
-Enabling this option is
-not recommended for devices communicating with the general Internet
-or using NAT (Network Address Translation).
-Since some NAT gateways
-pass through IP timestamp values, one IP can appear to have
-non-increasing timestamps.
-See RFC 1323 (PAWS), RFC 6191.
+.IR tcp_tw_recycle " (Boolean; default: disabled; Linux 2.4 to 4.12)"
+.\" Since 2.3.15; removed in 4.12; commit 4396e46187ca5070219b81773c4e65088dac50cc
+Enable fast recycling of TIME_WAIT sockets.  Enabling this option is
+not recommended as the remote IP may not use monotonically increasing
+timestamps (devices behind NAT, devices with per-connection timestamp
+offsets).  See RFC 1323 (PAWS), RFC 6191.
 .\"
 .\" The following is from 2.6.12: Documentation/networking/ip-sysctl.txt
 .TP
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
