From: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] reboot.2: Add documentation of LINUX_REBOOT_SW_SUSPEND
Date: Mon, 30 Sep 2013 20:41:44 +0200
Message-ID: <1380566504-9669-2-git-send-email-eliedebrauwer@gmail.com>
References: <1380566504-9669-1-git-send-email-eliedebrauwer@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380566504-9669-1-git-send-email-eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

When reboot() is called with LINUX_REBOOT_SW_SUSPEND and CONFIG_HIBERNATION
is set, the hibernation process will be called.

E.g kernel/reboot.c contains:

 267#ifdef CONFIG_HIBERNATION
 268        case LINUX_REBOOT_CMD_SW_SUSPEND:
 269                ret = hibernate();
 270                break;
 271#endif

Signed-off-by: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/reboot.2 |   17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/man2/reboot.2 b/man2/reboot.2
index 0ed6355..d4a5a0e 100644
--- a/man2/reboot.2
+++ b/man2/reboot.2
@@ -25,7 +25,7 @@
 .\" Modified, 27 May 2004, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 .\"     Added notes on capability requirements
 .\"
-.TH REBOOT 2 2010-10-31 "Linux" "Linux Programmer's Manual"
+.TH REBOOT 2 2013-09-30 "Linux" "Linux Programmer's Manual"
 .SH NAME
 reboot \- reboot or enable/disable Ctrl-Alt-Del
 .SH SYNOPSIS
@@ -101,21 +101,22 @@ the action associated with
 .BR LINUX_REBOOT_CMD_RESTART .
 .TP
 .B LINUX_REBOOT_CMD_HALT
-(RB_HALT_SYSTEM, 0xcdef0123; since 1.1.76).
+(RB_HALT_SYSTEM, 0xcdef0123; since Linux 1.1.76).
 The message "System halted." is printed, and the system is halted.
 Control is given to the ROM monitor, if there is one.
 If not preceded by a
 .BR sync (2),
 data will be lost.
 .TP
-.BR LINUX_REBOOT_CMD_KEXEC " (since Linux 2.6.13)"
+.BR LINUX_REBOOT_CMD_KEXEC 
+(0x45584543; since Linux 2.6.13).
 Execute a kernel that has been loaded earlier with
 .BR kexec_load (2).
 This option is available only if the kernel was configured with
 .BR CONFIG_KEXEC .
 .TP
 .B LINUX_REBOOT_CMD_POWER_OFF
-(RB_POWER_OFF, 0x4321fedc; since 2.1.30).
+(RB_POWER_OFF, 0x4321fedc; since Linux 2.1.30).
 The message "Power down." is printed, the system is stopped,
 and all power is removed from the system, if possible.
 If not preceded by a
@@ -131,7 +132,7 @@ If not preceded by a
 data will be lost.
 .TP
 .B LINUX_REBOOT_CMD_RESTART2
-(0xa1b2c3d4; since 2.1.30).
+(0xa1b2c3d4; since Linux 2.1.30).
 The message "Restarting system with command \(aq%s\(aq" is printed,
 and a restart (using the command string given in
 .IR arg )
@@ -139,6 +140,12 @@ is performed immediately.
 If not preceded by a
 .BR sync (2),
 data will be lost.
+.TP
+.BR LINUX_REBOOT_CMD_SW_SUSPEND 
+(0xd000fce2; since Linux 2.5.18).
+The system is suspended (hibernated) to disk.
+This option is available only if the kernel was configured with
+.BR CONFIG_HIBERNATION .
 .LP
 Only the superuser may call
 .BR reboot ().
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
