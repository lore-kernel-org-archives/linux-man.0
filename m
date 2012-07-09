From: Alex Henrie <alexh-qHTrr9Xtw9LQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ioperm.2: The maximum port number limit is gone
Date: Mon, 09 Jul 2012 09:39:53 -0600 (MDT)
Message-ID: <8cbbaba0-b3c0-44c4-bfb1-063b549f2fcb@zms02.zcs>
References: <df2cd958-9e85-4f84-a96c-c7a8299076d9@zms02.zcs>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <df2cd958-9e85-4f84-a96c-c7a8299076d9-Jwbh9eb7SLD1P9xLtpHBDw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexhenrie24-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

This documentation really confused me and needs to be updated. H. Peter Anvin, the maintainer for this part of the kernel, emailed me to clarify that the 0x3ff limit has been gone since Linux 2.6.8.

Signed-off-by: Alex Henrie <alexh-qHTrr9Xtw9LQT0dZR+AlfA@public.gmane.org>
---
 man2/ioperm.2 |   14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/man2/ioperm.2 b/man2/ioperm.2
index 3470a8d..11304aa 100644
--- a/man2/ioperm.2
+++ b/man2/ioperm.2
@@ -51,15 +51,6 @@ sets the port access permission bits for the calling process for
 If \fIturn_on\fP is nonzero, the calling process must be privileged
 .RB ( CAP_SYS_RAWIO ).
 
-.\" FIXME is the following ("Only the first 0x3ff I/O ports can be
-.\" specified in this manner") still true?  Looking at changes in
-.\" include/asm-i386/processor.h between 2.4 and 2.6 suggests
-.\" that the limit is different in 2.6.
-Only the first 0x3ff I/O ports can be specified in this manner.
-For more ports, the
-.BR iopl (2)
-system call must be used.
