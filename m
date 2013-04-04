From: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/4] io_destroy.2: fix up the description
Date: Thu,  4 Apr 2013 15:36:56 -0400
Message-ID: <1365104218-26042-3-git-send-email-jmoyer@redhat.com>
References: <1365104218-26042-1-git-send-email-jmoyer@redhat.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365104218-26042-1-git-send-email-jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: chrubis-AlSwsSmVLrQ@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The description was rather vague, citing a "list of I/O contexts" and
stating that it "can" cancel outstanding requests.  This update makes
things more concrete so that a reader knows exactly what's going on.

Signed-off-by: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man2/io_destroy.2 |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/man2/io_destroy.2 b/man2/io_destroy.2
index 26a84f3..ea318bd 100644
--- a/man2/io_destroy.2
+++ b/man2/io_destroy.2
@@ -21,12 +21,9 @@ There is no glibc wrapper for this system call; see NOTES.
 The
 .BR io_destroy ()
 system call
-removes the asynchronous I/O context specified by
-.I ctx_id
-from the list of
-I/O contexts and then destroys it.
-It can also cancel any outstanding asynchronous I/O
-actions on \fIctx_id\fP and block on completion.
+will attempt to cancel all outstanding asynchronous I/O operations
+against \fIctx_id\fP, will block on the completion of all operations
+that could not be cancelled, and will destroy the the \fIctx_id\fP.
 .SH RETURN VALUE
 On success,
 .BR io_destroy ()
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
