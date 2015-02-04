From: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] statfs.2 does not describe f_flag field
Date: Wed, 04 Feb 2015 09:48:44 +0100
Message-ID: <20150204084843.29485.58701.stgit@unused-4-157.brq.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: schwab-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, hch-jcswGhMUV9g@public.gmane.org, viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org
List-Id: linux-man@vger.kernel.org

Based on kernel commit [1], new flag f_flag is added to statfs struct.

Before kernel 2.6.36, glibc's statvfs.f_flags was computed be iterating
through all mounted points. This was inefficient and could cause a delay.
Since kernel 2.6.36, statfs struct has new field f_flag, which already
extracts mount options without iterating through mount point.
statfs.f_flag flags of glibc and kernel are the same (plus kernel adds
additional flag ST_VALID used only internally). So no matter what version
of kernel is used, flags does not change.

Flags used in statfs.f_flags can be enumerated from upstreams's
glibc/internal_statvfs.c, lines 155-173. Nine flags in sum:

ST_RDONLY = 1
ST_NOSUID = 2
ST_NODEV = 4
ST_NOEXEC = 8
ST_SYNCHRONOUS = 16
ST_MANDLOCK = 64
ST_NOATIME = 1024
ST_NODIRATIME = 2048
ST_RELATIME = 4096

This patch describes missing flag.

[1] https://github.com/torvalds/linux/commit/365b18189789bfa1acd9939e6312b8a4b4577b28

Signed-off-by: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man2/statfs.2 |   28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/man2/statfs.2 b/man2/statfs.2
index 714bc7c..46cfa5f 100644
--- a/man2/statfs.2
+++ b/man2/statfs.2
@@ -65,7 +65,9 @@ struct statfs {
     fsid_t       f_fsid;    /* filesystem id */
     __SWORD_TYPE f_namelen; /* maximum length of filenames */
     __SWORD_TYPE f_frsize;  /* fragment size (since Linux 2.6) */
-    __SWORD_TYPE f_spare[5];
+    __SWORD_TYPE f_flags;   /* mount flags of filesystem
+                               (since Linux 2.6.36) */
+    __SWORD_TYPE f_spare[4];
 };
 
 Filesystem types:
@@ -146,6 +148,30 @@ Most of these MAGIC constants are defined in
 .IR /usr/include/linux/magic.h ,
 and some are hardcoded in kernel sources.
 .PP
+Mount flags of
+.I f_flags
+field are extracted from an option string of a mount point defined in
+.BR mount (8).
+The field can be combination of the following flags
+(corresponding mount options are in the right column):
+.in
+.nf
+
+   ST_RDONLY          ro
+   ST_NOSUID          nosuid
+   ST_NOEXEC          noexec
+   ST_NODEV           nodev
+   ST_SYNCHRONOUS     sync
+   ST_MANDLOCK        mand
+   ST_NOATIME         noatime
+   ST_NODIRATIME      nodiratime
+   ST_RELATIME        relatime
+
+.fi
+.in
+For kernel less than 2.6.36 option flags are extracted by iterating
+through individual mount points which can be inefficient and cause delay.
+.PP
 Nobody knows what
 .I f_fsid
 is supposed to contain (but see below).

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
