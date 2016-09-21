From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/4] quotactl.2: Updated information regarding XFS-specific
 quotactl subcommands
Date: Wed, 21 Sep 2016 06:28:57 +0300
Message-ID: <20160921032857.GA5550@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

* man2/quotactl.2: Added information regarding structure definitions
  used for XFS-specific subcommands, updated flag constants, added
  information regarding ignored syscall arguments, added notes on usage
  of kernel UAPI header.
---
 man2/quotactl.2 |  237 +++++++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 215 insertions(+), 22 deletions(-)

diff --git a/man2/quotactl.2 b/man2/quotactl.2
index 3910379..ea076f9 100644
--- a/man2/quotactl.2
+++ b/man2/quotactl.2
@@ -30,7 +30,7 @@ quotactl \- manipulate disk quotas
 .SH SYNOPSIS
 .nf
 .B #include <sys/quota.h>
-.B #include <xfs/xqm.h>
+.B #include <xfs/xqm.h> /* for XFS quotas */
 .LP
 .BI "int quotactl(int " cmd ", const char *" special ", int " id \
 ", caddr_t " addr );
@@ -389,18 +389,25 @@ Therefore, XFS expects
 .I addr
 to be a pointer to an
 .I "unsigned int"
-that contains either the flags
-.B XFS_QUOTA_UDQ_ACCT
-and/or
-.B XFS_QUOTA_UDQ_ENFD
-(for user quota), or
-.B XFS_QUOTA_GDQ_ACCT
-and/or
-.B XFS_QUOTA_GDQ_ENFD
-(for group quota), as defined in
-.IR <xfs/xqm.h> .
+that contains the combination of the following flags (defined in
+.IR <xfs/xqm.h> ):
+
+.nf
+.in +4n
+#define XFS_QUOTA_UDQ_ACCT  (1<<0)  /* user quota accounting */
+#define XFS_QUOTA_UDQ_ENFD  (1<<1)  /* user quota limits enforcement */
+#define XFS_QUOTA_GDQ_ACCT  (1<<2)  /* group quota accounting */
+#define XFS_QUOTA_GDQ_ENFD  (1<<3)  /* group quota limits enforcement */
+#define XFS_QUOTA_PDQ_ACCT  (1<<4)  /* project quota accounting */
+#define XFS_QUOTA_PDQ_ENFD  (1<<5)  /* project quota limits enforcement */
+.in
+.fi
+
 This operation requires privilege
 .RB ( CAP_SYS_ADMIN ).
+The
+.I id
+argument is ignored.
 .TP
 .B Q_XQUOTAOFF
 Turn off quotas for an XFS filesystem.
@@ -409,9 +416,14 @@ As with
 XFS filesystems expect a pointer to an
 .I "unsigned int"
 that specifies whether quota accounting and/or limit enforcement need
-to be turned off.
+to be turned off (using the same flags as for
+.RB Q_XQUOTAON
+subcommand).
 This operation requires privilege
 .RB ( CAP_SYS_ADMIN ).
+The
+.I id
+argument is ignored.
 .TP
 .B Q_XGETQUOTA
 Get disk quota limits and current usage for user
@@ -420,8 +432,48 @@ The
 .I addr
 argument is a pointer to an
 .I fs_disk_quota
-structure (defined in
-.IR <xfs/xqm.h> ).
+structure which is defined in
+.I <xfs/xqm.h>
+as follows:
+
+.nf
+.in +4n
+/* All the blk units are in BBs (Basic Blocks) of 512 bytes. */
+
+#define FS_DQUOT_VERSION   1       /* fs_disk_quota.d_version */
+
+#define XFS_USER_QUOTA     (1<<0)  /* user quota type */
+#define XFS_PROJ_QUOTA     (1<<1)  /* project quota type */
+#define XFS_GROUP_QUOTA    (1<<2)  /* group quota type */
+
+struct fs_disk_quota {
+    int8_t    d_version;           /* version of this structure */
+    int8_t    d_flags;             /* XFS_{USER,PROJ,GROUP}_QUOTA */
+    uint16_t  d_fieldmask;         /* field specifier */
+    uint32_t  d_id;                /* user, project, or group ID */
+    uint64_t  d_blk_hardlimit;     /* absolute limit on disk blks */
+    uint64_t  d_blk_softlimit;     /* preferred limit on disk blks */
+    uint64_t  d_ino_hardlimit;     /* maximum # allocated inodes */
+    uint64_t  d_ino_softlimit;     /* preferred inode limit */
+    uint64_t  d_bcount;            /* # disk blocks owned by the user */
+    uint64_t  d_icount;            /* # inodes owned by the user */
+    int32_t   d_itimer;            /* zero if within inode limits */
+                                   /* if not, we refuse service */
+    int32_t   d_btimer;            /* similar to above; for disk blocks */
+    uint16_t  d_iwarns;            /* # warnings issued wrt num inodes */
+    uint16_t  d_bwarns;            /* # warnings issued wrt disk blocks */
+    int32_t   d_padding2;          /* padding2 - for future use */
+    uint64_t  d_rtb_hardlimit;     /* absolute limit on realtime blks */
+    uint64_t  d_rtb_softlimit;     /* preferred limit on RT disk blks */
+    uint64_t  d_rtbcount;          /* # realtime blocks owned */
+    int32_t   d_rtbtimer;          /* similar to above; for RT disk blks */
+    uint16_t  d_rtbwarns;          /* # warnings issued wrt RT disk blks */
+    int16_t   d_padding3;          /* padding3 - for future use */
+    char      d_padding4[8];       /* yet more padding */
+};
+.in
+.fi
+
 Unprivileged users may retrieve only their own quotas;
 a privileged user
 .RB ( CAP_SYS_ADMIN )
@@ -431,9 +483,21 @@ may retrieve the quotas of any user.
 .\" commit 8b37524962b9c54423374717786198f5c0820a28
 This operation is the same as
 .BR Q_XGETQUOTA ,
-but it returns quota information for the next ID greater than or equal to
+but it returns (in the
+.I fs_disk_quota
+structure pointed by
+.IR addr )
+quota information for the next ID greater than or equal to
 .IR id
-that has a quota set.
+that has a quota set. Note that since
+.I fs_disk_quota
+already has
+.I q_id
+field, no separate structure type is needed (in contrast with
+.B Q_GETQUOTA
+and
+.B Q_GETNEXTQUOTA
+commands)
 .TP
 .B Q_XSETQLIM
 Set disk quota limits for user
@@ -442,22 +506,123 @@ The
 .I addr
 argument is a pointer to an
 .I fs_disk_quota
-structure (defined in
-.IR <xfs/xqm.h> ).
+structure.
 This operation requires privilege
 .RB ( CAP_SYS_ADMIN ).
 .TP
 .B Q_XGETQSTAT
-Returns an
+Returns (in a buffer pointed by
+.IR addr )
+an
 .I fs_quota_stat
 structure containing XFS filesystem-specific quota information.
 This is useful for finding out how much space is used to store quota
 information, and also to get quotaon/off status of a given local XFS
-filesystem.
+filesystem. The
+.I fs_quota_stat
+structure itself is defined as follows:
+
+.nf
+.in +4n
+#define FS_QSTAT_VERSION 1  /* fs_quota_stat.qs_version */
+
+struct fs_qfilestat {
+    uint64_t qfs_ino;       /* inode number */
+    uint64_t qfs_nblks;     /* number of BBs 512-byte-blks */
+    uint32_t qfs_nextents;  /* number of extents */
+};
+
+struct fs_quota_stat {
+    int8_t               qs_version;      /* version number for future changes */
+    uint16_t             qs_flags;        /* XFS_QUOTA_{U,P,G}DQ_{ACCT,ENFD} */
+    int8_t               qs_pad;          /* unused */
+    struct fs_qfilestat  qs_uquota;       /* user quota storage information */
+    struct fs_qfilestat  qs_gquota;       /* group quota storage information */
+    uint32_t             qs_incoredqs;    /* number of dquots incore */
+    int32_t              qs_btimelimit;   /* limit for blks timer */
+    int32_t              qs_itimelimit;   /* limit for inodes timer */
+    int32_t              qs_rtbtimelimit; /* limit for rt blks timer */
+    uint16_t             qs_bwarnlimit;   /* limit for num warnings */
+    uint16_t             qs_iwarnlimit;   /* limit for num warnings */
+};
+.in
+.fi
+
+The
+.I id
+argument is ignored.
+.TP
+.B Q_XGETQSTATV
+Returns (in a buffer pointed by
+.IR addr )
+an
+.I fs_quota_statv
+structure containing XFS filesystem-specific quota information. This version
+of the command use structure with proper versioning support along with
+appropriate layout (all fields are naturally aligned) and adding for avoiding
+special compat handling; it also provides ability to get statistics regarding
+project quota file. The
+.I fs_quota_statv
+structure itself is defined as follows:
+
+.nf
+.in +4n
+#define FS_QSTATV_VERSION1 1 /* fs_quota_statv.qs_version */
+
+struct fs_qfilestatv {
+    uint64_t qfs_ino;        /* inode number */
+    uint64_t qfs_nblks;      /* number of BBs 512-byte-blks */
+    uint32_t qfs_nextents;   /* number of extents */
+    uint32_t qfs_pad;        /* pad for 8-byte alignment */
+};
+
+struct fs_quota_statv {
+    int8_t                qs_version;      /* version for future changes */
+    uint8_t               qs_pad1;         /* pad for 16bit alignment */
+    uint16_t              qs_flags;        /* XFS_QUOTA_.* flags */
+    uint32_t              qs_incoredqs;    /* number of dquots incore */
+    struct fs_qfilestatv  qs_uquota;       /* user quota information */
+    struct fs_qfilestatv  qs_gquota;       /* group quota information */
+    struct fs_qfilestatv  qs_pquota;       /* project quota information */
+    int32_t               qs_btimelimit;   /* limit for blks timer */
+    int32_t               qs_itimelimit;   /* limit for inodes timer */
+    int32_t               qs_rtbtimelimit; /* limit for rt blks timer */
+    uint16_t              qs_bwarnlimit;   /* limit for num warnings */
+    uint16_t              qs_iwarnlimit;   /* limit for num warnings */
+    uint64_t              qs_pad2[8];      /* for future proofing */
+};
+.in
+.fi
+
+The
+.I qs_version
+field of the structure should be filled with the version of the structure
+supported by the callee (for now, only
+.I FS_QSTAT_VERSION1
+is supported). Kernel will fill the structure in accordance with
+version provided.
+The
+.I id
+argument is ignored.
 .TP
 .B Q_XQUOTARM
-Free the disk space taken by disk quotas.
-Quotas must have already been turned off.
+Free the disk space taken by disk quotas. The
+.I addr
+argument should be a pointer to an
+.I "unsigned int"
+value containing flags (the same as in
+.I d_flags
+field of
+.I fs_disk_quota
+structure) which identify what types of quota should be removed (note that quota
+type passed in
+.I cmd
+argument is ignored, but should remain valid in order to pass preliminary
+quotactl syscall handler checks).
+
+Quotas must have already been turned off. The
+.I id
+argument is ignored.
 .PP
 There is no command equivalent to
 .B Q_SYNC
@@ -557,6 +722,34 @@ or
 but there is no ID greater than or equal to
 .IR id
 that has an active quota.
+.SH NOTES
+Instead of
+.I <xfs/xqm.h>
+one can use
+.IR <linux/dqblk_xfs.h> ,
+taking into account that there are several naming discrepancies:
+.IP \(bu 3
+Quota enabling flags (of format
+.BR XFS_QUOTA_[UGP]DQ_{ACCT,ENFD} )
+are defined without leading "X", as
+.BR FS_QUOTA_[UGP]DQ_{ACCT,ENFD} .
+.IP \(bu
+The same is applied to
+.B XFS_{USER,GROUP,PROJ}_QUOTA
+quota type flags which are defined as
+.BR FS_{USER,GROUP,PROJ}_QUOTA .
+.IP \(bu
+The
+.I dqblk_xfs.h
+defines its own
+.BR XQM_USRQUOTA ,
+.BR XQM_GRPQUOTA ,
+and
+.B XQM_PRJQUOTA
+constants for the available quota types, but their values are the same as for
+constants without the
+.B XQM_
+prefix.
 .SH SEE ALSO
 .BR quota (1),
 .BR getrlimit (2),
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
