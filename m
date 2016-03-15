From: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 3/4] netlink.7: Rename NETLINK_INET_DIAG to NETLINK_SOCK_DIAG
Date: Tue, 15 Mar 2016 20:26:10 +0300
Message-ID: <20160315172610.GD2903@altlinux.org>
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
 man7/netlink.7 | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/man7/netlink.7 b/man7/netlink.7
index 513f854..9462862 100644
--- a/man7/netlink.7
+++ b/man7/netlink.7
@@ -62,9 +62,9 @@ Used by
 .I ip_queue
 kernel module.
 .TP
-.B NETLINK_INET_DIAG
-.\" FIXME More details on NETLINK_INET_DIAG needed.
-INET socket monitoring.
+.BR NETLINK_SOCK_DIAG " (formerly known as " NETLINK_INET_DIAG )
+Query information about sockets of various protocol families
+from the kernel.
 .TP
 .B NETLINK_NFLOG
 Netfilter/iptables ULOG.
@@ -383,10 +383,12 @@ NETLINK_KOBJECT_UEVENT appeared in Linux 2.6.10.
 
 NETLINK_W1 and NETLINK_FIB_LOOKUP appeared in Linux 2.6.13.
 
-NETLINK_INET_DIAG, NETLINK_CONNECTOR and NETLINK_NETFILTER appeared in
-Linux 2.6.14.
+NETLINK_CONNECTOR and NETLINK_NETFILTER appeared in Linux 2.6.14.
 
 NETLINK_GENERIC and NETLINK_ISCSI appeared in Linux 2.6.15.
+
+NETLINK_INET_DIAG appeared in Linux 2.6.14,
+in Linux 3.3 it was renamed to NETLINK_SOCK_DIAG.
 .SH NOTES
 It is often better to use netlink via
 .I libnetlink
-- 
ldv

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
