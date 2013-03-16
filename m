From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] capabilities.7: pfix
Date: Sat, 16 Mar 2013 17:37:43 -0400
Message-ID: <1363469864-1679-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/capabilities.7 |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/man7/capabilities.7 b/man7/capabilities.7
index 19a7309..61a340e 100644
--- a/man7/capabilities.7
+++ b/man7/capabilities.7
@@ -190,13 +190,13 @@ Perform various network-related operations:
 .IP * 2
 interface configuration;
 .IP *
-administration of IP firewall, masquerading, and accounting
+administration of IP firewall, masquerading, and accounting;
 .IP *
 modify routing tables;
 .IP *
 bind to any address for transparent proxying;
 .IP *
-set type-of-service (TOS)
+set type-of-service (TOS);
 .IP *
 clear driver statistics;
 .IP *
@@ -368,7 +368,7 @@ employ the
 .B TIOCSTI
 .BR ioctl (2)
 to insert characters into the input queue of a terminal other than
-the caller's controlling terminal.
+the caller's controlling terminal;
 .IP *
 employ the obsolete
 .BR nfsservctl (2)
@@ -482,7 +482,7 @@ employ the
 operation;
 .IP *
 open devices for accessing x86 model-specific registers (MSRs, see
-.BR msr (4))
+.BR msr (4));
 .IP *
 update
 .IR /proc/sys/vm/mmap_min_addr ;
@@ -549,7 +549,7 @@ override the
 limit when setting the capacity of a pipe using the
 .B F_SETPIPE_SZ
 .BR fcntl (2)
-command.
+command;
 .IP *
 use
 .BR F_SETPIPE_SZ
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
