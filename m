From: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 4/4] netlink.7: Add references to sock_diag(7)
Date: Tue, 15 Mar 2016 20:26:14 +0300
Message-ID: <20160315172614.GE2903@altlinux.org>
References: <cover.1458040999.git.ldv@altlinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cover.1458040999.git.ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Pavel Emelyanov <xemul-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
---
 man7/netlink.7 | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/man7/netlink.7 b/man7/netlink.7
index 9462862..0d5ae05 100644
--- a/man7/netlink.7
+++ b/man7/netlink.7
@@ -64,7 +64,8 @@ kernel module.
 .TP
 .BR NETLINK_SOCK_DIAG " (formerly known as " NETLINK_INET_DIAG )
 Query information about sockets of various protocol families
-from the kernel.
+from the kernel (see
+.BR sock_diag (7)).
 .TP
 .B NETLINK_NFLOG
 Netfilter/iptables ULOG.
@@ -476,7 +477,8 @@ for (nh = (struct nlmsghdr *) buf; NLMSG_OK (nh, len);
 .BR cmsg (3),
 .BR netlink (3),
 .BR capabilities (7),
-.BR rtnetlink (7)
+.BR rtnetlink (7),
+.BR sock_diag (7)
 
 .UR ftp://ftp.inr.ac.ru\:/ip-routing\:/iproute2*
 information about libnetlink
-- 
ldv

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
