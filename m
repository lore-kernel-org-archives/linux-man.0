From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH] open.2: add some comments on O_SYNC and friends
Date: Thu, 27 Aug 2009 20:00:04 +0200
Message-ID: <20090827180004.GA31605@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The language probably needs some editing, but this was the best
I could come up with.


Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>

Index: man-pages/man2/open.2
===================================================================
--- man-pages.orig/man2/open.2	2009-08-27 14:43:43.589383500 -0300
+++ man-pages/man2/open.2	2009-08-27 14:51:01.729354515 -0300
@@ -276,12 +276,12 @@ The following symbolic constants are pro
 Try to minimize cache effects of the I/O to and from this file.
 In general this will degrade performance, but it is useful in
 special situations, such as when applications do their own caching.
-File I/O is done directly to/from user space buffers.
-The I/O is synchronous, that is, at the completion of a
-.BR read (2)
-or
-.BR write (2),
-data is guaranteed to have been transferred.
+File I/O is done directly to/from user space buffers.  The
+\fBO_DIRECT\fP flag alone does make at an effort to transfer
+data synchronously, but does not give the guarantees of the
+\fBO_SYNC\fP that data and nessecary data must be transferred.
+To guarantee synchronous I/O the \fBO_SYNC\fP must be used
+in addition to \fBO_DIRECT\fP.
 See
 .B NOTES
 below for further discussion.
@@ -661,8 +661,14 @@ amongst others
 
 POSIX provides for three different variants of synchronized I/O,
 corresponding to the flags \fBO_SYNC\fP, \fBO_DSYNC\fP and
-\fBO_RSYNC\fP.
-Currently (2.1.130) these are all synonymous under Linux.
+\fBO_RSYNC\fP.  Currently (2.6.31) Linux only implements the
+\fBO_SYNC\fP but glibc maps \fBO_DSYNC\fP and \fBO_SYNC\fP to
+the same numerical value.  Most Linux filesystems do however not
+actually implement the Posix \fBO_SYNC\fP, semantics which
+require all metadata updates of a write to be on disk on returning
+to userspace, but only the \fBO_DSYNC\fP semantics, which require
+only actual file data and metadata nessecary to retreive it to
+be on disk by the time the system call returns.
 
 Note that
 .BR open ()
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
