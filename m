From: adam.manzanares@wdc.com
Subject: [PATCH] io_submit.2: Add IOCB_FLAG_IOPRIO
Date: Fri, 13 Jul 2018 13:58:31 -0700
Message-ID: <20180713205831.8134-1-adam.manzanares@wdc.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mtk.manpages@gmail.com
Cc: jmoyer@redhat.com, rgoldwyn@suse.com, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, Adam Manzanares <adam.manzanares@wdc.com>
List-Id: linux-man@vger.kernel.org

From: Adam Manzanares <adam.manzanares@wdc.com>

The newly added IOCB_FLAG_IOPRIO aio_flag introduces
new behaviors and return values.

The details of this new feature are posted here:
https://lkml.org/lkml/2018/5/22/809

Signed-off-by: Adam Manzanares <adam.manzanares@wdc.com>
---
 man2/io_submit.2 | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/man2/io_submit.2 b/man2/io_submit.2
index d17e3122a..15e1ecdea 100644
--- a/man2/io_submit.2
+++ b/man2/io_submit.2
@@ -164,14 +164,26 @@ This is the size of the buffer pointed to by
 This is the file offset at which the I/O operation is to be performed.
 .TP
 .I aio_flags
-This is the flag to be passed iocb structure.
-The only valid value is
-.BR IOCB_FLAG_RESFD ,
-which indicates that the asynchronous I/O control must signal the file
+This is the set of flags associated with the iocb structure.
+The valid values are:
+.RS
+.TP
+.BR IOCB_FLAG_RESFD
+Asynchronous I/O control must signal the file
 descriptor mentioned in
 .I aio_resfd
 upon completion.
 .TP
+.BR IOCB_FLAG_IOPRIO " (since Linux 4.18)"
+.\" commit d9a08a9e616beeccdbd0e7262b7225ffdfa49e92
+Interpret the
+.I aio_reqprio
+field as an
+.B IOPRIO_VALUE
+as defined by
+.IR linux/ioprio.h.
+.RE
+.TP
 .I aio_resfd
 The file descriptor to signal in the event of asynchronous I/O completion.
 .SH RETURN VALUE
@@ -196,13 +208,21 @@ The AIO context specified by \fIctx_id\fP is invalid.
 \fInr\fP is less than 0.
 The \fIiocb\fP at
 .I *iocbpp[0]
-is not properly initialized,
-or the operation specified is invalid for the file descriptor
-in the \fIiocb\fP.
+is not properly initialized, the operation specified is invalid for the file
+descriptor in the \fIiocb\fP, or the value in the
+.I aio_reqprio
+field is invalid.
 .TP
 .B ENOSYS
 .BR io_submit ()
 is not implemented on this architecture.
+.TP
+.B EPERM
+The aio_reqprio field is set with the class
+.B IOPRIO_CLASS_RT
+, but the submitting context does not have the
+.B CAP_SYS_ADMIN
+privilege.
 .SH VERSIONS
 .PP
 The asynchronous I/O system calls first appeared in Linux 2.5.
-- 
2.17.1
