From: bill o gallmeister <bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: for review:  man3/posix_spawn_file_actions_addopen.3 (replaces 3p
 POSIX verbiage)
Date: Sat, 26 Sep 2009 11:43:30 -0700
Message-ID: <4ABE60D2.3080206@gmail.com>
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
.\"     Linux libc source code
.\"     POSIX 1003.1-2004 documentation (http://www.opengroup.org/onlinepubs/009695399)
.\"
.TH "POSIX_SPAWN_FILE_ACTIONS_ADDOPEN" 3 2009-09-22 "GNU" "Linux Programmer's Manual"
.\" posix_spawn_file_actions_addopen, posix_spawn_file_actions_addclose, posix_spawn_file_actions_adddup2
.SH NAME
posix_spawn_file_actions_addopen, posix_spawn_file_actions_addclose, posix_spawn_file_actions_adddup2 \- Add operations to POSIX spawn file action
vectors.
.SH SYNOPSIS
.nf
.B #include <spawn.h>

.BI "int posix_spawn_file_actions_addopen(posix_spawn_file_actions_t *" file_actions ,
.BI "                int " desired_fd ,
.BI "                char *const " path ", int " oflag ", mode_t " mode );

.BI "int posix_spawn_file_actions_addclose(posix_spawn_file_actions_t *" file_actions ,
.BI "                int " fd );

.BI "int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *" file_actions ,
.BI "                int " orig_fd ", int " new_fd );

.fi
.sp
.in -4n
Feature Test Macro Requirements for glibc (see
.BR feature_test_macros (7)):
.in
.sp
.ad l
.BR posix_spawn_file_actions_addopen "(), " posix_spawn_file_actions_addclose "(), and " posix_spawn_file_actions_adddup2 ():
(_POSIX_C_SOURCE\ >=\ 200112L)\ &&\ (_POSIX_SPAWN)
.ad b

.SH DESCRIPTION
.BR Posix_spawn ()
and
.BR posix_spawnp ()
are used to create a new child process from the specified
process image.  Think of these functions as a combined
.BR fork ()/ exec ().
As part of these operations, the programmer can specify a sequence of file operations using a
.I posix_spawn_file_actions_t
object.
The programmer can add
requests for
.BR open (),
.BR close (),
and
.BR dup2 ()
operations to this object using
.BR posix_spawn_file_actions_addopen (),
.BR posix_spawn_file_actions_addclose (),
and
.BR posix_spawn_file_actions_adddup2 ().
.LP
The
.B posix_spawn_file_actions_t
object is initialized to an empty sequence of operations by the use of
.BR posix_spawn_file_actions_init ().
Then, the programmer can add operations to this sequence using the three functions
described here.
When
.BR posix_spawn ()
or
.BR posix_spawnp ()
are called with the
.B posix_spawn_file_actions_t
sequence, the requested sequence of file actions will be performed in the same order
in which the operations were added to the object.
.SS OPEN Operation
When an operation is added with
.BR posix_spawn_file_actions_addopen ( a , desired_fd , path , oflag , mode )
will result in the file whos ename is given in
.I path
being opened as if by a call to
.BR open ( name , oflag , mode ),
with the resulting file descriptor then being
.BR dup2 ()'ed
to the desired file descriptor value,
.BR desired_fd .
(only the requested file descriptor is left open at the end of this operation;
any other fd opened as a side-effect will be closed).

.SS CLOSE Operation
When an operation is added with
.BR posix_spawn_file_actions_addclose ( a , fd )
will result in the file being closed as if by a call to
.BR close ( fd ).

.SS DUP2 Operation
When an operation is added with
.BR posix_spawn_file_actions_adddup2 ( a , orig_fd , new_fd )
will result in the file descriptor
.B orig_fd
being duplicated to
.B new_fd
as if by a call to
.BR dup2 ( orig_fd , new_fd ).

.LP
In the event of any of the above operations failing when
.BR posix_spawn ()
or
.BR posix_spawnp ()
are called,
the child process created by those functions will exit with exit value 127.
.SH RETURN VALUE
.LP
Upon successful completion, all three of these functions
add the desired operation to the sequence described by
.B file_actions ,
and return 0.
If there is an error,
it will be returned.
.SH ERRORS
.LP
.BR Posix_spawn_file_actions_addopen (),
.BR posix_spawn_file_actions_addclose (),
and
.BR posix_spawn_file_actions_adddup2 ()
may fail under the following circumstances:
.TP
.B EBADF
The specified file descriptor or file descriptors are invalid (negative or greater than or equal to {OPEN_MAX}).
.TP
.B ENOMEM
There is insufficient memory to add the desired operation to
.B file_actions .
.TP
.B ENOSYS
This function is not supported.
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
.BR posix_spawn_file_actions_destroy (3),
.BR posix_spawn_file_actions_init (3),
.BR pthread_atfork (3),
.BR <spawn.h>,
Base Definitions volume of POSIX.1-2004,
.I http://www.opengroup.org/unix/online.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
