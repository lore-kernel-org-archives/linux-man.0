From: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] fix O_DIRECT alignment notes in open(2)
Date: Mon, 13 Jun 2011 10:21:27 -0400
Message-ID: <x49y615izh4.fsf@segfault.boston.devel.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

O_DIRECT requires alignment to the underlying device's logical block
size.  It used to be pretty safe to assume this was 512 bytes, but
that's no longer the case with the introduction of 4k logical sector
size devices.

Feel free to change the wording in the man page as you see fit, but
here's an example of how it might be fixed.

Cheers,
Jeff

Signed-off-by: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

diff --git a/man2/open.2 b/man2/open.2
index ff3aa88..fae90d2 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -769,8 +769,8 @@ operation in
 Under Linux 2.4, transfer sizes, and the alignment of the user buffer
 and the file offset must all be multiples of the logical block size
 of the file system.
-Under Linux 2.6, alignment to 512-byte boundaries
-suffices.
+Under Linux 2.6, alignment to the underlying device's logical block
+size suffices.
 .LP
 The
 .B O_DIRECT
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
