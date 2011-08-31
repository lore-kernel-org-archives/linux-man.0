From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] fallocate.2, unix.7: add section number
Date: Wed, 31 Aug 2011 23:36:00 +0900
Message-ID: <4E5E46D0.7080800@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

man-pages version: latest git repository
why: Add section number to references to functions documented in other pages


diff --git a/man2/fallocate.2 b/man2/fallocate.2
--- a/man2/fallocate.2
+++ b/man2/fallocate.2
@@ -17,7 +17,7 @@ fallocate \- manipulate file space
This is a nonportable, Linux-specific system call.
For the portable, POSIX.1-specified method of ensuring that space
is allocated for a file, see
-.BR posix_fallocate ().
+.BR posix_fallocate (3).

.BR fallocate ()
allows the caller to directly manipulate the allocated disk space
diff --git a/man7/unix.7 b/man7/unix.7
--- a/man7/unix.7
+++ b/man7/unix.7
@@ -346,7 +346,7 @@ specified on a connected socket.
.TP
.B ENOENT
The pathname in the remote address specified to
-.BR connect ()
+.BR connect (2)
did not exist.
.TP
.B ENOMEM

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
