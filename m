From: bill o gallmeister <bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: for review:  posix_spawnattr_init.3 (replaces 3p POSIX verbiage)
Date: Sat, 26 Sep 2009 11:50:47 -0700
Message-ID: <4ABE6287.7080607@gmail.com>
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
.TH "POSIX_SPAWNATTR_INIT" 3 2009-09-22 "GNU" "Linux Programmer's Manual"
.\" posix_spawnattr_init, posix_spawnattr_destroy
.SH NAME
posix_spawnattr_init, posix_spawnattr_destroy \- initialize/destroy POSIX spawnattr objects
.SH SYNOPSIS
.nf
.B #include <spawn.h>

.BI "int posix_spawnattr_init(posix_spawnattr_t *" attrp );

.BI "int posix_spawnattr_destroy(posix_spawnattr_t *" attrp );

.fi
.sp
.in -4n
Feature Test Macro Requirements for glibc (see
.BR feature_test_macros (7)):
.in
.sp
.ad l
.BR posix_spawnattr_init ()
and
.BR posix_spawnattr_destroy ():
(_POSIX_C_SOURCE\ >=\ 200112L)\ &&\ (_POSIX_SPAWN)
.ad b

.SH DESCRIPTION
.BR Posix_spawn ()
and
.BR posix_spawnp ()
are used to create a new child process from the specified
process image.  Think of these functions as a combined
.BR fork ()/ exec ().
As part of calling these functions, te programmer can specify actions to be taken in the newly-created
child process by passing a pointer to an appropriately-initialized
.B posix_spawnattr_t
structure.
POSIX requires that the
.B posix_spawnattr_t
structure be initialized by a call to
.BR posix_spawnattr_init ()
before it is populated with desired actions.
POSIX further requires that the
.B posix_spawnattr_t
be cleaned up by a call to
.BR posix_spawnattr_destroy ()
after its use in
.BR posix_spawn ()
or
.BR posix_spawnp ().
.LP
Once initialized, the programmer can specify actions to be taken in the child process when
.BR posix_spawn ()
or
.BR posix_spawnp ()
are called, by setting various elements in the
.BR posix_spawnattr_t :
.IP "Setting the signal mask:" 2
Use
.BR posix_spawnattr_setsigmask ()
to set the
.I spawn-sigmask
element, which will be used to set the signal mask in the child process.
.IP "Setting the signal actions to their defaults:" 2
Use
.BR posix_spawnattr_setsigdefault ()
to set the
.I spawn-sigdefault
element, which indicates which signal handlers to set back to their defaults in the child process.
.IP "Setting the scheduling policy:" 2
Use
.BR posix_spawnattr_setschedpolicy ()
to set the
.I spawn-schedpolicy
element, which indicates the desired scheduling policy for the child process (only supported if
.B _POSIX_PRIORITY_SCHEDULING
is supported on your system).
.IP "Setting the scheduling parameters:" 2
Use
.BR posix_spawnattr_setschedparam ()
to set the
.I spawn-schedparam
element, which indicates the desired scheduling paramters for the child process (only supported if
.B _POSIX_PRIORITY_SCHEDULING
is supported on your system).
.IP "Setting the process group:" 2
Use
.BR posix_spawnattr_setproup ()
to set the
.I spawn-pgroup
element, which controls the process group setting for the child process.
.SH RETURN VALUE
.LP
.BR posix_spawnattr_init ()
and
.BR posix_spawnattr_destroy ()
always return 0 on Linux/Glibc systems.
.SH ERRORS
.LP
.BR Posix_spawnattr_init ()
and
.BR posix_spawnattr_destroy ()
return no errors on Linux/Glibc systems,
other than the possible error when
.I posix_spawn*
are not supported on the particular system where the functions are executed:
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
.BR posix_spawnattr_getsigmask (3),
.BR posix_spawnattr_init (3),
.BR posix_spawnattr_setflags (3),
.BR posix_spawnattr_setpgroup (3),
.BR posix_spawnattr_setschedparam (3),
.BR posix_spawnattr_setschedpolicy (3),
.BR posix_spawnattr_setsigdefault (3),
.BR posix_spawnattr_setsigmask (3),
.BR posix_spawn_file_actions_addclose (3),
.BR posix_spawn_file_actions_adddup2 (3),
.BR posix_spawn_file_actions_addopen (3),
.BR posix_spawn_file_actions_destroy (3),
.BR posix_spawn_file_actions_init (3),
.BR pthread_atfork (3),
.BR posixoptions (7),
.BR <spawn.h>,
Base Definitions volume of POSIX.1-2004,
.I http://www.opengroup.org/unix/online.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
