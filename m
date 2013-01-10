From: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] proc.5: add dmesg_restrict and add permission details
Date: Thu, 10 Jan 2013 13:47:07 -0800
Message-ID: <20130110214707.GA29277@www.outflux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Adds a section for dmesg_restrict which is already mentioned in
syslog(2). This also re-orders proc.5 alphabetically and includes
references to the permissions needed to make changes to the sysctl values since Linux 3.4.

Signed-off-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 man5/proc.5 |   29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/man5/proc.5 b/man5/proc.5
index c29eacc..b4bcc1b 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -58,7 +58,7 @@
 .\" to see what information could be imported from that file
 .\" into this file.
 .\"
-.TH PROC 5 2012-12-27 "Linux" "Linux Programmer's Manual"
+.TH PROC 5 2013-01-10 "Linux" "Linux Programmer's Manual"
 .SH NAME
 proc \- process information pseudo-file system
 .SH DESCRIPTION
@@ -2560,11 +2560,16 @@ mode, the ctrl-alt-del is intercepted by the program before it
 ever reaches the kernel tty layer, and it's up to the program
 to decide what to do with it.
 .TP
-.I /proc/sys/kernel/hotplug
-This file
-contains the path for the hotplug policy agent.
-The default value in this file is
-.IR /sbin/hotplug .
+.IR /proc/sys/kernel/dmesg_restrict " (since Linux 2.6.37)"
+The value in this file determines who can see kernel syslog contents.
+A value of 0 in this file imposes no restrictions. If the value is 1,
+only privileged users can read the kernel syslog. (See
+.BR syslog (2)
+for more details.) Since Linux 3.4,
+.\" commit 620f6e8e855d6d447688a5f67a4e176944a084e8
+only users with the
+.BR CAP_SYS_ADMIN
+capability may change the value.
 .TP
 .IR /proc/sys/kernel/domainname " and " /proc/sys/kernel/hostname
 can be used to set the NIS/YP domainname and the
@@ -2601,6 +2606,12 @@ see the
 .BR hostname (1)
 man page.
 .TP
+.I /proc/sys/kernel/hotplug
+This file
+contains the path for the hotplug policy agent.
+The default value in this file is
+.IR /sbin/hotplug .
+.TP
 .I /proc/sys/kernel/htab-reclaim
 (PowerPC only) If this file is set to a nonzero value,
 the PowerPC htab
@@ -2627,7 +2638,11 @@ of the user's capabilities.
 The initial default value for this file was 1,
 but the default was changed
 .\" commit 411f05f123cbd7f8aa1edcae86970755a6e2a9d9
-to 0 in Linux 2.6.39.
+to 0 in Linux 2.6.39. Since Linux 3.4,
+.\" commit 620f6e8e855d6d447688a5f67a4e176944a084e8
+only users with the
+.BR CAP_SYS_ADMIN
+capability can change the sysctl value.
 .TP
 .I /proc/sys/kernel/l2cr
 (PowerPC only) This file
-- 
1.7.9.5


-- 
Kees Cook
Chrome OS Security
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
