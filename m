From: Sam Clegg <sam-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Subject: [patch] Change the name of first ioctl arg to 'fd'.
Date: Mon, 05 Aug 2013 12:36:47 -0700
Message-ID: <51FFFECF.3000500@superduper.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090200070704020002040800"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------090200070704020002040800
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I noticed this inconsistency between the ioctl man pages and the pages
for all other FD accepting syscalls.

--------------090200070704020002040800
Content-Type: text/x-patch;
 name="0001-Change-the-name-of-first-ioctl-arg-from-d-to-fd.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-Change-the-name-of-first-ioctl-arg-from-d-to-fd.patch"

diff --git a/man2/ioctl.2 b/man2/ioctl.2
index 3d7a11c..d00e71a 100644
--- a/man2/ioctl.2
+++ b/man2/ioctl.2
@@ -44,7 +44,7 @@ ioctl \- control device
 .SH SYNOPSIS
 .B #include <sys/ioctl.h>
 .sp
-.BI "int ioctl(int " d ", int " request ", ...);"
+.BI "int ioctl(int " fd ", int " request ", ...);"
 .SH DESCRIPTION
 The
 .BR ioctl ()
@@ -54,7 +54,7 @@ In particular, many operating characteristics of character special files
 .BR ioctl ()
 requests.
 The argument
-.I d
+.I fd
 must be an open file descriptor.
 .PP
 The second argument is a device-dependent request code.
@@ -92,8 +92,8 @@ is set appropriately.
 .SH ERRORS
 .TP 0.7i
 .B EBADF
-.I d
-is not a valid descriptor.
+.I fd
+is not a valid file descriptor.
 .TP
 .B EFAULT
 .I argp
@@ -106,13 +106,13 @@ or
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
1.8.3


--------------090200070704020002040800--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
