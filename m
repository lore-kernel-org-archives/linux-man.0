From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: arm_fadvise() man page
Date: Sat, 9 Oct 2010 06:50:29 +0200
Message-ID: <AANLkTinQ7xBBa1VqR9oiLoh=7JCiR7BAeFceE3Cgc+TT@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

[Was: man pages for undocumented system calls]

Stephan,

The situation here is similar to sync_file_range, but specific to ARM.
The documentation would better be in the posix_fadvise() page, should
explicitly note that this system call is for ARM only, and should note
why the system call exists. For man-pages-3.29, I applied the patch
below.

Thanks,

Michael

--- a/man2/posix_fadvise.2
+++ b/man2/posix_fadvise.2
@@ -148,6 +149,30 @@ call
 or
 .BR fdatasync (2)
 first.
+.SS arm_fadvise()
+The ARM architecture
+needs 64-bit arguments to be aligned in a suitable pair of registers.
+On this architecture, the call signature of
+.BR posix_fadvise ()
+is flawed, since it forces a register to be wasted as padding between the
+.I fd
+and
+.I len
+arguments.
+Therefore, since Linux 2.6.14, ARM defines a different
+system call that orders the arguments suitably:
+.PP
+.in +4n
+.nf
+.BI "long arm_fadvise64_64(int " fd ", int " advice ,
+.BI "                     loff_t " offset ", loff_t " len );
+.fi
+.in
+.PP
+The behavior of this system call is otherwise exactly the same as
+.BR posix_fadvise().
+No library support is provided for this system call in glibc.
+.\" No ARM support in glibc.
 .SH BUGS
 In kernels before 2.6.6, if
 .I len

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
