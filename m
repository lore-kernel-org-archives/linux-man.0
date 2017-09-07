From: Sage Weil <sage-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] io_submit.2: acknowledge possibility of short return
Date: Thu,  7 Sep 2017 16:44:28 -0400
Message-ID: <20170907204428.8344-1-sage@redhat.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sage Weil <sage-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Note that the return value may be a value less than nr
if not all iocbs were queued at once.  This would have saved
me an embarrassing amount of time.

Signed-off-by: Sage Weil <sage-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man2/io_submit.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/io_submit.2 b/man2/io_submit.2
index 36465b64b..77ba34671 100644
--- a/man2/io_submit.2
+++ b/man2/io_submit.2
@@ -32,7 +32,7 @@ which will be submitted to context \fIctx_id\fP.
 On success,
 .BR io_submit ()
 returns the number of \fIiocb\fPs submitted (which may be
-0 if \fInr\fP is zero).
+less than \fInr\fP, or 0 if \fInr\fP is zero).
 For the failure return, see NOTES.
 .SH ERRORS
 .TP
-- 
2.13.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
