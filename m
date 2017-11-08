From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] ioctl_tty.2: tfix
Date: Wed,  8 Nov 2017 23:32:50 +0100
Message-ID: <20171108223250.1924-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/ioctl_tty.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/ioctl_tty.2 b/man2/ioctl_tty.2
index 346f86bf5..cd2a30425 100644
--- a/man2/ioctl_tty.2
+++ b/man2/ioctl_tty.2
@@ -281,7 +281,7 @@ Set the foreground process group ID of this terminal.
 .TP
 .BI "TIOCGSID	pid_t *" argp
 Get the session ID of the given terminal.
-This fails fail with the error
+This fails with the error
 .B ENOTTY
 if the terminal is not a master pseudoterminal
 and not our controlling terminal.
@@ -293,7 +293,7 @@ Put the terminal into exclusive mode.
 No further
 .BR open (2)
 operations on the terminal are permitted.
-(They fail fail with
+(They fail with
 .BR EBUSY ,
 except for a process with the
 .BR CAP_SYS_ADMIN
-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
