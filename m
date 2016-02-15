From: "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] termios.3: Document line length in canonical mode
Date: Mon, 15 Feb 2016 14:26:59 +0100
Message-ID: <1455542819-29184-1-git-send-email-toddy@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

See https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/n_tty.c#n1673
See https://bugs.debian.org/797479
---
 man3/termios.3 | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/man3/termios.3 b/man3/termios.3
index 7d738d4..3f57607 100644
--- a/man3/termios.3
+++ b/man3/termios.3
@@ -728,11 +728,20 @@ requested fewer bytes than are available in the current line of input,
 then only as many bytes as requested are read,
 and the remaining characters will be available for a future
 .BR read (2).
+.IP * 2
+The maximum line length is 4096 chars (including the line termination
+char); lines longer than 4096 chars are truncated. After 4095 chars,
+input data is still processed but not stored. Overflow processing
+ensures the tty can always receive more input until at least one
+line can be read.
 .PP
 In noncanonical mode input is available immediately (without
 the user having to type a line-delimiter character),
 no input processing is performed,
 and line editing is disabled.
+The read buffer will only accept 4095 chars; this provides the
+necessary space for a newline char if the input mode is switched
+to canonical.
 The settings of MIN
 .RI ( c_cc[VMIN] )
 and TIME
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
