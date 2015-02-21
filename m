From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] ioctl_list.2: SEE ALSO ioctl_fat.2
Date: Sat, 21 Feb 2015 15:21:27 +0100
Message-ID: <1424528487-15888-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

add FAT_IOCTL_GET_VOLUME_ID
SEE ALSO ioctl_fat.2

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/ioctl_list.2 | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/man2/ioctl_list.2 b/man2/ioctl_list.2
index d0d662f..d935f7d 100644
--- a/man2/ioctl_list.2
+++ b/man2/ioctl_list.2
@@ -27,6 +27,9 @@
 .\" 2007-12-29 Alain Portal <aportal-CD6X2pywdrkGaKE8qFNMvg@public.gmane.org> and Michael Kerrisk
 .\"     <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
 .\"          Various formatting improvements
+.\"
+.\" 2015-02-21 Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
+.\"     SEE ALSO ioctl_fat(2), add FAT_IOCTL_GET_VOLUME_ID.
 .TH IOCTL_LIST 2 2013-09-17 "Linux" "Linux Programmer's Manual"
 .SH NAME
 ioctl_list \- list of ioctl calls in Linux/i386 kernel
@@ -474,13 +477,15 @@ l l l l.
 0x000089E1	SIOCGETSGCNT	struct sioc_sg_req *	// I-O
 .TE
 
-// <include/linux/msdos_fs.h>
+// <include/linux/msdos_fs.h> see 
+.BR ioctl_fat (2)
 .TS
 l l l l.
 0x82307201	VFAT_IOCTL_READDIR_BOTH	struct dirent [2]
 0x82307202	VFAT_IOCTL_READDIR_SHORT	struct dirent [2]
 0x80047210	FAT_IOCTL_GET_ATTRIBUTES	__u32 *
 0x40047211	FAT_IOCTL_SET_ATTRIBUTES	const __u32 *
+0x80047213	FAT_IOCTL_GET_VOLUME_ID	__u32 *
 .TE
 
 // <include/linux/mtio.h>
@@ -961,4 +966,5 @@ l l l.
 0x00005404	SNDCTL_TMR_CONTINUE	TCSETSF
 .TE
 .SH SEE ALSO
-.BR ioctl (2)
+.BR ioctl (2),
+.BR ioctl_fat (2)
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
