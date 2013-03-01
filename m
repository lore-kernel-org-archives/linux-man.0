From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: For review: pid_namespaces(7) man page
Date: Fri, 1 Mar 2013 09:50:16 +0100
Message-ID: <CAKgNAkjxrbcpONCU4UdD0-cjXwbHr+YwkOR0H_aXp3CGB283Uw@mail.gmail.com>
References: <CAKgNAki=mUYuu_Ewhe7sjCmo+Dq2Vr+FZCixqNRaadcvAxtpFw@mail.gmail.com>
 <87txowa2cm.fsf@xmission.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87txowa2cm.fsf-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Cc: Linux Containers <containers-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "Serge E. Hallyn" <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Eric,

On Thu, Feb 28, 2013 at 4:24 PM, Eric W. Biederman
<ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org> wrote:
> "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

[...]

>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> PID_NAMESPACES(7)      Linux Programmer's Manual     PID_NAMESPACES(=
7)
>>
>> NAME
>>        pid_namespaces - overview of Linux PID namespaces
>>
>> DESCRIPTION
[...]

>>    The namespace init process
>>        The first process created in a new namespace (i.e., the proce=
ss
>>        created using clone(2) with the CLONE_NEWPID flag, or the fir=
st
>>        child created by a process after a call to unshare(2) using t=
he
>>        CLONE_NEWPID flag) has the PID 1, and is the "init" process f=
or
>>        the namespace (see init(1)).  Children that are orphaned with=
in
>>        the namespace will be reparented to this  process  rather  th=
an
>>        init(1).
>>
>>        If the "init" process of a PID namespace terminates, the kern=
el
>>        terminates all of the processes in the namespace via a  SIGKI=
LL
>>        signal.   This  behavior  reflects  the  fact  that  the "ini=
t"
>>        process is essential for the correct operation of a PID  name=
s=E2=80=90
>>        pace.   In this case, a subsequent fork(2) into this PID name=
s=E2=80=90
>>        pace (e.g., from a process that has done a  setns(2)  into  t=
he
>>        namespace    using    an    open    file   descriptor   for  =
 a
>>        /proc/[pid]/ns/pid file corresponding to a process that was  =
in
>>        the  namespace) will fail with the error ENOMEM; it is not po=
s=E2=80=90
>>        sible to create a new processes in a PID namespace whose "ini=
t"
>>        process has terminated.
>
> It may be useful to mention unshare in the case of fork(2) failing ju=
st
> because that is such an easy mistake to make.
>
> unshare(CLONE_NEWPID);
> pid =3D fork();
> waitpid(pid,...);
> fork() -> ENOMEM

I'm lost. Why does that sequence fail? The child of fork() becomes PID
1 in the new PID namespace.

>>        Only  signals  for  which  the "init" process has established=
 a
>>        signal handler can be sent to the "init" process by other  me=
m=E2=80=90
>>        bers  of  the  PID namespace.  This restriction applies even =
to
>>        privileged processes, and prevents other  members  of  the  P=
ID
>>        namespace from accidentally killing the "init" process.
>>
>>        Likewise, a process in an ancestor namespace can=E2=80=94subj=
ect to the
>>        usual permission checks described in  kill(2)=E2=80=94send  s=
ignals  to
>>        the  "init" process of a child PID namespace only if the "ini=
t"
>>        process has established a handler for that signal.  (Within t=
he
>>        handler,  the  siginfo_t si_pid field described in sigaction(=
2)
>>        will be zero.)  SIGKILL or SIGSTOP are  treated  exceptionall=
y:
>>        these signals are forcibly delivered when sent from an ancest=
or
>>        PID namespace.  Neither of these signals can be caught  by  t=
he
>>        "init" process, and so will result in the usual actions assoc=
i=E2=80=90
>>        ated with those signals (respectively, terminating and stoppi=
ng
>>        the process).
>>
>>    Nesting PID namespaces
>>        PID  namespaces can be nested: each PID namespace has a paren=
t,
>>        except for the initial ("root") PID namespace.  The parent of=
 a
>>        PID  namespace is the PID namespace of the process that creat=
ed
>>        the namespace using clone(2)  or  unshare(2).   PID  namespac=
es
>>        thus  form a tree, with all namespaces ultimately tracing the=
ir
>>        ancestry to the root namespace.
>>
>>        A process is visible to other processes in its  PID  namespac=
e,
>>        and  to  the  processes  in  each direct ancestor PID namespa=
ce
>>        going back to the root PID namespace.  In this context,  "vis=
i=E2=80=90
>>        ble"  means that one process can be the target of operations =
by
>>        another process using system calls that specify a  process  I=
D.
>>        Conversely,  the  processes  in a child PID namespace can't s=
ee
>>        processes in the parent and further removed ancestor namespac=
e.
>>        More  succinctly:  a  process  can see (e.g., send signals wi=
th
>>        kill(2), set nice values with setpriority(2), etc.)  only  pr=
o=E2=80=90
>>        cesses contained in its own PID namespace and in descendants =
of
>>        that namespace.
>>
>>        A process has one process ID in each of the layers of  the  P=
ID
>>        namespace  hierarchy  in  which  is  visible,  and walking ba=
ck
>>        though each direct ancestor namespace through to the  root  P=
ID
>>        namespace.   System  calls  that  operate on process IDs alwa=
ys
>>        operate using the process ID that is visible in the PID  name=
s=E2=80=90
>>        pace of the caller.  A call to getpid(2) always returns the P=
ID
>>        associated with the namespace in which the process was create=
d.
>>
>>        Some processes in a PID namespace may  have  parents  that  a=
re
>>        outside  of the namespace.  For example, the parent of the in=
i=E2=80=90
>>        tial process in the namespace (i.e., the init(1)  process  wi=
th
>>        PID  1)  is  necessarily  in  another namespace.  Likewise, t=
he
>>        direct children of a process that uses setns(2)  to  cause  i=
ts
>>        children  to join a PID namespace are in a different PID name=
s=E2=80=90
>>        pace from the caller of setns(2).  Calls to getppid(2) for su=
ch
>>        processes return 0.
>>
>>    setns(2) and unshare(2) semantics
>>        Calls  to setns(2) that specify a PID namespace file descript=
or
>>        and calls to unshare(2) with the CLONE_NEWPID flag cause  chi=
l=E2=80=90
>>        dren  subsequently created by the caller to be placed in a di=
f=E2=80=90
>>        ferent PID namespace from the caller.  These calls do not, ho=
w=E2=80=90
>>        ever,  change the PID namespace of the calling process, becau=
se
>>        doing so would change the caller's idea  of  its  own  PID  (=
as
>>        reported  by getpid()), which would break many applications a=
nd
>>        libraries.
>>
>>        To put things another way: a process's PID namespace membersh=
ip
>>        is determined when the process is created and cannot be chang=
ed
>>        thereafter.  Among other things, this means that  the  parent=
al
>>        relationship between processes mirrors the parental between P=
ID
>>        namespaces: the parent of a  process  is  either  in  the  sa=
me
>>        namespace or resides in the immediate parent PID namespace.
>
> This is mostly true.  With setns it is possible to have a parent
> in a pid namespace several steps up the pid namespace hierarchy.
>
>>        Every  thread  in  a process must be in the same PID namespac=
e.
>>        For this reason, the two following call sequences will fail:
>>
>>            unshare(CLONE_NEWPID);
>>            clone(..., CLONE_VM, ...);    /* Fails */
>>
>>            setns(fd, CLONE_NEWPID);
>>            clone(..., CLONE_VM, ...);    /* Fails */
>>
>>        Because the above unshare(2) and setns(2) calls only change t=
he
>>        PID  namespace  for created children, the clone(2) calls nece=
s=E2=80=90
>>        sarily put the new thread in a different PID namespace from t=
he
>>        calling thread.
>
> I don't know if it is interesting but these sequences also fail.  But=
 I
> suppose that is obvious?  Or documented at least Documented in the cl=
one
> manpage and unshare manpages.
>
>             clone(..., CLONE_VM, ...);
>             unshare(CLONE_NEWPID);       /* Fails */
>
>             clone(..., CLONE_VM, ...);
>             setns(fd, CLONE_NEWPID);     /* Fails */


I added to this page.

>>    Miscellaneous
>>        After  creating a new PID namespace, it is useful for the chi=
ld
>>        to change its root directory and mount a new procfs instance =
at
>>        /proc  so  that  tools such as ps(1) work correctly.  (If a n=
ew
>>        mount  namespace  is  simultaneously   created   by   includi=
ng
>>        CLONE_NEWNS  in  the flags argument of clone(2) or unshare(2)=
),
>>        then it isn't necessary to change the  root  directory:  a  n=
ew
>>        procfs instance can be mounted directly over /proc.)
>
> Should it be documented somewhere that /proc when mounted from a pid
> namespace will use the pids of that pid namespace and /proc will only
> show process for visible in the mounting pid namespace, even if that
> mount of proc is accessed by processes in other pid namespaces?
>
> You sort of say it here by saying it is useful to mount a new copy of
> /proc, which it is.  I just don't see you coming out straight and say=
ing
> why it is.  It just seems to be implied.

You're right. I should be more explicit. I will add some text detailing=
 this.

[...]

Thanks for the comments, Eric!

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
