From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] reboot.2: tfix (double word) and minor format issue
Date: Wed,  8 Jan 2014 23:54:28 +0100
Message-ID: <1389221668-25712-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/reboot.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/reboot.2 b/man2/reboot.2
index aa55cae..152f346 100644
--- a/man2/reboot.2
+++ b/man2/reboot.2
@@ -113,7 +113,7 @@ data will be lost.
 .TP
 .BR LINUX_REBOOT_CMD_KEXEC
 .RB ( RB_KEXEC ,
-0x45584543, since Linux Linux 2.6.13)
+0x45584543, since Linux 2.6.13).
 Execute a kernel that has been loaded earlier with
 .BR kexec_load (2).
 This option is available only if the kernel was configured with
-- 
1.8.5.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
