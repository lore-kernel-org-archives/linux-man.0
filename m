From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: small improvement for initrd.4 (more)
Date: Sun, 25 Jul 2010 16:22:08 +0400
Message-ID: <20100725162208.791257bd@keeper.home.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/J./WPmI1bsIae=tw.Ft02lV"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--MP_/J./WPmI1bsIae=tw.Ft02lV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.

--- man-pages-git/man4/initrd.4 2010-03-26 17:46:41.000000000 +0300
+++ /tmp/initrd.4       2010-07-25 16:15:46.000000000 +0400
@@ -246,7 +246,7 @@
 For more information on setting the root file system see also the
 .BR LILO
 and
-LOADLIN
+.BR LOADLIN
 documentation.
 .PP
 It is also possible for the
@@ -289,7 +289,7 @@
 normal root device to the NFS directory
 .I /var/nfsroot
 on a local networked NFS server with IP number 193.8.232.7 for a system with
-IP number 193.8.232.7 and named "idefix":
+IP number 193.8.232.2 and named "idefix":
 .nf
 
     echo /var/nfsroot >/proc/sys/kernel/nfs-root-name
@@ -408,7 +408,7 @@
 from CD-ROM without the need of any floppies.
 The distribution could also use a
 .B LILO
-boot floppy and then bootstrap a bigger ram disk via
+boot floppy and then bootstrap a bigger RAM disk via
 .IR /dev/initrd
 from the CD-ROM.
 .\"


-- 
Best Regards,
Yuri Kozlov


--MP_/J./WPmI1bsIae=tw.Ft02lV
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=initrd.4.patch

--- man-pages-git/man4/initrd.4	2010-03-26 17:46:41.000000000 +0300
+++ /tmp/initrd.4	2010-07-25 16:15:46.000000000 +0400
@@ -246,7 +246,7 @@
 For more information on setting the root file system see also the
 .BR LILO
 and
-LOADLIN
+.BR LOADLIN
 documentation.
 .PP
 It is also possible for the
@@ -289,7 +289,7 @@
 normal root device to the NFS directory
 .I /var/nfsroot
 on a local networked NFS server with IP number 193.8.232.7 for a system with
-IP number 193.8.232.7 and named "idefix":
+IP number 193.8.232.2 and named "idefix":
 .nf
 
     echo /var/nfsroot >/proc/sys/kernel/nfs-root-name
@@ -408,7 +408,7 @@
 from CD-ROM without the need of any floppies.
 The distribution could also use a
 .B LILO
-boot floppy and then bootstrap a bigger ram disk via
+boot floppy and then bootstrap a bigger RAM disk via
 .IR /dev/initrd
 from the CD-ROM.
 .\"

--MP_/J./WPmI1bsIae=tw.Ft02lV--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
