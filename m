From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: arm_mremap() man page
Date: Sat, 9 Oct 2010 07:19:34 +0200
Message-ID: <AANLkTinaFiESuT6pU8w8OhfCH323-WS-haHRi4+fmkpo@mail.gmail.com>
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

I don't think we really need to document this system call. It has gone
away nowadays. Note also that your description below is incorrect. The
2.4 Linux source reads as follows:

        unsigned long ret = -EINVAL;

        /*
         * If we are doing a fixed mapping, and address < PAGE_SIZE,
         * then deny it.
         */
        if (flags & MREMAP_FIXED && new_addr < PAGE_SIZE &&
            vectors_base() == 0)
                goto out;

In other words, new_addr can't be less than PAGE_SIZE for MREMAP_FIXED
(if vectors_base() == 0, which I gather to mean if page 0 is being
used as a vector address page).

Also, your point in NOTES is not correct. The new_addr argument is
passed by value; it can;t be used to return anything.

Thanks,

Michael


=====
.\" This file contains the arm_mremap syscall documentation
.\"
.\" Copyright (c) 2010 Stephan Mueller <smueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
.\"
.\" Permission is granted to make and distribute verbatim copies of this
.\" manual provided the copyright notice and this permission notice are
.\" preserved on all copies.
.\"
.\" Permission is granted to copy and distribute modified versions of
.\" this manual under the conditions for verbatim copying, provided that
.\" the entire resulting derived work is distributed under the terms of
.\" a permission notice identical to this one.
.\"
.\" Since the Linux kernel and libraries are constantly changing, this
.\" manual page may be incorrect or out-of-date.  The author(s) assume.
.\" no responsibility for errors or omissions, or for damages resulting.
.\" from the use of the information contained herein.  The author(s) may.
.\" not have taken the same level of care in the production of this.
.\" manual, which is licensed free of charge, as they might when working.
.\" professionally.
.\"
.\" Formatted or processed versions of this manual, if unaccompanied by
.\" the source, must acknowledge the copyright and authors of this work.
.\"
.TH ARM_MREMAP 2 2010-06-22 "Linux" "Linux Programmer's Manual"
.SH NAME
arm_mremap \- re-map a virtual memory address
.SH SYNOPSIS
.nf
.BI "size_t arm_mremap(void *" old_address ", size_t " old_size ,
.BI "             size_t " new_size ", int " flags ", void *" new_address ");
.fi
.SH DESCRIPTION
This system call is a wrapper for the
.BR mremap (2)
system call.
The difference is only that the flag
.BR MREMAP_FIXED
is disallowed compared to the standard
.BR mremap (2)
system call.

.SH NOTE
The man page for
.BR mremap (2)
defines the system call as exported by the libc. This man page
on the other hand defines the system call as exported by the kernel.
The difference is that the kernel system call returns \fInew_address\fP
as an argument whereas the libc interface returns this data as the
return code of the call. This difference however does not imply any
functional differences.

.SH "SEE ALSO"
.BR mremap (2).

.SH AUTHORS
Stephan Mueller,
.RI < smueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org >
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
