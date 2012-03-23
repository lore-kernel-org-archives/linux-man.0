From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] rtnetlink.3: fix example code, use RTA_LENGTH macro
Date: Fri, 23 Mar 2012 01:31:26 +0100
Message-ID: <1332462686-26100-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

>From Kirill Brilliantov, http://bugs.debian.org/655088
---
 man3/rtnetlink.3 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man3/rtnetlink.3 b/man3/rtnetlink.3
index 29d7765..ada93e2 100644
--- a/man3/rtnetlink.3
+++ b/man3/rtnetlink.3
@@ -109,7 +109,7 @@ Creating a rtnetlink message to set the MTU of a device:
     rta = (struct rtattr *)(((char *) &req) +
                              NLMSG_ALIGN(req.nh.nlmsg_len));
     rta\->rta_type = IFLA_MTU;
-    rta\->rta_len = sizeof(unsigned int);
+    rta\->rta_len = RTA_LENGTH(sizeof(unsigned int));
     req.n.nlmsg_len = NLMSG_ALIGN(req.nh.nlmsg_len) +
                                   RTA_LENGTH(sizeof(mtu));
     memcpy(RTA_DATA(rta), &mtu, sizeof(mtu));
-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
