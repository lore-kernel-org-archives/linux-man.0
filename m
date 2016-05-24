From: Fabien Siron <fabien.siron-ZrNlpQwM5lQ@public.gmane.org>
Subject: [PATCH] netlink.7 : Change NETLINK_INET_DIAG to NETLINK_SOCK_DIAG
Date: Tue, 24 May 2016 10:42:19 +0000
Message-ID: <1464086539-30865-2-git-send-email-fabien.siron@epita.fr>
References: <1464086539-30865-1-git-send-email-fabien.siron@epita.fr>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464086539-30865-1-git-send-email-fabien.siron-ZrNlpQwM5lQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Fabien Siron <fabien.siron-ZrNlpQwM5lQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/netlink.7 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/man7/netlink.7 b/man7/netlink.7
index 513f854..88e3dc1 100644
--- a/man7/netlink.7
+++ b/man7/netlink.7
@@ -62,9 +62,9 @@ Used by
 .I ip_queue
 kernel module.
 .TP
-.B NETLINK_INET_DIAG
-.\" FIXME More details on NETLINK_INET_DIAG needed.
-INET socket monitoring.
+.B NETLINK_SOCK_DIAG
+.\" FIXME More details on NETLINK_SOCK_DIAG needed.
+Socket monitoring.
 .TP
 .B NETLINK_NFLOG
 Netfilter/iptables ULOG.
@@ -383,7 +383,7 @@ NETLINK_KOBJECT_UEVENT appeared in Linux 2.6.10.
 
 NETLINK_W1 and NETLINK_FIB_LOOKUP appeared in Linux 2.6.13.
 
-NETLINK_INET_DIAG, NETLINK_CONNECTOR and NETLINK_NETFILTER appeared in
+NETLINK_SOCK_DIAG, NETLINK_CONNECTOR and NETLINK_NETFILTER appeared in
 Linux 2.6.14.
 
 NETLINK_GENERIC and NETLINK_ISCSI appeared in Linux 2.6.15.
-- 
2.8.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
