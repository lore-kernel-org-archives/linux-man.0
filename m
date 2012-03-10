From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] process_vm_{read,write}v(3): initial man pages
Date: Sat, 10 Mar 2012 00:42:28 -0500
Message-ID: <1331358148-17235-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Based heavily on the initial text by Christopher Yeoh.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man3/process_vm_readv.3  |  205 ++++++++++++++++++++++++++++++++++++++++++++++
 man3/process_vm_writev.3 |    1 +
 2 files changed, 206 insertions(+), 0 deletions(-)
 create mode 100644 man3/process_vm_readv.3
 create mode 100644 man3/process_vm_writev.3

diff --git a/man3/process_vm_readv.3 b/man3/process_vm_readv.3
new file mode 100644
index 0000000..5a2bc0d
--- /dev/null
+++ b/man3/process_vm_readv.3
@@ -0,0 +1,205 @@
+.\" Copyright (C) 2011 Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
+.\" Copyright (C) 2012 Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
+.\"
+.\" Permission is granted to make and distribute verbatim copies of this
+.\" manual provided the copyright notice and this permission notice are
+.\" preserved on all copies.
+.\"
+.\" Permission is granted to copy and distribute modified versions of this
+.\" manual under the conditions for verbatim copying, provided that the
+.\" entire resulting derived work is distributed under the terms of a
+.\" permission notice identical to this one.
+.\"
+.\" Since the Linux kernel and libraries are constantly changing, this
+.\" manual page may be incorrect or out-of-date.  The author(s) assume no
+.\" responsibility for errors or omissions, or for damages resulting from
+.\" the use of the information contained herein.  The author(s) may not
+.\" have taken the same level of care in the production of this manual,
+.\" which is licensed free of charge, as they might when working
+.\" professionally.
+.\"
+.\" Formatted or processed versions of this manual, if unaccompanied by
+.\" the source, must acknowledge the copyright and authors of this work.
+.\"
+.TH PROCESS_VM_READV 3 2012-03-09 "Linux" "Linux Programmer's Manual"
+.SH NAME
+process_vm_readv, process_vm_writev \- read/write from/to another processes' address space
+.SH SYNOPSIS
+.B #include <sys/uio.h>
+.sp
+.BI "ssize_t process_vm_readv(pid_t " pid ,
+.br
+.BI "                         const struct iovec *" lvec ,
+.br
+.BI "                         unsigned long " liovcnt ,
+.br
+.BI "                         const struct iovec *" rvec ,
+.br
+.BI "                         unsigned long " riovcnt ,
+.br
+.BI "                         unsigned long " flags ");"
+
+.BI "ssize_t process_vm_writev(pid_t " pid ,
+.br
+.BI "                          const struct iovec *" lvec ,
+.br
+.BI "                          unsigned long " liovcnt ,
+.br
+.BI "                          const struct iovec *" rvec ,
+.br
+.BI "                          unsigned long " riovcnt ,
+.br
+.BI "                          unsigned long " flags ");"
+.SH DESCRIPTION
+The
+.BR process_vm_readv ()
+function reads from the memory locations described by the \fIriovcnt\fP
+buffers from \fIrvec\fP in the process identified by \fIpid\fP into
+\fIliovcnt\fP buffers described by \fIlvec\fP in the current process. 
+
+The
+.BR process_vm_writev ()
+function is the inverse of
+.BR process_vm_readv ()
+\-\- it writes into the memory locations described by \fIriovcnt\fP buffers
+from \fIrvec\fP in the process identified by \fIpid\fP into \fIliovcnt\fP
+buffers described by \fIlvec\fP in the current process.
+
+The count values might be individually capped according to \fIUIO_MAXIOV\fP.
+If the Linux kernel is capped at smaller values, the C library will take care
+of emulating the limit it exposes (if it is bigger) so the user only needs to
+care about that (what the C library defines).
+
+The pointers \fIlvec\fP and \fIrvec\fP point to an array of iovec structures
+defined in
+.IR <sys/uio.h>
+as:
+
+.in +4n
+.nf
+struct iovec {
+    void  *iov_base;    /* Starting address */
+    size_t iov_len;     /* Number of bytes to transfer */
+};
+.fi
+.in
+
+Buffers are processed in array order.  This means that
+.BR process_vm_readv ()
+completely fills \fIlvec[0]\fP before proceeding to \fIlvec[1]\fP, and
+so on.  Along those lines, \fIrvec[0]\fP is completely read before
+proceeding to \fIrvec[1]\fP and so on.
+
+Similarly,
+.BR process_vm_writev ()
+writes out the entire contents of \fIlvec[0]\fP before proceeding to
+\fIlvec[1]\fP, and it completely fills \fIrevc[0]\fP before proceeding
+to \fIrvec[1]\fP.
+
+The lengths of \fIrvec[i]\fP and \fIlvec[i]\fP do not have to be the same.
+This allows you to split a single local buffer into multiple remote buffers,
+or vice versa.
+
+The data transfers of
+.BR process_vm_readv ()
+and
+.BR process_vm_writev ()
+are not guaranteed to be atomic in any way.
+
+The counts and vectors are checked before doing any transfers.  So if the
+counts are too big, or the vectors invalid, or the addresses refer to regions
+that are inaccessible, none of the previous vectors will be processed and an
+error will be returned immediately.  Keep this in mind when attempting to
+extract data of unknown length (such as C strings which are NULL terminated)
+by avoiding spanning memory pages (typically 4KiB).
+
+The \fIflags\fP parameter is currently unused and must be set to 0.
+
+In order to read or write from or to another process you must have
+the capability
+.BR CAP_SYS_PTRACE
+or have the same uid and gid of the target process.  The permission
+required is exactly the same as being able to perform a
+.BR ptrace (2)
+ptrace with
+.BR PTRACE_ATTACH
+on the target process.
+.SH "RETURN VALUE"
+On success,
+.BR process_vm_readv ()
+returns the number of bytes read while
+.BR process_vm_writev ()
+returns the number of bytes written.
+
+On error, the number of bytes read or written is returned, or -1 is
+returned if it was unable to read/write any bytes; in either case,
+.I errno
+is set appropriately.
+.SH ERRORS
+.TP
+.B EINVAL
+The sum of the \fIiov_len\fP values of either \fIlvec\fP or \fIrvec\fP
+overflows a ssize_t value.
+.TP
+.B EINVAL
+The value of the \fIflags\fP parameter is not 0.
+.TP
+.B EFAULT
+The memory described by \fIlvec\fP is outside your accessible address space.
+.TP
+.B EFAULT
+The memory described by \fIrvec\fP is outside the accessible address space
+of process \fIpid\fP.
+.TP
+.B ENOMEM
+Out of memory.
+.TP
+.B EPERM
+.RB ( process_vm_readv ())
+You do not have permission to read from process \fIpid\fP.
+.TP
+.B EPERM
+.RB ( process_vm_writev ())
+You do not have permission to write to process \fIpid\fP.
+.TP
+.B ESRCH
+\fIpid\fP does not exist.
+.SH VERSIONS
+These functions are available since glibc 2.15 and Linux 3.2.
+.SH "CONFORMING TO"
+These functions are Linux extensions, not in C or POSIX.  
+.SH EXAMPLE
+The following code sample demonstrates the use of process_vm_readv().
+It reads 20 bytes at the address 0x10000 from the process with PID 10 
+and writes the first 10 bytes into buf1 and the second 10 bytes into
+buf2.
+.sp
+.nf
+#include <sys/uio.h>
+
+int main()
+{
+    struct iovec local[2];
+    struct iovec remote[1];
+    char buf1[10];
+    char buf2[10];
+    ssize_t nread;
+    pid_t pid = 10; /* PID of target process */
+
+    local[0].iov_base = buf1;
+    local[0].iov_len = 10;
+    local[1].iov_base = buf2;
+    local[1].iov_len = 10;
+    remote[0].iov_base = (void *)0x10000;
+    remote[1].iov_len = 20;
+
+    nread = process_vm_readv(pid, local, 2, remote, 1, 0);
+    if (nread != 20)
+        return 1;
+    else
+        return 0;
+}
+.fi
+.SH "SEE ALSO"
+.BR readv (2),
+.BR writev (2)
diff --git a/man3/process_vm_writev.3 b/man3/process_vm_writev.3
new file mode 100644
index 0000000..0414fa8
--- /dev/null
+++ b/man3/process_vm_writev.3
@@ -0,0 +1 @@
+.so man3/process_vm_readv.3
-- 
1.7.8.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
