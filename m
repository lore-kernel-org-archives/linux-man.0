From: "Gregory P. Smith" <gps-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: PATCH: readahead(2) man page incorrectly states that it blocks
Date: Thu, 7 Jan 2010 16:51:47 -0800
Message-ID: <8bf6f5a21001071651s6fa4bcf3q4eae23ba628fb609@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Patch below.

This was reported on the mailing list several months ago by Corrado Zoc=
colo:

=A0http://www.spinics.net/lists/linux-man/msg00961.html

diff --git a/man2/readahead.2 b/man2/readahead.2
index 886b22a..a07bcbe 100644
--- a/man2/readahead.2
+++ b/man2/readahead.2
@@ -58,7 +58,9 @@ equal to
 .BR readahead ()
 does not read beyond the end of the file.
 .BR readahead ()
-blocks until the specified data has been read.
+is asynchronous and returns immediately.
+The next system call reading from the file descriptor
+will block until data is available.
 The current file offset of the open file referred to by
 .I fd
 is left unchanged.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
