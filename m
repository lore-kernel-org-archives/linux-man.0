From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] fanotify_mark.2: mention FAN_Q_OVERFLOW
Date: Tue,  8 Nov 2016 23:13:38 +0100
Message-ID: <20161108221338.9611-1-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

To receive overflow events it is necessary to set this bit
in fanotify_mark().

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/fanotify_mark.2 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/man2/fanotify_mark.2 b/man2/fanotify_mark.2
index 88aa17e..4933ecc 100644
--- a/man2/fanotify_mark.2
+++ b/man2/fanotify_mark.2
@@ -149,6 +149,13 @@ Create an event when a read-only file or directory is closed.
 .B FAN_OPEN
 Create an event when a file or directory is opened.
 .TP
+.B FAN_Q_OVERFLOW
+Create an event when an overflow of the event queue occurs.
+The size of the event queue is limited to 16384 entries if
+.B FAN_UNLIMITED_QUEUE
+is not set in
+.BR fanotify_init (2).
+.TP
 .B FAN_OPEN_PERM
 Create an event when a permission to open a file or directory is requested.
 An fanotify file descriptor created with
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
