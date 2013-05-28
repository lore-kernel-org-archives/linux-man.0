From: =?UTF-8?q?Beno=C3=AEt=20Bourbi=C3=A9?= <benoit.bourbie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Typo fix
Date: Tue, 28 May 2013 16:28:26 -0500
Message-ID: <1369776506-13902-1-git-send-email-benoit.bourbie@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Beno=C3=AEt=20Bourbi=C3=A9?= <benoit.bourbie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

"of" is duplicated
---
 man2/io_setup.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/io_setup.2 b/man2/io_setup.2
index 81b9a8b..549495a 100644
--- a/man2/io_setup.2
+++ b/man2/io_setup.2
@@ -21,7 +21,7 @@ There is no glibc wrapper for this system call; see NOTES.
 The
 .BR io_setup ()
 system call
-creates an asynchronous I/O context capable of of concurrently processing
+creates an asynchronous I/O context capable of concurrently processing
 at least \fInr_events\fP.
 The
 .I ctx_idp
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
