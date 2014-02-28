From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] packet.7: wfix
Date: Fri, 28 Feb 2014 23:48:17 +0100
Message-ID: <1393627697-4009-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

A side-effect: singular
---
 man7/packet.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/packet.7 b/man7/packet.7
index 060c984..59ea38b 100644
--- a/man7/packet.7
+++ b/man7/packet.7
@@ -442,7 +442,7 @@ that intend to brute-force flood the network\(emfor example,
 to test devices under load in a similar
 fashion to pktgen\(emthis layer can be bypassed by setting
 this integer option to 1.
-A side-effects is that packet buffering in the qdisc layer is avoided,
+A side-effect is that packet buffering in the qdisc layer is avoided,
 which will lead to increased drops when network
 device transmit queues are busy;
 therefore, use at your own risk.
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
