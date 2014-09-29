From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] fanotify_mark.2: Document bugs fixed in Linux 3.15
Date: Mon, 29 Sep 2014 16:48:13 +0200
Message-ID: <5429712D.6030402@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Heinrich,

I've drafted the patch below for fanotify_mark.2. Does it 
look okay to you (including the commit IDs)?

Cheers,

Michael

diff --git a/man2/fanotify_mark.2 b/man2/fanotify_mark.2
index 5ea34b6..05ad4b4 100644
--- a/man2/fanotify_mark.2
+++ b/man2/fanotify_mark.2
@@ -303,10 +303,9 @@ was introduced in version 2.6.36 of the Linux kernel and enabled in version
 .SH CONFORMING TO
 This system call is Linux-specific.
 .SH BUGS
-As of Linux 3.15,
-the following bugs exist:
+The following bugs were present in Linux kernels before version 3.15:
 .IP * 3
-.\" FIXME . Patch is in next-20140424.
+.\" Fixed by commit 0a8dd2db579f7a0ac7033d6b857c3d5dbaa77563
 If
 .I flags
 contains
@@ -316,13 +315,13 @@ and
 .I pathname
 must specify a valid filesystem object, even though this object is not used.
 .IP *
-.\" FIXME . Patch is in next-20140424.
+.\" Fixed by commit d4c7cf6cffb1bc711a833b5e304ba5bcfe76398b
 .BR readdir (2)
 does not generate a
 .B FAN_ACCESS
 event.
 .IP *
-.\" FIXME . Patch proposed.
+.\" Fixed by commit cc299a98eb13a9853675a9cbb90b30b4011e1406
 If
 .BR fanotify_mark (2)
 is called with


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
