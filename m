From: Radek Pazdera <rpazdera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ip.7: Adding IP_MULTICAST_ALL Option
Date: Wed, 20 Mar 2013 17:40:11 +0100
Message-ID: <1363797611-20016-1-git-send-email-rpazdera@redhat.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Radek Pazdera <rpazdera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This commit adds documentation for the IP_MULTICAST_ALL socket option.

The option was added to the Linux kernel in 2.6.31:

    Author Nivedita Singhvi <niv-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
    Commit f771bef98004d9d141b085d987a77d06669d4f4f

The description is based on a previous one [3] posted by the original
author of the code -- Nivedita, but it is slightly re-worded.

I tested it myself and it works as described.

References:
    [1] http://lxr.free-electrons.com/source/net/ipv4/ip_sockglue.c#L972
    [2] http://lxr.free-electrons.com/source/net/ipv4/igmp.c#L2267
    [3] http://patchwork.ozlabs.org/patch/28902/

Signed-off-by: Radek Pazdera <rpazdera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man7/ip.7 |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/man7/ip.7 b/man7/ip.7
index 9bef3bf..cc8eea6 100644
--- a/man7/ip.7
+++ b/man7/ip.7
@@ -29,9 +29,6 @@
 .\"	MCAST_JOIN_SOURCE_GROUP (2.4.22 / 2.6)
 .\"	MCAST_LEAVE_SOURCE_GROUP (2.4.22 / 2.6)
 .\"	MCAST_MSFILTER (2.4.22 / 2.6)
-.\"	IP_MULTICAST_ALL (2.6.31)
-.\"	    commit f771bef98004d9d141b085d987a77d06669d4f4f
-.\"	    Author: Nivedita Singhvi <niv-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
 .\"	IP_UNICAST_IF (3.4)
 .\"	    commit 76e21053b5bf33a07c76f99d27a74238310e3c71
 .\"	    Author: Erich E. Hoover <ehoover-/qOHPfZA4H6HXe+LvDLADg@public.gmane.org>
@@ -525,6 +522,17 @@ This is also particularly useful for diagnostic tools such as
 that wish to deliberately send probe packets larger than
 the observed Path MTU.
 .TP
+.BR IP_MULTICAST_ALL " (since Linux 2.6.31)"
+This option can be used to modify the delivery policy of multicast messages
+to sockets bound to the wildcard
+.B INADDR_ANY
+address. The argument is a boolean integer (defaults to 1). If set to 1,
+the socket will receive messages from all the groups that have been joined
+globally on the whole system. Otherwise, it will deliver only messages from
+the groups that have been explicitly joined (for example via the
+.B IP_ADD_MEMBERSHIP
+option) on this particular socket.
+.TP
 .BR IP_MULTICAST_IF " (since Linux 1.2)"
 Set the local device for a multicast socket.
 Argument is an
-- 
1.7.7.6

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
