From: Gao feng <gaofeng-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ipv6.7: add description of getsockopt for IPV6_MTU
Date: Mon, 10 Dec 2012 14:02:28 +0800
Message-ID: <1355119348-3545-1-git-send-email-gaofeng@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gao feng <gaofeng-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

In ipv4,IP_MTU is only supported by getsockopt.
In ipv6,we can use IPV6_MTU to set socket's mtu,
but the return value of getsockopt is the path mtu.
it may make people confusion.

Add the description of the getsockopt for IPV6_MTU to
tell people the mtu of getting and setting is different.

Signed-off-by: Gao feng <gaofeng-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man7/ipv6.7 |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/man7/ipv6.7 b/man7/ipv6.7
index e13597c..888c6fa 100644
--- a/man7/ipv6.7
+++ b/man7/ipv6.7
@@ -147,6 +147,10 @@ structure.
 .\" should be documented
 .TP
 .B IPV6_MTU
+Retrieve the current known path MTU of the current socket.
+Only valid when the socket has been connected.
+Returns an integer.
+
 Set the MTU to be used for the socket.
 The MTU is limited by the device
 MTU or the path MTU when path MTU discovery is enabled.
-- 
1.7.7.6

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
