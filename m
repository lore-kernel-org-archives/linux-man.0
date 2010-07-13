From: Linus Nilsson <lajnold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] error.3: change perror(errnum) to strerror(errnum)
Date: Tue, 13 Jul 2010 03:17:47 +0200
Message-ID: <AANLkTikN4zMpd1SKkWT3ZkZbB-nsgG-cBN4E-w252W2y@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

As I was reading "man 3 error", I noticed that it mentioned
"perror(errnum)", but it is "strerror" that gives back a string
description given an error code.

The problem was noticed in man-pages 3.25, and the patch was made
against current git.

diff --git a/man3/error.3 b/man3/error.3
index fc4dfbe..f2fcf8c 100644
--- a/man3/error.3
+++ b/man3/error.3
@@ -55,7 +55,7 @@ the program name, a colon and a space, the message
specified by the
 .BR printf (3)-style
 format string \fIformat\fP, and, if \fIerrnum\fP is
 nonzero, a second colon and a space followed by the string given by
-\fBperror(\fIerrnum\fB)\fP.
+\fBstrerror(\fIerrnum\fB)\fP.
 Any arguments required for
 .I format
 should follow
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
