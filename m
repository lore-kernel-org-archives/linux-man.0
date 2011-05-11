From: John Hammond <jhammond-Tmo6s3XX3Xr5xfTjtVVUew@public.gmane.org>
Subject: [PATCH] setbuf.3: stdio buffers are allocated by mmap() not malloc()
Date: Wed, 11 May 2011 16:30:08 -0500
Message-ID: <4DCAFFE0.7030307@tacc.utexas.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

This patch applies to man-pages 3.33.  setbuf.3 claims that stdio
buffers are allocated by malloc().  Strangely this is not the case;
they are allocated using mmap() by way of the macro ALLOC_BUF() in
glibc-2.13.90/libio/libioP.h:803.

Best,

John

---
--- a/man3/setbuf.3
+++ b/man3/setbuf.3
@@ -83,7 +83,7 @@ may be used to force the block out early.
 .BR fclose (3).)
 Normally all files are block buffered.
 When the first I/O operation occurs on a file,
-.BR malloc (3)
+.BR mmap (2)
 is called, and a buffer is obtained.
 If a stream refers to a terminal (as
 .I stdout
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
