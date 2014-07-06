From: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] pipe.7: Add reference that the pipe capacity can be changed.
Date: Sun,  6 Jul 2014 15:44:11 +0200
Message-ID: <1404654251-8293-3-git-send-email-eliedebrauwer@gmail.com>
References: <1404654251-8293-1-git-send-email-eliedebrauwer@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404654251-8293-1-git-send-email-eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

In fcntl(2) F_SETPIPE_SZ, F_GETPIPE_SZ and /proc/sys/fs/pipe-max-size are
defined, however pipe(7) still defines the pipe capacity as being a static
entity. Adding a reference to fcntl(2).

Signed-off-by: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man7/pipe.7 | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/man7/pipe.7 b/man7/pipe.7
index 78d1cea..64a6761 100644
--- a/man7/pipe.7
+++ b/man7/pipe.7
@@ -133,6 +133,16 @@ so that a writing process does not remain blocked.
 In Linux versions before 2.6.11, the capacity of a pipe was the same as
 the system page size (e.g., 4096 bytes on i386).
 Since Linux 2.6.11, the pipe capacity is 65536 bytes.
+Since Linux 2.6.35, the pipe capacity can be queried and set using the
+.BR fcntl (2)
+.BR F_GETPIPE_SZ
+and
+.BR F_SETPIPE_SZ
+operations.
+See
+.BR fcntl (2)
+for more information.
+
 .SS PIPE_BUF
 POSIX.1-2001 says that
 .BR write (2)s
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
