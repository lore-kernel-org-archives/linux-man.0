From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 99911] ioperm is kept on fork
Date: Tue, 15 Mar 2016 03:37:47 +0000
Message-ID: <bug-99911-11311-7i9rCgF5nU@https.bugzilla.kernel.org/>
References: <bug-99911-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-99911-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=99911

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #3 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Alex, sorry for the long delay in following up.

I have applied the patch below. Closing this bug.

Cheers,

Michael


diff --git a/man2/ioperm.2 b/man2/ioperm.2
index 91d081c..6171e1c 100644
--- a/man2/ioperm.2
+++ b/man2/ioperm.2
@@ -63,11 +63,9 @@ system call had to be used (with a
 argument of 3).
 Since Linux 2.6.8, 65,536 I/O ports can be specified.

-Permissions are not inherited by the child created by
-.BR fork (2);
-following a
+Permissions are inherited by the child created by
 .BR fork (2)
-the child must turn on those permissions that it needs.
+(but see NOTES).
 Permissions are preserved across
 .BR execve (2);
 this is useful for giving port access permissions to unprivileged
@@ -107,6 +105,10 @@ The
 .I /proc/ioports
 file shows the I/O ports that are currently allocated on the system.

+Before Linux 2.4,
+permissions were not inherited by a child created by
+.BR fork (2).
+
 Glibc has an
 .BR ioperm ()
 prototype both in

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
