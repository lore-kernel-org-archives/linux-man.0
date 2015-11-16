From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] tty_ioctl.4: Remove TIOCTTYGSTRUCT ioctl info
Date: Mon, 16 Nov 2015 16:39:29 -0500
Message-ID: <1447709969-26477-1-git-send-email-peter@hurleysoftware.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Thankfully, TIOCTTYGSTRUCT was removed in v2.5.67 by:

    commit b3506a09d15dc5aee6d4bb88d759b157016e1864
    Author: Andries E. Brouwer <andries.brouwer-rh8NL+sEX9E@public.gmane.org>
    Date:   Tue Apr 1 04:42:46 2003 -0800

    [PATCH] kill TIOCTTYGSTRUCT

    Only used for (dubious) debugging purposes, and exposes
    internal kernel state.

[The git SHA is from Thomas Gleixner's history tree at
https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git]

Signed-off-by: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
---
 man4/tty_ioctl.4 | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/man4/tty_ioctl.4 b/man4/tty_ioctl.4
index 53645d8..c3bee35 100644
--- a/man4/tty_ioctl.4
+++ b/man4/tty_ioctl.4
@@ -471,14 +471,6 @@ For the
 .B TIOCLINUX
 ioctl, see
 .BR console_ioctl (4).
-.SS Kernel debugging
-.B "#include <linux/tty.h>"
-.TP
-.BI "TIOCTTYGSTRUCT	struct tty_struct *" argp
-Get the
-.I tty_struct
-corresponding to
-.IR fd .
 .\"
 .\" .SS Serial info
 .\" .BR "#include <linux/serial.h>"
-- 
2.6.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
