From: "Maxin John" <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] mount.2 : Add MS_SILENT mountflag
Date: Tue, 30 Sep 2008 17:23:44 +0530
Message-ID: <9debc4410809300453p638d3515sc2ae330263039b9c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: tytso-3s7WtUTddSA@public.gmane.org, Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, tytso-AKGzg7BKzIDYtjvyW6yDsg@public.gmane.org
List-Id: linux-man@vger.kernel.org

Dear Michael,

 The MS_VERBOSE in mountflags option of mount system call was replaced
by MS_SILENT in Kernel version 2.6.17
(http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=9b04c997b1120feefa1e6ee8e2902270bc055cd2
).

The LKML thread regarding this commit:
http://linux.derkeiler.com/Mailing-Lists/Kernel/2006-03/msg08081.html

eg:
mount("/dev/sda1", "/mnt/test", "ext3", MS_SILENT, "");

The patch also includes some miscellaneous cleanups of the mount.2 man page.

Kindly let me know if there are any issues with respect to this patch.

Cheers,

Maxin B. John
Sony India Software Center
Bangalore, India

Signed-off-by: Maxin B. John <maxin.john-qujY0cBTTHtBDgjK7y7TUQ@public.gmane.org>
-------

diff -uNr man-pages-3.10/man2/mount.2 man-pages-3.10_mount/man2/mount.2
--- man-pages-3.10/man2/mount.2	2008-09-23 19:22:25.000000000 +0530
+++ man-pages-3.10_mount/man2/mount.2	2008-09-30 17:15:29.087697160 +0530
@@ -128,7 +128,6 @@
 Since Linux 2.6.26, the
 .B MS_RDONLY
 flag is honored when making a bind mount.
-Since Linux 2.6.2
 .TP
 .BR MS_DIRSYNC " (since Linux 2.5.19)"
 Make directory changes on this file system synchronous.
@@ -228,6 +227,9 @@
 .BR MS_NODEV ,
 .BR MS_NOEXEC .
 .TP
+.B MS_SILENT " (Linux 2.6.17 onwards)"
+This flag suppresses the display of verbose messages.
+.TP
 .B MS_SYNCHRONOUS
 Make writes on this file system synchronous (as though
 the

-------
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
