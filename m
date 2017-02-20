From: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] New page describing userfaultfd(2) system call.
Date: Mon, 20 Feb 2017 11:23:28 +0200
Message-ID: <20170220092327.GD11386@rapoport-lnx>
References: <1482995717-27063-1-git-send-email-rppt@linux.vnet.ibm.com>
 <3ffbeecb-03b7-eb00-37e2-9899e14f58ec@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3ffbeecb-03b7-eb00-37e2-9899e14f58ec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael,

On Thu, Dec 29, 2016 at 04:08:26PM +0100, Michael Kerrisk (man-pages) wrote:
> On 12/29/2016 08:15 AM, Mike Rapoport wrote:
> > Signed-off-by: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> > ---
> > v2 changes:
> > * fix typo in the date
> > * add paragraph describing error codes returned in uffdio_copy.copy as
> > suggested by Andrea
> 
> Hi Mike,
> 
> I've taken this page, and am now editing it.

Any updates on the userfaultfd man page?
 
> Cheers,
> 
> Michael
> 

--
Sincerely yours,
Mike.

> > I've kept the note about anonymous private mappings and I haven't added the
> > description of the features that are not yet merged upstream.
> > I'm going to update the man page as soon as the new features will be in.
> > 
> >  man2/userfaultfd.2 | 332 +++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 332 insertions(+)
> >  create mode 100644 man2/userfaultfd.2
> > 
> > diff --git a/man2/userfaultfd.2 b/man2/userfaultfd.2
> > new file mode 100644
> > index 0000000..1622dcb
> > --- /dev/null
> > +++ b/man2/userfaultfd.2
> > @@ -0,0 +1,332 @@
> > +.\" Copyright (c) 2016, IBM Corporation.
> > +.\" Written by Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> > +.\"
> > +.\" %%%LICENSE_START(VERBATIM)
> > +.\" Permission is granted to make and distribute verbatim copies of this
> > +.\" manual provided the copyright notice and this permission notice are
> > +.\" preserved on all copies.
> > +.\"
> > +.\" Permission is granted to copy and distribute modified versions of this
> > +.\" manual under the conditions for verbatim copying, provided that the
> > +.\" entire resulting derived work is distributed under the terms of a
> > +.\" permission notice identical to this one.
> > +.\"
> > +.\" Since the Linux kernel and libraries are constantly changing, this
> > +.\" manual page may be incorrect or out-of-date.  The author(s) assume no
> > +.\" responsibility for errors or omissions, or for damages resulting from
> > +.\" the use of the information contained herein.  The author(s) may not
> > +.\" have taken the same level of care in the production of this manual,
> > +.\" which is licensed free of charge, as they might when working
> > +.\" professionally.
> > +.\"
> > +.\" Formatted or processed versions of this manual, if unaccompanied by
> > +.\" the source, must acknowledge the copyright and authors of this work.
> > +.\" %%%LICENSE_END
> > +.\"
> > +.TH USERFAULTFD 2 2016-12-12 "Linux" "Linux Programmer's Manual"
> > +.SH NAME
> > +userfaultfd \- create a file descriptor for handling page faults in user
> > +space
> > +.SH SYNOPSIS
> > +.nf
> > +.B #include <sys/types.h>
> > +.sp
> > +.BI "int userfaultfd(int " flags );
> > +.fi
> > +.PP
> > +.IR Note :
> > +There is no glibc wrapper for this system call; see NOTES.
> > +.SH DESCRIPTION
> > +.BR userfaultfd (2)
> > +creates a userfaultfd object that can be used for delegation of page fault
> > +handling to a user space application.
> > +The userfaultfd should be configured using
> > +.BR ioctl (2).
> > +Once the userfaultfd is configured, the application can use
> > +.BR read (2)
> > +to receive userfaultfd notifications.
> > +The reads from userfaultfd may be blocking or non-blocking, depending on
> > +the value of
> > +.I flags
> > +used for the creation of the userfaultfd or subsequent calls to
> > +.BR fcntl (2) .
> > +
> > +The following values may be bitwise ORed in
> > +.IR flags
> > +to change the behavior of
> > +.BR userfaultfd ():
> > +.TP
> > +.BR O_CLOEXEC
> > +Enable the close-on-exec flag for the new userfaultfd object.
> > +See the description of the
> > +.B O_CLOEXEC
> > +flag in
> > +.BR open (2)
> > +.TP
> > +.BR O_NONBLOCK
> > +Enables non-blocking operation for the userfaultfd
> > +.BR O_NONBLOCK
> > +See the description of the
> > +.BR O_NONBLOCK
> > +flag in
> > +.BR open (2).
> > +.\"
> > +.SS Userfaultfd operation
> > +After the userfaultfd object is created with
> > +.BR userfaultfd (2)
> > +system call, the application have to enable it using
> > +.I UFFDIO_API
> > +ioctl to perform API version and supported features handshake between the
> > +kernel and the user space.
> > +If the
> > +.I UFFDIO_API
> > +is successful, the application should register memory ranges using
> > +.I UFFDIO_REGISTER
> > +ioctl. After successful completion of
> > +.I UFFDIO_REGISTER
> > +ioctl, a page fault occurring in the requested memory range, and satisfying
> > +the mode defined at the register time, will be forwarded by the kernel to
> > +the user space application.
> > +The application then can use
> > +.I UFFDIO_COPY
> > +or
> > +.I UFFDIO_ZERO
> > +ioctls to resolve the page fault.
> > +.PP
> > +Currently, userfaultfd can only be used with anonymous private memory
> > +mappings.
> > +.\"
> > +.SS API Ioctls
> > +The API ioctls are used to configure userfaultfd behavior.
> > +They allow to choose what features will be enabled and what kinds of events
> > +will be delivered to the application.
> > +.TP
> > +.BR "UFFDIO_API	struct uffdio_api *" api
> > +Enable userfaultfd and perform API handshake.
> > +The
> > +.I uffdio_api
> > +structure is defined as:
> > +.in +4n
> > +.nf
> > +
> > +struct uffdio_api {
> > +	__u64 api;
> > +	__u64 features;
> > +	__u64 ioctls;
> > +};
> > +
> > +.fi
> > +.in
> > +The
> > +.I api
> > +field denotes the API version requested by the application.
> > +The kernel verifies that it can support the required API, and sets the
> > +.I features
> > +and
> > +.I ioctls
> > +fields to bit masks representing all the available features and the generic
> > +ioctls available.
> > +.\"
> > +.TP
> > +.BI "UFFDIO_REGISTER	struct uffdio_register *" arg
> > +Register a memory range with userfaultfd.
> > +The
> > +.I uffdio_register
> > +structure is defined as:
> > +.in +4n
> > +.nf
> > +
> > +struct uffdio_range {
> > +	__u64 start;
> > +	__u64 end;
> > +};
> > +
> > +struct uffdio_register {
> > +	struct uffdio_range range;
> > +	__u64 mode;
> > +	__u64 ioctls;
> > +};
> > +
> > +.fi
> > +.in
> > +
> > +The
> > +.I range
> > +field defines a memory range starting at
> > +.I start
> > +and ending at
> > +.I end
> > +that should be handled by the userfaultfd.
> > +The
> > +.I mode
> > +defines mode of operation desired for this memory region.
> > +The following values may be bitwise ORed to set the userfaultfd mode for
> > +particular range:
> > +.RS
> > +.sp
> > +.PD 0
> > +.TP 12
> > +.B UFFDIO_REGISTER_MODE_MISSING
> > +Track page faults on missing pages
> > +.TP 12
> > +.B UFFDIO_REGISTER_MODE_WP
> > +Track page faults on write protected pages.
> > +Currently the only supported mode is
> > +.I UFFDIO_REGISTER_MODE_MISSING
> > +.PD
> > +.RE
> > +.IP
> > +The kernel answers which ioctl commands are available for the requested
> > +range in the
> > +.I ioctls
> > +field.
> > +.\"
> > +.TP
> > +.BI "UFFDIO_UNREGISTER	struct uffdio_register *" arg
> > +Unregister a memory range from userfaultfd.
> > +.\"
> > +.SS Range Ioctls
> > +The range ioctls enable the calling application to resolve page fault
> > +events in consistent way.
> > +.TP
> > +.BI "UFFDIO_COPY struct uffdio_copy *" arg
> > +Atomically copy a continuous memory chunk into the userfault registered
> > +range and optionally wake up the blocked thread.
> > +The source and destination addresses and the amount of bytes to copy are
> > +specified by
> > +.IR src ", " dst ", and " len
> > +fields of
> > +.I "struct uffdio_copy"
> > +respectively:
> > +
> > +.in +4n
> > +.nf
> > +struct uffdio_copy {
> > +	__u64 dst;
> > +	__u64 src;
> > +	__u64 len;
> > +	__u64 mode;
> > +	__s64 copy;
> > +};
> > +.nf
> > +.fi
> > +
> > +The following values may be bitwise ORed in
> > +.IR mode
> > +to change the behavior of
> > +.I UFFDIO_COPY
> > +ioctl:
> > +.RS
> > +.sp
> > +.PD 0
> > +.TP 12
> > +.B UFFDIO_COPY_MODE_DONTWAKE
> > +Do not wake up the thread that waits for page fault resolution
> > +.PD
> > +.RE
> > +.IP
> > +The
> > +.I copy
> > +field of the
> > +.I uffdio_copy
> > +structure is used by the kernel to return amount of bytes that was actually
> > +copied, or an error.
> > +If
> > +.I uffdio_copy.copy
> > +doesn't match the
> > +.I uffdio_copy.len
> > +passed in input to
> > +.IR UFFDIO_COPY ,
> > +the ioctl will return
> > +.BR -EAGAIN .
> > +If the ioctl returns zero it means it succeeded, no error was reported and
> > +the entire area was copied.
> > +If a an invalid fault happens while writing to the
> > +.I uffdio_copy.copy
> > +field, the syscall will return
> > +.BR -EFAULT .
> > +.I uffdio_copy.copy
> > +is an output-only field so it is not being read by the UFFDIO_COPY ioctl.
> > +
> > +.\"
> > +.TP
> > +.BI "UFFDIO_ZERO struct uffdio_zero *" arg
> > +Zero out a part of memory range registered with userfaultfd.
> > +The requested range is specified by
> > +.I range
> > +field of
> > +.I uffdio_zeropage
> > +structure:
> > +
> > +.in +4n
> > +.nf
> > +struct uffdio_zeropage {
> > +	struct uffdio_range range;
> > +	__u64 mode;
> > +	__s64 zeropage;
> > +};
> > +.nf
> > +.fi
> > +
> > +The following values may be bitwise ORed in
> > +.IR mode
> > +to change the behavior of
> > +.I UFFDIO_ZERO
> > +ioctl:
> > +.RS
> > +.sp
> > +.PD 0
> > +.TP 12
> > +.B UFFDIO_ZEROPAGE_MODE_DONTWAKE
> > +Do not wake up the thread that waits for page fault resolution
> > +.PD
> > +.RE
> > +.IP
> > +The
> > +.I zeropage
> > +field of the
> > +.I uffdio_zero
> > +structure is used by the kernel to return amount of bytes that was actually
> > +zeroed, or an error the same way like
> > +.IR uffdio_copy.copy .
> > +.\"
> > +.TP
> > +.BI "UFFDIO_WAKE struct uffdio_range *" arg
> > +Wake up the thread waiting for the page fault resolution.
> > +.SH RETURN VALUE
> > +For a successful call, the
> > +.BR userfaultfd (2)
> > +system call returns the new file descriptor for the userfaultfd object.
> > +On error, \-1 is returned, and
> > +.I errno
> > +is set appropriately.
> > +.SH ERRORS
> > +.TP
> > +.B EINVAL
> > +An unsupported value was specified in
> > +.IR flags .
> > +.TP
> > +.BR EMFILE
> > +The per-process limit on the number of open file descriptors has been
> > +reached
> > +.TP
> > +.B ENFILE
> > +The system-wide limit on the total number of open files has been
> > +reached.
> > +.TP
> > +.B ENOMEM
> > +Insufficient kernel memory was available.
> > +.SH CONFORMING TO
> > +.BR userfaultfd ()
> > +is Linux-specific and should not be used in programs intended to be
> > +portable.
> > +.SH NOTES
> > +Glibc does not provide a wrapper for this system call; call it using
> > +.BR syscall (2).
> > +.SH SEE ALSO
> > +.BR fcntl (2),
> > +.BR ioctl (2)
> > +
> > +.IR Documentation/vm/userfaultfd.txt
> > +in the Linux kernel source tree
> > +
> > 
> 
> 
> -- 
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
