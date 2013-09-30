From: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] reboot.2: Mention RB_POWER_OFF
Date: Mon, 30 Sep 2013 20:41:43 +0200
Message-ID: <1380566504-9669-1-git-send-email-eliedebrauwer@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The manpage did not mention RB_POWER_OFF which is the glibc symbolic name
for LINUX_REBOOT_CMD_POWER_OFF.

edb@lapedb:/usr/include$ cat x86_64-linux-gnu/sys/reboot.h  | grep POWER_OFF
 define RB_POWER_OFF	0x4321fedc

Signed-off-by: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/reboot.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/reboot.2 b/man2/reboot.2
index b25d62c..0ed6355 100644
--- a/man2/reboot.2
+++ b/man2/reboot.2
@@ -115,7 +115,7 @@ This option is available only if the kernel was configured with
 .BR CONFIG_KEXEC .
 .TP
 .B LINUX_REBOOT_CMD_POWER_OFF
-(0x4321fedc; since 2.1.30).
+(RB_POWER_OFF, 0x4321fedc; since 2.1.30).
 The message "Power down." is printed, the system is stopped,
 and all power is removed from the system, if possible.
 If not preceded by a
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
