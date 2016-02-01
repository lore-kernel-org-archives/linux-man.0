From: Andreas Gruenbacher <agruenba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] aio.7: Improve example
Date: Mon,  1 Feb 2016 10:46:58 +0100
Message-ID: <1454320018-14176-1-git-send-email-agruenba@redhat.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Andreas Gruenbacher <agruenba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

When aio_sigevent.sigev_notify is set to SIGEV_SIGNAL, signal handlers
called for asychronous I/O operations will have si->si_code set to
SI_ASYNCIO.  Check to make sure that si->si_value.sival_ptr is defined.

Signed-off-by: Andreas Gruenbacher <agruenba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 aio.7 | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/aio.7 b/aio.7
index 1f861da..21193fd 100644
--- a/aio.7
+++ b/aio.7
@@ -281,12 +281,14 @@ quitHandler(int sig)
 static void                 /* Handler for I/O completion signal */
 aioSigHandler(int sig, siginfo_t *si, void *ucontext)
 {
-    write(STDOUT_FILENO, "I/O completion signal received\\n", 31);
+    if (si->si_code == SI_ASYNCIO) {
+        write(STDOUT_FILENO, "I/O completion signal received\\n", 31);
 
-    /* The corresponding ioRequest structure would be available as
-           struct ioRequest *ioReq = si\->si_value.sival_ptr;
-       and the file descriptor would then be available via
-           ioReq\->aiocbp\->aio_fildes */
+        /* The corresponding ioRequest structure would be available as
+               struct ioRequest *ioReq = si\->si_value.sival_ptr;
+           and the file descriptor would then be available via
+               ioReq\->aiocbp\->aio_fildes */
+    }
 }
 
 int
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
