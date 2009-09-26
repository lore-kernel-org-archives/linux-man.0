From: bill o gallmeister <bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: for review:  man3/posix_spawnattr_getschedpolicy.3 (replaces 3p POSIX
 verbiage)
Date: Sat, 26 Sep 2009 11:45:41 -0700
Message-ID: <4ABE6155.40105@gmail.com>
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
.TH "POSIX_SPAWNATTR_GETSCHEDPOLICY" 3 2009-09-22 "GNU" "Linux Programmer's Manual"
.\" posix_spawnattr_getschedpolicy, posix_spawnattr_setschedpolicy, posix_spawnattr_getschedparam, posix_spawnattr_setschedparam
.SH NAME
posix_spawnattr_getschedpolicy, posix_spawnattr_setschedpolicy, posix_spawnattr_getschedparam, posix_spawnattr_setschedparam \- get/set spawn
scheduling policy and parameters attributes
.SH SYNOPSIS
.nf
.B #include <spawn.h>

.BI "int posix_spawnattr_setschedpolicy(posix_spawnattr_t *" attrp ,
.BI "       int " schedpolicy);

.BI "int posix_spawnattr_getschedpolicy(const posix_spawnattr_t *" attrp ,
.BI "       int *" schedpolicy);

.BI "int posix_spawnattr_setschedparam(posix_spawnattr_t *" attrp ,
.BI "       struct sched_param " schedparam);

.BI "int posix_spawnattr_getschedparam(const posix_spawnattr_t *" attrp ,
.BI "       struct sched_param *" schedparam);

.fi
.sp
.in -4n
Feature Test Macro Requirements for glibc (see
.BR feature_test_macros (7)):
.in
.sp
.ad l
.BR posix_spawnattr_getschedpolicy (),
.BR posix_spawnattr_setschedpolicy (),
.BR posix_spawnattr_getschedparam (),
and
.BR posix_spawnattr_setschedparam ():
(_POSIX_C_SOURCE\ >=\ 200112L)\ &&\ (_POSIX_SPAWN)\ &&\ (_POSIX_PRIORITY_SCHEDULING)
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
Two of these actions are the setting of the scheduling policy and parameters for
the child process.
By default, these attributes in the spawned child process will be the same as that of the parent process.
If the calling process has set the
.B POSIX_SPAWN_SETSCHEDPARAM
flag, using
.BR posix_spawnattr_setflags (),
then the scheduling parameters for the child process will be set according to the value of the
.I spawn-schedparam
element in the
.I posix_spawnattr_t
structure.
This scheduling parameter is set by calling
.BR posix_spawnattr_setschedparam ().
The programmer passes a
.BR "struct sched_param" ,
initialized as for a call to
.BR sched_setparam ().
This parameter will be interpreted relative to the scheduling policy in effect for the child process.
.LP
If the programmer wishes to set the scheduling policy for the child process,
then the
.B POSIX_SPAWN_SETSCHEDPOLICY
flag should be set using
.BR posix_spawnattr_setflags (),
and the desired policy should be set using
.BR posix_spawnattr_setschedpolicy ().
.LP
If both
.B POSIX_SPAWN_SETSCHEDPOLICY
and
.B POSIX_SPAWN_SETSCHEDPARAM
are set, then the desired scheduling policy will be put into effect with the desired parameters (if possible).
If only
.B POSIX_SPAWN_SETSCHEDPOLICY
is set, then the scheduling policy will be set with default parameters for that policy.
.LP
To retrieve the value of the
.I spawn-schedpolicy
or
.I spawn-schedparam
elements in the
.I posix_spawnattr_t
structure,
use
.BR posix_spawnattr_getschedpolicy ()
or
.BR posix_spawnattr_getschedpolicy (),
respectively.
.SH RETURN VALUE
.LP
All four of these functions return 0 unless an error occurs.
If an error occurs, then the error value is returned.
.SH ERRORS
.LP
The following errors may be returned on
Linux/glibc systems:
.TP
.B EINVAL
An invalid value for
.I sched_policy
was specified (
.BR posix_spawnattr_setschedpolicy ()
only).
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
