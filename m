From: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 3/3] netlink.7: Add references to sock_diag(7)
Date: Wed, 7 Dec 2016 17:00:15 +0300
Message-ID: <20161207140014.GE1100@altlinux.org>
References: <cover.1481118042.git.ldv@altlinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cover.1481118042.git.ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pavel Emelyanov <xemul-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
---
 man7/netlink.7 | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/man7/netlink.7 b/man7/netlink.7
index 4c43344..45ccb74 100644
--- a/man7/netlink.7
+++ b/man7/netlink.7
@@ -63,7 +63,9 @@ Used by
 kernel module.
 .TP
 .BR NETLINK_INET_DIAG " (since Linux 2.6.14, also known as " NETLINK_SOCK_DIAG " since Linux 3.3)"
-Query information about sockets of various protocol families from the kernel.
+Query information about sockets of various protocol families from the kernel
+(see
+.BR sock_diag (7)).
 .TP
 .BR NETLINK_NFLOG
 Netfilter/iptables ULOG.
@@ -538,7 +540,8 @@ for (nh = (struct nlmsghdr *) buf; NLMSG_OK (nh, len);
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
