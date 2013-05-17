From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ip.7: IP_MULTICAST_IF setsockopt recognizes struct mreq (compatibility)
Date: Sat, 18 May 2013 00:58:52 +0200
Message-ID: <1368831532-8327-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Kernel added compatibility only recently in
3a084ddb4bf299a6e898a9a07c89f3917f0713f7
See: http://bugs.debian.org/607979
---
 man7/ip.7 |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/man7/ip.7 b/man7/ip.7
index d5036ea..39715a3 100644
--- a/man7/ip.7
+++ b/man7/ip.7
@@ -542,6 +542,9 @@ Argument is an
 .I ip_mreqn
 or
 .I ip_mreq
+.\" net: IP_MULTICAST_IF setsockopt now recognizes struct mreq
+.\" Commit: 3a084ddb4bf299a6e898a9a07c89f3917f0713f7
+(since Linux 3.5)
 structure similar to
 .BR IP_ADD_MEMBERSHIP .
 .IP
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
