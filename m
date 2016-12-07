From: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 2/3] netlink.7: Document NETLINK_INET_DIAG rename to NETLINK_SOCK_DIAG
Date: Wed, 7 Dec 2016 16:59:58 +0300
Message-ID: <20161207135958.GD1100@altlinux.org>
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
 man7/netlink.7 | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/man7/netlink.7 b/man7/netlink.7
index 57bab5f..4c43344 100644
--- a/man7/netlink.7
+++ b/man7/netlink.7
@@ -62,9 +62,8 @@ Used by
 .I ip_queue
 kernel module.
 .TP
-.BR NETLINK_INET_DIAG " (since Linux 2.6.14)"
-.\" FIXME More details on NETLINK_INET_DIAG needed.
-INET socket monitoring.
+.BR NETLINK_INET_DIAG " (since Linux 2.6.14, also known as " NETLINK_SOCK_DIAG " since Linux 3.3)"
+Query information about sockets of various protocol families from the kernel.
 .TP
 .BR NETLINK_NFLOG
 Netfilter/iptables ULOG.
-- 
ldv

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
