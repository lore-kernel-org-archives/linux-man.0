From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] getifaddrs.3, rtnetlink.7: stats interface is struct rtnl_link_stats, not net_device_stats
Date: Mon, 23 Jul 2012 22:12:53 +0200
Message-ID: <1343074373-25922-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Bug-Debian: http://bugs.debian.org/526778
Author: Julien Cristau <jcristau-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
 man3/getifaddrs.3 |    4 ++--
 man7/rtnetlink.7  |    4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/man3/getifaddrs.3 b/man3/getifaddrs.3
index d2cf120..996593c 100644
--- a/man3/getifaddrs.3
+++ b/man3/getifaddrs.3
@@ -191,9 +191,9 @@ and its physical layer.
 In this case, the
 .I ifa_data
 field may contain a pointer to a
-.IR "struct net_device_stats" ,
+.IR "struct rtnl_link_stats" ,
 defined in
-.IR <linux/netdevice.h> ,
+.IR <linux/if_link.h> ,
 which contains various interface attributes and statistics.
 .SH EXAMPLE
 The program below demonstrates the use of
diff --git a/man7/rtnetlink.7 b/man7/rtnetlink.7
index 3037737..a8e9e83 100644
--- a/man7/rtnetlink.7
+++ b/man7/rtnetlink.7
@@ -14,6 +14,8 @@ rtnetlink \- Linux IPv4 routing socket
 .SH SYNOPSIS
 .B #include <asm/types.h>
 .br
+.B #include <linux/if_link.h>
+.br
 .B #include <linux/netlink.h>
 .br
 .B #include <linux/rtnetlink.h>
@@ -102,7 +104,7 @@ T}:Interface Statistics.
 .TE
 .ad
 .sp
-The value type for IFLA_STATS is \fIstruct net_device_stats\fP.
+The value type for IFLA_STATS is \fIstruct rtnl_link_stats\fP.
 .TP
 .BR RTM_NEWADDR ", " RTM_DELADDR ", " RTM_GETADDR
 Add, remove or receive information about an IP address associated with
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
