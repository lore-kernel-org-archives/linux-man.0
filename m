From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] statfs.2: spfix
Date: Sun, 13 Mar 2016 19:34:38 +0100
Message-ID: <1457894078-9245-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The "Filesystem types" list had a random mixture of lower- and
uppercase hexadecimal digits. This patch makes them all uppercase.

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/statfs.2 | 48 ++++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/man2/statfs.2 b/man2/statfs.2
index 81bfc52..ca6a80c 100644
--- a/man2/statfs.2
+++ b/man2/statfs.2
@@ -67,22 +67,22 @@ struct statfs {
 
 Filesystem types:
 
-   ADFS_SUPER_MAGIC      0xadf5
+   ADFS_SUPER_MAGIC      0xADF5
    AFFS_SUPER_MAGIC      0xADFF
    BDEVFS_MAGIC          0x62646576
    BEFS_SUPER_MAGIC      0x42465331
    BFS_MAGIC             0x1BADFACE
-   BINFMTFS_MAGIC        0x42494e4d
+   BINFMTFS_MAGIC        0x42494E4D
    BTRFS_SUPER_MAGIC     0x9123683E
-   CGROUP_SUPER_MAGIC    0x27e0eb
+   CGROUP_SUPER_MAGIC    0x27E0EB
    CIFS_MAGIC_NUMBER     0xFF534D42
    CODA_SUPER_MAGIC      0x73757245
    COH_SUPER_MAGIC       0x012FF7B7
-   CRAMFS_MAGIC          0x28cd3d45
+   CRAMFS_MAGIC          0x28CD3D45
    DEBUGFS_MAGIC         0x64626720
    DEVFS_SUPER_MAGIC     0x1373
-   DEVPTS_SUPER_MAGIC    0x1cd1
-   EFIVARFS_MAGIC        0xde5e81e4
+   DEVPTS_SUPER_MAGIC    0x1CD1
+   EFIVARFS_MAGIC        0xDE5E81E4
    EFS_SUPER_MAGIC       0x00414A53
    EXT_SUPER_MAGIC       0x137D
    EXT2_OLD_SUPER_MAGIC  0xEF51
@@ -92,35 +92,35 @@ Filesystem types:
    FUSE_SUPER_MAGIC      0x65735546
    FUTEXFS_SUPER_MAGIC   0xBAD1DEA
    HFS_SUPER_MAGIC       0x4244
-   HOSTFS_SUPER_MAGIC    0x00c0ffee
+   HOSTFS_SUPER_MAGIC    0x00C0FFEE
    HPFS_SUPER_MAGIC      0xF995E849
-   HUGETLBFS_MAGIC       0x958458f6
+   HUGETLBFS_MAGIC       0x958458F6
    ISOFS_SUPER_MAGIC     0x9660
-   JFFS2_SUPER_MAGIC     0x72b6
-   JFS_SUPER_MAGIC       0x3153464a
+   JFFS2_SUPER_MAGIC     0x72B6
+   JFS_SUPER_MAGIC       0x3153464A
    MINIX_SUPER_MAGIC     0x137F /* orig. minix */
    MINIX_SUPER_MAGIC2    0x138F /* 30 char minix */
    MINIX2_SUPER_MAGIC    0x2468 /* minix V2 */
    MINIX2_SUPER_MAGIC2   0x2478 /* minix V2, 30 char names */
-   MINIX3_SUPER_MAGIC    0x4d5a /* minix V3 fs, 60 char names */
+   MINIX3_SUPER_MAGIC    0x4D5A /* minix V3 fs, 60 char names */
    MQUEUE_MAGIC          0x19800202
-   MSDOS_SUPER_MAGIC     0x4d44
-   NCP_SUPER_MAGIC       0x564c
+   MSDOS_SUPER_MAGIC     0x4D44
+   NCP_SUPER_MAGIC       0x564C
    NFS_SUPER_MAGIC       0x6969
    NILFS_SUPER_MAGIC     0x3434
-   NTFS_SB_MAGIC         0x5346544e
-   OCFS2_SUPER_MAGIC     0x7461636f
-   OPENPROM_SUPER_MAGIC  0x9fa1
+   NTFS_SB_MAGIC         0x5346544E
+   OCFS2_SUPER_MAGIC     0x7461636F
+   OPENPROM_SUPER_MAGIC  0x9FA1
    PIPEFS_MAGIC          0x50495045
-   PROC_SUPER_MAGIC      0x9fa0
+   PROC_SUPER_MAGIC      0x9FA0
    PSTOREFS_MAGIC        0x6165676C
-   QNX4_SUPER_MAGIC      0x002f
+   QNX4_SUPER_MAGIC      0x002F
    QNX6_SUPER_MAGIC      0x68191122
-   RAMFS_MAGIC           0x858458f6
+   RAMFS_MAGIC           0x858458F6
    REISERFS_SUPER_MAGIC  0x52654973
    ROMFS_MAGIC           0x7275
-   SELINUX_MAGIC         0xf97cff8c
-   SMACK_MAGIC           0x43415d53
+   SELINUX_MAGIC         0xF97CFF8C
+   SMACK_MAGIC           0x43415D53
    SMB_SUPER_MAGIC       0x517B
    SOCKFS_MAGIC          0x534F434B
    SQUASHFS_MAGIC        0x73717368
@@ -130,10 +130,10 @@ Filesystem types:
    TMPFS_MAGIC           0x01021994
    UDF_SUPER_MAGIC       0x15013346
    UFS_MAGIC             0x00011954
-   USBDEVICE_SUPER_MAGIC 0x9fa2
+   USBDEVICE_SUPER_MAGIC 0x9FA2
    V9FS_MAGIC            0x01021997
-   VXFS_SUPER_MAGIC      0xa501FCF5
-   XENFS_SUPER_MAGIC     0xabba1974
+   VXFS_SUPER_MAGIC      0xA501FCF5
+   XENFS_SUPER_MAGIC     0xABBA1974
    XENIX_SUPER_MAGIC     0x012FF7B4
    XFS_SUPER_MAGIC       0x58465342
    _XIAFS_SUPER_MAGIC    0x012FD16D
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
