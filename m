From: =?ISO-8859-1?Q?Martin_P=E4rtel?= <martin.partel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] posix_fallocate.3: EBADF possible when lacking read access
Date: Tue, 09 Oct 2012 01:43:20 +0300
Message-ID: <50735708.7090900@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

posix_fallocate on a write-only FD may fail with a EBADF when fallocate(2) is unsupported by the filesystem and glibc must emulate it.
The emulation requires read-write access to the file. The source code is in glibc's sysdeps/posix/posix_fallocate.c


Applies to git master.

diff --git a/man3/posix_fallocate.3 b/man3/posix_fallocate.3
index 6fae367..b92c140 100644
--- a/man3/posix_fallocate.3
+++ b/man3/posix_fallocate.3
@@ -71,7 +71,8 @@ is not set.
 .TP
 .B EBADF
 .I fd
-is not a valid file descriptor, or is not opened for writing.
+is not a valid file descriptor, or is not opened for
+both reading and writing.
 .TP
 .B EFBIG
 .I offset+len
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
