From: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Subject: Re: open_by_handle_at(2) and name_to_handle_at(2)
Date: Mon, 12 Sep 2011 21:37:41 +0200
Message-ID: <4E6E5F85.5000100@atsec.com>
References: <4E6A7B89.7070708@atsec.com> <4E6E547F.2000104@atsec.com> <20110912192913.GA15182@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090102080800000105050202"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110912192913.GA15182-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------090102080800000105050202
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12.09.2011 21:29:13, +0200, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:

Hi Christoph,

> On Mon, Sep 12, 2011 at 08:50:39PM +0200, Stephan Mueller wrote:
>> as the actual file handle can have a varying size. The variable of
>> .I handle_type
>> specifies how the file within the filesystem is encoded. This value
>> is set to one of the following values:
> 
> This has absolutely no business in the man page.  As far as userspace
> is concerned this simply is an opaque handle freely chose by the
> file system.  The only reason we have an emum for them is to make
> it easier to follow them on the wire using tools like wireshark.
> 
> 
> The man page should probably also mentioned that these systems calls
> are optinal and might not be present on modern kernel in case they
> have been disabled during configuration.

Thank you for the review.

Here is the updated man page with your change requests.

-- 
Ciao
Stephan

--------------090102080800000105050202
Content-Type: text/plain;
 name="open_by_handle_at.2"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="open_by_handle_at.2"

.\" Copyright (c) 2011, Stephan Mueller <smueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
.\" All rights reserved.
.\"
.\" Redistribution and use in source and binary forms, with or without
.\" modification, are permitted provided that the following conditions
.\" are met:
.\" * Redistributions of source code must retain the above copyright
.\"   notice, this list of conditions and the following disclaimer.
.\" * Redistributions in binary form must reproduce the above copyright
.\"   notice, this list of conditions and the following disclaimer in
.\"   the documentation and/or other materials provided with the
.\"   distribution.
.\" * Neither the name of the atsec information security corp.
.\"   nor the names of its contributors may be used to endorse or
.\"   promote products derived from this software without specific prior
.\"   written permission.
.\"
.\" THIS SOFTWARE IS PROVIDED BY atsec information security corp.
.\" ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
.\" LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
.\" FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
.\" IN NO EVENT SHALL THE <copyright-holder>
.\" BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
.\" OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
.\" OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
.\" OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
.\" LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
.\" NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
.\" SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
.TH OPEN_BY_HANDLE_AT 2 2011-09-09 "Linux" "Linux Programmer's Manual"
.SH NAME
name_to_handle_at \- generate a file handle from a pathname
.br
open_by_handle_at \- open a file using a file handle
.SH SYNOPSIS
.BI "int name_to_handle_at(int " dfd ", const char * " name ","
.br
.BI "                      struct file_handle " handle ", int * " mnt_id ","
.br
.BI "                      int " flag ");"

.BI "int open_by_handle_at(int " mountdirfd ", struct file_handle " handle ","
.br
.BI "                      int " flags ");"
.SH DESCRIPTION
.BR open_by_handle_at ()
opens the file referenced by the file handle specified with
.IR handle .
This system call uses the file handle that is returned by the
.BR name_to_handle_at ()
system call. Both system calls can be considered to split the behavior
of the
.BR open ()
system call.
.PP
The 
.I struct file_handle
is defined with the following data structure:
.sp
.in +4n
.nf
struct file_handle {
	unsigned int handle_bytes; /* size of the file handle f_handle */
	int handle_type;           /* type of the file handle */
	void *f_handle;            /* file handle */
};
.fi
.in
.PP
The size of the file handle data structure is specified in
.I handle_bytes
as the actual file handle can have a varying size. The variable of
.I handle_type
is to be treated as an opaque value whose contents is freely chosen by the
file system.
.PP
The actual file handle held in the member variable of
.I f_handle
must be treated as an opaque value by the calling user space application. The
contents of this handle value may differ depending on the underlying file system.
.PP
The system call
.BR name_to_handle_at ()
performs the lookup of the requested file system object and returns the
file handle to that object. If the pathname given in
.I name
is relative, then it is interpreted relative to the directory referred
to by the file descriptor
.I dfd
(rather than relative to the current working directory  of  the  calling
process). When
.I dfd
not NULL, the same principle as outlined for the
.BR openat ()
system call is applied. Using the parameter
.I handle
the calling process must specify the maximum size of the file handle. When
the kernel generated the file handle,
.I handle
is filled with the file handle type and the actual file handle. The size
of the actual file handle provided by the kernel is set in
.IR handle.handle_bytes .
The parameter
.I mnt_id
is filled by the kernel with the mount id of the file system containing the
file. The
.I flag
parameter allows the calling process to specify whether to follow a symlink
(using
.BR AT_SYMLINK_FOLLOW )
or not (using
.BR AT_EMPTY_PATH ).
.PP
The system call
.BR open_by_handle_at ()
opens the file system object pointed to by the file handle
.IR handle .
The parameter of
.I mountdirfd
specifies the file descriptor of the directory used as a base for the
file system object lookup. The file handle is decoded relative to that
directory. The
.I flags
parameter can be used to specify the same file open flags as documented for the
.BR open ()
system call.
.SH "RETURN VALUE"
On success, 
.BR open_by_handle_at
returns a new file descriptor. On error, -1 is returned, and errno is set to
indicate the error.
.PP
On success,
.BR name_to_handle_at
returns 0. On error, -1 is returned, and errno is set to indicate the error.
.SH ERRORS
.BR open_by_handle_at ()
returns the same errors as documented for
.BR open ().
In addition, the following error conditions exist.
.TP
.B EPERM
The calling process does not possess the CAP_DAC_READ_SEARCH capability.
.TP
.B EFAULT
The file handle data stucture or the opaque file handle cannot be retrieved
by the kernel.
.TP
.B EINVAL
The size of the file handle specified in
.I handle.handle_bytes
is too large.
.TP
.B ENOMEM
The kernel has insufficient memory for performing the operation.
.PP
.BR name_to_handle_at ()
returns the same errors as documented for
.BR open ().
In addition, the following error conditions exist.
.TP
.B EFAULT
The file handle data stucture cannot be retrieved by the kernel.
.TP
.B EINVAL
The size of the file handle specified in
.I handle.handle_bytes
is too large.
.TP
.B ENOMEM
The kernel has insufficient memory for performing the operation.
.TP
.B EINVAL
An invalid value was specified in the
.I flag
argument.
.TP
.B EOVERFLOW
The size of the file handle exceeds the size specified by the calling
process in
.IR handle.handle_bytes .
.TP
.B EFAULT
The kernel is unable to copy the handle data structure to user space.
.SH "CONFORMING TO"
These system calls are Linux-specific and appeared in the Linux kernel 2.6.39.
.SH NOTES
The system calls, the file handle data structure, as well as the file handle types
are not yet exported via glibc or another library. The system calls must be
invoked using the
.BR syscall ()
function.
.PP
This system call is optional and might not be present with a kernel in case they
have been disabled during configuration.
.SH "SEE ALSO"
.BR open (2),
.BR openat (2).
.BR syscall (2)

--------------090102080800000105050202--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
