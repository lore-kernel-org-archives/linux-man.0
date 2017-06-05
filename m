From: Goldwyn Rodrigues <rgoldwyn-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH] Add iocb details to io_submit
Date: Mon,  5 Jun 2017 00:51:52 -0500
Message-ID: <20170605055152.11262-1-rgoldwyn@suse.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jack-IBi9RG/b67k@public.gmane.org, hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, Goldwyn Rodrigues <rgoldwyn-IBi9RG/b67k@public.gmane.org>
List-Id: linux-man@vger.kernel.org

From: Goldwyn Rodrigues <rgoldwyn-IBi9RG/b67k@public.gmane.org>

Add more information about the iocb structure. It explains the fields
of the I/O control block structure which is passed to the io_submit
call.

The work also includes the nowait feature flags which is currently
posted at http://marc.info/?l=linux-fsdevel&m=149664103900715&w=2

Signed-off-by: Goldwyn Rodrigues <rgoldwyn-IBi9RG/b67k@public.gmane.org>
---
 man2/io_submit.2 | 114 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/man2/io_submit.2 b/man2/io_submit.2
index 6aae4efff..fc1290da9 100644
--- a/man2/io_submit.2
+++ b/man2/io_submit.2
@@ -28,6 +28,120 @@ The
 .I iocbpp
 argument should be an array of \fInr\fP AIO control blocks,
 which will be submitted to context \fIctx_id\fP.
+The
+.I iocb
+(I/O control block) structure defined in linux/aio_abi.h
+defines the parameters that control the I/O operation.
+.PP
+.in +4n
+.nf
+
+#include <linux/aio_abi.h>
+
+struct iocb {
+	__u64   aio_data;
+	__u32   PADDED(aio_key, aio_rw_flags);
+
+	__u16   aio_lio_opcode;
+	__s16   aio_reqprio;
+	__u32   aio_fildes;
+
+	__u64   aio_buf;
+	__u64   aio_nbytes;
+	__s64   aio_offset;
+
+	__u64   aio_reserved2;
+
+	__u32   aio_flags;
+	__u32   aio_resfd;
+};
+
+.fi
+.in
+The fields of this structure are as follows:
+.TP
+.I aio_data
+This is a internal field used by the kernel. Do not modify this field after an
+.B io_submit (2)
+call.
+.TP
+.I aio_key
+This is a internal field used by the kernel. Do not modify this field after an
+.B io_submit (2)
+call.
+.TP
+.I aio_rw_flags
+This defines the R/W flags passed with structure. The valid values are:
+.RS
+.TP
+.I RWF_HIPRI
+High priority request, poll if possible
+.TP
+.I RWF_DSYNC
+Write operation complete according to requirement of synchronized I/O data integrity. Similar to a file passed
+.B O_DSYNC
+parameter to
+.B open(2)
+.TP
+.I RWF_SYNC
+Write operation complete according to requirement of synchronized I/O file integrity. Similar to a file passed
+.B .O_SYNC
+parameter to
+.B open(2)
+.TP
+.I RWF_NOWAIT
+Don't wait if the I/O will block for operations such as file block allocations,
+dirty page flush, mutex locks, or a congested block device inside the kernel.
+If any of these conditions are met, the control block is returned immediately
+with a return value of
+.B -EAGAIN
+in the res field of the io_event structure.
+.RE
+.TP
+.I aio_lio_opcode
+This defines the type of I/O to be performed by the iocb structure. The
+valid values are defined by the enum defined in linux/aio_abi.h:
+.in +4
+.nf
+enum {
+        IOCB_CMD_PREAD = 0,
+        IOCB_CMD_PWRITE = 1,
+        IOCB_CMD_FSYNC = 2,
+        IOCB_CMD_FDSYNC = 3,
+        IOCB_CMD_NOOP = 6,
+        IOCB_CMD_PREADV = 7,
+        IOCB_CMD_PWRITEV = 8,
+};
+.fi
+.in
+.TP
+.I aio_reqprio
+This defines the requests priority.
+.TP
+.I aio_filedes
+The file descriptor on which the I/O operation is to be performed.
+.TP
+.I aio_buf
+This is the buffer used to transfer data for a read or write operation.
+.TP
+.I aio_nbytes
+This is the size of the buffer pointed to by
+.IR aio_buf .
+.TP
+.I aio_offset
+This is the file offset at which the I/O operation is to be performed.
+.TP
+.I aio_flags
+This is the flag to be passed iocb structure. The only valid value is
+.I IOCB_FLAG_RESFD
+, which indicates that the asynchronous I/O control must signal the file
+descriptor mentioned in
+.I aio_resfd
+upon completion.
+.TP
+.I aio_resfd
+The file descriptor to signal in the event of asynchronous I/O completion.
+
 .SH RETURN VALUE
 On success,
 .BR io_submit ()
-- 
2.12.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
