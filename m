From: bill o gallmeister <bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: for review:  man3/posix_spawnattr_getpgroup.3 (replaces 3p POSIX
 verbiage)
Date: Sat, 26 Sep 2009 11:47:43 -0700
Message-ID: <4ABE61CF.5010900@gmail.com>
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
.TH "POSIX_SPAWNATTR_GETPGROUP" 3 2009-09-22 "GNU" "Linux Programmer's Manual"
.\" posix_spawnattr_getpgroup, posix_spawnattr_setpgroup
.SH NAME
posix_spawnattr_getpgroup, posix_spawnattr_setpgroup \- get/set process group attribute
.SH SYNOPSIS
.nf
.B #include <spawn.h>

.BI "int posix_spawnattr_getpgroup(const posix_spawnattr_t *" attrp ,
.BI "       pid_t *" pgroup);

.BI "int posix_spawnattr_setsigmask(posix_spawnattr_t *" attrp ,
.BI "       pid_t " pgroup);

.fi
.sp
.in -4n
Feature Test Macro Requirements for glibc (see
.BR feature_test_macros (7)):
.in
.sp
.ad l
.BR posix_spawnattr_getpgroup ()
and
.BR posix_spawnattr_setpgroup ():
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
One of these actions is the setting of the process group in the child process.
By default, the process group of the spawned child process will be the same as that of the parent process.
If the calling process has set the
.B POSIX_SPAWN_SETPGROUP
flag, using
.BR posix_spawnattr_setflags (),
then the signal mask will be set according to the value of the
.I spawn-pgroup
element in the
.I posix_spawnattr_t
structure.
This element is set by calling
.BR posix_spawnattr_setpgroup ().
The programmer passes a
.I pid_t
value to the function.
If the value is 0, then the child process will be placed in a new process
group having the same ID as the PID of the child process.
Otherwise, the child will have its process group ID set to the value passed in the
.I spawn-pgroup
element in the
.I posix_spawnattr_t
structure.
.LP
To retrieve the value of the
.I spawn-pgroup
element in the
.I posix_spawnattr_t
structure,
use
.BR posix_spawnattr_getpgroup ().
.SH RETURN VALUE
.LP
.BR posix_spawnattr_setpgroup ()
and
.BR posix_spawnattr_getpgroup ()
always return 0 on Linux/Glibc systems.
.SH ERRORS
.LP
.BR Posix_spawnattr_setpgroup ()
and
.BR posix_spawnattr_getpgroup ()
return no errors on Linux/Glibc systems,
other than the possible error when the system is not configured to support the
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
