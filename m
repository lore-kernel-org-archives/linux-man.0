From: Eric Blake <ebb9-PGZyUNKar/Q@public.gmane.org>
Subject: [PATCH] * openpty.3: Use const as appropriate
Date: Fri,  5 Feb 2010 14:05:30 -0700
Message-ID: <1265403930-5005-1-git-send-email-ebb9@byu.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: ebb9-PGZyUNKar/Q@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Eric Blake <ebb9-PGZyUNKar/Q@public.gmane.org>
---
Make the openpty/forkpty man page match /usr/include/pty.h as
included in glibc 2.11.1.

 man3/openpty.3 |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/man3/openpty.3 b/man3/openpty.3
index e033af0..a36352b 100644
--- a/man3/openpty.3
+++ b/man3/openpty.3
@@ -29,7 +29,7 @@
 .\"
 .\" Added -lutil remark, 030718
 .\"
-.TH OPENPTY 3  2003-07-18 "GNU" "Linux Programmer's Manual"
+.TH OPENPTY 3  2010-02-05 "GNU" "Linux Programmer's Manual"
 .SH NAME
 openpty, login_tty, forkpty \- tty utility functions
 .SH SYNOPSIS
@@ -37,10 +37,12 @@ openpty, login_tty, forkpty \- tty utility functions
 .B #include <pty.h>
 .sp
 .BI "int openpty(int *" amaster ", int *" aslave ", char *" name ,
-.BI "            struct termios *" termp ", struct winsize *" winp );
+.BI "            const struct termios *" termp ,
+.BI "            const struct winsize *" winp );
 .sp
-.BI "pid_t forkpty(int *" amaster ", char *" name ", struct termios *" termp ,
-.BI "              struct winsize *" winp );
+.BI "pid_t forkpty(int *" amaster ", char *" name ,
+.BI "              const struct termios *" termp ,
+.BI "              const struct winsize *" winp );
 .sp
 .B #include <utmp.h>
 .sp
-- 
1.6.6

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
