From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] statfs.2: Add more filesystem type
Date: Sun, 22 Jan 2017 08:58:25 +1300
Message-ID: <6d9deee8-18b5-616e-c78f-aabdc56d4a66@gmail.com>
References: <20170121014943.24699-1-namhyung@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170121014943.24699-1-namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/21/2017 02:49 PM, Namhyung Kim wrote:
> Add missing magic numbers from /usr/include/linux/magic.h

Thanks, Namhyung. Patch applied.

Cheers,

Michael


> Signed-off-by: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man2/statfs.2 | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/man2/statfs.2 b/man2/statfs.2
> index bde6f28e4..1abeb558d 100644
> --- a/man2/statfs.2
> +++ b/man2/statfs.2
> @@ -69,12 +69,18 @@ Filesystem types:
>  
>     ADFS_SUPER_MAGIC      0xadf5
>     AFFS_SUPER_MAGIC      0xadff
> +   AFS_SUPER_MAGIC       0x5346414f
> +   ANON_INODE_FS_MAGIC   0x09041934
> +   AUTOFS_SUPER_MAGIC    0x0187
>     BDEVFS_MAGIC          0x62646576
>     BEFS_SUPER_MAGIC      0x42465331
>     BFS_MAGIC             0x1badface
>     BINFMTFS_MAGIC        0x42494e4d
> +   BPF_FS_MAGIC          0xcafe4a11
>     BTRFS_SUPER_MAGIC     0x9123683e
> +   BTRFS_TEST_MAGIC      0x73727279
>     CGROUP_SUPER_MAGIC    0x27e0eb
> +   CGROUP2_SUPER_MAGIC   0x63677270
>     CIFS_MAGIC_NUMBER     0xff534d42
>     CODA_SUPER_MAGIC      0x73757245
>     COH_SUPER_MAGIC       0x012ff7b7
> @@ -82,6 +88,7 @@ Filesystem types:
>     DEBUGFS_MAGIC         0x64626720
>     DEVFS_SUPER_MAGIC     0x1373
>     DEVPTS_SUPER_MAGIC    0x1cd1
> +   ECRYPTFS_SUPER_MAGIC  0xf15f
>     EFIVARFS_MAGIC        0xde5e81e4
>     EFS_SUPER_MAGIC       0x00414a53
>     EXT_SUPER_MAGIC       0x137d
> @@ -89,6 +96,7 @@ Filesystem types:
>     EXT2_SUPER_MAGIC      0xef53
>     EXT3_SUPER_MAGIC      0xef53
>     EXT4_SUPER_MAGIC      0xef53
> +   F2FS_SUPER_MAGIC      0xf2f52010
>     FUSE_SUPER_MAGIC      0x65735546
>     FUTEXFS_SUPER_MAGIC   0xbad1dea
>     HFS_SUPER_MAGIC       0x4244
> @@ -105,12 +113,15 @@ Filesystem types:
>     MINIX3_SUPER_MAGIC    0x4d5a /* minix V3 fs, 60 char names */
>     MQUEUE_MAGIC          0x19800202
>     MSDOS_SUPER_MAGIC     0x4d44
> +   MTD_INODE_FS_MAGIC    0x11307854
>     NCP_SUPER_MAGIC       0x564c
>     NFS_SUPER_MAGIC       0x6969
>     NILFS_SUPER_MAGIC     0x3434
> +   NSFS_MAGIC            0x6e736673
>     NTFS_SB_MAGIC         0x5346544e
>     OCFS2_SUPER_MAGIC     0x7461636f
>     OPENPROM_SUPER_MAGIC  0x9fa1
> +   OVERLAYFS_SUPER_MAGIC 0x794c7630
>     PIPEFS_MAGIC          0x50495045
>     PROC_SUPER_MAGIC      0x9fa0
>     PSTOREFS_MAGIC        0x6165676c
> @@ -119,6 +130,7 @@ Filesystem types:
>     RAMFS_MAGIC           0x858458f6
>     REISERFS_SUPER_MAGIC  0x52654973
>     ROMFS_MAGIC           0x7275
> +   SECURITYFS_MAGIC      0x73636673
>     SELINUX_MAGIC         0xf97cff8c
>     SMACK_MAGIC           0x43415d53
>     SMB_SUPER_MAGIC       0x517b
> @@ -128,6 +140,7 @@ Filesystem types:
>     SYSV2_SUPER_MAGIC     0x012ff7b6
>     SYSV4_SUPER_MAGIC     0x012ff7b5
>     TMPFS_MAGIC           0x01021994
> +   TRACEFS_MAGIC         0x74726163
>     UDF_SUPER_MAGIC       0x15013346
>     UFS_MAGIC             0x00011954
>     USBDEVICE_SUPER_MAGIC 0x9fa2
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
