From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] netlink.7: nlmsg_pid/nl_pid is *not* the process ID
Date: Tue, 24 Jul 2012 00:59:47 +0200
Message-ID: <1343084387-18616-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

See cf130cb102487723bdfc53e4abde1227a7563797 in kernel
Reported-By: Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>
Bug-Debian: http://bugs.debian.org/383296
---
 man7/netlink.7 |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man7/netlink.7 b/man7/netlink.7
index 9f2e654..e918dce 100644
--- a/man7/netlink.7
+++ b/man7/netlink.7
@@ -139,7 +139,7 @@ struct nlmsghdr {
     __u16 nlmsg_type;   /* Type of message content. */
     __u16 nlmsg_flags;  /* Additional flags. */
     __u32 nlmsg_seq;    /* Sequence number. */
-    __u32 nlmsg_pid;    /* PID of the sending process. */
+    __u32 nlmsg_pid;    /* Sending process port ID */
 };
 .fi
 .in
@@ -291,7 +291,7 @@ not equal 0).
 struct sockaddr_nl {
     sa_family_t     nl_family;  /* AF_NETLINK */
     unsigned short  nl_pad;     /* Zero. */
-    pid_t           nl_pid;     /* Process ID. */
+    pid_t           nl_pid;     /* port ID. */
     __u32           nl_groups;  /* Multicast groups mask. */
 };
 .fi
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
