From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] posix_fallocate.3: Mention glibc emulation caveats.
Date: Fri, 2 Oct 2015 00:17:43 -0400
Message-ID: <560E0567.7040204@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Michael,

You're going to really enjoy reading this patch ;-)

Patch applies to master.

When the glibc implementation of posix_fallocate detects
that the underlying filesystem does not support fallocate
it uses an emulation function to attempt to allocate the
space requested. The most common case is calling
posix_fallocate for a file that is on NFS where the
NFS server is not new enough to support the recent fallocate
extensions. This emulation has various serious caveats that
must be understood in order to use posix_fallocate robustly
on all filesystems. The change document the caveats in the
glibc implementation.

Lastly, we expand the meaning of EINVAL to match POSIX
2013 (Issue 7). If the underlying filesystem doesn't support
posix_fallocate the implementation can return EINVAL, but
glibc does not do this, it emulates the operation instead.

Signed-off-by: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

diff --git a/man3/posix_fallocate.3 b/man3/posix_fallocate.3
index e35dcb9..1b91a37 100644
--- a/man3/posix_fallocate.3
+++ b/man3/posix_fallocate.3
@@ -83,7 +83,8 @@ exceeds the maximum file size.
 .I offset
 was less than 0, or
 .I len
-was less than or equal to 0.
+was less than or equal to 0, or the underlying filesystem does not
+support the operation.
 .TP
 .B ENODEV
 .I fd
@@ -142,6 +143,30 @@ In the glibc implementation,
 .BR posix_fallocate ()
 is implemented using
 .BR fallocate (2).
+If the underlying filesystem does not support the
+.BR fallocate (2)
+syscall then the operation is emulated with the following caveats:
+.IP * 2
+The emulation is inefficient.
+.IP *
+There is a race condition where concurrent writes from another thread or
+process could be overwritten with null bytes.
+.IP *
+There is a race condition where concurrent file size increase by
+another thread or process could result in a file whose size is smaller
+than expected.
+.IP *
+If fd has been opened with the O_APPEND or O_WRONLY flags the function
+will fail with
+.B EBADF.
+.PP
+In general the emulation is not MT-safe. On Linux, applications may use
+.BR fallocate (2)
+if they cannot work around the emulation caveats. In general this is
+only recommended if the application plans to terminate the operation if
+.B EOPNOTSUPP
+is returned, otherwise the application itself will need to implement an
+fallback with all the same problems as the emulation provided by glibc.
 .SH SEE ALSO
 .BR fallocate (1),
 .BR fallocate (2),
---

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
