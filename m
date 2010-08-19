From: Linus Nilsson <lajnold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] error.3: change perror(errnum) to strerror(errnum) in description
Date: Thu, 19 Aug 2010 03:22:10 +0200
Message-ID: <AANLkTikb5QCDgbZDZDvrS+jmfkugptFC1KSTA4Gj=aQy@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This patch changes perror to strerror, as strerror is the one that takes an
error code.
The patch also adds a \fP after the underlining of "errnum", so the text
following it is no longer underlined.

The patch applies to current git.

--- a/man3/error.3
+++ b/man3/error.3
@@ -55,7 +55,7 @@ the program name, a colon and a space, the message
specified by the
 .BR printf (3)-style
 format string \fIformat\fP, and, if \fIerrnum\fP is
 nonzero, a second colon and a space followed by the string given by
-\fBperror(\fIerrnum\fB)\fP.
+\fBstrerror(\fP\fIerrnum\fP\fB)\fP.
 Any arguments required for
 .I format
 should follow
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
