From: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Subject: fanotify_init(2) and fanotify_mark(2) man pages
Date: Mon, 17 Oct 2011 11:51:32 +0200
Message-ID: <4E9BFAA4.3010907@atsec.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010707020605090807070202"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------010707020605090807070202
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi,

please find attached the man pages for the system calls of fanotify_init
and fanotify_mark.

The creator of fanotify, Eric, has generally blessed the man pages.

Though, there is one area which should warrant another review: the
struct fanotify_response discussion, in particular I am not sure about
the explanation of the fd member variable.

Thanks
-- 
Ciao
Stephan

--------------010707020605090807070202
Content-Type: text/plain;
 name="fanotify_init.2"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="fanotify_init.2"

.\" Copyright (c) 2011, Stephan Mueller <smueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
.\" supported by Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> who provided the
.\" initial information at
.\" http://marc.info/?l=linux-kernel&m=125701492503938
.\"
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
.\"
.TH FANOTIFY_INIT 2 2011-09-15 "Linux" "Linux Programmer's Manual"
.SH NAME
fanotify_init \- initialize a fanotify group
.SH SYNOPSIS
.BI "int fanotify_init(unsigned int " flags ", unsigned int " event_f_flags ");"
.SH DESCRIPTION
.BR fanotify_init ()
initializes a new fanotify instance and returns a file
descriptor associated with the new fanotify event queue.
The calling process must possess the
.I CAP_SYS_ADMIN
capability to invoke this system call. However, it is likely that this
capability requirement will change in the future. Therefore, this system call
implements additional capability checks as outlined below which will remain
unchanged.
.SH "FILE DESCRIPTOR USAGE"
When reading from the file descriptor returned by
.BR fanotify_init (),
the caller is returned all events the kernel collected for the
.B fanotify
group. When the file descriptor possesses the flag
.I O_NONBLOCK
the kernel returns one event. Otherwise, the kernel blocks the
.B read
system call and constantly returns events as the kernel collects these events.
.PP
A
.B fanotify
group is a "thing" that wants to receive notification about filesystem
events.
.PP
One
.B fanotify
events is defined by struct
.IR fsnotify_event .
This data structure specifies the precise information of the file system
object for which the event occured.
.PP
In addition to reading from the
.B fanotify
file descriptor, the calling process may also write to the file descriptor.
User space must write data using the following data structure:

.in +4n
.nf
struct fanotify_response {
        __s32 fd;		/* file descriptor */
        __u32 response;		/* response flags */
};
.fi
.in
.PP
The
.I fd
response pointer identifies a particular response stored for the
.B fanotify
group.
.PP
The
.I response
flag allows user space to specify one of the following responses:
.TP
.B FAN_ALLOW
Allow the operation.
.TP
.B FAN_DENY
Deny the operation.
.PP
In addition, the following IOCTL can be invoked with the file descriptor:
.TP
.B FIONREAD
This IOCTL returns number of events present in the event queue for the
.B fanotify
group.
.SH "SYSTEM CALL ARGUMENTS"
.PP
The following values can be OR'd into the
.I flags
field:
.PP
.TP
.B FAN_NONBLOCK
Set the
.I O_NONBLOCK
file status flag on the new open file description.
Using this flag saves extra calls to
.BR fcntl (2)
to achieve the same result.
.TP
.B FAN_CLOEXEC
Set the close-on-exec (
.I FD_CLOEXEC ) flag on the new file descriptor.
See the description of the
.I O_CLOEXEC
flag in
.BR open (2)
for reasons why this may be useful.
.TP
.B FAN_CLASS_NOTIF
Using this priority level,
.B fanotify
groups may not use synchronous notification marks which means that
they cannot make access decisions for users.
.TP
.B FAN_CLASS_CONTENT
This priority level is intended for groups which which need access to the
file contents to make access decisions. These could be things like
anti virus scanners or integrity monitors.
.TP
.B FAN_CLASS_PRE_CONTENT
This priority level is intended for groups which will place
content into the given file before it is used. This priority level is
indended for something like a hierarchical storage manager which needs
to retrieve data from tape.
.TP
.B FAN_READONLY_FALLBACK
Setting this flag will cause the kernel to try to
open a file attached to an event read only if the
.I event_f_flags
indicated it should be opened read/write and that open failed.
.TP
.B FAN_UNLIMITED_QUEUE
Set the size of the fanotify event queue to unlimited. This flag requires
the caller to possess the
.I CAP_SYS_ADMIN
capability.
.TP
.B FAN_UNLIMITED_MARKS
Set the number of the fanotify data mark maintained by the fanotify group
to unlimited.
.PP
Note that only one of the
.B FAN_CLASS_*
priority levels shall be selected for all groups. If none is chose,
.B FAN_CLASS_NOTIF
is used as default.
.PP
The
.I event_f_flags
takes any of the same options as the
.I flags
argument of the
.BR open (2)
system call. Those flags are used when opening a file descriptor which is
supplied with the event.
.SH "RETURN VALUE"
On success, this system call return a new file descriptor. On error, -1 is
returned, and errno is set to indicate the error.
.SH ERRORS
.TP
.B EINVAL
An invalid value was specified in the
.I flags
argument.
.TB
.B EINVAL
An invalid invalid
.B FAN_CLASS_*
value was selected.
.TP
.B EINVAL
.B FAN_READONLY_FALLBACK
was set but the access mode to the file descriptor supplied in
.I event_f_flags
is not
.IR O_RDWR .
.TP
.B EINVAL
A non-zero valid was passed in the
.I event_f_flags
argument.
.TP
.B EMFILE
The system limit on the total number of file descriptors has been reached.
.TP
.B ENOMEM
Insufficient kernel memory is available.
.TP
.B EPERM
The calling process does not possess the
.I CAP_SYS_ADMIN
capability.
.SH "CONFORMING TO"
These system calls are Linux-specific.
.SH NOTES
The system calls, the file handle data structure, as well as the file handle types
are not yet exported via glibc or another library. The system calls must be
invoked using the
.BR syscall ()
function.
.SH "SEE ALSO"
.BR fanotify_mark (2),
.BR open (2),
.BR syscall (2)

--------------010707020605090807070202
Content-Type: text/plain;
 name="fanotify_mark.2"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="fanotify_mark.2"

.\" Copyright (c) 2011, Stephan Mueller <smueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
.\" supported by Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> who provided the
.\" initial information at
.\" http://kerneltrap.org/mailarchive/linux-kernel/2009/10/31/4502845
.\"
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
.\"
.TH FANOTIFY_MARK 2 2011-09-15 "Linux" "Linux Programmer's Manual"
.SH NAME
fanotify_mark \- add, remove, or modify a fanotify mark on a file system object
.SH SYNOPSIS
.BI "int fanotify_mark(int " fanotify_fd ", unsigned int " flags ","
.br
.BI "                  __u64 " mask ", int " dfd ","
.br
.BI "                  const char *" pathname ");"
.SH DESCRIPTION
.BR fanotify_mark
is used to add remove or modify a mark on an inode
Marks are used to indicate that the fanotify group is
interested in events which occur on that inode.  At this point in
time marks may only be added to files and directories.
.PP
.I fanotify_fd
must be a file descriptor returned by the
.BR fanotify_init (2)
system call.
.PP
The
.I flags
field must contain exactly one of the following:
.TP
.B FAN_MARK_ADD
OR the bits in
.I mask
into the mark.
.TP
.B FAN_MARK_REMOVE
bitwise remove the bits in
.I mask
from the mark.
.TP
.B FAN_MARK_FLUSH
The flush is like
.BR FAN_MARK_REMOVE ,
but it removes all marks for the entire group. The
.I mask
parameter is irrelevant.
.PP
The following values can be OR'd into the
.I flags
field:
.TP
.B FAN_MARK_DONT_FOLLOW
same meaning as
.I O_NOFOLLOW
as described in
.BR open (2).
.TP
.B FAN_MARK_ONLYDIR
same meaning as
.I O_DIRECTORY
as described in
.BR open (2).
.TP
.B FAN_MARK_MOUNT
indicates that this mark should apply to any event which
happens to this mount point, not to the specific inode referenced.
.TP
.B FAN_MARK_IGNORED_MASK
indicates the add/remove should be applied to
the "ignored_mask" rather than the "normal" mask. See below for a discussion
of the mask type.
.TP
.B FAN_MARK_IGNORED_SURV_MODIFY
normally ignored masks are cleared on inode
modification. This flag leaves the ignored bits alone on inode
modification. The ignored bits can be explicitly removed with a
.BR FAN_MARK_REMOVE |
.B FAN_MARK_IGNORED_MASK
operation.
.PP
.I dfd
may be any other the following:
.TP
.B AT_FDCWD
the object will be lookup up based on
.I pathname similar
to
.BR open (2).
.B file descriptor of a directory
if
.I pathname
is not NULL the object to modify will be lookup up similar to
.BR openat (2).
.TP
.B file descriptor of the final object
if pathname is NULL, the object to modify will be the object referenced by the
.I dfd
parameter.
.PP
The
.I mask
is the bitwise OR of the set of events of interest such as:
.TP
.B FAN_ACCESS
object was accessed (read)
.TP
.B FAN_MODIFY
object was modified (write)
.TP
.B FAN_CLOSE_WRITE
object was writable and was closed
.TP
.B FAN_CLOSE_NOWRITE
object was read only and was closed
.TP
.B FAN_OPEN
object was opened
.TP
.B FAN_EVENT_ON_CHILD
used when adding a mark to a directory to indicate
that you want to receive what events are available to its children
inodes (not descendants).
.TP
.B FAN_Q_OVERFLOW
event queue overflowed. This request type may be returned by the kernel.
But a caller is not expected to use that type and send it to the kernel.
.PP
The are syncronous events which require writing back to the
.I fanotify_fd
file descriptor before the original operation completes. These cannot be used for
the following types:
.TP
.B FAN_CLASS_NOTIF
.TP
.B FAN_OPEN_PERM
File open in permission check.
.TP
.B FAN_ACCESS_PERM
File accessed in permission check.
.SH "MASK TYPE"
The
.I mask
value is used to specify two types of masks.
.TP
.B Normal masks
The specified
.I mask
values are applied to the the event.
.TP
.B Ignored masks
The ignored mask is the opposite of the "normal" mask. "Ignored" masks are
cleared on modification of the inode to which they are set to. This default
behavior can be changed when using
.BR FAN_MARK_IGNORED_SURV_MODIFY .
.PP
If
.B FAN_OPEN
is specified in both the "normal" and the "ignored" mask
no event will be sent to userspace. This is not persently used but
will be used when more objects may be marked.
.PP
The use of "normal" and "ignored" masks can be illustrated with the following
example. Assume you marked a mount point as something of interest.
You could then add an "ignored" mask entry on individual inodes to get
notification on everything in the mount point except for a select few inodes.
.SH "RETURN VALUE"
On success, this system call return a new file descriptor. On error, -1 is
returned, and errno is set to indicate the error.
.SH ERRORS
.TP
.B EINVAL
An invalid value was specified in the
.I flags
argument.
.TP
.B EINVAL
An invalid value was specified in the
.I mask
argument.
.TP
.B EINVAL
An invalid value was specified in the
.I ignored_mask
argument.
.TP
.B EINVAL
.I fanotify_fd
is not a file descriptor as returned by
.BR fanotify_init (2).
.TP
.B EINVAL
.I flags
did not contain at least one of
.BR FAN_MARK_ADD ,
.BR FAN_MARK_REMOVE ,
or
.BR FAN_MARK_FLUSH .
.TP
.B EINVAL
.BR FAN_MARK_ADD
or
.BR FAN_MARK_REMOVE
was set but the
.I mask
was zero.
.TP
.B EBADF
.I fanotify_fd
is not a valid file descriptor.
.TP
.B EBADF
.I dfd
is not a valid file descriptor and path is NULL.
.TP
.B ENOTDIR
.I dfd
is not a directory and path is not NULL.
.TP
.B ENOTDIR
.I dfd
is not a directory and
.BR FAN_MARK_ONLYDIR
was set.
.TP
.B EACCESS
You do not have search permission on the
.IR dfd .
.TP
.B EACCESS
No search permissions on some part of the path.
.TP
.B ENOENT
File not found.
.TP
.B ENOMEM
Insufficient kernel memory is available.
.SH "CONFORMING TO"
These system calls are Linux-specific.
.SH NOTES
The system calls, the file handle data structure, as well as the file handle types
are not yet exported via glibc or another library. The system calls must be
invoked using the
.BR syscall ()
function.
.SH "SEE ALSO"
.BR fanotify_init (2),
.BR syscall (2)

--------------010707020605090807070202--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
