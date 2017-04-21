From: Christian Brauner <christian.brauner-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ttyname(3): add NOTES section
Date: Fri, 21 Apr 2017 22:05:09 +0200
Message-ID: <20170421200509.23616-1-christian.brauner@ubuntu.com>
References: <8c7cb5df-bc2f-94d4-0a17-6efdf86f43b3@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8c7cb5df-bc2f-94d4-0a17-6efdf86f43b3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org, stgraber-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org
Cc: Christian Brauner <christian.brauner-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Christian Brauner <christian.brauner-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
---
 man3/ttyname.3 | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/man3/ttyname.3 b/man3/ttyname.3
index 0be50c62a..f184b4505 100644
--- a/man3/ttyname.3
+++ b/man3/ttyname.3
@@ -75,7 +75,7 @@ was too small to allow storing the pathname.
 .\" glibc commit 15e9a4f378c8607c2ae1aa465436af4321db0e23
 .B ENODEV
 File descriptor refers to a slave pseudoterminal device
-but the corresponding pathname could not be found.
+but the corresponding pathname could not be found (see NOTES).
 .SH ATTRIBUTES
 For an explanation of the terms used in this section, see
 .BR attributes (7).
@@ -93,6 +93,22 @@ T}	Thread safety	MT-Safe
 .TE
 .SH CONFORMING TO
 POSIX.1-2001, POSIX.1-2008, 4.2BSD.
+.SH NOTES
+Processes keeping a file descriptor to a
+.BR pts (4)
+device open when switching to
+.BR mount_namespaces (7)
+that use a different
+.IR /dev/ptmx
+instance may still accidently find that a device path of the same name
+for that file descriptor exists. However, this device path refers to a
+different device and thus cannot not be used to modify the device that
+the file descriptor refers to. Calling
+.BR ttyname (7)
+or
+.BR ttyname_r (7)
+on the file descriptor in such a mount namespace will cause these
+functions to return NULL and set errno to ENODEV.
 .SH SEE ALSO
 .BR tty (1),
 .BR fstat (2),
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
