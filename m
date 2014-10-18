From: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] madvise.2: madvise(, , MADV_REMOVE) supports ext4,
 ocfs2 and xfs as well
Date: Sat, 18 Oct 2014 17:22:40 +0200
Message-ID: <20141018152240.14951.14405.stgit@unused-4-157.brq.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, hughd-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

As from upstream commit:

commit 3f31d07571eeea18a7d34db9af21d2285b807a17
Author: Hugh Dickins <hughd-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Date:   Tue May 29 15:06:40 2012 -0700

     mm/fs: route MADV_REMOVE to FALLOC_FL_PUNCH_HOLE

     Now tmpfs supports hole-punching via fallocate(), switch madvise_remove()
     to use do_fallocate() instead of vmtruncate_range(): which extends
     madvise(,,MADV_REMOVE) support from tmpfs to ext4, ocfs2 and xfs.

madvise(,,MADV_REMOVE) support was extended by ext4, ocfs2 and xfs.

bug report: https://bugzilla.redhat.com/show_bug.cgi?id=1120294

Justification from Rafael Aquini:
Well, that code is committed in kernel since v3.5 (2012) and it surely is
the expected behaviour since. It seems to me that madvise(2) man page text
for MADV_REMOVE just got out-of-date in that regard.

This patch mentions this support in madvise.2 man page.

Reworded and corrected by Michael Kerrisk and Hugh Dickins. Thank you.

Signed-off-by: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man2/madvise.2 |   17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/man2/madvise.2 b/man2/madvise.2
index 032ead7..b955864 100644
--- a/man2/madvise.2
+++ b/man2/madvise.2
@@ -101,11 +101,18 @@ without an underlying file.
 .BR MADV_REMOVE " (since Linux 2.6.16)"
 Free up a given range of pages
 and its associated backing store.
-Currently,
-.\" 2.6.18-rc5
-only shmfs/tmpfs supports this; other filesystems return with the
-error
-.BR ENOSYS .
+Originally, only shmfs/tmpfs supported this; but since Linux 3.5,
+any filesystem which supports the
+.BR fallocate(2)
+mode
+.BR FALLOC_FL_PUNCH_HOLE
+also supports the
+.BR madvise(2)
+advice
+.BR MADV_REMOVE .
+Other filesystems return with the
+.BR EOPNOTSUPP
+error.
 .\" Databases want to use this feature to drop a section of their
 .\" bufferpool (shared memory segments) - without writing back to
 .\" disk/swap space.  This feature is also useful for supporting

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
