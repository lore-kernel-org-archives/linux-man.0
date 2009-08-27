From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: sync_file_range.2:  add some big WARNINGS
Date: Thu, 27 Aug 2009 20:01:16 +0200
Message-ID: <20090827180116.GB31605@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This system call is by design completely unsuitable for any data
integrity operations.  Make that very clear in the manpage.


Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>

Index: man-pages/man2/sync_file_range.2
===================================================================
--- man-pages.orig/man2/sync_file_range.2	2009-08-27 14:51:51.373360594 -0300
+++ man-pages/man2/sync_file_range.2	2009-08-27 14:57:35.213854927 -0300
@@ -80,11 +80,22 @@ after performing any write.
 Specifying
 .I flags
 as 0 is permitted, as a no-op.
-.SS Some details
-None of these operations write out the file's metadata.
+.SS WARNING
+This system call is extremly dangerous and should not be used in portable
+programs.  None of these operations write out the file's metadata.
 Therefore, unless the application is strictly performing overwrites of
-already-instantiated disk blocks,
-there are no guarantees that the data will be available after a crash.
+already-instantiated disk blocks, there are no guarantees that the data will
+be available after a crash.  There is no user interface to know if a
+write is purely an overwrite. On filesystem using copy on write semantics
+like
+.IR btrfs
+an over write of existing allocated blocks is impossible.  Writing into
+pre-allocated space many filesystems also require calls into the block
+allocator which this system call does not sync out to disk.
+This system call does not flush disk write caches and thus does not provide
+any data integrity on systems with volatile disk write caches.
+
+.SS Some details
 
 .B SYNC_FILE_RANGE_WAIT_BEFORE
 and
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
