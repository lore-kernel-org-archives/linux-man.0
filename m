From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] fanotify: read(2) error handling
Date: Sat,  3 May 2014 18:57:49 +0200
Message-ID: <1399136269-7930-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The last lines of fanotify_read() in fanotify_user.c are:
	if (start != buf && ret != -EFAULT)
		ret = buf - start;
	return ret;

This implies that an error code is only returned, if reading the first
event on the queue fails or if EFAULT occurs.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man7/fanotify.7 | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/man7/fanotify.7 b/man7/fanotify.7
index 083244f..6936b88 100644
--- a/man7/fanotify.7
+++ b/man7/fanotify.7
@@ -131,6 +131,14 @@ until either a file event occurs or the call is interrupted by a signal
 The return value of
 .BR read (2)
 is the length of the filled buffer, or \-1 in case of an error.
+If multiple events are on the fanotify queue,
+.BR read (2)
+will only report an error, if reading the first event fails or an error
+.B EFAULT
+occurs.
+If reading the first event is successful but reading any further event fails,
+.BR read (2)
+returns the length of the buffer filled with all prior events.
 After a successful
 .BR read (2),
 the read buffer contains one or more of the following structures:
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
