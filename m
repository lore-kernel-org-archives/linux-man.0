From: bill o gallmeister <bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: For review: posix_spawn_file_actions_init.3
Date: Fri, 25 Sep 2009 10:09:05 -0700
Message-ID: <4ABCF931.3000307@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This man page replaces the equivalent 3p POSIX boilerplate pages currently being shipped.  For your review and comment.

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
.TH "POSIX_SPAWN_FILE_ACTIONS_INIT" 3 2009-09-22 "GNU" "Linux Programmer's Manual"
.\" posix_spawn_file_actions_init, posix_spawn_file_actions_destroy
.SH NAME
posix_spawn_file_actions_init, posix_spawn_file_actions_destroy \- Initialize and tear down POSIX spawn file action vectors.
.SH SYNOPSIS
.nf
.B #include <spawn.h>

.BI "int posix_spawn_file_actions_init(
.BI "                posix_spawn_file_actions_t *" file_actions );

.BI "int posix_spawn_file_actions_destroy(
.BI "                posix_spawn_file_actions_t *" file_actions );

.fi
.sp
.in -4n
Feature Test Macro Requirements for glibc (see
.BR feature_test_macros (7)):
.in
.sp
.ad l
.BR posix_spawn_file_actions_init ()
and
.BR posix_spawn_file_actions_destroy ():
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
.BR open ,
.BR close ,
and
.BR dup2
operations to this object using
.BR posix_spawn_file_actions_addopen (),
.BR posix_spawn_file_actions_addclose (),
and
.BR posix_spawn_file_actions_adddup2 ().
These calls are documented in the relevant manual pages.
Before any of these calls can be made, you must initialize the
.I posix_spawn_file_actions_t
by calling
.BR posix_spawn_file_actions_init ().
Once
.BR posix_spawn ()
has been called and the programmer is done with the
.I posix_spawn_file_actions_t
object, it should be deinitialized using
.BR posix_spawn_file_actions_destroy ().
Thereafter, the program should not reference the
.I posix_spwn_file_actions_t .
.SH RETURN VALUE
.LP
The glibc implementations of these functions return 0.
.SH ERRORS
In the glibc implementation, these functions do not return errors other than the following possibility:
.TP
.B ENOSYS
This function is not supported.
.SH CONFORMING TO
.LP
POSIX.1-2004.
.SH SEE ALSO
.LP
.BR posix_spawn (3),
.BR posix_spawn_file_actions_addclose (3),
.BR posix_spawn_file_actions_adddup2 (3),
.BR posix_spawn_file_actions_addopen (3),
.BR <spawn.h>,
Base Definitions volume of POSIX.1-2001,
.I http://www.opengroup.org/unix/online.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
