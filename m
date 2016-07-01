From: Jann Horn <jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] setfsuid.2: Fix note about errors from the syscall wrapper
Date: Fri,  1 Jul 2016 16:14:09 +0200
Message-ID: <1467382449-32544-1-git-send-email-jannh@google.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jann Horn <jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

See sysdeps/unix/sysv/linux/i386/setfsuid.c in glibc-2.2.1.
(This code is not present in modern glibc anymore.)

Signed-off-by: Jann Horn <jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
---
 man2/setfsgid.2 | 6 ++++--
 man2/setfsuid.2 | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/man2/setfsgid.2 b/man2/setfsgid.2
index d1d021d..910b3fd 100644
--- a/man2/setfsgid.2
+++ b/man2/setfsgid.2
@@ -77,8 +77,10 @@ This system call is present in Linux since version 1.2.
 is Linux-specific and should not be used in programs intended
 to be portable.
 .SH NOTES
-When glibc determines that the argument is not a valid group ID,
-it will return \-1 and set \fIerrno\fP to
+When old versions of glibc determine that the argument can not be
+passed to the kernel without integer truncation (because the kernel
+is old and does not support 32-bit group IDs),
+they will return \-1 and set \fIerrno\fP to
 .B EINVAL
 without attempting
 the system call.
diff --git a/man2/setfsuid.2 b/man2/setfsuid.2
index 57b125e..08735df 100644
--- a/man2/setfsuid.2
+++ b/man2/setfsuid.2
@@ -77,8 +77,10 @@ This system call is present in Linux since version 1.2.
 is Linux-specific and should not be used in programs intended
 to be portable.
 .SH NOTES
-When glibc determines that the argument is not a valid user ID,
-it will return \-1 and set \fIerrno\fP to
+When old versions of glibc determine that the argument can not be
+passed to the kernel without integer truncation (because the kernel
+is old and does not support 32-bit user IDs),
+they will return \-1 and set \fIerrno\fP to
 .B EINVAL
 without attempting
 the system call.
-- 
2.8.0.rc3.226.g39d4020

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
