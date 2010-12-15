From: =?ISO-8859-15?Q?Erik_Inge_Bols=F8?= <knan-qtFA7gTkXNbOT5slSWiCZNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] clone.2: correct required capabilities for CLONE_NEWNET
Date: Wed, 15 Dec 2010 22:47:26 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1012152243350.19517@login.redpill-linpro.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man2/clone.2 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ref: own testing with setcap and unshare -n /bin/bash
minimum set required turns out to be
# setcap cap_sys_admin,cap_net_raw+ep /usr/bin/unshare
$ unshare -n /bin/bash
$
$ lsb_release -ir
Distributor ID:	Ubuntu
Release:	10.04
$ uname -a
Linux ip 2.6.32-26-generic #48-Ubuntu SMP Wed Nov 24 10:14:11 UTC 2010 x86_64 GNU/Linux

diff --git a/man2/clone.2 b/man2/clone.2
index 4085179..edb3e91 100644
--- a/man2/clone.2
+++ b/man2/clone.2
@@ -322,7 +322,7 @@ initial network namespace (not to the parent of the process).
 Use of this flag requires: a kernel configured with the
 .B CONFIG_NET_NS
 option and that the process be privileged
-.RB ( CAP_SYS_ADMIN ).
+.RB ( CAP_NET_RAW | CAP_SYS_ADMIN ).
 .TP
 .BR CLONE_NEWNS " (since Linux 2.4.19)"
 Start the child in a new mount namespace.
-- 
1.7.0.4
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
