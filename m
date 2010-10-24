From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Fwd: for review: posix_spawn(3)
Date: Sun, 24 Oct 2010 16:58:45 +0200
Message-ID: <AANLkTinE6vvU9XWws7E-0sAv=UhjoS_ct7LiGz1fpNxj@mail.gmail.com>
References: <4AB9B6F8.4020204@gmail.com> <4C9D8F97.8080108@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4C9D8F97.8080108-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bill o gallmeister <bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Bill,

Any chance you could take a look at this page; then we could start
pushing it and the rest of the posix_spawn pages towards release.

Thanks,

Michael



---------- Forwarded message ----------
=46rom: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Sat, Sep 25, 2010 at 7:58 AM
Subject: Re: for review: posix_spawn(3)
To: bill o gallmeister <bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


Hello Bill,

Thanks for all of the pages, and sorry for the long delay in following =
up.

I'll make comments inline below. Many of these are general comments
that apply to all of the pages.

On 09/23/2009 07:49 AM, bill o gallmeister wrote:
> I have the rest of posix_spawn* to send along, but thought I'd get fe=
edback on this page before sending the rest.
>
> - bog
>
> .\" Copyright (c) 2009 Bill O. Gallmeister (bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org)
> .\"
> .\" Permission is granted to make and distribute verbatim copies of t=
his
> .\" manual provided the copyright notice and this permission notice a=
re
> .\" preserved on all copies.
> .\"
> .\" Permission is granted to copy and distribute modified versions of=
 this
> .\" manual under the conditions for verbatim copying, provided that t=
he
> .\" entire resulting derived work is distributed under the terms of a
> .\" permission notice identical to this one.
> .\"
> .\" Since the Linux kernel and libraries are constantly changing, thi=
s
> .\" manual page may be incorrect or out-of-date. =A0The author(s) ass=
ume no
> .\" responsibility for errors or omissions, or for damages resulting =
from
> .\" the use of the information contained herein. =A0The author(s) may=
 not
> .\" have taken the same level of care in the production of this manua=
l,
> .\" which is licensed free of charge, as they might when working
> .\" professionally.
> .\"
> .\" Formatted or processed versions of this manual, if unaccompanied =
by
> .\" the source, must acknowledge the copyright and authors of this wo=
rk.
> .\"
> .\" References consulted:
> .\" =A0 =A0 Linux glibc source code
> .\" =A0 =A0 POSIX 1003.1-2004 documentation (http://www.opengroup.org=
/onlinepubs/009695399)
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
> .BI " =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const posix_spawn_file_actions_t=
 *" file_actions ,
> .BI " =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const posix_spawnattr_t *" attrp=
 ,
> .BI " =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0char *const " argv[] ", char *co=
nst " envp[] );
>
> .BI "int posix_spawnp(pid_t *" pid ", const char *" file ,
> .BI " =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const posix_spawn_file_actions_t=
 *" file_actions ,
> .BI " =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const posix_spawnattr_t *" attrp=
 ,
> .BI " =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0char *const " argv[] ", char *co=
nst " envp[] );
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
> (_POSIX_C_SOURCE\ >=3D\ 200112L)\ &&\ (_POSIX_SPAWN)
> .ad b

Where did you derive the FTM requirements? As far as I can tell, no
=46TMs are required. (It seems logical that there might be some FTM
requirements, but it looks like glibc has none.)


> .SH DESCRIPTION
> .BR Posix_spawn ()
> and
> .BR posix_spawnp ()

I try to avoid changing the case of identifiers. Better to write "The
xxxxx function(s)...", or simply not capitalize.

> are used to create a new child process from the specified
> process image. =A0Think of these functions as a combined
> .BR fork ()/ exec ().

References to other pages should always include the section number.

> This page documents the behavior of the GNU/Linux implementations of =
these functions.

This last sentence can be assumed, so I removed it.

Best to avoid source lines that go over about 75 characters. Makes
later patches easier to read, and avoids word-wrap problems in patches
sent by some mailers.

> .LP
> .BR Posix_spawn ()
> and
> .BR posix_spawnp ()
> are not meant to replace
> .BR fork ()
> and
> .BR exec ().
> In fact, these functions provide only a subset of the functionality t=
hat can be achieved by
> using the more common system calls.
> These functions were specified by POSIX provide the standardized capa=
bility
> to create new processes on machines that lack the capability
> to support the
> .BR fork ()
> system call.
> These machines are generally small, embedded systems lacking MMU supp=
ort.
> .SH DESCRIPTION

You've accidentally made two DESCRIPTION sections. I've reworked the te=
xt here.

> .BR Posix_spawn ()
> and
> .BR posix_spawnp ()
> provide the functionality of a combined
> .BR fork ()
> and
> .BR exec (),
> with some optional housekeeping steps in the child process before the
> .BR exec ().

About here is a good spot to explain the difference between
posix_spawn() and posix_spawnp(). You do that lower down, but I think
it's better to have that description here.

And I think it would be also worth introducing all of the arguments to
these functions here.

> These functions will be described
> in terms of a three step process: =A0the fork step, the pre-exec step=
, and the exec step.

"three-step"

Avoid double spaces in the source. (Or, maybe you know more than me
about *roff formatting, in which case, let me know I'm wrong ;-).)

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
> argument is dereferenced and the pid of the child is stored there. =A0=
The parent then returns from

"PID"

Please start new sentences on new source lines. My rationale is that
subsequent patches make changes at the sentence level, so the patches
are easier to read if sentences start on new lines.

> the
> .BR spawn ()
> function.
> .BR Wait (),
> .BR wait3 (),
> or
> .BR waitpid ()
> can be used to check the status of the child process after this point=
=2E =A0If the child fails
> in any of its housekeeping or fails to execute the desired file, the =
child will exit with the exit value of 127.
> .IP "WHEN IS VFORK USED?" 2
> .BR vfork ()
> is used instead of
> .BR fork ()
> when:
> .IP *
> the
> .I spawn-flags
> element of *attrp contains the value POSIX_SPAWN_USEVFORK and does \f=
Inot\fP

=46ormat expressions and identifiers with .I, and constants with .B

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

=A0/* Generate the new process. =A0*/
=A0if ((flags & POSIX_SPAWN_USEVFORK) !=3D 0
=A0 =A0 =A0/* If no major work is done, allow using vfork. =A0Note that=
 we
=A0 =A0 =A0 =A0 might perform the path searching. =A0But this would be =
done by
=A0 =A0 =A0 =A0 a call to execvp(), too, and such a call must be OK acc=
ording
=A0 =A0 =A0 =A0 to POSIX. =A0*/
=A0 =A0 =A0|| ((flags & (POSIX_SPAWN_SETSIGMASK | POSIX_SPAWN_SETSIGDEF
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| POSIX_SPAWN_SETSCHEDPARAM | PO=
SIX_SPAWN_SETSCHEDULER
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| POSIX_SPAWN_SETPGROUP | POSIX_=
SPAWN_RESETIDS)) =3D=3D 0
=A0 =A0 =A0 =A0 =A0&& file_actions =3D=3D NULL))
=A0 =A0new_pid =3D __vfork ();
=A0else
=A0 =A0new_pid =3D __fork ();

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
> a child process has a certain set of hosekeeping operations it may ne=
ed to perform.
> .BR Posix_spawn ()
> and
> .BR posix_spawnp ()
> support a small, well-defined set of system tasks that the child
> process can accomplish before it executes the executable file. =A0The=
se operations are controlled by the
> attributes structure pointed to by attrp, as well as the vector
> .I file_actions.
> In the child, processing is done in the following sequence:
> .IP 1. 5
> General processing: =A0signal mask, signal default handlers, scheduli=
ng algorithm and parameters,
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
> set scheduling algorithm and/or scheduling parameters (if POSIX_PROCE=
SS_SCHEDULING is in effect)
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

Stray text? (I think I know what you wanted to say here, and I've
added a piece to cover it. See below.)

> .LP
> The housekeeping activities in the child are controlled by the object=
 pointed to by
> .I attrp
> (for non-file actions), and by the array of
> .I file_actions
> (described in the section following this one).
> In POSIX parlance, these objects are not referred to as structures, a=
nd their elements are not specified by name.

POSIX calls these "[attribute] objects", not "structures", AFAICS, so
I amended the text.

> For portable coding, you should initialize and set values in these st=
ructures only using the POSIX-specified functions.

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
> is also set, then the scheduling parameters are set according to the =
corresponding element;
> otherwise, the effect is as if a NULL was passed as the
> .I param
> argument to
> .BR sched_setscheduler ()).

I've filed a bug about the behavior here, since glibc also seems not
to conform with POSIX. See below.

> .IP [POSIX_SPAWN_RESETIDS]
> Set the effective UID and GID to the real UID and GID of the parent p=
rocess.
> If this flag is not set, then the child gets the effective UID and GI=
D of the parent.
> In either case, the setuid and setgid bits of the executable file the=
mselves take precedence.
> .IP [POSIX_SPAWN_SETPGROUP]
> Set the process group to the value specified in
> the
> .I spawn-pgroup
> element
> .LP
> If any of these actions fails (due to bogus values being passed or ot=
her reasons why signal handling,
> process scheduling, and process ID functions might fail), the child p=
rocess exits with exit value 127.
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
> this function to de-initialize the structure pointed to by attrp when=
 you are done with it;
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
> specifies a sequence of file operations which are performed in the ch=
ild process after
> the general processing described above, and before it
> .I execs .
> If
> .I file_actions
> is NULL, then no special action is taken, and standard
> .BR exec ()
> sematics apply--files open before the exec remain open in the new pro=
cess, except those
> for which the FD_CLOEXEC flag has been set. =A0File locks remain in p=
lace.
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
> The requested operations are performed in the order they were added t=
o
> .I file_actions .
> Note that you can specify file descriptors in
> .I posix_spawn_file_actions_adddup2 ()
> which would not be usable if you called
> .BR dup2 ()
> at that time--I.E. file descriptors that are opened or closed by the =
earlier operations
> added to
> .I file_actions .
> .SS EXEC Step
> Once the child has successfully forked and performed all requested pr=
e-exec steps,
> the child runs the requested executable.
> .LP
> .BR Posix_spawn ()
> requires the user to specify the full path of the file to be executed=
, similar to
> .BR execl ().
> .BR Posix_spawnp ()
> allows the user to specify an executable file name, and uses the PATH=
 environment variable

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
> then no child is created, and these functions return an error value a=
s
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
> call fail; =A0in these cases, the error return will be the errno valu=
e set by
> .BR fork ()
> or
> .BR vfork ().
> .LP
> If the child process is successfully forked, then
> .BR posix_spawn ()
> and
> .BR posix_spawnp ()
> both return success. =A0However, the child process may still fail for=
 a plethora of reasons related to its
> pre-\fBexec\fR() initialization.
> In all of these cases, the child process will exit with the exit valu=
e of 127.
> .LP
> In addition,
> these functions fail if:
> .TP
> .B ENOSYS
> Function not supported on this system.
> .SH NOTES
> POSIX does not specify the names of any internal elements within the
> .I posix_spawnattr_t
> structure; =A0in fact, it does not specify that it is a structure at =
all.
> Portable programs should refrain from directly referencing fields wit=
hin this
> structure. =A0In these man pages we refer to the internal parts of th=
e
> .I posix_spawnattr_t
> as elements.

Here we can add a VERSIONS section noting that the functions are
available since glibc 2.2.

> .SH CONFORMING TO
> .LP
> POSIX.1-2004.

I tend to indicate things in terms of the main POSIX releases (2001
and 2008), rather than the TCs. I changed this to 2001, and added a
reference to POSIX.1-2008 as well.

Here is maybe also a good place to note that the POSIX_SPAWN_USEVFORK
flag is GNU specific and that the _GNU_SOURCE FTM is required to
expose it.

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

I didn't note it above, but there were a few places where information
was duplicated, and the order could be improved. I also generally got
interested in this function, and so added quite a few pieces of text
and an example program, and rewrote several passages. Below is the
current draft (still incomplete). Could you take a look?

Thanks,

Michael

=2E\" Copyright (c) 2009 Bill O. Gallmeister (bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org)
=2E\" and Copyright 2010 Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
=2E\"
=2E\" Permission is granted to make and distribute verbatim copies of t=
his
=2E\" manual provided the copyright notice and this permission notice a=
re
=2E\" preserved on all copies.
=2E\"
=2E\" Permission is granted to copy and distribute modified versions of=
 this
=2E\" manual under the conditions for verbatim copying, provided that t=
he
=2E\" entire resulting derived work is distributed under the terms of a
=2E\" permission notice identical to this one.
=2E\"
=2E\" Since the Linux kernel and libraries are constantly changing, thi=
s
=2E\" manual page may be incorrect or out-of-date. =A0The author(s) ass=
ume no
=2E\" responsibility for errors or omissions, or for damages resulting =
from
=2E\" the use of the information contained herein. =A0The author(s) may=
 not
=2E\" have taken the same level of care in the production of this manua=
l,
=2E\" which is licensed free of charge, as they might when working
=2E\" professionally.
=2E\"
=2E\" Formatted or processed versions of this manual, if unaccompanied =
by
=2E\" the source, must acknowledge the copyright and authors of this wo=
rk.
=2E\"
=2E\" References consulted:
=2E\" =A0 =A0 Linux glibc source code
=2E\" =A0 =A0 POSIX 1003.1-2004 documentation
=2E\" =A0 =A0 (http://www.opengroup.org/onlinepubs/009695399)
=2E\"
=2ETH "POSIX_SPAWN" 3 2009-09-22 "GNU" "Linux Programmer's Manual"
=2ESH NAME
posix_spawn, posix_spawnp \- spawn a process
=2ESH SYNOPSIS
=2Enf
=2EB #include <spawn.h>

=2EBI "int posix_spawn(pid_t *" pid ", const char *" path ,
=2EBI " =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const posix_spawn_file_actions_t=
 *" file_actions ,
=2EBI " =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const posix_spawnattr_t *" attrp=
 ,
=2EBI " =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0char *const " argv[] ", char *co=
nst " envp[] );

=2EBI "int posix_spawnp(pid_t *" pid ", const char *" file ,
=2EBI " =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const posix_spawn_file_actions_t=
 *" file_actions ,
=2EBI " =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const posix_spawnattr_t *" attrp=
 ,
=2EBI " =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0char *const " argv[] ", char *co=
nst " envp[] );
=2Efi
=2ESH DESCRIPTION
The
=2EBR posix_spawn ()
and
=2EBR posix_spawnp ()
functions are used to create a new child process that executes
a specified file.
These functions were specified by POSIX to provide a standardized metho=
d
of creating new processes on machines that lack the capability
to support the
=2EBR fork ()
system call.
These machines are generally small, embedded systems lacking MMU suppor=
t.

The
=2EBR posix_spawn ()
and
=2EBR posix_spawnp ()
functions provide the functionality of a combined
=2EBR fork (2)
and
=2EBR exec (3),
with some optional housekeeping steps in the child process before the
=2EBR exec (3).
These functions are not meant to replace the
=2EBR fork (2)
and
=2EBR exec (2)
system calls.
In fact, they provide only a subset of the functionality
that can be achieved by using the system calls.

The only difference between
=2EBR posix_spawn ()
and
=2EBR posix_spawnp ()
is the manner in which they specify the file to be executed by
the child process.
With
=2EBR posix_spawn (),
the executable file is specified as a pathname
(which can be absolute or relative).
With
=2EBR posix_spawnp (),
the executable file is specified as a simple filename;
the system searches for this file in the list of directories specified =
by
=2EBR PATH
(in the same way as for
=2EBR execvp (3)).
=46or the remainder of this page, the discussion is phrased in terms of
=2EBR posix_spawn (),
with the understanding that
=2EBR posix_spawn ()
differs only on the point just described.

The remaining arguments to these two functions are as follows:
=2EIP * 3
The
=2EI pid
argument points to a buffer that is used to return the process ID
of the new child process.
=2EIP *
The
=2EI file_actions
argument points to a
=2EI "spawn file actions object"
that specifies file-related actions to be performed in the child
between the
=2EBR fork (2)
and
=2EBR exec (3)
steps.
This object is initialized and populated before the
=2EBR posix_spawn ()
call using
=2EBR posix_spawn_file_actions_init (3)
and the
=2EBR posix_spawn_file_actions_* ()
functions.
=2EIP *
The
=2EI attrp
argument points to an
=2EI attributes objects
that specifies various attributes of the created child process.
This object is initialized and populated before the
=2EBR posix_spawn ()
call using
=2EBR posix_spawnattr_init (3)
and the
=2EBR posix_spawnattr_* ()
functions.
=2EIP *
The
=2EI argv
and
=2EI envp
arguments specify the argument list and environment for the program
that is executed in the child process, as for
=2EBR execve (2).
=2EPP
Below, the functions are described in terms of a three-step process: th=
e
=2EBR fork()
step, the
=2ERB pre- exec ()
step (executed in the child),
and the
=2EBR exec ()
step (executed in the child).
=2ESS fork() step
The
=2EBR posix_spawn ()
function commences by calling
=2EBR fork (2),
or possibly
=2EBR vfork (2)
(see below).

The PID of the new child process is placed in
=2EIR *pid .
The
=2EBR posix_spawn ()
function then returns control to the parent process.

Subsequently, the parent can use one of the system calls described in
=2EBR wait (2)
to check the status of the child process.
If the child fails in any of the housekeeping steps described below,
or fails to execute the desired file,
it exits with a status of 127.

The child process is created using
=2EBR vfork (2)
instead of
=2EBR fork (2)
when either of the following is true:
=2EIP * 3
the
=2EI spawn-flags
element of the attributes object pointed to by
=2EI attrp
contains the GNU-specific flag
=2EBR POSIX_SPAWN_USEVFORK ;
or
=2EIP *
=2EI file_actions
is NULL and the
=2EI spawn-flags
element of the attributes object pointed to by
=2EI attrp
does \fInot\fP contain
=2EBR POSIX_SPAWN_SETSIGMASK ,
=2EBR POSIX_SPAWN_SETSIGDEF ,
=2EBR POSIX_SPAWN_SETSCHEDPARAM ,
=2EBR POSIX_SPAWN_SETSCHEDULER ,
=2EBR POSIX_SPAWN_SETPGROUP ,
or
=2EBR POSIX_SPAWN_RESETIDS .
=2ELP
In other words,
=2EBR vfork (2)
is used if the caller requests it,
or if there is no cleanup expected in the child before it
=2EBR exec (3)s
the requested file.

=2ESS pre-exec() step: housekeeping
In between the
=2EBR fork (2)
and the
=2EBR exec (3),
a child process may need to perform a set of housekeeping actions.
The
=2EBR posix_spawn ()
and
=2EBR posix_spawnp ()
functions support a small, well-defined set of system tasks that the ch=
ild
process can accomplish before it executes the executable file.
These operations are controlled by the attributes object pointed to by
=2EIR attrp
and the file actions object pointed to by
=2EI file_actions.
In the child, processing is done in the following sequence:
=2EIP 1. 3
Process attribute actions: signal mask, signal default handlers,
scheduling algorithm and parameters,
process group, and effective user and group IDs
are changed as specified by the attributes object pointed to by
=2EIR attrp .
=2EIP 2.
=46ile actions, as specified in the
=2EI file_actions
argument,
are performed in the order that they were specified using calls to the
=2EBR posix_spawn_file_actions_add* ()
functions.
=2EIP 3.
=46ile descriptors with the
=2EB FD_CLOEXEC
flag set are closed.
=2ELP
All process attributes in the child,
other than those affected by attributes specified in the
object pointed to by
=2EIR attrp
and the file actions in the object pointed to by
=2EIR file_actions ,
will be affected as though the child was created with
=2EBR fork (2)
and it executed the program with
=2EBR execve (2).

The process attributes actions are defined by the attributes object
pointed to by
=2EIR attrp .
The
=2EI spawn-flags
attribute (set using
=2EBR posix_spawnattr_setflags (3))
controls the general actions that occur,
and other attributes in the object specify values
to be used during those actions.
=2ELP
The effects of the flags that may be specified in
=2EIR spawn-flags
are as follows:
=2ETP 8
=2EB POSIX_SPAWN_SETSIGMASK
Set the signal mask to the signal set specified in the
=2EI spawn-sigmask
attribute (see
=2EBR posix_spawnattr_setsigmask (3))
of the object pointed to by
=2EIR attrp .
If the
=2EB POSIX_SPAWN_SETSIGMASK
flag is not set, then the child inherits the parent's signal mask.
=2ETP
=2EB POSIX_SPAWN_SETSIGDEF
Reset the disposition of all signals in the set specified in the
=2EI spawn-sigdefault
attribute (see
=2EBR posix_spawnattr_setsigdefault (3))
of the object pointed to by
=2EIR attrp
to the default.
=46or the treatment of the dispositions of signals not specified in the
=2EI spawn-sigdefault
attribute, or the treatment when
=2EB POSIX_SPAWN_SETSIGDEF
is not specified, see
=2EBR execve (2).
=2ETP
=2EB POSIX_SPAWN_SETSCHEDPARAM
=2E\" (POSIX_PRIORITY_SCHEDULING only)
If this flag is set, and the
=2EB POSIX_SPAWN_SETSCHEDULER
flag is not set, then set the scheduling parameters
to the parameters specified in the
=2EI spawn-schedparam
attribute (see
=2EBR posix_spawnattr_setschedparam (3))
of the object pointed to by
=2EIR attrp .
=2ETP
=2EB POSIX_SPAWN_SETSCHEDULER
Set the scheduling policy algorithm and parameters of the child,
as follows:
=2ERS
=2EIP * 3
The scheduling policy is set to the value specified in the
=2EI spawn-schedpolicy
attribute (see
=2EBR posix_spawnattr_setpolicy (3))
of the object pointed to by
=2EIR attrp .
=2E\" The following looks like a glibc bug, since POSIX says
=2E\" POSIX_SPAWN_SETSCHEDPARAM is ignored when POSIX_SPAWN_SETSCHEDULE=
R
=2E\" is specified
=2E\" I filed http://sourceware.org/bugzilla/show_bug.cgi?id=3D12052
=2E\" Depending on the outcome, the following section may need to be
=2E\" rewritten and a description of the current behavior added under B=
UGS.
=2EIP *
If the
=2EB POSIX_SPAWN_SETSCHEDPARAM
flag is also set,
then the scheduling parameters are set to the value specified in the
=2EI spawn-schedparam
attribute (see
=2EBR posix_spawnattr_setschedparam (3))
of the object pointed to by
=2EIR attrp .
If the
=2EB POSIX_SPAWN_SETSCHEDPARAM
flag is not set, then the housekeeping in the child fails.
=2ELP
If the
=2EB POSIX_SPAWN_SETSCHEDPARAM
and
=2EB POSIX_SPAWN_SETSCHEDPOLICY
flags are not specified,
the child inherits the corresponding scheduling attributes from the par=
ent.
=2E\" Given a NULL 'param' argument, sched_setscheduler() fails with EI=
NVAL.
=2E\"
=2E\" FIXME: The following seems to be misleading
=2E\" (If
=2E\" .I POSIX_SPAWN_SETSCHEDPARAM
=2E\" is also set,
=2E\" then the scheduling parameters are set according to the
corresponding element;
=2E\" otherwise, the effect is as if a NULL was passed as the
=2E\" .I param
=2E\" argument to
=2E\" .BR sched_setscheduler (2)).
=2ERE
=2ETP
=2EB POSIX_SPAWN_RESETIDS
If this flag is set,
reset the effective UID and GID to the
real UID and GID of the parent process.
If this flag is not set,
then the child retains the effective UID and GID of the parent.
In either case, if the set-user-ID and set-group-ID permission
bits are enabled on the executable file, their effect will override
the setting of the effective UID and GID (se
=2EBR execve (2)).
=2ETP
=2EB POSIX_SPAWN_SETPGROUP
Set the process group to the value specified in the
=2EI spawn-pgroup
attribute (see
=2EBR posix_spawnattr_setpgroup (3))
of the object pointed to by
=2EIR attrp .
If the
=2EI spawn-pgroup
attribute has the value 0,
the child's process group ID is made the same as its process ID.
If the
=2EB POSIX_SPAWN_SETPGROUP
flag is not set, the child inherits the parent's process group ID.
=2ELP
If
=2EI attrp
is NULL, then the default behaviors described above for each flag apply=
=2E
=2E\" mtk: I think we probably don't want to say the following, since i=
t
=2E\" =A0 =A0 =A0could lead people to do the wrong thing
=2E\" The POSIX standard tells you to call
=2E\" this function to de-initialize the attributes object pointed to b=
y
=2E\" .I attrp
=2E\" when you are done with it;
=2E\" however, on Linux systems this operation is a no-op.

The
=2EI file_actions
argument specifies a sequence of file operations
that are performed in the child process after
the general processing described above, and before it performs the
=2EBR exec (3).
If
=2EI file_actions
is NULL, then no special action is taken, and standard
=2EBR exec (3)
semantics apply--file descriptors open before the exec
remain open in the new process,
except those for which the
=2EB FD_CLOEXEC
flag has been set.
=46ile locks remain in place.
=2ELP
If
=2EI file_actions
is not NULL, then it contains an ordered set of requests to
=2EBR open (2),
=2EBR close (2),
and
=2EBR dup2 (2)
files.
These requests are added to the
=2EI file_actions
by
=2EBR posix_spawn_file_actions_addopen (3),
=2EBR posix_spawn_file_actions_addclose (3),
and
=2EBR posix_spawn_file_actions_adddup2 (3).
The requested operations are performed in the order they were added to
=2EIR file_actions .
=2E\" FIXME I think the following is best placed in the
=2E\" posix_spawn_file_actions_adddup2(3) page, and a similar statement=
 is
=2E\" also needed in posix_spawn_file_actions_addclose(3)
=2E\" Note that you can specify file descriptors in
=2E\" .I posix_spawn_file_actions_adddup2 (3)
=2E\" which would not be usable if you called
=2E\" .BR dup2 (2)
=2E\" at that time--i.e., file descriptors that are opened or
=2E\" closed by the earlier operations
=2E\" added to
=2E\" .I file_actions .

If any of the housekeeping actions fails
(due to bogus values being passed or other reasons why signal handling,
process scheduling, process group ID functions,
and file descriptor operations might fail),
the child process exits with exit value 127.
=2ESS exec() step
Once the child has successfully forked and performed
all requested pre-exec steps,
the child runs the requested executable.
=2ELP
The child process takes its environment from the
=2EI envp
argument, which is interpreted as if it had been passed to
=2EBR execve (2).
The arguments to the created process come from the
=2EI argv
argument, which is processed as for
=2EBR execve (2).
=2ESH RETURN VALUE
Upon successful completion,
=2EBR posix_spawn ()
and
=2EBR posix_spawnp ()
place the PID of the child process in
=2EIR pid ,
and return 0.
If there is an error before or during the
=2EBR fork (2),
then no child is created,
the contents of
=2EIR *pid
are unspecified,
and these functions return an error number as described below.

Even when these functions return a success status,
the child process may still fail for a plethora of reasons related to i=
ts
pre-\fBexec\fR() initialization.
In addition, the
=2EBR exec (3)
may fail.
In all of these cases, the child process will exit with the exit value =
of 127.
=2ESH ERRORS
The
=2EBR posix_spawn ()
and
=2EBR posix_spawnp ()
functions fail only in the case where the underlying
=2EBR fork (2)
or
=2EBR vfork (2)
call fails; =A0in these cases, these functions return an error number,
which will be one of the errors described for
=2EBR fork (2)
or
=2EBR vfork (2).
=2ELP
In addition, these functions fail if:
=2ETP
=2EB ENOSYS
=46unction not supported on this system.
=2ESH NOTES
The housekeeping activities in the child are controlled by
the objects pointed to by
=2EI attrp
(for non-file actions) and
=2EI file_actions
In POSIX parlance, the
=2EI posix_spawnattr_t
and
=2EI posix_spawn_file_actions_t
data types are referred to as objects,
and their elements are not specified by name.
Portable programs should initialize these objects using
only the POSIX-specified functions.
(In other words,
although these objects may be implemented as structures containing fiel=
ds,
portable programs must avoid dependence on such implementation details.=
)

According to POSIX, it unspecified whether fork handlers established wi=
th
=2EBR pthread_atfork (3)
are called when
=2EBR posix_spawn (3)
is invoked.
On glibc,
=2E\" Tested on glibc 2.12
fork handlers are called only if the child is created using
=2EBR fork (2).
=2ESH VERSIONS
=2E\" FIXME all of these pages should have a VERSIONS section
The
=2EBR posix_spawn ()
and
=2EBR posix_spawnp ()
functions are available since glibc 2.2.
=2ESH CONFORMING TO
=2ELP
POSIX.1-2001, POSIX.1-2008.
=2E\" FIXME: This piece belongs in pthread_attr_setflags()
The
=2EB POSIX_SPAWN_USEVFORK
flag is a GNU extension; the
=2EB _GNU_SOURCE
feature test macro must be defined (before including any header files)
to obtain the definition of this constant.
=2ESH EXAMPLE
The program below demonstrates the use of various functions in the
POSIX spawn API.
The program accepts command-line attributes that can be used
to create file actions and attributes objects.
The remaining command-line arguments are used as the executable name
and command-line arguments of the program that is executed in the child=
=2E

In the first run, the
=2EBR date (1)
command is executed in the child, and the
=2EBR posix_spawn ()
call employs no file actions or attributes objects.
=2Esp
=2Ein +4
=2Enf
$ \fB./a.out date\fP
PID of child: 7634
Tue Feb =A01 19:47:50 CEST 2011
Child status: exited, status=3D0
=2Efi
=2Ein
=2Esp
In the next run, the
=2EI \-c
command-line option is used to create a file actions object that closes
standard output in the child.
Consequently,
=2EBR date (1)
fails when trying to perform output and exits with a status of 1.
=2Esp
=2Ein +4
=2Enf
$ \fB./a.out -c date\fP
PID of child: 7636
date: write error: Bad file descriptor
Child status: exited, status=3D1
=2Efi
=2Ein
=2Esp
In the next run, the
=2EI \-s
command-line option is used to create an attributes object that
specifies that all (blockable) signals in the child should be blocked.
Consequently, trying to kill child with the default signal sent by
=2EBR kill (1)
(i.e.,
=2EBR SIGTERM )
fails, because that signal is blocked.
Therefore, to kill the child,
=2EBR SIGKILL
is necessary
=2ERB ( SIGKILL
can't be blocked).
=2Esp
=2Ein +4
=2Enf
$ \fB./a.out -s sleep 60 &\fP
[1] 7637
$ PID of child: 7638

$ \fBkill 7638\fP
$ \fBkill -KILL 7638\fP
$ Child status: killed by signal 9
[1]+ =A0Done =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0./a.out -s sleep 60
=2Efi
=2Ein
=2Esp
When we try to execute a nonexistent command in the child, the
=2EBR exec (3)
fails and the child exits with a status of 127.
=2Esp
=2Ein +4
=2Enf
$ \fB./a.out xxxxx
PID of child: 10190
Child status: exited, status=3D127
=2Efi
=2Ein
=2ESS Source code
=2Enf
#include <spawn.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <wait.h>
#include <errno.h>

#define errExit(msg) =A0 =A0do { perror(msg); \\
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 exit(EXIT_FAILU=
RE); } while (0)

#define errExitEN(en, msg) \\
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0do { errno =3D en; perro=
r(msg); \\
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 exit(EXIT_FAILU=
RE); } while (0)

char **environ;

int
main(int argc, char *argv[])
{
=A0 =A0pid_t child_pid;
=A0 =A0int s, opt, status;
=A0 =A0sigset_t mask;
=A0 =A0posix_spawnattr_t attr;
=A0 =A0posix_spawnattr_t *attrp;
=A0 =A0posix_spawn_file_actions_t file_actions;
=A0 =A0posix_spawn_file_actions_t *file_actionsp;

=A0 =A0/* Parse command\-line options, which can be used to specify an
=A0 =A0 =A0 attributes object and file actions object for the child. */

=A0 =A0attrp =3D NULL;
=A0 =A0file_actionsp =3D NULL;

=A0 =A0while ((opt =3D getopt(argc, argv, "sc")) !=3D \-1) {
=A0 =A0 =A0 =A0switch (opt) {
=A0 =A0 =A0 =A0case \(aqc\(aq: =A0 =A0 =A0 /* \-c: close standard outpu=
t in child */

=A0 =A0 =A0 =A0 =A0 =A0/* Create a file actions object and add a "close=
"
=A0 =A0 =A0 =A0 =A0 =A0 =A0 action to it */

=A0 =A0 =A0 =A0 =A0 =A0s =3D posix_spawn_file_actions_init(&file_action=
s);
=A0 =A0 =A0 =A0 =A0 =A0if (s !=3D 0)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0errExitEN(s, "posix_spawn_file_actions_i=
nit");

=A0 =A0 =A0 =A0 =A0 =A0s =3D posix_spawn_file_actions_addclose(&file_ac=
tions,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0STDOUT_FILENO);
=A0 =A0 =A0 =A0 =A0 =A0if (s !=3D 0)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0errExitEN(s, "posix_spawn_file_actions_a=
ddclose");

=A0 =A0 =A0 =A0 =A0 =A0file_actionsp =3D &file_actions;
=A0 =A0 =A0 =A0 =A0 =A0break;

=A0 =A0 =A0 =A0case \(aqs\(aq: =A0 =A0 =A0 /* \-s: block all signals in=
 child */

=A0 =A0 =A0 =A0 =A0 =A0/* Create an attributes object and add a "set si=
gnal mask"
=A0 =A0 =A0 =A0 =A0 =A0 =A0 action to it */

=A0 =A0 =A0 =A0 =A0 =A0s =3D posix_spawnattr_init(&attr);
=A0 =A0 =A0 =A0 =A0 =A0if (s !=3D 0)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0errExitEN(s, "posix_spawnattr_init");
=A0 =A0 =A0 =A0 =A0 =A0s =3D posix_spawnattr_setflags(&attr, POSIX_SPAW=
N_SETSIGMASK);
=A0 =A0 =A0 =A0 =A0 =A0if (s !=3D 0)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0errExitEN(s, "posix_spawnattr_setflags")=
;

=A0 =A0 =A0 =A0 =A0 =A0sigfillset(&mask);
=A0 =A0 =A0 =A0 =A0 =A0s =3D posix_spawnattr_setsigmask(&attr, &mask);
=A0 =A0 =A0 =A0 =A0 =A0if (s !=3D 0)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0errExitEN(s, "posix_spawnattr_setsigmask=
");

=A0 =A0 =A0 =A0 =A0 =A0attrp =3D &attr;
=A0 =A0 =A0 =A0 =A0 =A0break;
=A0 =A0 =A0 =A0}
=A0 =A0}

=A0 =A0/* Spawn the child. The name of the program to execute and the
=A0 =A0 =A0 command\-line arguments are taken from the command\-line ar=
guments
=A0 =A0 =A0 of this program. The environment of the program execed in t=
he
=A0 =A0 =A0 child is made the same as the parent\(aqs environment. */

=A0 =A0s =3D posix_spawnp(&child_pid, argv[optind], file_actionsp, attr=
p,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &argv[optind], environ);
=A0 =A0if (s !=3D 0)
=A0 =A0 =A0 =A0errExitEN(s, "posix_spawn");

=A0 =A0/* Destroy any objects that we created earlier */

=A0 =A0if (attrp !=3D NULL) {
=A0 =A0 =A0 =A0s =3D posix_spawnattr_destroy(attrp);
=A0 =A0 =A0 =A0if (s !=3D 0)
=A0 =A0 =A0 =A0 =A0 =A0errExitEN(s, "posix_spawnattr_destroy");
=A0 =A0}

=A0 =A0if (file_actionsp !=3D NULL) {
=A0 =A0 =A0 =A0s =3D posix_spawn_file_actions_destroy(file_actionsp);
=A0 =A0 =A0 =A0if (s !=3D 0)
=A0 =A0 =A0 =A0 =A0 =A0errExitEN(s, "posix_spawn_file_actions_destroy")=
;
=A0 =A0}

=A0 =A0printf("PID of child: %ld\\n", (long) child_pid);

=A0 =A0/* Monitor status of the child until it terminates */

=A0 =A0do {
=A0 =A0 =A0 =A0s =3D waitpid(child_pid, &status, WUNTRACED | WCONTINUED=
);
=A0 =A0 =A0 =A0if (s =3D=3D \-1)
=A0 =A0 =A0 =A0 =A0 =A0errExit("waitpid");

=A0 =A0 =A0 =A0printf("Child status: ");
=A0 =A0 =A0 =A0if (WIFEXITED(status)) {
=A0 =A0 =A0 =A0 =A0 =A0printf("exited, status=3D%d\\n", WEXITSTATUS(sta=
tus));
=A0 =A0 =A0 =A0} else if (WIFSIGNALED(status)) {
=A0 =A0 =A0 =A0 =A0 =A0printf("killed by signal %d\\n", WTERMSIG(status=
));
=A0 =A0 =A0 =A0} else if (WIFSTOPPED(status)) {
=A0 =A0 =A0 =A0 =A0 =A0printf("stopped by signal %d\\n", WSTOPSIG(statu=
s));
=A0 =A0 =A0 =A0} else if (WIFCONTINUED(status)) {
=A0 =A0 =A0 =A0 =A0 =A0printf("continued\\n");
=A0 =A0 =A0 =A0}
=A0 =A0} while (!WIFEXITED(status) && !WIFSIGNALED(status));

=A0 =A0exit(EXIT_SUCCESS);
}
=2Efi
=2ESH SEE ALSO
=2Enh \" Disable hyphenation
=2Ead l
=2EBR close (2),
=2EBR dup2 (2),
=2EBR execl (2),
=2EBR execlp (2),
=2EBR fork (2),
=2EBR open (2),
=2EBR sched_setparam (2),
=2EBR sched_setscheduler (2),
=2EBR setpgid (2),
=2EBR setuid (2),
=2EBR sigaction (2),
=2EBR sigprocask (2),
=2EBR posix_spawnattr_destroy (3),
=2EBR posix_spawnattr_getflags (3),
=2EBR posix_spawnattr_getpgroup (3),
=2EBR posix_spawnattr_getschedparam (3),
=2EBR posix_spawnattr_getschedpolicy (3),
=2EBR posix_spawnattr_getsigdefault (3),
=2EBR posix_spawnattr_getsigmask (3),
=2EBR posix_spawnattr_init (3),
=2EBR posix_spawnattr_setflags (3),
=2EBR posix_spawnattr_setpgroup (3),
=2EBR posix_spawnattr_setschedparam (3),
=2EBR posix_spawnattr_setschedpolicy (3),
=2EBR posix_spawnattr_setsigdefault (3),
=2EBR posix_spawnattr_setsigmask (3),
=2EBR posix_spawn_file_actions_addclose (3),
=2EBR posix_spawn_file_actions_adddup2 (3),
=2EBR posix_spawn_file_actions_addopen (3),
=2EBR posix_spawn_file_actions_destroy (3),
=2EBR posix_spawn_file_actions_init (3),
=2EBR pthread_atfork (3),
=2EBR feature_test_macros (7),
=2EBR <spawn.h>,
Base Definitions volume of POSIX.1-2001,
=2EI http://www.opengroup.org/unix/online.html



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
