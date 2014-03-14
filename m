From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] Man pages for the fanotify API
Date: Fri, 14 Mar 2014 17:42:08 +0100
Message-ID: <53233160.9000106@gmail.com>
References: <1393444390-16012-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393444390-16012-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xypron.glpk-Mmb7MZpHnFY@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>, James Hunt <james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Heinrich,

Thank you for pushing this again. Let's see if we can get this done this time. 
My apologies for not following up on previous attempts. The pages are a good
start, but need some work.

I've added a few people to the CC. Eric, Stephan, James, maybe you have some 
input or review comments.

Eric! Your input here would be really helpful.

On 02/26/2014 08:53 PM, xypron.glpk-Mmb7MZpHnFY@public.gmane.org wrote:
> From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> 
> The fanotify API is part of the Linux kernel since 2.6.36.
> 
> It is especially useful to scan files for malware.
> Commercial products using this API have been published.
> 
> Outdated descriptions of the API are contained in the orginal commits:
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commit;h=2a3edf86040a7e15684525a2aadc29f532c51325
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commit;h=52c923dd079df49f58016a9e56df184b132611d6
> 
> A suggestion for man-pages has been made by Stephan Mueller
> http://permalink.gmane.org/gmane.linux.man/2400
> but has not been picked up.

Yes, unfortunately that effort petered out, and I didn't 
have the time to push it along.

Is the information in your pages a superset of that in
Stephan's pages?

> A further attempt was made by me in 2012,
> http://article.gmane.org/gmane.linux.man/3399
> 
> Unfortunately no response has been received from Eric Paris the original author
> of the API.

Eric, are you listening?

> Since then I have used the API both in test programs and in an open source
> project and continuously updated my version of the documentation.

Good to hear.

> A review was provided by David Simmons
> http://git.xypron.de/?p=fanotify-manpages.git;a=commit;h=7b8d05cbcef5269b33301e6fa0870cfd905b87cd
> 
> A html version of the appended man pages is available at
> http://www.xypron.de/projects/fanotify-manpages/
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/fanotify_init.2 |  173 +++++++++++++++++++++
>  man2/fanotify_mark.2 |  197 ++++++++++++++++++++++++
>  man7/fanotify.7      |  410 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 780 insertions(+)
>  create mode 100644 man2/fanotify_init.2
>  create mode 100644 man2/fanotify_mark.2
>  create mode 100644 man7/fanotify.7
> 
> diff --git a/man2/fanotify_init.2 b/man2/fanotify_init.2
> new file mode 100644
> index 0000000..04785cd
> --- /dev/null
> +++ b/man2/fanotify_init.2
> @@ -0,0 +1,173 @@
> +.\" Copyright (C) 2013, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> +.\" 

Could you add LICENSE_START and LICENSE_END tags to the license on
each page please.
(See https://www.kernel.org/doc/man-pages/licenses.html#verbatim)

> +.\" Permission is granted to make and distribute verbatim copies of this
> +.\" manual provided the copyright notice and this permission notice are
> +.\" preserved on all copies.
> +.\"
> +.\" Permission is granted to copy and distribute modified versions of
> +.\" this manual under the conditions for verbatim copying, provided that
> +.\" the entire resulting derived work is distributed under the terms of
> +.\" a permission notice identical to this one.
> +.\"
> +.\" Since the Linux kernel and libraries are constantly changing, this
> +.\" manual page may be incorrect or out-of-date.  The author(s) assume.
> +.\" no responsibility for errors or omissions, or for damages resulting.
> +.\" from the use of the information contained herein.  The author(s) may.
> +.\" not have taken the same level of care in the production of this.
> +.\" manual, which is licensed free of charge, as they might when working.
> +.\" professionally.
> +.\"
> +.\" Formatted or processed versions of this manual, if unaccompanied by
> +.\" the source, must acknowledge the copyright and authors of this work.
> +.\"
> +.TH FANOTIFY_INIT 2 2013-08-21 "Linux" "Linux Programmer's Manual"
> +.SH NAME
> +fanotify_init \- create and initialize fanotify group
> +.SH SYNOPSIS
> +.nf
> +.B #include <linux/fcntl.h>

I think you mean <sys/fcntl.h>

> +.B #include <sys/fanotify.h>
> +.sp
> +.B "int fanotify_init(unsigned int flags, unsigned int event_f_flags);"

The formatting here is not correct. Look at the formatting of the
SYNOPSIS in any other page, to see the required form here. Please
fix all SYNOPSIS sections.

> +.fi
> +.SH DESCRIPTION
> +.BR fanotify_iqnit()
> +initializes a new fanotify group and returns a file descriptor for the event
> +queue.
> +.PP
> +The call requires the
> +.B CAP_SYS_ADMIN
> +capability. This constraint might be relaxed in future versions of the API.
> +Hence additional local capability checks have been implemented as indicated
> +below.
> +.PP
> +.IR flags

Please start all new sentences on new source lines (see man-pages(7):

> +defines the behavior of the file descriptor. It is a bitmask composed of the

==>
    defines the behavior of the file descriptor. 
    It is a bitmask composed of the

> +following values:
> +.TP
> +.B FAN_CLOEXEC
> +sets the close-on-exec flag (
> +.I FD_CLOEXEC
> +) 

Formatting here should be

.BR ( FD_CLOEXEC )

(There are other instances below to fix.)

on the new file descriptor. When calling
> +.BR execve (2)
> +the inherited file descriptor of the child process will be closed. See the
> +description of the
> +.I O_CLOEXEC

All constants should be formatted bold

.B O_CLOEXEC

> +flag in
> +.BR open (2).
> +.TP
> +.B FAN_NONBLOCK
> +enables the non-blocking flag (
> +.I O_NONBLOCK

Broken formatting; see above

> +) for the file descriptor. Reading from the file descriptor will not block.
> +Instead if no data is available an error
> +.B EAGAIN
> +will occur.

Where will that error occur? On a read()? This needs to be clarified.
(I see that you say this in fanotify.7, but the reader on this page will 
be puzzled.)

> +.TP
> +.B FAN_CLASS_NOTIF
> +sets a priority level which does not allow making access decisions.

This sentence is very unclear. Decisions? What decisions are these, 
and how does one "make" these decisions?

> +.TP
> +.B FAN_CLASS_CONTENT
> +sets a priority level which allows making access decisions.

See above.

> +.TP
> +.B FAN_CLASS_PRE_CONTENT
> +sets a priority level which allows changing the file content prior to access.

Is this explained in more detail somewhere?

> +Only one of the values
> +.B FAN_CLASS_NOTIF,
> +.B FAN_CLASS_CONTENT,
> +or
> +.B FAN_CLASS_PRE_CONTENT
> +may be set.
> +.TP
> +.B FAN_UNLIMITED_QUEUE
> +removes the limit on the size of the event queue. This flag requires the
> +.nh
> +.B CAP_SYS_ADMIN
> +.hy
> +capability.

So if FAN_UNLIMITED_QUEUE is not specified, what are the limits? That's 
not explained.

> +.TP
> +.B FAN_UNLIMITED_MARKS
> +removes the limit on the number of marks. This flag requires the
> +.nh
> +.B CAP_SYS_ADMIN
> +.hy
> +capability.

So if FAN_UNLIMITED_MARKS is not specified, what are the limits? That's 
not explained.

> +.PP
> +.IR event_f_flags
> +defines the file flags, with which file descriptors for fanotify events shall
> +be created. For explanations of possible values see parameter
> +.I flags
> +of the 
> +.BR open (2)
> +system call. Useful values are
> +.TP
> +.B O_RDONLY
> +read only access.
> +.TP
> +.B O_WRONLY
> +write only access.
> +.TP
> +.B O_RDWR
> +read and write access.
> +.TP
> +.B O_CLOEXEC
> +enable close-on-exec.
> +.TP
> +.B O_LARGEFILE
> +support files exceeding 2 GB. Failing to set this flag will result in an
> +.B EOVERFLOW
> +error when trying to open a large file which is monitored by a fanotify group.
> +.SH RETURN VALUES

RETURN VALUE (no S)

> +If the system call is successful a new file descriptor is returned.
> +In case of an error \-1 is returned, and
> +.I errno
> +is set to indicate the error.
> +.SH ERRORS
> +.TP
> +.B EINVAL
> +An invalid value was passed in
> +.IR flags .
> +.B FAN_ALL_INIT_FLAGS
> +defines all allowable bits.
> +.TP
> +.B EMFILE
> +indicates one of the following situations:
> +.br
> +- The number of listeners exceeds

Please drop the .nh/.hy tags. It's better to have hyphenation than large
amounts of whitespace in the lines.

> +.nh
> +.B FANOTIFY_DEFAULT_MAX_LISTENERS.
> +.hy

The next two cases give EPERM, not EMFILE:

> +.br
> +- Flag
> +.nh
> +.B FAN_UNLIMITED_QUEUE
> +.hy
> +was set without owning the
> +.nh
> +.B CAP_SYS_ADMIN
> +.hy
> +capability.
> +.br
> +- Flag
> +.nh
> +.B FAN_UNLIMITED_MARKS
> +.hy
> +was set without owning the
> +.nh
> +.B CAP_SYS_ADMIN
> +.hy
> +capability.
> +.TP
> +.B ENOMEM
> +Out of memory, the allocation of memory for the notification group failed. 
> +.TP
> +.B EPERM
> +Operation not permitted
> +.SH VERSIONS
> +Fanotify_init 

.BR fanotify_init ()

> was introduced in version 2.6.36 of the Linux kernel and enabled
> +in version 2.6.37.
> +.SH "CONFORMING TO"
> +This system call is Linux-specific.
> +.SH "SEE ALSO"
> +.BR fanotify (7),
> +.BR fanotify_mark (2)

Order SEE ALSO entries by section, and then alphabetically within the section.

> diff --git a/man2/fanotify_mark.2 b/man2/fanotify_mark.2
> new file mode 100644
> index 0000000..aa71c3d
> --- /dev/null
> +++ b/man2/fanotify_mark.2
> @@ -0,0 +1,197 @@
> +.\" Copyright (C) 2013,  Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> +.\" 
> +.\" Permission is granted to make and distribute verbatim copies of this
> +.\" manual provided the copyright notice and this permission notice are
> +.\" preserved on all copies.
> +.\"
> +.\" Permission is granted to copy and distribute modified versions of
> +.\" this manual under the conditions for verbatim copying, provided that
> +.\" the entire resulting derived work is distributed under the terms of
> +.\" a permission notice identical to this one.
> +.\"
> +.\" Since the Linux kernel and libraries are constantly changing, this
> +.\" manual page may be incorrect or out-of-date.  The author(s) assume.
> +.\" no responsibility for errors or omissions, or for damages resulting.
> +.\" from the use of the information contained herein.  The author(s) may.
> +.\" not have taken the same level of care in the production of this.
> +.\" manual, which is licensed free of charge, as they might when working.
> +.\" professionally.
> +.\"
> +.\" Formatted or processed versions of this manual, if unaccompanied by
> +.\" the source, must acknowledge the copyright and authors of this work.
> +.\"
> +.TH FANOTIFY_MARK 2 2013-08-27 "Linux" "Linux Programmer's Manual"
> +.SH NAME
> +fanotify_mark \-  add, remove, or modify a fanotify mark on a filesystem
> +object.
> +.SH SYNOPSIS
> +.nf
> +.B #include <sys/fanotify.h>
> +.sp
> +.B int fanotify_mark (int fanotify_fd, unsigned int flags, uint64_t mask, \
> +int dfd, const char *pathname);

Please break this over two lines.
See also my earlier comment about formatting in the SYNOPSIS.

> +.fi
> +.SH DESCRIPTION
> +.BR fanotify_mark (2)
> +adds, removes, or modifies a fanotify mark on a filesystem.
> +.PP
> +.I fd
> +is the file descriptor returned by
> +.BR fanotify_init (2).
> +.PP
> +.I flags
> +is a bitmask describing the modification to perform. It is composed of the
> +following values:
> +.TP
> +.B FAN_MARK_ADD
> +Add the events in
> +.I mask. 

Correct formatting here is

.IR mark .

(Please fix other instances.)

> +.TP
> +.B FAN_MARK_REMOVE
> +Remove the events in
> +.I mask. 
> +.TP
> +.B FAN_MARK_DONT_FOLLOW
> +Do not follow symbolic links.
> +.TP
> +.B FAN_MARK_ONLYDIR
> +Fail if the path to be marked is not a directory.
> +.TP
> +.B FAN_MARK_MOUNT
> +The path indicates a mount to be marked.
> +.TP
> +.B FAN_MARK_IGNORED_MASK
> +Add to or remove from the ignored event mask.
> +.TP
> +.B FAN_MARK_IGNORED_SURV_MODIFY
> +The ignored mask shall survive modify events. If this flag is not set the
> +ignored mask is cleared if a modify event occurs for the fanotify group.
> +.TP
> +.B FAN_MARK_FLUSH
> +Remove all events from the whole group.
> +.PP
> +Only one of
> +.B FAN_MARK_ADD, FAN_MARK_REMOVE,
> +or
> +.B FAN_MARK_FLUSH
> +should be set.

What happens if you specify more than one of these?
Explain this in the page, please.

> +.PP
> +The following composed value exists
> +.TP
> +.B FAN_ALL_MARK_FLAGS
> +A mask with all mark bits set
> +.nh
> +(FAN_MARK_ADD | FAN_MARK_REMOVE | FAN_MARK_DONT_FOLLOW | FAN_MARK_ONLYDIR |
> +FAN_MARK_MOUNT | FAN_MARK_IGNORED_MASK | FAN_MARK_IGNORED_SURV_MODIFY |
> +FAN_MARK_FLUSH).
> +.hy

Yes, but FAN_ALL_MARK_FLAGS is irrelevant. It's only used inside the kernel 
to check the validity of the flags argument... So, remove the preceding
paragraph.

> +.PP
> +.I mask
> +defines which events shall be listened to. It is a bitmask composed of the
> +following values:
> +.TP
> +.B FAN_ACCESS
> +A file was accessed (read).
> +.TP
> +.B FAN_MODIFY
> +A file was modified (write).
> +.TP
> +.B FAN_CLOSE_WRITE
> +A writable file was closed.
> +.TP
> +.B FAN_CLOSE_NOWRITE
> +An readonly file was closed.
> +.TP
> +.B FAN_OPEN
> +A file was opened.
> +.TP
> +.B FAN_Q_OVERFLOW
> +The event queue overflowed.
> +.TP
> +.B FAN_OPEN_PERM
> +A file open permission was requested.
> +.TP
> +.B FAN_ACCESS_PERM
> +An access permission for a file was requested.
> +.TP
> +.B FAN_ONDIR
> +The event occurred against a directory.
> +.TP
> +.B FAN_EVENT_ON_CHILD
> +An event for a child of a monitored directory occurred.
> +.PP
> +The following composed value is defined
> +.TP
> +.B FAN_CLOSE
> +A file was closed (FAN_CLOSE_WRITE | FAN_CLOSE_NOWRITE).
> +.PP
> +.I dfd
> +is a file descriptor.
> +.IP - 2
> +If 
> +.I pathname
> +is NULL
> +.I dfd
> +defines the path to be marked.
> +.IP - 2
> +If
> +.I pathname
> +is NULL and dfd takes the special value
> +.B AT_FDCWD
> +defined in <fcntl.h> the current working directory is to be marked.
> +.IP - 2
> +If
> +.I pathname
> +is absolute it defines the path to be marked.
> +.IP - 2
> +If
> +.I pathname
> +is relative it defines a path relative to the path indicated by the file
> +descriptor in
> +.I dfd
> +to be marked.
> +.IP - 2
> +If
> +.I pathname
> +is relative and dfd 

.I dfd

> takes the special value
> +.B AT_FDCWD
> +it defines a path relative to the current working directory to be marked.
> +.PP
> +.I pathname
> +is an absolute or relative path to be marked.
> +.SH RETURN VALUES

RETURN VALUE (no S)

> +If the system call is successful 0 is returned. In case of an error \-1 is
      ^^^^^^^^^^^^^^^
If
.BR fanotify_mark()
is successful....

> +returned, and
> +.I errno
> +is set to indicate the error.
> +.SH ERRORS
Missing errors:
ENOTDIR (FAN_MARK_ONLYDIR)

> +.TP
> +.B EBADF
> +An invalid file descriptor was passed in
> +.IR fanotify_fd .
> +.TP
> +.B EINVAL
> +An invalid value was passed in
> +.IR flags ,
> +or
> +.IR mask .

EINVAL: ==> fd was not an fanotify file descriptor.
/
> +.TP
> +.B ENOENT
> +The directory indicated by
> +.IR pathname
> +is not valid. This error also occurs when trying to remove a mark from a
> +directory or mount which is not marked.
> +.TP
> +.B ENOMEM
> +Out of memory.
> +.TP
> +.B ENOSPC
> +Too many marks.
> +.SH VERSIONS
> +Fanotify_mark 

.BR fanotify_mark ()

> was introduced in version 2.6.36 of the Linux kernel and enabled
> +in version 2.6.37.
> +.SH "CONFORMING TO"
> +This system call is Linux-specific.
> +.SH "SEE ALSO"
> +.BR fanotify (7),
> +.BR fanotify_init (2)

Ordering...

> diff --git a/man7/fanotify.7 b/man7/fanotify.7
> new file mode 100644
> index 0000000..5d32f1c
> --- /dev/null
> +++ b/man7/fanotify.7
> @@ -0,0 +1,410 @@
> +.\" Copyright (C) 2013, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> +.\" 
> +.\" Permission is granted to make and distribute verbatim copies of this
> +.\" manual provided the copyright notice and this permission notice are
> +.\" preserved on all copies.
> +.\"
> +.\" Permission is granted to copy and distribute modified versions of
> +.\" this manual under the conditions for verbatim copying, provided that
> +.\" the entire resulting derived work is distributed under the terms of
> +.\" a permission notice identical to this one.
> +.\"
> +.\" Since the Linux kernel and libraries are constantly changing, this
> +.\" manual page may be incorrect or out-of-date.  The author(s) assume.
> +.\" no responsibility for errors or omissions, or for damages resulting.
> +.\" from the use of the information contained herein.  The author(s) may.
> +.\" not have taken the same level of care in the production of this.
> +.\" manual, which is licensed free of charge, as they might when working.
> +.\" professionally.
> +.\"
> +.\" Formatted or processed versions of this manual, if unaccompanied by
> +.\" the source, must acknowledge the copyright and authors of this work.
> +.\"
> +.TH FANOTIFY 7 2014-02-26 "Linux" "Linux Programmer's Manual"
> +.SH NAME
> +fanotify \- monitoring file system events

Change all instances of "file system" to "filesystem"

> +.SH DESCRIPTION
> +The
> +.B fanotify
> +API provides notification and interception of file system events. Use cases
> +are virus scanning and hierarchical storage management.
> +
> +The following system calls are used with this API:
> +.BR fanotify_init (2),
> +.BR fanotify_mark (2),
> +.BR poll (2),
> +.BR ppoll (2),
> +.BR read (2),
> +.BR write (2),
> +and
> +.BR close (2).
> +.PP
> +.BR fanotify_init (2)
> +creates and initializes a
> +.B fanotify
> +group and returns a file descriptor
> +referring to it.

At this point, you need to explain what an "fanotify group" is.
You never really explain it in the entire page.

> +.br

s/.br/.PP/

> +.BR fanotify_mark (2)
> +adds or removes a file, a directory, or a mount from the notification group.
> +.PP
> +When all file descriptors referring to the
> +.B fanotify
> +group are closed, the
> +notification group is released and the resources are freed for reuse by the
> +kernel.
> +.PP
> +An application first calls
> +.BR fanotify_init (2)
> +to receive a file descriptor. It uses
> +.BR fanotify_mark (2)
> +to define which files, directories, or mounts events shall be created.

I think the last sentence isn't quite right. Don't you mean something like:

It uses fanotify_mark(2) to add files, directories, and mounts to the set
of objects to be monitored.

?


> +.PP
> +Calling
> +.BR poll (2)
> +or
> +.BR ppoll (2)

Where does the file descriptor given to poll() come from.
Tell the reader!

Now, I'm sure that you can use select() and epoll here has well. I'd rewrite this
as a more general statement: 

    the file descriptor inidcates as readable when given
    top select(2), poll(2), and epoll(7).

> +will block until either a file event occurs or it is interrupted by a signal
> +(see
> +.nh

Please drop *all* .nh/.hy pairs in all three pages.

> +.BR signal (7)).
> +.hy
> +If events are able to be read this will be advertised in the returned events
> +mask as
> +.B POLLIN

Drop this piece:
[[
> +and if compiled with
> +.B _XOPEN_SOURCE
> +as
> +.B POLLRDNORM. 
]]

> +.PP
> +Calling
> +.BR read (2)
> +for the file descriptor returned by
> +.BR fanotify_init (2)
> +will block (if flag
> +.nh
> +.B FAN_NONBLOCK
> +.hy
> +is not set in the call to
> +.nh
> +.BR fanotify_init (2))
> +.hy
> +until either a file event occurs or it is interrupted by a signal
> +(see
> +.nh
> +.BR signal (7)).
> +.BR read (2)
> +.hy
> +will return the length of the filled buffer or -1 in case of an error.
> +
> +Each successful call to
> +.BR read (2)
> +returns a buffer containing one or more of the following structures:
> +
> +.in +4n
> +.nf
> +struct fanotify_event_metadata {
> +    __u32 event_len;
> +    __u8 vers;
> +    __u8 reserved;
> +    __u16 metadata_len;
> +    __aligned_u64 mask;
> +    __s32 fd; 
> +    __s32 pid;
> +};
> +.fi
> +.in
> +
> +.TP 15
> +.I event_len
> +is the length of the data for this event and the offset to the next event
> +in the buffer. This length might be longer than the size of structure
> +.nh
> +.I fanotify_event_metadata.
> +.hy
> +Therefore it is recommended to use a larger buffer size when reading,
> +e.g. 4096 bytes.
> +.TP
> +.I vers
> +holds the version of the
> +.B fanotify
> +API. The value should be checked against
> +.nh
> +.B FANOTIFY_METADATA_VERSION.
> +.hy
> +.TP
> +.I reserved
> +is not used.
> +.TP
> +.I metadata_len
> +is the length of the structure. The field was introduced to facilitate the
> +implementation of optional headers per event type.
> +.TP
> +.I mask
> +is a bitmask describing the event.
> +.TP
> +.I fd
> +is an open file descriptor for the object being accessed or
> +.B FAN_NOFD
> +if a queue overflow occurred. The reading application is responsible for
> +closing this file descriptor.
> +.TP
> +.I pid
> +is the ID of the process that caused the event.
> +.PP
> +The bitmask in
> +.I mask
> +is composed of the following values:
> +.TP
> +.B FAN_ACCESS
> +file was accessed.
> +.TP
> +.B FAN_OPEN
> +file was opened.
> +.TP
> +.B FAN_MODIFY
> +file was modified.
> +.TP
> +.B FAN_CLOSE_WRITE
> +writable file closed.
> +.TP
> +.B FAN_CLOSE_NOWRITE
> +unwritable file closed.
> +.TP
> +.B FAN_Q_OVERFLOW
> +event queue overflowed.
> +.TP
> +.B FAN_ACCESS_PERM
> +file accessed in perm check.
> +.TP
> +.B FAN_OPEN_PERM
> +file open in perm check.
> +.TP
> +.B FAN_ONDIR
> +event occurred against directory.
> +.TP
> +.B FAN_EVENT_ON_CHILD
> +event for a child of a directory occurred.
> +.PP
> +To check for any close event the following bitmask may be used
> +.TP
> +.B FAN_CLOSE
> +a file was closed 
> +.nh
> +(FAN_CLOSE_WRITE | FAN_CLOSE_NOWRITE).
> +.hy
> +.PP
> +The following macros are provided to iterate over a buffer of
> +.B fanotify
> +event metadata:
> +.TP
> +.B FAN_EVENT_OK(meta, len)
> +checks the remaining length
> +.I len
> +of the buffer
> +.I meta
> +against the length of the metadata structure and the
> +.I event_len
> +field of the first metadata structure in the buffer.
> +.TP
> +.B FAN_EVENT_NEXT(meta, len)
> +lets the pointer
> +.I meta
> +point to the next metadata structure using the length indicated in the
> +.I event_len
> +field of the metadata structure and reduces the remaining length of the
> +buffer
> +.I len.
> +.PP
> +For permission events the application must
> +.BR write (2)
> +to the
> +.B fanotify
> +file descriptor a structure
> +
> +.in +4n
> +.nf
> +struct fanotify_response {
> +        __s32 fd;
> +        __u32 response;
> +};
> +.fi
> +.in
> +
> +.TP 15
> +.I fd
> +is the file descriptor from structure
> +.I fanotify_event_metadata.
> +.TP
> +.I response
> +must be either
> +.br
> +.B FAN_ALLOW
> +to allow the file operation or
> +.br
> +.B FAN_DENY
> +to deny the file operation.
> +.PP
> +To end listening it is sufficient to
> +.BR close (2)
> +the
> +.B fanotify
> +file descriptor. The open permission events will be set to allowed, and all
> +resources will be returned to the kernel.
> +.PP
> +File /proc/<pid>/fdinfo/<fd> contains information about fanotify marks for
> +file descriptor fd of process pid. See
> +.nh
> +.I Documentation/filesystems/proc.txt
> +.hy
> +for details.
> +.SH ERRORS
> +The following errors may occur when reading from the
> +.B fanotify
> +file descriptor:
> +.TP
> +.B EAGAIN
> +a nonblocking call did not return any data.
> +.TP
> +.B EFAULT
> +the read buffer is outside your accessible address space.
> +.TP
> +.B EINTR
> +a signal has occurred.
> +.TP
> +.B EINVAL
> +the buffer is too short to hold the event.
> +.PP
> +The following errors may occur when writing to the
> +.B fanotify
> +file descriptor:
> +.TP
> +.B EFAULT
> +the write buffer is outside your accessible address space.
> +.TP
> +.B EINVAL
> +.B fanotify
> +access permissions are not enabled or the value of
> +.I response
> +in the response structure is not valid.
> +.TP
> +.B ENOENT
> +the file descriptor
> +.I fd
> +in the response structure is not valid. This might occur because the file was
> +already deleted by another thread or process.
> +.SH VERSIONS
> +The
> +.B fanotify
> +API was introduced in version 2.6.36 of the Linux kernel and enabled in
> +version 2.6.37. Fdinfo support was added in version 3.8.
> +.SH "CONFORMING TO"
> +The
> +.B fanotify
> +API is Linux-specific.
> +.SH NOTES
> +The notification is based on the kernel filesystem notification system
> +.B fsnotify.
> +.PP
> +To enable the
> +.B fanotify
> +API the following setting in the Kernel configuration is needed:
> +CONFIG_FANOTIFY=y. For permission handling
> +CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y must be set.
> +.SH EXAMPLE
> +The following program demonstrates the usage of the
> +.B fanotify
> +API. It creates a thread waiting for FAN_PERM_OPEN and FAN_CLOSE_WRITE events

Format all constants with

.B

> +for mount /home. If a permission event arises a FAN_ALLOW response is given.
> +When a line feed is entered a signal is sent to stop the listening thread.

Please ad a sample run or two in the page, and explain the example output.

> +.PP
> +The example does not cover handling signals arising while not waiting for a new
> +event.

Some general remarkks about the program.
* Add more vertical white space to break up the logical steps would be good.
* Add some (good) comments explaining what is happening at signicant points.
  
> +.PP

Add
.SS Program source
here.

> +.nf
> +#include <linux/fcntl.h>
> +#include <linux/limits.h>
> +#include <pthread.h>
> +#include <signal.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <sys/fanotify.h>
> +#include <unistd.h>
> +
> +static void *run(void *data) {

The norm for man-pages is

static void *
run (void *data)
{

(Please fix main() also)

> +    char buf[4096];
> +    int fd;
> +    const struct fanotify_event_metadata *metadata;
> +    int len;
> +    char path[PATH_MAX];
> +    int path_len;
> +    struct fanotify_response response;

Blank line here.

> +    if (-1 == (fd = fanotify_init(FAN_CLOEXEC | FAN_CLASS_CONTENT,
> +            O_RDONLY | O_LARGEFILE))) {


Needlessly hard to read. Please write this as:

    fd = fanotify_init()
    if (fd == \-1) {
        ...


Also, all '-' characters in code should be escaped (\-)

> +        perror("Cannot init");

perror("fanotify_init");

and similar elsewhere below.

> +        return NULL;
> +    }
> +    if (-1 == (fanotify_mark(fd, FAN_MARK_ADD | FAN_MARK_MOUNT,
> +            FAN_OPEN_PERM | FAN_CLOSE_WRITE, FAN_NOFD, "/home"))) {

Please write

    if (fanotify_mark() == \-1)

> +        perror("Cannot mark");
> +        close(fd);
> +        return NULL;
> +    }

> +    while (-1 != (len = read(fd, (void *) &buf, sizeof (buf)))) {

See above.

> +        metadata = (struct fanotify_event_metadata *) buf;

Comment explaining while look

> +        while (FAN_EVENT_OK(metadata, len)) {
> +            if (metadata->fd != FAN_NOFD) {
> +                if (metadata->fd >= 0) {
> +                    if (metadata->mask & FAN_OPEN_PERM) {
> +                        printf("FAN_OPEN_PERM: ");
> +                        response.fd = metadata->fd;
> +                        response.response = FAN_ALLOW;
> +                        write(fd, &response, sizeof (
> +                                struct fanotify_response));
> +                    }

> +                    if (metadata->mask & FAN_CLOSE_WRITE) {
> +                        printf("FAN_CLOSE_WRITE: ");
> +                    }

> +                    sprintf(path, "/proc/self/fd/%d", metadata->fd);
> +                    path_len = readlink(path, path, sizeof (path) - 1);
> +                    if (path_len > 0) {
> +
> +                        path[path_len] = 0x00;

"0x00" is idiosyncratic. Please write '\0'.

> +                        printf("File %s", path);
> +                    }
> +                    close(metadata->fd);
> +                }
> +                printf("\\n");
> +            }
> +            metadata = FAN_EVENT_NEXT(metadata, len);
> +        }
> +    }
> +    close(fd);
> +    return NULL;
> +}
> +
> +int main(int argc, char *argv[]) {
   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
See formatting comment above.

> +    pthread_attr_t attr;
> +    pthread_t thread;
> +    void *result;

Blank line

> +    if (pthread_attr_init(&attr)) {
> +        return EXIT_FAILURE;
> +    }

Please add error diagnostics to all of these calls. And, the norm in 
man-pages is exit().

e = pthread_create();
if (e != 0) {
    errno = e;
    perror("pthread_create");
    exit(EXIT_FAILURE);
}

Or add this macro (or similar) to simplify the diagnotic:

#define errExitEN(en, msg) \
    			do { errno = en; perror(msg); \
    			     exit(EXIT_FAILURE); } while (0)

> +    if (pthread_create(&thread, &attr, run, NULL)) {
> +        return EXIT_FAILURE;
> +    }

See above comment on diagnostics.

> +    printf("Press any key to terminate\\n");
> +    getchar();
> +    if (0 != pthread_kill(thread, SIGUSR1)) {
> +        return EXIT_FAILURE;
> +    }

See above comment on diagnostics.

> +    pthread_join(thread, &result);

See above comment on diagnostics.

> +    return EXIT_SUCCESS;

exit()

> +}
> +.fi
> +.SH "SEE ALSO"
> +.ad l
> +.nh
> +.BR fanotify_init (2),
> +.BR fanotify_mark (2),
> +.BR inotify (7)

The idea of an fanotify(7) page is a good one. And, modulo a 
lack of comments and lack of a demo, thanks for including an
example program. But, having got to the end of the page, 
I still don't feel like I have a good overview of fanotify.

Somewhere near the top of the page, there should be an explanation
of the steps in overview. Something like:

1. Create an fanotify instance
2. Add marks
3. Execute a read loop to handle events.
   a) Loop through the events
      (each read() may return multiple events)
      *) Deal with each event
         (Explain write() here.)
         (Explain that (all) events may open file descriptors.)
4. Close the file descriptors.

See what I mean?

I'll have a lot more comments, but would you be willing to fix up these
points Heinrich, and then I can take another pass.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
