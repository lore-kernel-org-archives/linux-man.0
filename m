From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] aio_cancel.3, aio_suspend.3: ffix
Date: Tue, 15 May 2012 23:10:44 -0400
Message-ID: <1337137844-26841-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/aio_cancel.3  |    2 +-
 man3/aio_suspend.3 |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/aio_cancel.3 b/man3/aio_cancel.3
index 8b80275..c800075 100644
--- a/man3/aio_cancel.3
+++ b/man3/aio_cancel.3
@@ -104,7 +104,7 @@ The cause of the error can be found by inspecting
 is not a valid file descriptor.
 .TP
 .B ENOSYS
-.BR aio_cancel()
+.BR aio_cancel ()
 is not implemented.
 .SH VERSIONS
 The
diff --git a/man3/aio_suspend.3 b/man3/aio_suspend.3
index 1215ff7..05d045d 100644
--- a/man3/aio_suspend.3
+++ b/man3/aio_suspend.3
@@ -97,7 +97,7 @@ waiting for); see
 .BR signal (7).
 .TP
 .B ENOSYS
-.BR aio_suspend()
+.BR aio_suspend ()
 is not implemented.
 .SH VERSIONS
 The
-- 
1.7.10

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
