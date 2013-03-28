From: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] open.2: Fix up incorrect O_DIRECT aligment information
Date: Thu, 28 Mar 2013 13:28:11 -0400
Message-ID: <x49ip4bzb6c.fsf@segfault.boston.devel.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

The alignment text for O_DIRECT is slightly misleading:

       Under  Linux  2.4, transfer sizes, and the alignment of the user buffer
       and the file offset must all be multiples of the logical block size  of
       the  file  system.   Under  Linux 2.6, alignment to 512-byte boundaries
       suffices.

The last sentence is incorrect.  You cannot perform O_DIRECT I/O in
sizes smaller than the underlying logical block size (for block devices
and block-based file systems; nfs is a different beast).  I've attached
my proposed change.  Comments and word-smithing are most welcome.

Cheers,
Jeff

Signed-off-by: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

diff --git a/man2/open.2 b/man2/open.2
index e518c1f..df92d6a 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -787,7 +787,8 @@ operation in
 Under Linux 2.4, transfer sizes, and the alignment of the user buffer
 and the file offset must all be multiples of the logical block size
 of the file system.
-Under Linux 2.6, alignment to 512-byte boundaries suffices.
+Under Linux 2.6, alignment to the underlying block device's logical
+block size suffices.
 .LP
 .B O_DIRECT
 I/Os should never be run concurrently with the
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
