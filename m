From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] ioctl_fat.2: d_ino, d_off, return value explained
Date: Fri,  6 Feb 2015 23:10:38 +0100
Message-ID: <1423260638-23504-1-git-send-email-xypron.glpk@gmx.de>
References: <87fvane3ch.fsf@mail.parknet.co.jp>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87fvane3ch.fsf-UIVanBePwB70ZhReMnHkpc8NsWr+9BEh@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: OGAWA Hirofumi <hirofumi-UIVanBePwB70ZhReMnHkpc8NsWr+9BEh@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andreas Dilger <adilger-m1MBpc4rdrD3fQ9qLvQP4Q@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The fields d_ino and d_off of structure __fat_dirent are explained.

The different return values of VFAT_IOCTL_READDIR_BOTH and
VFAT_IOCTL_READDIR_SHORT are explained.

The usage of the return value in the example is corrected.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/ioctl_fat.2 | 54 ++++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/man2/ioctl_fat.2 b/man2/ioctl_fat.2
index 55417f6..2c28421 100644
--- a/man2/ioctl_fat.2
+++ b/man2/ioctl_fat.2
@@ -157,25 +157,61 @@ struct __fat_dirent {
 The first entry in the array is for the short filename.
 The second entry is for the long filename.
 .PP
+Fields
+.I d_ino
+and
+.I d_off
+are only filled for long filenames.
+Field
+.I d_ino
+holds the inode number of the directory.
+Field
+.I d_off
+holds the offset of the file entry in the directory.
+As these values are not available for short filenames, the user code should
+simply ignore them.
+.PP
 The field
 .I d_reclen
 contains the length of the filename in the field
 .IR d_name .
-A length of 0 for the short filename signals that the end of the directory
-has been reached.
-.\" FIXME Missing here are explanations of the fileds ;d_ino' and 'd_off'
+To keep backwards compatibility a length of 0 for the short filename signals
+that the end of the directory has been reached.
+The user code should rely on the return value to identify the end of the
+directory.
+If no long filename exists, field
+.I d_reclen
+is set to 0 and
+.I d_name
+is a character string of length 0 for the long filename.
 .SH RETURN VALUE
 On error, \-1 is returned, and
 .I errno
 is set to indicate the error.
+.PP
+For
+.B VFAT_IOCTL_READDIR_BOTH
+and
+.B VFAT_IOCTL_READDIR_SHORT
+a return value of 1 signals that a new directory entry has been read and
+a return value of 0 signals that the end of the directory has been reached.
 .SH ERRORS
 .TP
-.B ENOTDIR
+.B ENOENT
 This error is returned by
+.B VFAT_IOCTL_READDIR_BOTH
+and
 .B VFAT_IOCTL_READDIR_SHORT
+if the file descriptor
+.I fd
+refers to a removed, but still open directory.
+.TP
+.B ENOTDIR
+This error is returned by
+.B VFAT_IOCTL_READDIR_BOTH
 and
 .B VFAT_IOCTL_READDIR_SHORT
-if
+if the file descriptor
 .I fd
 does not refer to a directory.
 .TP
@@ -431,10 +467,12 @@ main(int argc, char *argv[])
 
         /*
          * If an error occurs, the return value is \-1.
-         * If d_reclen is zero, the end of the directory
-         * list has been reached.
+         * If the end of the directory list has been reached,
+         * the return value is 0.
+         * For backward compatibility the end of the directory
+         * list is also signaled by d_reclen == 0.
          */
-        if (ret == \-1 || entry[0].d_reclen == 0)
+        if (ret < 1)
             break;
 
         /*
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
