From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] ioctl.2: wfix
Date: Sun,  9 Nov 2014 11:52:01 +0100
Message-ID: <1415530321-6004-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

In most other manpages file descriptors are called fd.

This patches renames attribute d to fd.

cf. fs/ioctl.c:604
SYSCALL_DEFINE3(ioctl, unsigned int, fd, unsigned int, cmd, unsigned long, arg)

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/ioctl.2 | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/man2/ioctl.2 b/man2/ioctl.2
index 0a1c432..166c0aa 100644
--- a/man2/ioctl.2
+++ b/man2/ioctl.2
@@ -44,7 +44,7 @@ ioctl \- control device
 .SH SYNOPSIS
 .B #include <sys/ioctl.h>
 .sp
-.BI "int ioctl(int " d ", unsigned long " request ", ...);"
+.BI "int ioctl(int " fd ", unsigned long " request ", ...);"
 .\" POSIX says 'request' is int, but glibc has the above
 .\" See https://bugzilla.kernel.org/show_bug.cgi?id=42705
 .SH DESCRIPTION
@@ -56,7 +56,7 @@ In particular, many operating characteristics of character special files
 .BR ioctl ()
 requests.
 The argument
-.I d
+.I fd
 must be an open file descriptor.
 .PP
 The second argument is a device-dependent request code.
@@ -94,7 +94,7 @@ is set appropriately.
 .SH ERRORS
 .TP 0.7i
 .B EBADF
-.I d
+.I fd
 is not a valid descriptor.
 .TP
 .B EFAULT
@@ -108,13 +108,13 @@ or
 is not valid.
 .TP
 .B ENOTTY
-.I d
+.I fd
 is not associated with a character special device.
 .TP
 .B ENOTTY
 The specified request does not apply to the kind of object that the
 descriptor
-.I d
+.I fd
 references.
 .SH CONFORMING TO
 No single standard.
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
