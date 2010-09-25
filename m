From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: for review: posix_spawn(3)
Date: Sat, 25 Sep 2010 07:58:47 +0200
Message-ID: <4C9D8F97.8080108@gmail.com>
References: <4AB9B6F8.4020204@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4AB9B6F8.4020204-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bill o gallmeister <bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Bill,

Thanks for all of the pages, and sorry for the long delay in following up.

I'll make comments inline below. Many of these are general comments that apply to all of the pages.

On 09/23/2009 07:49 AM, bill o gallmeister wrote:
> I have the rest of posix_spawn* to send along, but thought I'd get feedback on this page before sending the rest.
> 
> - bog
> 
> .\" Copyright (c) 2009 Bill O. Gallmeister (bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org)
> .\"
> .\" Permission is granted to make and distribute verbatim copies of this
> .\" manual provided the copyright notice and this permission notice are
> .\" preserved on all copies.
> .\"
> .\" Permission is granted to copy and distribute modified versions of this
> .\" manual under the conditions for verbatim copying, provided that the
> .\" entire resulting derived work is distributed under the terms of a
> .\" permission notice identical to this one.
> .\"
> .\" Since the Linux kernel and libraries are constantly changing, this
> .\" manual page may be incorrect or out-of-date.  The author(s) assume no
> .\" responsibility for errors or omissions, or for damages resulting from
> .\" the use of the information contained herein.  The author(s) may not
> .\" have taken the same level of care in the production of this manual,
> .\" which is licensed free of charge, as they might when working
> .\" professionally.
> .\"
> .\" Formatted or processed versions of this manual, if unaccompanied by
> .\" the source, must acknowledge the copyright and authors of this work.
> .\"
> .\" References consulted:
> .\"     Linux glibc source code
> .\"     POSIX 1003.1-2004 documentation (http://www.opengroup.org/onlinepubs/009695399)
> .\"
> .TH "POSIX_SPAWN" 3 2009-09-22 "GNU" "Linux Programmer's Manual"
> .\" posix_spawn

This line isn't needed.

> .SH NAME
> posix_spawn, posix_spawnp \- spawn a process
> .SH SYNOPSIS
> .nf
> .B #include <spawn.h>
> 
> .BI "int posix_spawn(pid_t *" pid ", const char *" path ,
> .BI "                const posix_spawn_file_actions_t *" file_actions ,
> .BI "                const posix_spawnattr_t *" attrp ,
> .BI "                char *const " argv[] ", char *const " envp[] );
> 
> .BI "int posix_spawnp(pid_t *" pid ", const char *" file ,
> .BI "                const posix_spawn_file_actions_t *" file_actions ,
> .BI "                const posix_spawnattr_t *" attrp ,
> .BI "                char *const " argv[] ", char *const " envp[] );
> .fi
> .sp
> .in -4n
> Feature Test Macro Requirements for glibc (see
> .BR feature_test_macros (7)):
> .in
> .sp
> .ad l
> .BR posix_spawn ()
> and
> .BR posix_spawnp ():
> (_POSIX_C_SOURCE\ >=\ 200112L)\ &&\ (_POSIX_SPAWN)
> .ad b

Where did you derive the FTM requirements? As far as I can tell, no FTMs are required. (It seems logical that there might be some FTM requirements, but it looks like glibc has none.)


> .SH DESCRIPTION
> .BR Posix_spawn ()
> and
> .BR posix_spawnp ()

I try to avoid changing the case of identifiers. Better to write "The xxxxx function(s)...", or simply not capitalize.

> are used to create a new child process from the specified
> process image.  Think of these functions as a combined
> .BR fork ()/ exec ().

References to other pages should always include the section number.

> This page documents the behavior of the GNU/Linux implementations of these functions.

This last sentence can be assumed, so I removed it.

Best to avoid source lines that go over about 75 characters. Makes later patches easier to read, and avoids word-wrap problems in patches sent by some mailers.

> .LP
> .BR Posix_spawn ()
> and
> .BR posix_spawnp ()
> are not meant to replace
> .BR fork ()
> and
> .BR exec ().
> In fact, these functions provide only a subset of the functionality that can be achieved by
> using the more common system calls.
> These functions were specified by POSIX provide the standardized capability
> to create new processes on machines that lack the capability
> to support the
> .BR fork ()
> system call.
> These machines are generally small, embedded systems lacking MMU support.
> .SH DESCRIPTION

You've accidentally made two DESCRIPTION sections. I've reworked the text here.

> .BR Posix_spawn ()
> and
> .BR posix_spawnp ()
> provide the functionality of a combined
> .BR fork ()
> and
> .BR exec (),
> with some optional housekeeping steps in the child process before the
> .BR exec ().

About here is a good spot to explain the difference between posix_spawn() and posix_spawnp(). You do that lower down, but I think it's better to have that description here.

And I think it would be also worth introducing all of the arguments to these functions here. 

> These functions will be described
> in terms of a three step process:  the fork step, the pre-exec step, and the exec step.

"three-step"

Avoid double spaces in the source. (Or, maybe you know more than me about *roff formatting, in which case, let me know I'm wrong ;-).)

> .SS FORK step
> Each function executes a
> .BR fork (),
> or possibly a
> .BR vfork ()
> (more on
> .BR vfork ()
> below).
> In the parent, the
> .I pid
> argument is dereferenced and the pid of the child is stored there.  The parent then returns from

"PID"

Please start new sentences on new source lines. My rationale is that subsequent patches make changes at the sentence level, so the patches are easier to read if sentences start on new lines.

> the
> .BR spawn ()
> function.
> .BR Wait (),
> .BR wait3 (),
> or
> .BR waitpid ()
> can be used to check the status of the child process after this point.  If the child fails
> in any of its housekeeping or fails to execute the desired file, the child will exit with the exit value of 127.
> .IP "WHEN IS VFORK USED?" 2
> .BR vfork ()
> is used instead of
> .BR fork ()
> when:
> .IP *
> the
> .I spawn-flags
> element of *attrp contains the value POSIX_SPAWN_USEVFORK and does \fInot\fP

Format expressions and identifiers with .I, and constants with .B

> contain
> POSIX_SPAWN_SETSIGMASK,
> POSIX_SPAWN_SETSIGDEF,
> POSIX_SPAWN_SETSCHEDPARAM,
> POSIX_SPAWN_SETSCHEDULER,
> POSIX_SPAWN_SETPGROUP, or
> POSIX_SPAWN_RESETIDS.
> .IP *
> .I file_actions
> is NULL.

The above description isn't consistent with the glibc (2.12) source:

  /* Generate the new process.  */
  if ((flags & POSIX_SPAWN_USEVFORK) != 0
      /* If no major work is done, allow using vfork.  Note that we
         might perform the path searching.  But this would be done by
         a call to execvp(), too, and such a call must be OK according
         to POSIX.  */
      || ((flags & (POSIX_SPAWN_SETSIGMASK | POSIX_SPAWN_SETSIGDEF
                    | POSIX_SPAWN_SETSCHEDPARAM | POSIX_SPAWN_SETSCHEDULER
                    | POSIX_SPAWN_SETPGROUP | POSIX_SPAWN_RESETIDS)) == 0
          && file_actions == NULL))
    new_pid = __vfork ();
  else
    new_pid = __fork ();

> .LP
> In essence,
> .BR vfork ()
> is used only if the caller requests it,
> and if there is no cleanup expected in the child before it
> .BR execs
> the requested file.
> 
> .SS PRE-EXEC STEP: GENERAL PROCESSING
> In between the
> .BR fork ()
> and the
> .BR exec (),
> a child process has a certain set of hosekeeping operations it may need to perform.
> .BR Posix_spawn ()
> and
> .BR posix_spawnp ()
> support a small, well-defined set of system tasks that the child
> process can accomplish before it executes the executable file.  These operations are controlled by the
> attributes structure pointed to by attrp, as well as the vector
> .I file_actions.
> In the child, processing is done in the following sequence:
> .IP 1. 5
> General processing:  signal mask, signal default handlers, scheduling algorithm and parameters,
> process group, UID and GID
> are changed as specified by the
> .I attrp
> argument.
> .IP 2. 5
> File actions, as specified in the
> .I file_actions
> argument, are performed in order, starting with
> .I file_actions[0]
> and continuing to the end of the list.
> .IP 3. 5
> Files with the FD_CLOEXEC flag are closed.

"File descriptors..."

Use .B with macro constants (except "NULL").

> .LP
> The general processing operations are:
> .IP * 2
> set signal mask and default actions.
> .IP *
> set effective group and user ID
> .IP *
> set process group
> .IP *
> set scheduling algorithm and/or scheduling parameters (if POSIX_PROCESS_SCHEDULING is in effect)
> .IP *
> a sequence of
> .BR open (),
> .BR close (),
> and
> .BR dup2 ()
> actions
> .LP
> In addition, standard operations that occur on
> .BR fork ()
> and
> .BR exec (),
> can also be expected to occur, including:
> closing of files based on the FD_CLOEXEC flag.

> effect on threads in the forked process (including
> .BR pthread_atfork ()).

Stray text? (I think I know what you wanted to say here, and I've added a piece to cover it. See below.)

> .LP
> The housekeeping activities in the child are controlled by the object pointed to by
> .I attrp
> (for non-file actions), and by the array of
> .I file_actions
> (described in the section following this one).
> In POSIX parlance, these objects are not referred to as structures, and their elements are not specified by name.

POSIX calls these "[attribute] objects", not "structures", AFAICS, so I amended the text.

> For portable coding, you should initialize and set values in these structures only using the POSIX-specified functions.

"using only" (my copyeditor beat me up over this one repeatedly...)

> .LP
> Based on the
> .I spawn-flags
> specified in the structure pointed to by
> .I attrp,
> the child process can:
> .IP [POSIX_SPAWN_SETSIGMASK] 2
> Set its signal mask as if using
> .BI sigprocmask( SIG_SETMASK )
> and the signal set specified in
> the
> .I spawn-sigmask
> element.
> .IP [POSIX_SPAWN_SETSIGDEF]
> Reset the handler for all signals specified in
> the
> .I spawn-sigdefault
> element back to default state.
> .IP [POSIX_SPAWN_SETSCHEDPARAM]
> Set the scheduling parameters (POSIX_PRIORITY_SCHEDULING only)
> to the parameters specified in the
> .I spawn-schedparam
> element.
> .IP [POSIX_SPAWN_SETSCHEDULER]
> Set the scheduling algorithm and parameters according to
> the
> .I spawn-schedpolicy
> element of
> .I *attrp
> (If
> .I POSIX_SPAWN_SETSCHEDPARAM
> is also set, then the scheduling parameters are set according to the corresponding element;
> otherwise, the effect is as if a NULL was passed as the
> .I param
> argument to
> .BR sched_setscheduler ()).

I've filed a bug about the behavior here, since glibc also seems not to conform with POSIX. See below.

> .IP [POSIX_SPAWN_RESETIDS]
> Set the effective UID and GID to the real UID and GID of the parent process.
> If this flag is not set, then the child gets the effective UID and GID of the parent.
> In either case, the setuid and setgid bits of the executable file themselves take precedence.
> .IP [POSIX_SPAWN_SETPGROUP]
> Set the process group to the value specified in
> the
> .I spawn-pgroup
> element
> .LP
> If any of these actions fails (due to bogus values being passed or other reasons why signal handling,
> process scheduling, and process ID functions might fail), the child process exits with exit value 127.
> .LP
> To set these flags, use
> .BR posix_spawnattr_init ()
> and
> .BR posix_spawnattr_setflags ().
> Additionally, you should call
> .BR posix_spawnattr_destroy ()
> when you are done with the structure
> pointed to by
> .I attrp.
> The POSIX standard tells you to call
> this function to de-initialize the structure pointed to by attrp when you are done with it;
> however, on Linux systems this operation is a no-op.
> .LP
> To set the various elements in the
> .I posix_spawnattr_t
> object, use:
> .IP \fIspawn-sigmask\fP 2
> .BR posix_spawnattr_setsigmask ()
> .IP \fIspawn-sigdefault\fP
> .BR posix_spawnattr_setsigdefault ()
> .IP \fIspawn-schedpolicy\fP
> .BR posix_spawnattr_setschedpolicy ()
> .IP \fIspawn-schedparam\fP
> .BR posix_spawnattr_setschedparam ()
> .IP \fIspawn-pgroup\fP
> .BR posix_spawnattr_setproup ()
> .LP
> There are "get" variants of all of the above functions as well.
> .SS PRE-EXEC STEP: FILE PROCESSING
> The argument
> .I file_actions
> specifies a sequence of file operations which are performed in the child process after
> the general processing described above, and before it
> .I execs .
> If
> .I file_actions
> is NULL, then no special action is taken, and standard
> .BR exec ()
> sematics apply--files open before the exec remain open in the new process, except those
> for which the FD_CLOEXEC flag has been set.  File locks remain in place.
> .LP
> If
> .I file_actions
> is not NULL, then
> it contains an ordered set of requests to
> .BR open (),
> .BR close (),
> and
> .BR dup2 ()
> files.
> These requests are added to the
> .I file_actions
> by
> .BR posix_spawn_file_actions_addopen (),
> .BR posix_spawn_file_actions_addclose (),
> and
> .BR posix_spawn_file_actions_adddup2 ().
> The requested operations are performed in the order they were added to
> .I file_actions .
> Note that you can specify file descriptors in
> .I posix_spawn_file_actions_adddup2 ()
> which would not be usable if you called
> .BR dup2 ()
> at that time--I.E. file descriptors that are opened or closed by the earlier operations
> added to
> .I file_actions .
> .SS EXEC Step
> Once the child has successfully forked and performed all requested pre-exec steps,
> the child runs the requested executable.
> .LP
> .BR Posix_spawn ()
> requires the user to specify the full path of the file to be executed, similar to
> .BR execl ().
> .BR Posix_spawnp ()
> allows the user to specify an executable file name, and uses the PATH environment variable

Use .B for environment variable names.

> to look up the executable program, like
> .BR execlp ().
> Other than that, the two functions are identical.
> .LP
> The child process takes its environment from the
> .I envp
> argument,
> which is interpreted as if it had been passed to
> .BR execle ().
> The arguments to the created process come from the
> .I argv
> argument, which is processed as for any of the
> .BR exec ()
> family.
> .SH RETURN VALUE
> .LP
> Upon successful completion,
> .BR posix_spawn ()
> and
> .BR posix_spawnp ()
> set the PID of the child process in
> .I pid,
> and return 0.
> If there is an error before (or in the process of) the
> .BR fork (),
> then no child is created, and these functions return an error value as
> described below.
> .LP
> If the parent is able to successfully
> .BR fork ()
> the child, but the child fails to perform any of the requested
> actions prior to
> .BR exec (),
> or if the
> .BR exec ()
> itself fails,
> then the child will exit with status 127.
> .SH ERRORS
> .LP
> .BR posix_spawn ()
> and
> .BR posix_spawnp ()
> fail only in the case where the underlying
> .BR fork ()
> or
> .BR vfork ()
> call fail;  in these cases, the error return will be the errno value set by
> .BR fork ()
> or
> .BR vfork ().
> .LP
> If the child process is successfully forked, then
> .BR posix_spawn ()
> and
> .BR posix_spawnp ()
> both return success.  However, the child process may still fail for a plethora of reasons related to its
> pre-\fBexec\fR() initialization.
> In all of these cases, the child process will exit with the exit value of 127.
> .LP
> In addition,
> these functions fail if:
> .TP
> .B ENOSYS
> Function not supported on this system.
> .SH NOTES
> POSIX does not specify the names of any internal elements within the
> .I posix_spawnattr_t
> structure;  in fact, it does not specify that it is a structure at all.
> Portable programs should refrain from directly referencing fields within this
> structure.  In these man pages we refer to the internal parts of the
> .I posix_spawnattr_t
> as elements.

Here we can add a VERSIONS section noting that the functions are available since glibc 2.2.

> .SH CONFORMING TO
> .LP
> POSIX.1-2004.

I tend to indicate things in terms of the main POSIX releases (2001 and 2008), rather than the TCs. I changed this to 2001, and added a reference to POSIX.1-2008 as well.

Here is maybe also a good place to note that the POSIX_SPAWN_USEVFORK flag is GNU specific and that the _GNU_SOURCE FTM is required to expose it.

> .SH SEE ALSO
> .LP
> .BR close (2),
> .BR dup2 (2),
> .BR execl (2),
> .BR execlp (2),
> .BR fork (2),
> .BR open (2),
> .BR sched_setparam (2),
> .BR sched_setscheduler (2),
> .BR setpgid (2),
> .BR setuid (2),
> .BR sigaction (2),
> .BR sigprocask (2),
> .BR posix_spawnattr_destroy (3),
> .BR posix_spawnattr_getflags (3),
> .BR posix_spawnattr_getpgroup (3),
> .BR posix_spawnattr_getschedparam (3),
> .BR posix_spawnattr_getschedpolicy (3),
> .BR posix_spawnattr_getsigdefault (3),
> .BR posix_spawnattr_getsigmask (3),
> .BR posix_spawnattr_init (3),
> .BR posix_spawnattr_setflags (3),
> .BR posix_spawnattr_setpgroup (3),
> .BR posix_spawnattr_setschedparam (3),
> .BR posix_spawnattr_setschedpolicy (3),
> .BR posix_spawnattr_setsigdefault (3),
> .BR posix_spawnattr_setsigmask (3),
> .BR posix_spawn_file_actions_addclose (3),
> .BR posix_spawn_file_actions_adddup2 (3),
> .BR posix_spawn_file_actions_addopen (3),
> .BR posix_spawn_file_actions_destroy (3),
> .BR posix_spawn_file_actions_init (3),
> .BR pthread_atfork (3),
> .BR <spawn.h>,
> Base Definitions volume of POSIX.1-2004,
> .I http://www.opengroup.org/unix/online.html

I didn't note it above, but there were a few places where information was duplicated, and the order could be improved. I also generally got interested in this function, and so added quite a few pieces of text and an example program, and rewrote several passages. Below is the current draft (still incomplete). Could you take a look?

Thanks,

Michael

.\" Copyright (c) 2009 Bill O. Gallmeister (bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org)
.\" and Copyright 2010 Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
.\"     POSIX 1003.1-2004 documentation
.\"     (http://www.opengroup.org/onlinepubs/009695399)
.\"
.TH "POSIX_SPAWN" 3 2009-09-22 "GNU" "Linux Programmer's Manual"
.SH NAME
posix_spawn, posix_spawnp \- spawn a process
.SH SYNOPSIS
.nf
.B #include <spawn.h>

.BI "int posix_spawn(pid_t *" pid ", const char *" path ,
.BI "                const posix_spawn_file_actions_t *" file_actions ,
.BI "                const posix_spawnattr_t *" attrp ,
.BI "                char *const " argv[] ", char *const " envp[] );

.BI "int posix_spawnp(pid_t *" pid ", const char *" file ,
.BI "                const posix_spawn_file_actions_t *" file_actions ,
.BI "                const posix_spawnattr_t *" attrp ,
.BI "                char *const " argv[] ", char *const " envp[] );
.fi
.SH DESCRIPTION
The
.BR posix_spawn ()
and
.BR posix_spawnp ()
functions are used to create a new child process that executes
a specified file.
These functions were specified by POSIX to provide a standardized method
of creating new processes on machines that lack the capability
to support the
.BR fork ()
system call.
These machines are generally small, embedded systems lacking MMU support.

The
.BR posix_spawn ()
and
.BR posix_spawnp ()
functions provide the functionality of a combined
.BR fork (2)
and
.BR exec (3),
with some optional housekeeping steps in the child process before the
.BR exec (3).
These functions are not meant to replace the
.BR fork (2)
and
.BR exec (2)
system calls.
In fact, they provide only a subset of the functionality
that can be achieved by using the system calls.

The only difference between
.BR posix_spawn ()
and
.BR posix_spawnp ()
is the manner in which they specify the file to be executed by
the child process.
With
.BR posix_spawn (),
the executable file is specified as a pathname
(which can be absolute or relative).
With
.BR posix_spawnp (),
the executable file is specified as a simple filename;
the system searches for this file in the list of directories specified by
.BR PATH
(in the same way as for
.BR execvp (3)).
For the remainder of this page, the discussion is phrased in terms of
.BR posix_spawn (),
with the understanding that
.BR posix_spawn ()
differs only on the point just described.

The remaining arguments to these two functions are as follows:
.IP * 3
The
.I pid
argument points to a buffer that is used to return the process ID
of the new child process.
.IP *
The
.I file_actions
argument points to a
.I "spawn file actions object"
that specifies file-related actions to be performed in the child
between the
.BR fork (2)
and
.BR exec (3)
steps.
This object is initialized and populated before the
.BR posix_spawn ()
call using
.BR posix_spawn_file_actions_init (3)
and the
.BR posix_spawn_file_actions_* ()
functions.
.IP *
The
.I attrp
argument points to an
.I attributes objects
that specifies various attributes of the created child process.
This object is initialized and populated before the
.BR posix_spawn ()
call using
.BR posix_spawnattr_init (3)
and the
.BR posix_spawnattr_* ()
functions.
.IP *
The
.I argv
and
.I envp
arguments specify the argument list and environment for the program
that is executed in the child process, as for
.BR execve (2).
.PP
Below, the functions are described in terms of a three-step process: the
.BR fork()
step, the
.RB pre- exec ()
step (executed in the child),
and the
.BR exec ()
step (executed in the child).
.SS fork() step
The
.BR posix_spawn ()
function commences by calling
.BR fork (2),
or possibly
.BR vfork (2)
(see below).

The PID of the new child process is placed in
.IR *pid .
The
.BR posix_spawn ()
function then returns control to the parent process.

Subsequently, the parent can use one of the system calls described in
.BR wait (2)
to check the status of the child process.
If the child fails in any of the housekeeping steps described below,
or fails to execute the desired file,
it exits with a status of 127.

The child process is created using
.BR vfork (2)
instead of
.BR fork (2)
when either of the following is true:
.IP * 3
the
.I spawn-flags
element of the attributes object pointed to by
.I attrp
contains the GNU-specific flag
.BR POSIX_SPAWN_USEVFORK ;
or
.IP *
.I file_actions
is NULL and the
.I spawn-flags
element of the attributes object pointed to by
.I attrp
does \fInot\fP contain
.BR POSIX_SPAWN_SETSIGMASK ,
.BR POSIX_SPAWN_SETSIGDEF ,
.BR POSIX_SPAWN_SETSCHEDPARAM ,
.BR POSIX_SPAWN_SETSCHEDULER ,
.BR POSIX_SPAWN_SETPGROUP ,
or
.BR POSIX_SPAWN_RESETIDS .
.LP
In other words,
.BR vfork (2)
is used if the caller requests it,
or if there is no cleanup expected in the child before it
.BR exec (3)s
the requested file.

.SS pre-exec() step: housekeeping
In between the
.BR fork (2)
and the
.BR exec (3),
a child process may need to perform a set of housekeeping actions.
The
.BR posix_spawn ()
and
.BR posix_spawnp ()
functions support a small, well-defined set of system tasks that the child
process can accomplish before it executes the executable file.
These operations are controlled by the attributes object pointed to by
.IR attrp 
and the file actions object pointed to by
.I file_actions.
In the child, processing is done in the following sequence:
.IP 1. 3
Process attribute actions: signal mask, signal default handlers,
scheduling algorithm and parameters,
process group, and effective user and group IDs
are changed as specified by the attributes object pointed to by
.IR attrp .
.IP 2.
File actions, as specified in the
.I file_actions
argument,
are performed in the order that they were specified using calls to the
.BR posix_spawn_file_actions_add* ()
functions.
.IP 3.
File descriptors with the
.B FD_CLOEXEC
flag set are closed.
.LP
All process attributes in the child,
other than those affected by attributes specified in the
object pointed to by
.IR attrp
and the file actions in the object pointed to by
.IR file_actions ,
will be affected as though the child was created with
.BR fork (2)
and it executed the program with
.BR execve (2).

The process attributes actions are defined by the attributes object
pointed to by
.IR attrp .
The
.I spawn-flags
attribute (set using
.BR posix_spawnattr_setflags (3))
controls the general actions that occur,
and other attributes in the object specify values
to be used during those actions.
.LP 
The effects of the flags that may be specified in
.IR spawn-flags
are as follows:
.TP 8
.B POSIX_SPAWN_SETSIGMASK
Set the signal mask to the signal set specified in the
.I spawn-sigmask
attribute (see
.BR posix_spawnattr_setsigmask (3))
of the object pointed to by
.IR attrp .
If the
.B POSIX_SPAWN_SETSIGMASK
flag is not set, then the child inherits the parent's signal mask.
.TP
.B POSIX_SPAWN_SETSIGDEF
Reset the disposition of all signals in the set specified in the
.I spawn-sigdefault
attribute (see
.BR posix_spawnattr_setsigdefault (3))
of the object pointed to by
.IR attrp
to the default.
For the treatment of the dispositions of signals not specified in the
.I spawn-sigdefault
attribute, or the treatment when 
.B POSIX_SPAWN_SETSIGDEF
is not specified, see
.BR execve (2).
.TP
.B POSIX_SPAWN_SETSCHEDPARAM
.\" (POSIX_PRIORITY_SCHEDULING only)
If this flag is set, and the
.B POSIX_SPAWN_SETSCHEDULER
flag is not set, then set the scheduling parameters
to the parameters specified in the
.I spawn-schedparam
attribute (see
.BR posix_spawnattr_setschedparam (3))
of the object pointed to by
.IR attrp .
.TP
.B POSIX_SPAWN_SETSCHEDULER
Set the scheduling policy algorithm and parameters of the child,
as follows:
.RS
.IP * 3
The scheduling policy is set to the value specified in the
.I spawn-schedpolicy
attribute (see
.BR posix_spawnattr_setpolicy (3))
of the object pointed to by
.IR attrp .
.\" The following looks like a glibc bug, since POSIX says
.\" POSIX_SPAWN_SETSCHEDPARAM is ignored when POSIX_SPAWN_SETSCHEDULER
.\" is specified
.\" I filed http://sourceware.org/bugzilla/show_bug.cgi?id=12052
.\" Depending on the outcome, the following section may need to be
.\" rewritten and a description of the current behavior added under BUGS.
.IP *
If the
.B POSIX_SPAWN_SETSCHEDPARAM
flag is also set,
then the scheduling parameters are set to the value specified in the
.I spawn-schedparam
attribute (see
.BR posix_spawnattr_setschedparam (3))
of the object pointed to by
.IR attrp .
If the
.B POSIX_SPAWN_SETSCHEDPARAM
flag is not set, then the housekeeping in the child fails.
.LP
If the
.B POSIX_SPAWN_SETSCHEDPARAM
and
.B POSIX_SPAWN_SETSCHEDPOLICY
flags are not specified,
the child inherits the corresponding scheduling attributes from the parent.
.\" Given a NULL 'param' argument, sched_setscheduler() fails with EINVAL.
.\"
.\" FIXME: The following seems to be misleading
.\" (If
.\" .I POSIX_SPAWN_SETSCHEDPARAM
.\" is also set,
.\" then the scheduling parameters are set according to the corresponding element;
.\" otherwise, the effect is as if a NULL was passed as the
.\" .I param
.\" argument to
.\" .BR sched_setscheduler (2)).
.RE
.TP
.B POSIX_SPAWN_RESETIDS
If this flag is set,
reset the effective UID and GID to the
real UID and GID of the parent process.
If this flag is not set,
then the child retains the effective UID and GID of the parent.
In either case, if the set-user-ID and set-group-ID permission
bits are enabled on the executable file, their effect will override
the setting of the effective UID and GID (se
.BR execve (2)).
.TP
.B POSIX_SPAWN_SETPGROUP
Set the process group to the value specified in the
.I spawn-pgroup
attribute (see
.BR posix_spawnattr_setpgroup (3))
of the object pointed to by
.IR attrp .
If the
.I spawn-pgroup
attribute has the value 0,
the child's process group ID is made the same as its process ID.
If the
.B POSIX_SPAWN_SETPGROUP
flag is not set, the child inherits the parent's process group ID.
.LP
If
.I attrp
is NULL, then the default behaviors described above for each flag apply.
.\" mtk: I think we probably don't want to say the following, since it
.\"      could lead people to do the wrong thing
.\" The POSIX standard tells you to call
.\" this function to de-initialize the attributes object pointed to by
.\" .I attrp
.\" when you are done with it;
.\" however, on Linux systems this operation is a no-op.

The
.I file_actions
argument specifies a sequence of file operations
that are performed in the child process after
the general processing described above, and before it performs the
.BR exec (3).
If
.I file_actions
is NULL, then no special action is taken, and standard
.BR exec (3)
semantics apply--file descriptors open before the exec
remain open in the new process,
except those for which the
.B FD_CLOEXEC
flag has been set.
File locks remain in place.
.LP
If
.I file_actions
is not NULL, then it contains an ordered set of requests to
.BR open (2),
.BR close (2),
and
.BR dup2 (2)
files.
These requests are added to the
.I file_actions
by
.BR posix_spawn_file_actions_addopen (3),
.BR posix_spawn_file_actions_addclose (3),
and
.BR posix_spawn_file_actions_adddup2 (3).
The requested operations are performed in the order they were added to
.IR file_actions .
.\" FIXME I think the following is best placed in the 
.\" posix_spawn_file_actions_adddup2(3) page, and a similar statement is
.\" also needed in posix_spawn_file_actions_addclose(3)
.\" Note that you can specify file descriptors in
.\" .I posix_spawn_file_actions_adddup2 (3)
.\" which would not be usable if you called
.\" .BR dup2 (2)
.\" at that time--i.e., file descriptors that are opened or
.\" closed by the earlier operations
.\" added to
.\" .I file_actions .

If any of the housekeeping actions fails
(due to bogus values being passed or other reasons why signal handling,
process scheduling, process group ID functions,
and file descriptor operations might fail),
the child process exits with exit value 127.
.SS exec() step
Once the child has successfully forked and performed
all requested pre-exec steps,
the child runs the requested executable.
.LP
The child process takes its environment from the
.I envp
argument, which is interpreted as if it had been passed to
.BR execve (2).
The arguments to the created process come from the
.I argv
argument, which is processed as for
.BR execve (2).
.SH RETURN VALUE
Upon successful completion,
.BR posix_spawn ()
and
.BR posix_spawnp ()
place the PID of the child process in
.IR pid ,
and return 0.
If there is an error before or during the
.BR fork (2),
then no child is created,
the contents of
.IR *pid
are unspecified,
and these functions return an error number as described below.

Even when these functions return a success status,
the child process may still fail for a plethora of reasons related to its
pre-\fBexec\fR() initialization.
In addition, the
.BR exec (3)
may fail.
In all of these cases, the child process will exit with the exit value of 127.
.SH ERRORS
The
.BR posix_spawn ()
and
.BR posix_spawnp ()
functions fail only in the case where the underlying
.BR fork (2)
or
.BR vfork (2)
call fails;  in these cases, these functions return an error number,
which will be one of the errors described for
.BR fork (2)
or
.BR vfork (2).
.LP
In addition, these functions fail if:
.TP
.B ENOSYS
Function not supported on this system.
.SH NOTES
The housekeeping activities in the child are controlled by
the objects pointed to by
.I attrp
(for non-file actions) and
.I file_actions
In POSIX parlance, the
.I posix_spawnattr_t
and
.I posix_spawn_file_actions_t
data types are referred to as objects,
and their elements are not specified by name.
Portable programs should initialize these objects using
only the POSIX-specified functions.
(In other words,
although these objects may be implemented as structures containing fields,
portable programs must avoid dependence on such implementation details.)

According to POSIX, it unspecified whether fork handlers established with
.BR pthread_atfork (3)
are called when
.BR posix_spawn (3)
is invoked.
On glibc,
.\" Tested on glibc 2.12
fork handlers are called only if the child is created using
.BR fork (2).
.SH VERSIONS
.\" FIXME all of these pages should have a VERSIONS section
The
.BR posix_spawn ()
and
.BR posix_spawnp ()
functions are available since glibc 2.2.
.SH CONFORMING TO
.LP
POSIX.1-2001, POSIX.1-2008.
.\" FIXME: This piece belongs in pthread_attr_setflags()
The
.B POSIX_SPAWN_USEVFORK
flag is a GNU extension; the
.B _GNU_SOURCE
feature test macro must be defined (before including any header files)
to obtain the definition of this constant.
.SH EXAMPLE
The program below demonstrates the use of various functions in the
POSIX spawn API.
The program accepts command-line attributes that can be used
to create file actions and attributes objects.
The remaining command-line arguments are used as the executable name
and command-line arguments of the program that is executed in the child.

In the first run, the
.BR date (1)
command is executed in the child, and the
.BR posix_spawn ()
call employs no file actions or attributes objects.
.sp
.in +4
.nf
$ \fB./a.out date\fP
PID of child: 7634
Tue Feb  1 19:47:50 CEST 2011
Child status: exited, status=0
.fi
.in
.sp
In the next run, the
.I \-c
command-line option is used to create a file actions object that closes
standard output in the child.
Consequently,
.BR date (1)
fails when trying to perform output and exits with a status of 1.
.sp
.in +4
.nf
$ \fB./a.out -c date\fP
PID of child: 7636
date: write error: Bad file descriptor
Child status: exited, status=1
.fi
.in
.sp
In the next run, the
.I \-s
command-line option is used to create an attributes object that
specifies that all (blockable) signals in the child should be blocked.
Consequently, trying to kill child with the default signal sent by
.BR kill (1)
(i.e.,
.BR SIGTERM )
fails, because that signal is blocked.
Therefore, to kill the child,
.BR SIGKILL
is necessary
.RB ( SIGKILL
can't be blocked).
.sp
.in +4
.nf
$ \fB./a.out -s sleep 60 &\fP
[1] 7637
$ PID of child: 7638

$ \fBkill 7638\fP
$ \fBkill -KILL 7638\fP
$ Child status: killed by signal 9
[1]+  Done                    ./a.out -s sleep 60
.fi
.in
.sp
When we try to execute a nonexistent command in the child, the
.BR exec (3)
fails and the child exits with a status of 127.
.sp
.in +4
.nf
$ \fB./a.out xxxxx
PID of child: 10190
Child status: exited, status=127
.fi
.in
.SS Source code
.nf
#include <spawn.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <wait.h>
#include <errno.h>

#define errExit(msg)    do { perror(msg); \\
                             exit(EXIT_FAILURE); } while (0)

#define errExitEN(en, msg) \\
                        do { errno = en; perror(msg); \\
                             exit(EXIT_FAILURE); } while (0)

char **environ;

int
main(int argc, char *argv[])
{
    pid_t child_pid;
    int s, opt, status;
    sigset_t mask;
    posix_spawnattr_t attr;
    posix_spawnattr_t *attrp;
    posix_spawn_file_actions_t file_actions;
    posix_spawn_file_actions_t *file_actionsp;

    /* Parse command\-line options, which can be used to specify an
       attributes object and file actions object for the child. */

    attrp = NULL;
    file_actionsp = NULL;

    while ((opt = getopt(argc, argv, "sc")) != \-1) {
        switch (opt) {
        case \(aqc\(aq:       /* \-c: close standard output in child */

            /* Create a file actions object and add a "close"
               action to it */

            s = posix_spawn_file_actions_init(&file_actions);
            if (s != 0)
                errExitEN(s, "posix_spawn_file_actions_init");

            s = posix_spawn_file_actions_addclose(&file_actions,
                                                  STDOUT_FILENO);
            if (s != 0)
                errExitEN(s, "posix_spawn_file_actions_addclose");

            file_actionsp = &file_actions;
            break;

        case \(aqs\(aq:       /* \-s: block all signals in child */

            /* Create an attributes object and add a "set signal mask"
               action to it */

            s = posix_spawnattr_init(&attr);
            if (s != 0)
                errExitEN(s, "posix_spawnattr_init");
            s = posix_spawnattr_setflags(&attr, POSIX_SPAWN_SETSIGMASK);
            if (s != 0)
                errExitEN(s, "posix_spawnattr_setflags");

            sigfillset(&mask);
            s = posix_spawnattr_setsigmask(&attr, &mask);
            if (s != 0)
                errExitEN(s, "posix_spawnattr_setsigmask");

            attrp = &attr;
            break;
        }
    }

    /* Spawn the child. The name of the program to execute and the
       command\-line arguments are taken from the command\-line arguments
       of this program. The environment of the program execed in the
       child is made the same as the parent\(aqs environment. */

    s = posix_spawnp(&child_pid, argv[optind], file_actionsp, attrp,
                     &argv[optind], environ);
    if (s != 0)
        errExitEN(s, "posix_spawn");

    /* Destroy any objects that we created earlier */

    if (attrp != NULL) {
        s = posix_spawnattr_destroy(attrp);
        if (s != 0)
            errExitEN(s, "posix_spawnattr_destroy");
    }

    if (file_actionsp != NULL) {
        s = posix_spawn_file_actions_destroy(file_actionsp);
        if (s != 0)
            errExitEN(s, "posix_spawn_file_actions_destroy");
    }

    printf("PID of child: %ld\\n", (long) child_pid);

    /* Monitor status of the child until it terminates */

    do {
        s = waitpid(child_pid, &status, WUNTRACED | WCONTINUED);
        if (s == \-1)
            errExit("waitpid");

        printf("Child status: ");
        if (WIFEXITED(status)) {
            printf("exited, status=%d\\n", WEXITSTATUS(status));
        } else if (WIFSIGNALED(status)) {
            printf("killed by signal %d\\n", WTERMSIG(status));
        } else if (WIFSTOPPED(status)) {
            printf("stopped by signal %d\\n", WSTOPSIG(status));
        } else if (WIFCONTINUED(status)) {
            printf("continued\\n");
        }
    } while (!WIFEXITED(status) && !WIFSIGNALED(status));

    exit(EXIT_SUCCESS);
}
.fi
.SH SEE ALSO
.nh \" Disable hyphenation
.ad l
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
.BR feature_test_macros (7),
.BR <spawn.h>,
Base Definitions volume of POSIX.1-2001,
.I http://www.opengroup.org/unix/online.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
