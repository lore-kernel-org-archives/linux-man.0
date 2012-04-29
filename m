From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] open(2): document O_PATH
Date: Sat, 28 Apr 2012 23:25:17 -0400
Message-ID: <1335669917-23970-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man2/open.2 |   16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/man2/open.2 b/man2/open.2
index a655fae..61689cf 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -47,7 +47,6 @@
 .\" FIXME . Apr 08: The next POSIX revision has O_EXEC, O_SEARCH, and
 .\" O_TTYINIT.  Eventually these may need to be documented.  --mtk
 .\" FIXME Linux 2.6.33 has O_DSYNC, and a hidden __O_SYNC.
-.\" FIXME: Linux 2.6.39 added O_PATH
 .\"
 .TH OPEN 2 2012-02-27 "Linux" "Linux Programmer's Manual"
 .SH NAME
@@ -428,6 +427,21 @@ For a discussion of the effect of
 in conjunction with mandatory file locks and with file leases, see
 .BR fcntl (2).
 .TP
+.B O_PATH
+The path is opened for accessing its file attributes only.  Since the file
+itself is not opened, most operations (such as
+.BR read (2)
+or
+.BR write (2))
+will return
+.BR EBADF .
+You may however use functions that operate on the file descriptor itself
+such as
+.BR close (2),
+functions that duplicate file descriptors, and as the dirfd argument with
+all the *at style of functions (e.g.
+.BR openat (2)).
+.TP
 .B O_SYNC
 The file is opened for synchronous I/O.
 Any
-- 
1.7.9.7

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
