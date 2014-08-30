From: Holger Hans Peter Freyther <holger-/0vNEYwyzy+/WdZNMWml2A@public.gmane.org>
Subject: [PATCH] rtnetlink: Fix parameters for the send call in the example
Date: Sat, 30 Aug 2014 15:36:33 +0200
Message-ID: <1409405793-28111-1-git-send-email-holger@moiji-mobile.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Holger Hans Peter Freyther <holger-/0vNEYwyzy+/WdZNMWml2A@public.gmane.org>
---
 man3/rtnetlink.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/rtnetlink.3 b/man3/rtnetlink.3
index 6595bc0..213234d 100644
--- a/man3/rtnetlink.3
+++ b/man3/rtnetlink.3
@@ -116,7 +116,7 @@ Creating a rtnetlink message to set the MTU of a device:
     req.n.nlmsg_len = NLMSG_ALIGN(req.nh.nlmsg_len) +
                                   RTA_LENGTH(sizeof(mtu));
     memcpy(RTA_DATA(rta), &mtu, sizeof(mtu));
-    send(rtnetlink_sk, &req, req.nh.nlmsg_len);
+    send(rtnetlink_sk, &req, req.nh.nlmsg_len, 0);
 .fi
 .SH SEE ALSO
 .BR netlink (3),
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
