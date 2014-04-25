From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] fanotify: remove redundant mentioning of bugs
Date: Fri, 25 Apr 2014 16:59:13 +0200
Message-ID: <1398437953-7086-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

A bug mentioned in fanotify_mark(2) needs not to be repeated in
fanotify(7) again.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man7/fanotify.7 | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/man7/fanotify.7 b/man7/fanotify.7
index 1af1ebe..d529629 100644
--- a/man7/fanotify.7
+++ b/man7/fanotify.7
@@ -439,14 +439,8 @@ The event queue can overflow.
 In this case, events are lost.
 .SH BUGS
 As of Linux 3.15,
-the following bugs exist:
+the following bug exists:
 .IP * 3
-.\" FIXME: Patch is in linux-next-20140424.
-.BR readdir (2)
-does not create a
-.B FAN_ACCESS
-event.
-.IP *
 .\" FIXME: A patch was proposed.
 When an event is generated, no check is made to see whether the user ID of the
 receiving process has authorization to read or write the file before passing a
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
