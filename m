From: Andrea Remondini <andrea-zF+CBELTIi/h2jUh8lbIsg@public.gmane.org>
Subject: Proposed patch for: 'bootparam.7'
Date: Tue, 10 Nov 2009 21:44:08 +0100
Message-ID: <20091110204408.GA2734@acerrimo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

the enclosed patch documents the Linux kernel's 'resume' boot parameter.

The patch is to be applied to the 'bootparam.7' man page, as found in
version 3.23 of the man-pages.

The reported information was obtained from "The Linux BootPrompt-HowTo"
by Paul Gortmaker (v1.4, Mar 21, 2003) and tested on Slackware 12.2
using version 2.6.27.7 of the Linux kernel.

Regards,
Andrea Remondini



-----BEGIN DIFF-----

--- bootparam.7	2009-11-10 19:59:36.000000000 +0100
+++ bootparam.7.new	2009-11-10 20:58:23.000000000 +0100
@@ -221,6 +221,12 @@
 The choice between read-only and read/write can also be set using
 .BR rdev (8).
 .TP
+.B "'resume=...'"
+This tells the kernel the location of the suspend-to-disk data that you want the machine to resume from after hibernation.
+Usually, it is the same as your swap partition or file. Example:
+.IP
+.BI resume= /dev/hda2
+.TP
 .B "'reserve=...'"
 This is used to protect I/O port regions from probes.
 The form of the command is:

------END DIFF------
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
