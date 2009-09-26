From: bill o gallmeister <bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: for review:  man3/posix_spawnattr_getflags.3 (replaces 3p POSIX verbiage)
Date: Sat, 26 Sep 2009 11:46:40 -0700
Message-ID: <4ABE6190.2000700@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

.\" Copyright (c) 2009 Bill O. Gallmeister (bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org)
.\"
.\" Permission is granted to make and distribute verbatim copies of this
.\" manual provided the copyright notice and this permission notice are
.\" preserved on all copies.
.\"
.\" Permission is granted to copy and distribute modified versions of this
.\" manual under the conditions for verbatim copying, provided that the
.\" entire resulting derived work is distributed under the terms of a
.\" permission notice identical to this one.
.\"
.\" Since the Linux kernel and libraries are constantly changing, this
.\" manual page may be incorrect or out-of-date.  The author(s) assume no
.\" responsibility for errors or omissions, or for damages resulting from
.\" the use of the information contained herein.  The author(s) may not
.\" have taken the same level of care in the production of this manual,
.\" which is licensed free of charge, as they might when working
.\" professionally.
.\"
.\" Formatted or processed versions of this manual, if unaccompanied by
.\" the source, must acknowledge the copyright and authors of this work.
.\"
.\" References consulted:
.\"     Linux glibc source code
.\"     POSIX 1003.1-2004 documentation (http://www.opengroup.org/onlinepubs/009695399)
.\"
.TH "POSIX_SPAWNATTR_GETFLAGS" 3 2009-09-22 "GNU" "Linux Programmer's Manual"
.\" posix_spawnattr_getflags, posix_spawnattr_setflags
.SH NAME
posix_spawnattr_getflags, posix_spawnattr_setflags \- get/set spawn attribute flags
.SH SYNOPSIS
.nf
.B #include <spawn.h>

.BI "int posix_spawnattr_getflags(const posix_spawnattr_t *" attrp ,
.BI "       short *" flags);

.BI "int posix_spawnattr_setflags(posix_spawnattr_t *" attrp ", short " flags );

.fi
.sp
.in -4n
Feature Test Macro Requirements for glibc (see
.BR feature_test_macros (7)):
.in
.sp
.ad l
.BR posix_spawnattr_getflags ()
and
.BR posix_spawnattr_setflags ():
(_POSIX_C_SOURCE\ >=\ 200112L)\ &&\ (_POSIX_SPAWN)
.ad b

.SH DESCRIPTION
.BR Posix_spawn ()
and
.BR posix_spawnp ()
are used to create a new child process from the specified
process image.  Think of these functions as a combined
.BR fork ()/ exec ().
As part of calling these functions, the programmer can specify actions to be taken in the newly-created
child process by passing a pointer to an appropriately-initialized
.B posix_spawnattr_t
structure.
.LP
By setting flags and elements in this structure, the programmer can set various actions
to be taken when
.BR posix_spawn ()
is called.
.LP
The flags are set using
.BR posix_spawnattr_setflags ().
The corresponding elements in the
.I posix_spawnattr_t
are set using the other
.I posix_spawnattr_set*
functions.
.LP
The following flags are supported:
.IP [POSIX_SPAWN_SETSIGMASK] 2
Set its signal mask as if using
.BI sigprocmask( SIG_SETMASK )
and the signal set specified in
the
.I spawn-sigmask
element.  Set
.I spawn-sigmask
using
.BR posix_spawnattr_setsigmask ().
.IP [POSIX_SPAWN_SETSIGDEF]
Reset the handler for all signals specified in
the
.I spawn-sigdefault
element back to default state.
Set
.I spawn-sigdefault
using
.BR posix_spawnattr_setsigdefault ().
.IP [POSIX_SPAWN_SETSCHEDPARAM]
Set the scheduling parameters (POSIX_PRIORITY_SCHEDULING only)
to the parameters specified in the
.I spawn-schedparam
element.
Set
.I spawn-schedparam
using
.BR posix_spawnattr_setschedparam ().
.IP [POSIX_SPAWN_SETSCHEDULER]
Set the scheduling algorithm and parameters according to
the
.I spawn-schedpolicy
element of
.I *attrp
(If
.I POSIX_SPAWN_SETSCHEDPARAM
is also set, then the scheduling parameters are set according to the corresponding element;
otherwise, the effect is as if a NULL was passed as the
.I param
argument to
.BR sched_setscheduler ()).
Set
.I spawn-schedpolicy
using
.BR posix_spawnattr_setschedpolicy ().
.IP [POSIX_SPAWN_RESETIDS]
Set the effective UID and GID to the real UID and GID of the parent process.
If this flag is not set, then the child gets the effective UID and GID of the parent.
In either case, the setuid and setgid bits of the executable file themselves take precedence.
.IP [POSIX_SPAWN_SETPGROUP]
Set the process group to the value specified in
the \fIspawn-pgroup\fP element.
Set
.I spawn-pgroup
using
.BR posix_spawnattr_setpgroup ().
.IP [POSIX_SPAWN_USEVFORK]
Use
.BR vfork (),
rather than
.BR fork (),
when creating the child process.  Note that, in order for this action to be taken, none of the other flag values can be specified;  nor can any file
actions be specified in the call to
.BR posix_spawn ()/ posix_spawnp ().
.LP
To retrieve the value of the
flags in the
.I posix_spawnattr_t
structure,
use
.BR posix_spawnattr_getflags ().
.SH RETURN VALUE
.LP
If the system supports these functions,
.BR posix_spawnattr_setflags ()
returns 0 and sets the flags in the passed attribute structure,
unless an unsupported flag value is passed.
.LP
.BR Posix_spawnattr_getflags (),
on the other hand, always returns 0.
.SH ERRORS
.LP
.BR posix_spawnattr_setflags ()
returns an error in the following cases:
.TP
.B EINVAL
An unsupported flag value was specified.
.LP
Both
.BR posix_spawnattr_setflags ()
and
.BR posix_spawnattr_getflags ()
can fail if the system is not configured to support the
.I posix_spawn*
functions:
.TP
.B ENOSYS
This function is not supported on this system.
.SH NOTES
POSIX does not specify the names of any internal elements within the
.I posix_spawnattr_t
structure;  in fact, it does not specify that it is a structure at all.
Portable programs should refrain from directly referencing fields within this
structure.  In these man pages we refer to the internal parts of the
.I posix_spawnattr_t
as elements.
.SH CONFORMING TO
.LP
POSIX.1-2004.
.SH SEE ALSO
.LP
.BR close (2),
.BR dup2 (2),
.BR execl (2),
.BR execlp (2),
.BR fork (2),
.BR open (2),
.BR sched_setparam (2),
.BR sched_setscheduler (2),
.BR setpgid (2),
.BR setuid (2),
.BR sigaction (2),
.BR sigprocask (2),
.BR posix_spawnattr_destroy (3),
.BR posix_spawnattr_getflags (3),
.BR posix_spawnattr_getpgroup (3),
.BR posix_spawnattr_getschedparam (3),
.BR posix_spawnattr_getschedpolicy (3),
.BR posix_spawnattr_getsigdefault (3),
.BR posix_spawnattr_init (3),
.BR posix_spawnattr_setflags (3),
.BR posix_spawnattr_setpgroup (3),
.BR posix_spawnattr_setschedparam (3),
.BR posix_spawnattr_setschedpolicy (3),
.BR posix_spawnattr_setsigdefault (3),
.BR posix_spawn_file_actions_addclose (3),
.BR posix_spawn_file_actions_adddup2 (3),
.BR posix_spawn_file_actions_addopen (3),
.BR posix_spawn_file_actions_destroy (3),
.BR posix_spawn_file_actions_init (3),
.BR pthread_atfork (3),
.BR sigaddset (3),
.BR sigemptyset (3),
.BR sigfillset (3),
.BR posixoptions (7),
.BR <spawn.h>,
Base Definitions volume of POSIX.1-2004,
.I http://www.opengroup.org/unix/online.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
