From: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3] fallocate.2: Document FALLOC_FL_ZERO_RANGE
Date: Mon,  5 May 2014 14:04:23 +0200
Message-ID: <1399291463-13683-1-git-send-email-lczerner@redhat.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

FALLOC_FL_ZERO_RANGE was added in Linux 3.14,
for zeroing ranges in the allocated space in a file.

Signed-off-by: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
v2: Rebase and update the description
v3: Ext4 zero range on extent based files

 man2/fallocate.2 | 46 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/man2/fallocate.2 b/man2/fallocate.2
index 73c4f12..0ffce71 100644
--- a/man2/fallocate.2
+++ b/man2/fallocate.2
@@ -180,6 +180,48 @@ ext4 (only for extent-based files)
 .\" commit 9eb79482a97152930b113b51dff530aba9e28c8e
 and XFS.
 .\" commit e1d8fb88a64c1f8094b9f6c3b6d2d9e6719c970d
+.SS Zeroing file space
+Specifying
+.BR FALLOC_FL_ZERO_RANGE
+flag (available since Linux 3.14) in
+.I mode
+zeroes space in the byte range starting at
+.I offset
+and continuing for
+.I len
+bytes.
+Within the specified range, blocks are preallocated for the regions
+that span the holes in the file. After a successful call, subsequent
+reads from this range will return zeroes.
+
+Zeroing is done within the file system preferably by converting range into
+unwritten extents which requires very little IO to be issued mostly for
+metadata. This means that the range will not be physically zeroed out
+on the device.
+
+If the
+.B FALLOC_FL_KEEP_SIZE
+flag is specified in
+.IR mode ,
+the behavior of the call is similar,
+but the file size will not be changed even if
+.IR offset + len
+is greater than the file size. This behaviour is the same as when
+preallocating space with
+.B FALLOC_FL_KEEP_SIZE
+specified.
+
+Not all filesystems support
+.BR FALLOC_FL_ZERO_RANGE ;
+if a filesystem doesn't support the operation, an error is returned.
+The operation is supported on at least the following filesystems
+.IP * 3
+XFS (since Linux 3.14)
+.\" commit 376ba313147b4172f3e8cf620b9fb591f3e8cdfa
+.IP *
+ext4, for extent based files (since Linux 3.14)
+.\" commit b8a8684502a0fc852afa0056c6bb2a9273f6fcc0
+
 .SH RETURN VALUE
 On success,
 .BR fallocate ()
@@ -243,7 +285,9 @@ no other flags are permitted with
 .B EINVAL
 .I mode
 is
-.BR FALLOC_FL_COLLAPSE_RANGE ,
+.BR FALLOC_FL_COLLAPSE_RANGE
+or
+.BR FALLOC_FL_ZERO_RANGE,
 but the file referred to by
 .I fd
 is not a regular file.
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
