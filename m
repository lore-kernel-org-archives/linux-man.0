From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: sync_file_range2() man page
Date: Sat, 9 Oct 2010 05:39:08 +0200
Message-ID: <AANLkTi=WLtBgVaasueS_E59NpCJ++GP5sF4fFUdP+4T_@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

[was: man pages for undocumented system calls]

Stephan,

Thanks for this page. It is worth documenting the existence of this
system call, but we need to do it differently:

1. It's best documented as an addition to the sync_file_rabge.2 page.

2. There needs to be an explanation of why the system call exists.

I wrote the patch below for man-pages-3.29.

Cheers,

Michael

--- a/man2/sync_file_range.2
+++ b/man2/sync_file_range.2
@@ -179,6 +180,40 @@ appeared on Linux in kernel 2.6.17.
 .SH "CONFORMING TO"
 This system call is Linux-specific, and should be avoided
 in portable programs.
+.SH NOTES
+Some architectures (e.g., PowerPC, ARM)
+need 64-bit arguments to be aligned in a suitable pair of registers.
+.\" See kernel commit edd5cd4a9424f22b0fa08bef5e299d41befd5622
+On such architectures, the call signature of
+.BR sync_file_range ()
+is flawed, since it forces a register to be wasted as padding between the
+.I fd
+and
+.I offset
+arguments.
+Therefore, these architectures define a different
+system call that orders the arguments suitably:
+.PP
+.in +4n
+.nf
+.BI "int sync_file_range2(int " fd ", unsigned int " flags ,
+.BI "                     off64_t " offset ", off64_t " nbytes );
+.fi
+.in
+.PP
+The behavior of this system call is otherwise exactly the same as
+.BR sync_file_range().
+
+A system call with this signature first appeared on the ARM architecture
+in Linux 2.6.20, with the name
+.BR arm_sync_file_range ().
+It was renamed in Linux 2.6.22,
+when the analogous system call was added for PowerPC.
+On architectures where glibc support is provided,
+glibc transparently wraps
+.BR sync_file_range2 ()
+under the name
+.BR sync_file_range ().
 .SH "SEE ALSO"
 .BR fdatasync (2),
 .BR fsync (2),

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
