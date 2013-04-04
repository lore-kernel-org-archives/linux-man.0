From: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/4] io_getevents.2: timeout will not be updated
Date: Thu,  4 Apr 2013 15:36:57 -0400
Message-ID: <1365104218-26042-4-git-send-email-jmoyer@redhat.com>
References: <1365104218-26042-1-git-send-email-jmoyer@redhat.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365104218-26042-1-git-send-email-jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: chrubis-AlSwsSmVLrQ@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

I looked back through the kernel code, and the timeout was never updated
in any case.  I've submitted a patch upstream to change the comment
above io_getevents.

Signed-off-by: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man2/io_getevents.2 |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/man2/io_getevents.2 b/man2/io_getevents.2
index 34ecd4a..72317c3 100644
--- a/man2/io_getevents.2
+++ b/man2/io_getevents.2
@@ -30,8 +30,7 @@ specified by \fIctx_id\fP.
 The \fItimeout\fP argument specifies the amount of time to wait for events,
 where a NULL timeout waits until at least \fImin_nr\fP events
 have been seen.
-Note that \fItimeout\fP is relative and will be updated if not NULL
-and the operation blocks.
+Note that \fItimeout\fP is relative.
 .SH RETURN VALUE
 On success,
 .BR io_getevents ()
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
