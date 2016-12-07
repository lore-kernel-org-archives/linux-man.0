From: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] netlink.7: ffix
Date: Wed, 7 Dec 2016 17:04:24 +0300
Message-ID: <20161207140424.GA1138@altlinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
---
 man7/netlink.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/netlink.7 b/man7/netlink.7
index 45ccb74..44f996f 100644
--- a/man7/netlink.7
+++ b/man7/netlink.7
@@ -95,7 +95,7 @@ See
 .I Documentation/connector/*
 in the Linux kernel source tree for further information.
 .TP
-.B NETLINK_NETFILTER " (since Linux 2.6.14)"
+.BR NETLINK_NETFILTER " (since Linux 2.6.14)"
 .\" FIXME More details on NETLINK_NETFILTER needed.
 Netfilter subsystem.
 .TP

-- 
ldv
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
