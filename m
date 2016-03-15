From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 99901] iopl is lost on fork and execve
Date: Tue, 15 Mar 2016 03:37:16 +0000
Message-ID: <bug-99901-11311-l7iIHsFgMb@https.bugzilla.kernel.org/>
References: <bug-99901-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-99901-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=99901

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #2 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Alex, sorry for the long delay in following up.

I have applied the patch below. Closing this bug.

Cheers,

Michael

diff --git a/man2/iopl.2 b/man2/iopl.2
index 93dca3f..86f5242 100644
--- a/man2/iopl.2
+++ b/man2/iopl.2
@@ -53,10 +53,11 @@ In addition to granting unrestricted I/O port access,
running at a higher
 I/O privilege level also allows the process to disable interrupts.
 This will probably crash the system, and is not recommended.

-Permissions are inherited by
+Permissions are not inherited by the child process created by
 .BR fork (2)
-and
-.BR execve (2).
+and are not preserved across
+.BR execve (2)
+(but see NOTES).

 The I/O privilege level for a normal process is 0.

@@ -97,6 +98,16 @@ Glibc2 has a prototype both in
 and in
 .IR <sys/perm.h> .
 Avoid the latter, it is available on i386 only.
+
+Prior to Linux 3.7,
+on some architectures (such as i386), permissions
+.I were
+inherited by the child produced by
+.BR fork (2)
+and were preserved across
+.BR execve (2).
+This behavior was inadvertently changed in Linux 3.7,
+and won't be reinstated.
 .SH SEE ALSO
 .BR ioperm (2),
 .BR outb (2),

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
