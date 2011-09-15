From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] setns.2: Initial man page
Date: Thu, 15 Sep 2011 06:13:48 +0200
Message-ID: <CAKgNAkigmkeq+2sDc1VRLf0+TGAe_RHv=PvxEWNYxOqe2UUT0g@mail.gmail.com>
References: <m1r57gj2sh.fsf@fess.ebiederm.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m1r57gj2sh.fsf-+imSwln9KH6u2/kzUuoCbdi2O/JbrIOy@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Serge E. Hallyn" <serge.hallyn-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Eric,

See below.

On Mon, May 30, 2011 at 5:16 AM, Eric W. Biederman
<ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org> wrote:
>
> Signed-off-by: Eric W. Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
> ---
> =A0man2/setns.2 | =A0 88 ++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++
> =A01 files changed, 88 insertions(+), 0 deletions(-)
> =A0create mode 100644 man2/setns.2
>
> diff --git a/man2/setns.2 b/man2/setns.2
> new file mode 100644
> index 0000000..8b48e14
> --- /dev/null
> +++ b/man2/setns.2
> @@ -0,0 +1,88 @@
> +.\" Copyright (C) 2011, Eric Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
> +.\" Licensed under the GPLv2
> +.\"
> +.TH SETNS 2 2011-05-28 "Linux" "Linux Programmer's Manual"
> +.SH NAME
> +setns \- reassociate parts of the process execution context
> +.SH SYNOPSIS
> +.nf
> +.BR "#define _GNU_SOURCE" " =A0 =A0 =A0 =A0 =A0 =A0 /* See feature_t=
est_macros(7) */"
> +.B #include <sched.h>
> +.sp
> +.BI "int setns(int " fd ", int " nstype );
> +.fi
> +.SH DESCRIPTION
> +Given a file descriptor referring to a namespace reassociate the
> +current process with that namespace.
> +
> +The
> +.I nstype
> +argument is an enumeration that specifies which type of namespace
> +the current process may be reassociated with. =A0This argument can
> +have one of the following values:
> +
> +.TP
> +.BR 0
> +Allow any namespace to be joined.
> +.TP
> +.BR CLONE_NEWIPC
> +Only allow joining an ipc namespace.
> +.TP
> +.BR CLONE_NEWNET
> +Only allow joining a network namespace.
> +.TP
> +.BR CLONE_NEWUTS
> +Only allow joining a uts namespace.
> +.PP
> +If
> +.I flags
> +is specified as zero, then
> +.BR setns ()
> +is a no-op;
> +no changes are made to the calling process's execution context.
> +.SH RETURN VALUE
> +On success, zero returned.
> +On failure, \-1 is returned and
> +.I errno
> +is set to indicate the error.
> +.SH ERRORS
> +.TP
> +.TP
> +.B EBADF
> +A bad file descriptor was passed to setns.
> +
> +.TP
> +.B EINVAL
> +A file descriptor that does not match the specified nstype.
> +
> +Attempting to change the mount namespace and the filesystem
> +is shared between multiple tasks.
> +
> +.TP
> +.B ENOMEM
> +Cannot allocate sufficient memory to change the specified namespace.
> +
> +.TP
> +.B EPERM
> +The calling process did not have the required privileges for this op=
eration.
> +.SH VERSIONS
> +The
> +.BR setns ()
> +system call first appeared in Linux in kernel 3.0
> +.SH CONFORMING TO
> +The
> +.BR setns ()
> +system call is Linux-specific.
> +.SH NOTES
> +Not all of the process attributes that can be shared when
> +a new process is created using
> +.BR clone (2)
> +can be changed using
> +.BR setns ().
> +.SH BUGS
> +The pid namespace and the mount namespace are not currently supporte=
d.
> +.SH SEE ALSO
> +.BR clone (2),
> +.BR fork (2),
> +.BR vfork (2),
> +.BR setns(2)
> --
> 1.7.5.1.217.g4e3aa

I made various edits to the page, some after out F2F conversations.
Could you please comment on the new version below?

Note: we talked a couple of times about this piece of text under the
EINVAL error.

       Attempted  to  change  the  mount  namespace, but the filesystem
       is shared between multiple tasks.

As I understand it, this refers to interactions between the mount
namespace and file system namespace. However, as noted in the man
page, setns() does not support CLONE_NEWNS. Furthermore, I can see no
path in the setns() that generates EINVAL and  involves CLONE_NEWNS.
So,I removed that text. Please let me know if that's wrong.

Cheers,

Michael


=2E\" Copyright (C) 2011, Eric Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
=2E\" Licensed under the GPLv2
=2E\"
=2ETH SETNS 2 2011-09-15 "Linux" "Linux Programmer's Manual"
=2ESH NAME
setns \- reassociate process with a namespace
=2ESH SYNOPSIS
=2Enf
=2EBR "#define _GNU_SOURCE" "             /* See feature_test_macros(7)=
 */"
=2EB #include <sched.h>
=2Esp
=2EBI "int setns(int " fd ", int " nstype );
=2Efi
=2ESH DESCRIPTION
Given a file descriptor referring to a namespace,
reassociate the calling process with that namespace.

The
=2EI fd
argument is a file descriptor referring to one of the namespace entries=
 in a
=2EI /proc/[pid]/ns/
directory; see
=2EBR proc (5)
for further information on
=2EIR /proc/[pid]/ns/ .
The calling process will be reassociated with the corresponding namespa=
ce,
subject to any constraints imposed by the
=2EI nstype
argument.

The
=2EI nstype
argument specifies which type of namespace
the calling process may be reassociated with.
This argument can have one of the following values:
=2ETP
=2EBR 0
Allow any type of namespace to be joined.
=2ETP
=2EBR CLONE_NEWIPC
=2EI fd
must refer to an IPC namespace.
=2ETP
=2EBR CLONE_NEWNET
=2EI fd
must refer to a network namespace.
=2ETP
=2EBR CLONE_NEWUTS
=2EI fd
must refer to a UTS namespace.
=2EPP
Specifying
=2EI nstype
as 0 suffices if the caller knows (or does not care)
what type of namespace is referred to by
=2EIR fd .
Specifying a nonzero value for
=2EI nstype
is useful if the caller does not know what type of namespace is referre=
d to by
=2EIR fd
and wants to ensure that the namespace is of a particular type.
(The caller might not know the type of the namespace referred to by
=2EIR fd
if the file descriptor was opened by another process and, for example,
passed to the caller via a UNIX domain socket.)
=2ESH RETURN VALUE
On success,
=2EIR setns ()
returns 0.
On failure, \-1 is returned and
=2EI errno
is set to indicate the error.
=2ESH ERRORS
=2ETP
=2EB EBADF
=2EI fd
is not a valid file descriptor.
=2ETP
=2EB EINVAL
=2EI fd
refers to a namespace whose type does not match that specified in
=2EIR nstype .
=2ETP
=2EB ENOMEM
Cannot allocate sufficient memory to change the specified namespace.
=2ETP
=2EB EPERM
The calling process did not have the required privilege
=2ERB ( CAP_SYS_ADMIN )
for this operation.
=2ESH VERSIONS
The
=2EBR setns ()
system call first appeared in Linux in kernel 3.0
=2ESH CONFORMING TO
The
=2EBR setns ()
system call is Linux-specific.
=2ESH NOTES
Not all of the process attributes that can be shared when
a new process is created using
=2EBR clone (2)
can be changed using
=2EBR setns ().
=2ESH BUGS
The PID namespace and the mount namespace are not currently supported.
(See the descriptions of
=2EBR CLONE_NEWPID
and
=2EBR CLONE_NEWNS
in
=2EBR clone (2).)
=2ESH SEE ALSO
=2EBR clone (2),
=2EBR fork (2),
=2EBR vfork (2),
=2EBR proc (5),
=2EBR unix (7)


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
