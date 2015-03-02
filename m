From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] ioctl_list.2: include/linux/ext2_fs.h
Date: Mon,  2 Mar 2015 21:04:22 +0100
Message-ID: <1425326662-7567-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Include linux/ext2_fs.h does not contain any ioctl definitions
anymore.

Request codes EXT2_IOC* have been replaced by FS_IOC* in
linux/fs.h.

Some definitions of FS_IOC_* use long* but the actual code expects
int* (see fs/ext2/ioctl.c).

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/ioctl_list.2 | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/man2/ioctl_list.2 b/man2/ioctl_list.2
index dc1505f..75fb3df 100644
--- a/man2/ioctl_list.2
+++ b/man2/ioctl_list.2
@@ -30,6 +30,9 @@
 .\"
 .\" 2015-02-21 Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
 .\"     SEE ALSO ioctl_fat(2), add FAT_IOCTL_GET_VOLUME_ID.
+.\"
+.\" 2015-03-02 Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
+.\"     EXT2_IOC* have been replaced by FS_IOC*.
 .TH IOCTL_LIST 2 2013-09-17 "Linux" "Linux Programmer's Manual"
 .SH NAME
 ioctl_list \- list of ioctl calls in Linux/i386 kernel
@@ -273,15 +276,6 @@ l l l.
 0x00435909	CYSETDEFTIMEOUT	int
 .TE
 
-// <include/linux/ext2_fs.h>
-.TS
-l l l.
-0x80046601	EXT2_IOC_GETFLAGS	int *
-0x40046602	EXT2_IOC_SETFLAGS	const int *
-0x80047601	EXT2_IOC_GETVERSION	int *
-0x40047602	EXT2_IOC_SETVERSION	const int *
-.TE
