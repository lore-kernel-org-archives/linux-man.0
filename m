From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] statfs.2: Update + Note for pipe() fds
Date: Tue, 10 Jun 2014 22:27:57 +0200
Message-ID: <53976A4D.1010501@gmail.com>
References: <20140610160416.GA20354@rei.Home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140610160416.GA20354-HSzIOc4LzcM@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Cyril,

Thanks for this. I applied. However, for the future, I really would prefer 
unrelated changes such as the below to be submitted as separate patches.
(I manually split your patch.)

On 06/10/2014 06:04 PM, Cyril Hrubis wrote:
> * Update MAGIC constants, most of them are taken from
>   /usr/include/linux/magic.h, some were found by grepping Linux source.
> 
> * Add note about fstatfs(2) broken on fd from pipe(2) between
>   2.6.38 and 3.2

I moved that patch piece to a (new) BUGS section.

Looking at the following:

$ git describe --contains ff0c7d15f9787b7e8c601533c01529
v2.6.38-rc1~60^2~30
$ git describe --contains d70ef97baf048412c395bb5d65791d
v3.2-rc1~108^2~56

The breakage was from 2.6.38 to 3.1, right? (3.2 fixed things.)
I reworded a little.

And I just want to check. Was it really ff0c7d15f9787b7e8c601533c01529
that caused the breakage? At a quick glance, that patch looks
unrelated, but perhaps something very subtle is going on...

Cheers,

Michael

> Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
> ---
>  man2/statfs.2 | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/man2/statfs.2 b/man2/statfs.2
> index 8888307..53cff11 100644
> --- a/man2/statfs.2
> +++ b/man2/statfs.2
> @@ -72,20 +72,30 @@ Filesystem types:
>  
>     ADFS_SUPER_MAGIC      0xadf5
>     AFFS_SUPER_MAGIC      0xADFF
> +   BDEVFS_MAGIC          0x62646576
>     BEFS_SUPER_MAGIC      0x42465331
>     BFS_MAGIC             0x1BADFACE
> +   BINFMTFS_MAGIC        0x42494e4d
> +   BTRFS_SUPER_MAGIC     0x9123683E
> +   CGROUP_SUPER_MAGIC    0x27e0eb
>     CIFS_MAGIC_NUMBER     0xFF534D42
>     CODA_SUPER_MAGIC      0x73757245
>     COH_SUPER_MAGIC       0x012FF7B7
>     CRAMFS_MAGIC          0x28cd3d45
> +   DEBUGFS_MAGIC         0x64626720
>     DEVFS_SUPER_MAGIC     0x1373
> +   DEVPTS_SUPER_MAGIC    0x1cd1
> +   EFIVARFS_MAGIC        0xde5e81e4
>     EFS_SUPER_MAGIC       0x00414A53
>     EXT_SUPER_MAGIC       0x137D
>     EXT2_OLD_SUPER_MAGIC  0xEF51
>     EXT2_SUPER_MAGIC      0xEF53
>     EXT3_SUPER_MAGIC      0xEF53
>     EXT4_SUPER_MAGIC      0xEF53
> +   FUSE_SUPER_MAGIC      0x65735546
> +   FUTEXFS_SUPER_MAGIC   0xBAD1DEA
>     HFS_SUPER_MAGIC       0x4244
> +   HOSTFS_SUPER_MAGIC    0x00c0ffee
>     HPFS_SUPER_MAGIC      0xF995E849
>     HUGETLBFS_MAGIC       0x958458f6
>     ISOFS_SUPER_MAGIC     0x9660
> @@ -95,29 +105,47 @@ Filesystem types:
>     MINIX_SUPER_MAGIC2    0x138F /* 30 char minix */
>     MINIX2_SUPER_MAGIC    0x2468 /* minix V2 */
>     MINIX2_SUPER_MAGIC2   0x2478 /* minix V2, 30 char names */
> +   MINIX3_SUPER_MAGIC    0x4d5a /* minix V3 fs, 60 char names */
> +   MQUEUE_MAGIC          0x19800202
>     MSDOS_SUPER_MAGIC     0x4d44
>     NCP_SUPER_MAGIC       0x564c
>     NFS_SUPER_MAGIC       0x6969
> +   NILFS_SUPER_MAGIC     0x3434
>     NTFS_SB_MAGIC         0x5346544e
>     OPENPROM_SUPER_MAGIC  0x9fa1
> +   PIPEFS_MAGIC          0x50495045
>     PROC_SUPER_MAGIC      0x9fa0
> +   PSTOREFS_MAGIC        0x6165676C
>     QNX4_SUPER_MAGIC      0x002f
> +   QNX6_SUPER_MAGIC      0x68191122
> +   RAMFS_MAGIC           0x858458f6
>     REISERFS_SUPER_MAGIC  0x52654973
>     ROMFS_MAGIC           0x7275
> +   SELINUX_MAGIC         0xf97cff8c
> +   SMACK_MAGIC           0x43415d53
>     SMB_SUPER_MAGIC       0x517B
> +   SOCKFS_MAGIC          0x534F434B
> +   SQUASHFS_MAGIC        0x73717368
> +   SYSFS_MAGIC           0x62656572
>     SYSV2_SUPER_MAGIC     0x012FF7B6
>     SYSV4_SUPER_MAGIC     0x012FF7B5
>     TMPFS_MAGIC           0x01021994
>     UDF_SUPER_MAGIC       0x15013346
>     UFS_MAGIC             0x00011954
>     USBDEVICE_SUPER_MAGIC 0x9fa2
> +   V9FS_MAGIC            0x01021997
>     VXFS_SUPER_MAGIC      0xa501FCF5
> +   XENFS_SUPER_MAGIC     0xabba1974
>     XENIX_SUPER_MAGIC     0x012FF7B4
>     XFS_SUPER_MAGIC       0x58465342
>     _XIAFS_SUPER_MAGIC    0x012FD16D
>  .fi
>  .in
>  .PP
> +Most of these MAGIC constants are defined in
> +.I /usr/include/linux/magic.h
> +some are hardcoded in kernel sources.
> +.PP
>  Nobody knows what
>  .I f_fsid
>  is supposed to contain (but see below).
> @@ -221,6 +249,13 @@ Some systems only have \fI<sys/vfs.h>\fP, other systems also have
>  So it seems
>  including the former is the best choice.
>  
> +Between Linux 2.6.38 and Linux 3.2
> +.\" broken in commit ff0c7d15f9787b7e8c601533c015295cc68329f8
> +.\" fixed in commit d70ef97baf048412c395bb5d65791d8fe133a52b
> +.BR fstatfs ()
> +returned ENOSYS for file descriptor created by
> +.BR pipe (2) .
> +
>  LSB has deprecated the library calls
>  .BR statfs ()
>  and
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
