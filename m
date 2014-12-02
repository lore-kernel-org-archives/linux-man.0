From: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] netlink: add NETLINK_CRYPTO
Date: Tue, 02 Dec 2014 13:16:23 +0100
Message-ID: <3063949.uKkJtgaVA5@tauon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Add the NETLINK_CRYPTO reference to netlink(7).

Signed-off-by: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
---
 man7/netlink.7 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man7/netlink.7 b/man7/netlink.7
index be7814a..bfeb381 100644
--- a/man7/netlink.7
+++ b/man7/netlink.7
@@ -113,6 +113,11 @@ Kernel messages to user space.
 .TP
 .B NETLINK_GENERIC
 Generic netlink family for simplified netlink usage.
+.TP
+.B NETLINK_CRYPTO
+Netlink interface to request information about ciphers registered
+with the kernel crypto API as well as allow configuration of the
+kernel crypto API.
 .PP
 Netlink messages consist of a byte stream with one or multiple
 .I nlmsghdr
-- 
1.9.3


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
