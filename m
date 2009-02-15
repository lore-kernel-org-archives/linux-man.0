From: Parag Warudkar <parag.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] vm86.2: Add 32-bit specific to CONFORMING TO
Date: Sun, 15 Feb 2009 14:27:26 -0500 (EST)
Message-ID: <alpine.LFD.2.00.0902151421470.19327@localhost.localdomain>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

While playing around with Wine on 64-bit kernel I noticed that vm86 is 
not supposed to work there. 

It might be a good idea to clarify that in the vm86 man page.

--- man-pages-3.18/man2/vm86.2	2009-02-08 21:14:13.000000000 -0500
+++ man-pages-3.18-wk/man2/vm86.2	2009-02-15 14:19:08.072201220 -0500
@@ -69,7 +69,7 @@
 (This is a kernel sanity check; the saved
 stack should only exist within vm86 mode itself.)
 .SH "CONFORMING TO"
-This call is specific to Linux on Intel processors, and should not be
+This call is specific to 32-bit Linux on Intel processors, and should not be
 used in programs intended to be portable.
 .SH COLOPHON
 This page is part of release 3.18 of the Linux
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
