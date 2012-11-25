From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] Documentation of the fanotify interface.
Date: Sun, 25 Nov 2012 17:58:11 +0100
Message-ID: <CAKgNAkjmj5kOvkfWGTGH-GE=fak+C2_3PComW3im-tW3i5w6Xw@mail.gmail.com>
References: <1353790354-14452-1-git-send-email-xypron.glpk@gmx.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353790354-14452-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>, James Hunt <james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Heinrich,

On Sat, Nov 24, 2012 at 9:52 PM, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org> wrote:
> The fanotify interface was introduced in version 2.6.36 of the
> Linux kernel and enabled in version 2.6.37.

As you've I think noted elsewhere, Stephan Mueller sometime ago tried
to document these system calls. That effort fell on the floor for a
few reasons.

One reason was lack of review (by me, or anyone else). Eric Paris made
some comments, but even then I could still see obvious problems with
with Stephan's pages that Eric hadn't picked up. Unfortunately, I
never had time to follow it up, and an offered demo program from Eric
never appeared.

Some comments:

0. Please read man-pages(7). It has some useful pointers to
information on page formatting.

1. Stephan's pages seem more complete than yours, but still contain
errors and omissions. For example, there is not a lot of detail on
what you get from reading the file descriptor. Another example: the
statement in Stepha's page that 'event_f_flags' takes the same flags
as open(2) is clearly wrong: it takes a subset, and that subset should
be documented. I am suspicious of the statement that "When the file
descriptor possesses the flag O_NONBLOCK the kernel returns one
event." And the FAN_READONLY_FALLBACK flag described in those page
does not exist. There's no mention of the defaults used if "UNLIMITED"
flags are not specified. And so on.

2. It is unclear to me whether you or Stephan actually wrote programs
to test what you are writing about. Maybe both of you did, but no
mention of this was made in the mail. I think that's pretty essential
for a complex API like this.

3. I like your idea of an fanotify(7) page with overview. But, you've
copied and pasted from inotify(7) and many errors crept in that
process.

4. If Stephan is still available, here's what I'd like to see:
a) Review of Stephan's pages for accuracy, so that Stephan could
improve them. The problems in (1) make me think that many details need
to be checked. There is some material in your (Heinrich) pages that
could be useful in Stephan's pages. If Stephan is still available,
could you collaborate to get that material into Stephan's pages? If he
is not, could you pick up Stephan's pages and improve them, including
useful material from your pages?
b) I do like the idea of an fanotify(7) page -- it would be good to
have that, but improved please.
c) I'd like to know that the person(s) working on the page have tested
what they are writing about.
d) Eric, what happened to you demo program? There need to be some demo
program(s) in the man pages. And probably some shell session output
demonstrating the use of those programs.
e) James hunt asked that these Stephan's pages be included into
man-pages. James, are you able to do any review?
f) (Note to Stephan) I do prefer to get patches inline rather than attachments.

I will forward Stephan's pages to you.

Cheers,

Michael



> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/fanotify_init.2 |  174 +++++++++++++++++++++++++++++++++++++++++
>  man2/fanotify_mark.2 |  149 +++++++++++++++++++++++++++++++++++
>  man7/fanotify.7      |  210 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 533 insertions(+)
>  create mode 100644 man2/fanotify_init.2
>  create mode 100644 man2/fanotify_mark.2
>  create mode 100644 man7/fanotify.7
>
> diff --git a/man2/fanotify_init.2 b/man2/fanotify_init.2
> new file mode 100644
> index 0000000..9cde8e8
> --- /dev/null
> +++ b/man2/fanotify_init.2
> @@ -0,0 +1,174 @@
> +." Copyright (C)  Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> +."
> +.\" This is free documentation; you can redistribute it and/or
> +.\" modify it under the terms of the GNU General Public License as
> +.\" published by the Free Software Foundation; either version 2 of
> +.\" the License, or (at your option) any later version.
> +.\"
> +.\" The GNU General Public License's references to "object code"
> +.\" and "executables" are to be interpreted as the output of any
> +.\" document formatting or typesetting system, including
> +.\" intermediate and printed output.
> +.\"
> +.\" This manual is distributed in the hope that it will be useful,
> +.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
> +.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +.\" GNU General Public License for more details.
> +.\"
> +.\" You should have received a copy of the GNU General Public
> +.\" License along with this manual; if not, write to the Free
> +.\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111,
> +.\" USA.
> +
> +.TH FANOTIFY_INIT 7 2012-11-23 "Linux" "Linux Programmer's Manual"
> +.SH NAME
> +fanotify_init \- create and initialize fanotify group
> +.SH SYNOPSIS
> +.nf
> +.B #include <sys/fanotify.h>
> +.sp
> +.B "int fanotify_init(unsigned int flags, unsigned int event_f_flags);"
> +.fi
> +.SH DESCRIPTION
> +initializes a new fanotify group and returns a file descriptor for the event
> +queue.
> +.PP
> +The call requires the
> +.B CAP_SYS_ADMIN
> +capability. This constraint might be relaxed in future versions of the API.
> +Hence additonal local capability checks have been implemented as indicated
> +below.
> +.PP
> +.IR flags
> +defines the behavior of the file descriptor. It is a bitmask composed of the
> +following values:
> +.TP
> +.B FAN_CLOEXEC
> +Set the close-on-exec flag (
> +.I FD_CLOEXEC
> +) on the new file descriptor. For details refert to the description of the
> +.I O_CLOEXEC
> +flag in
> +.BR open (2)
> +.TP
> +.B FAN_NONBLOCK
> +enables the non-blocking flag (
> +.I O_NONBLOCK
> +) for the file descriptor. Reading from the file descriptor will not block.
> +Instead if no data is available an error
> +.B EAGAIN
> +will be occur.
> +.TP
> +.B FAN_CLASS_NOTIF
> +sets a priority level which does not allow to make access decisions.
> +.TP
> +.B FAN_CLASS_CONTENT
> +sets a priority level which allows to make access decisions.
> +.TP
> +.B FAN_CLASS_PRE_CONTENT
> +sets as priority level which allows to change the file content prior to access.
> +.TP
> +.B FAN_UNLIMITED_QUEUE
> +removes the limit on the size of the event queue. This flag requires the
> +.nh
> +.B CAP_SYS_ADMIN
> +.hy
> +capability.
> +.TP
> +.B FAN_UNLIMITED_MARKS
> +removes the limit on the number of marks. This flag requires the
> +.nh
> +.B CAP_SYS_ADMIN
> +.hy
> +capability.
> +.PP
> +.IR event_f_flags
> +defines which events shall be signaled. It is a bitmask composed of the
> +following values:
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
> +.B FAN_CLOSE
> +a file was closed (FAN_CLOSE_WRITE | FAN_CLOSE_NOWRITE).
> +.TP
> +.B FAN_CLOSE_WRITE
> +writtable file closed.
> +.TP
> +.B FAN_CLOSE_NOWRITE
> +unwrittable file closed.
> +.TP
> +.B FAN_Q_OVERFLOW
> +event queued overflowed.
> +.TP
> +.B FAN_ACCESS_PERM
> +file accessed in perm check.
> +.TP
> +.B FAN_OPEN_PERM
> +File open in perm check.
> +.TP
> +.B FAN_ONDIR
> +event occurred against directory.
> +.TP
> +.B FAN_EVENT_ON_CHILD
> +an event for child of a directory occured.
> +.SH RETURN VALUES
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
> +- The number of listeners excceeds
> +.nh
> +.B FANOTIFY_DEFAULT_MAX_LISTENERS.
> +.hy
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
> +Out of memory, the allocation of memory for the nofication group failed.
> +.TP
> +.B EPERM
> +Operation not permitted
> +.SH VERSIONS
> +Fanotify_init was introduced in version 2.6.36 of the Linux kernel and enabled
> +in version 2.6.37.
> +.SH "CONFORMING TO"
> +This system call is Linux-specific.
> +.SH "SEE ALSO"
> +.BR fanotify (7),
> +.BR fanotify_mark (2)
> \ No newline at end of file
> diff --git a/man2/fanotify_mark.2 b/man2/fanotify_mark.2
> new file mode 100644
> index 0000000..90d456d
> --- /dev/null
> +++ b/man2/fanotify_mark.2
> @@ -0,0 +1,149 @@
> +." Copyright (C)  Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> +."
> +.\" This is free documentation; you can redistribute it and/or
> +.\" modify it under the terms of the GNU General Public License as
> +.\" published by the Free Software Foundation; either version 2 of
> +.\" the License, or (at your option) any later version.
> +.\"
> +.\" The GNU General Public License's references to "object code"
> +.\" and "executables" are to be interpreted as the output of any
> +.\" document formatting or typesetting system, including
> +.\" intermediate and printed output.
> +.\"
> +.\" This manual is distributed in the hope that it will be useful,
> +.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
> +.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +.\" GNU General Public License for more details.
> +.\"
> +.\" You should have received a copy of the GNU General Public
> +.\" License along with this manual; if not, write to the Free
> +.\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111,
> +.\" USA.
> +
> +.TH FANOTIFY_MARK 7 2012-11-23 "Linux" "Linux Programmer's Manual"
> +.SH NAME
> +fanotify_mark \-  add, remove, or modify an fanotify mark on a filesystem
> +object.
> +.SH SYNOPSIS
> +.nf
> +.B #include <sys/fanotify.h>
> +.sp
> +.B int fanotify_mark (int fanotify_fd, unsigned int flags, uint64_t mask, int dfd, const char *pathname);
> +.fi
> +.SH DESCRIPTION
> +adds, removes, or modifies an fanotify mark on a filesystem.
> +.PP
> +.I fd
> +is the file descriptor returned by
> +.BR fanotify_init (2).
> +.PP
> +.I flags
> +is a bitmask describing the modification to do.
> +.TP
> +.B FAN_MARK_ADD
> +Add the events in
> +.I mask.
> +.TP
> +.B FAN_MARK_REMOVE
> +Remove the events in
> +.I mask.
> +.TP
> +.B FAN_MARK_DONT_FOLLOW
> +Do not follow symbolic links.
> +.TP
> +.B FAN_MARK_ONLYDIR
> +The path indicates a directory to be marked.
> +.TP
> +.B FAN_MARK_MOUNT
> +The path indicates a mount to be marked.
> +.TP
> +.B FAN_MARK_IGNORED_MASK
> +Add to or remove from the ignored event mask.
> +.TP
> +.B FAN_MARK_IGNORED_SURV_MODIFY
> +The ignored mask shall not be considered for modify events.
> +.TP
> +.B FAN_MARK_FLUSH
> +removes all events from the whole group.
> +.I
> +.PP
> +.I mask
> +defines which events shall be listened to. It is a bitmask composed of the
> +following values:
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
> +.B FAN_CLOSE
> +a file was closed (FAN_CLOSE_WRITE | FAN_CLOSE_NOWRITE).
> +.TP
> +.B FAN_CLOSE_WRITE
> +writtable file closed.
> +.TP
> +.B FAN_CLOSE_NOWRITE
> +unwrittable file closed.
> +.TP
> +.B FAN_Q_OVERFLOW
> +event queued overflowed.
> +.TP
> +.B FAN_ACCESS_PERM
> +file accessed in perm check.
> +.TP
> +.B FAN_OPEN_PERM
> +File open in perm check.
> +.TP
> +.B FAN_ONDIR
> +event occurred against directory.
> +.TP
> +.B FAN_EVENT_ON_CHILD
> +an event for child of a directory occured.
> +.PP
> +.I dfd
> +is a file decriptor.
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
> +defined in <fcntl.h> the curent working directory is to be marked.
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
> +is relative and dfd takes the special value
> +.B AT_FDCWD
> +it defines a path relative to the curent working directory to be marked.
> +.PP
> +.I pathname
> +Is an absolute or relative path to be marked.
> +
> +.SH VERSIONS
> +Fanotify_mark was introduced in version 2.6.36 of the Linux kernel and enabled
> +in version 2.6.37.
> +.SH "CONFORMING TO"
> +This system call is Linux-specific.
> +.SH "SEE ALSO"
> +.BR fanotify (7),
> +.BR fanotify_init (2)
> diff --git a/man7/fanotify.7 b/man7/fanotify.7
> new file mode 100644
> index 0000000..82078f8
> --- /dev/null
> +++ b/man7/fanotify.7
> @@ -0,0 +1,210 @@
> +.\" Copyright (C) 2012 Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> +.\"
> +.\" This is free documentation; you can redistribute it and/or
> +.\" modify it under the terms of the GNU General Public License as
> +.\" published by the Free Software Foundation; either version 2 of
> +.\" the License, or (at your option) any later version.
> +.\"
> +.\" The GNU General Public License's references to "object code"
> +.\" and "executables" are to be interpreted as the output of any
> +.\" document formatting or typesetting system, including
> +.\" intermediate and printed output.
> +.\"
> +.\" This manual is distributed in the hope that it will be useful,
> +.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
> +.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +.\" GNU General Public License for more details.
> +.\"
> +.\" You should have received a copy of the GNU General Public
> +.\" License along with this manual; if not, write to the Free
> +.\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111,
> +.\" USA.
> +
> +.TH INOTIFY 7 2012-11-23 "Linux" "Linux Programmer's Manual"
> +.SH NAME
> +fanotify \- monitoring file system events
> +.SH DESCRIPTION
> +The
> +.I fanotify
> +API provides notification, and interception of file system events. Use cases
> +are virus scanning and hierarchical storage management.
> +
> +The following system calls are used with this API:
> +.BR fanotify_init (2)
> +.BR fanotify_mark (2),
> +.BR poll (2),
> +.BR ppoll (2),
> +.BR read (2),
> +.BR write (2),
> +and
> +.BR close (2).
> +.PP
> +.BR fanotify_init (2)
> +creates a fanotify instance and returns a file descriptor referring to the
> +fanotify instance.
> +.br
> +.BR fanotify_mark (2)
> +adds or removes a file, a directory, or a mount from the notification group.
> +.PP
> +When all file descriptors referring to the fanotify group are close the
> +notification group is released and the resources are freed for reuse by the
> +kernel.
> +.PP
> +An application first calls
> +.BR inotify_init (2)
> +to receive a file descriptor. It uses
> +.BR inotify_mark (2)
> +to define for which files, directories, or mounts events shall be created.
> +.PP
> +Calling
> +.BR poll (2)
> +or
> +.BR ppoll (2)
> +will lock until either a file
> +event occurs or it is interrupted by a signal (see
> +.BR signal (7)).
> +If events are able to be read this will be advertised in the returned events mask
> +as
> +.BR POLLIN
> +and if compiled with _XOPEN_SOURCE as
> +.BR POLLRDNORM.
> +.PP
> +Calling
> +.BR read (2)
> +for the file descriptor returned by inotify will block until either a file
> +event occurs or it is interrupted by a signal (see
> +.BR signal (7)).
> +.BR read (2)
> +will return the length of the filled buffer or -1 in case of an error. The
> +following errors may occur:
> +.TP
> +.BR EINTR
> +a signal has occured.
> +.TP
> +.BR EFAULT
> +the read buffer is outside your accessible address space.
> +.TP
> +.BR EAGAIN
> +a nonblocking call did not return any data.
> +.HP 0
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
> +is the length of the structure in as returned by sizeof.
> +.TP
> +.I vers
> +holds the version of the fanotify API generated the structure
> +.TP
> +.I reserved
> +is not used
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
> +if an queue overflow occured.
> +.TP
> +.I pid
> +is the ID of the process that caused the event.
> +.PP
> +The bitmask in
> +.I mask
> +is composed of thefollowing values:
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
> +.B FAN_CLOSE
> +a file was closed (FAN_CLOSE_WRITE | FAN_CLOSE_NOWRITE).
> +.TP
> +.B FAN_CLOSE_WRITE
> +writtable file closed.
> +.TP
> +.B FAN_CLOSE_NOWRITE
> +unwrittable file closed.
> +.TP
> +.B FAN_Q_OVERFLOW
> +event queued overflowed.
> +.TP
> +.B FAN_ACCESS_PERM
> +file accessed in perm check.
> +.TP
> +.B FAN_OPEN_PERM
> +File open in perm check.
> +.TP
> +.B FAN_ONDIR
> +event occurred against directory.
> +.TP
> +.B FAN_EVENT_ON_CHILD
> +an event for child of a directory occured.
> +.PP
> +For permission events the application must write to the fanotify file
> +descriptor a structure
> +.in +4n
> +.nf
> +struct fanotify_response {
> +        __s32 fd;
> +        __u32 response;
> +};
> +.fi
> +.in
> +.TP 15
> +.I fd
> +is the file descriptor from structure
> +.I fanotify_event_metadata.
> +.TP
> +.I response
> +must be either of
> +.br
> +.B FAN_ALLOW
> +to allow the file operation or
> +.br
> +.B FAN_DENY
> +to deny the file operation.
> +.PP
> +To end listening it is sufficient to
> +.B close (2)
> +the fanotify file descriptor. The open permission events will be set to
> +allowed, and all resources will be returned to the kernel.
> +.SH VERSIONS
> +The fanotify API was introduced in version 2.6.36 of the Linux kernel and
> +enabled in version 2.6.37.
> +.SH "CONFORMING TO"
> +This system call is Linux-specific.
> +.SH NOTES
> +The notification is based on the kernel filesystem notification system
> +.B fsnotify.
> +.SH "SEE ALSO"
> +.BR dnotify (2),
> +.BR inotify (2),
> +.BR fanotify_init (2),
> +.BR fanotify_mark (2)
> --
> 1.7.10.4
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
