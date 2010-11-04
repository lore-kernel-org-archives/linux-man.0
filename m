From: Adam Lackorzynski <adam-IG//nw+yl+iQIjdd1DhZXWfrygkm6VTR@public.gmane.org>
Subject: [PATCH] ioperm: Update port range description
Date: Thu, 4 Nov 2010 20:16:09 +0100
Message-ID: <20101104191609.GD5649@os.inf.tu-dresden.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

In recent Linux versions the I/O port range limitation for ioperm() is gone.


Signed-off-by: Adam Lackorzynski <adam-IG//nw+yl+iQIjdd1DhZXWfrygkm6VTR@public.gmane.org>
---
 man2/ioperm.2 |   11 ++++-------
 1 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/man2/ioperm.2 b/man2/ioperm.2
index 3470a8d..1d55ad1 100644
--- a/man2/ioperm.2
+++ b/man2/ioperm.2
@@ -51,14 +51,11 @@ sets the port access permission bits for the calling process for
 If \fIturn_on\fP is nonzero, the calling process must be privileged
 .RB ( CAP_SYS_RAWIO ).
 
-.\" FIXME is the following ("Only the first 0x3ff I/O ports can be
-.\" specified in this manner") still true?  Looking at changes in
-.\" include/asm-i386/processor.h between 2.4 and 2.6 suggests
-.\" that the limit is different in 2.6.
-Only the first 0x3ff I/O ports can be specified in this manner.
-For more ports, the
+Up to Linux 2.6.7 only the first 0x3ff I/O ports can be specified in this
+manner.  For more ports, the
 .BR iopl (2)
-system call must be used.
+system call must be used. With Linux 2.6.8 or later all I/O ports can be
+specified.
 
 Permissions are not inherited by the child created by
 .BR fork (2).
-- 
1.7.2.3


Adam
-- 
Adam                 adam-IG//nw+yl+iQIjdd1DhZXWfrygkm6VTR@public.gmane.org
  Lackorzynski         http://os.inf.tu-dresden.de/~adam/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
