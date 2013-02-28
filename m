From: ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org (Eric W. Biederman)
Subject: Re: For review: pid_namespaces(7) man page
Date: Thu, 28 Feb 2013 07:24:09 -0800
Message-ID: <87txowa2cm.fsf@xmission.com>
References: <CAKgNAki=mUYuu_Ewhe7sjCmo+Dq2Vr+FZCixqNRaadcvAxtpFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAki=mUYuu_Ewhe7sjCmo+Dq2Vr+FZCixqNRaadcvAxtpFw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Michael Kerrisk's message of "Thu, 28 Feb 2013 12:24:07 +0100")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Linux Containers <containers-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "Serge E. Hallyn" <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

"Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> Eric et al,
>
> Eventually, there will be more namespace man pages, but let us start
> now with one for PID namespaces. The attached page aims to provide a
> fairly complete overview of PID namespaces.
>
> Eric, various pieces of the page are shifted out of other pages
> (clone(2), setns(2), etc.) and are derived from comments you've
> emailed me off list, so you are (jointly) in the copyright of the
> page. I've chosen the common license for man-pages; let me know if yo=
u
> have any objections to that license.

Interesting license.  It seems reasonable.

> I'm looking for review comments (corrections, improvements, additions=
,
> etc.) on this page. I've provided it in two forms inline below, and
> reviewers can comment comment on whichever form they are most
> comfortable with:
>
> 1) The rendered page as plain text
> 2) The *roff source (also attached); rendering that source will enabl=
e
> readers to see proper formatting for the page.
>
> Note that the namespaces(7) page referred to in this page is not yet
> finished; I'll send it out for review at a future time.
>
> Thanks,
>
> Michael
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> PID_NAMESPACES(7)      Linux Programmer's Manual     PID_NAMESPACES(7=
)
>
> NAME
>        pid_namespaces - overview of Linux PID namespaces
>
> DESCRIPTION
>        For an overview of namespaces, see namespaces(7).
>
>        PID  namespaces  isolate  the  process ID number space, meanin=
g
>        that processes in different PID namespaces can  have  the  sam=
e
>        PID.   PID namespaces allow containers to migrate to a new hos=
t
>        while the processes inside  the  container  maintain  the  sam=
e
>        PIDs.
>
>        PIDs  in a new PID namespace start at 1, somewhat like a stand=
=E2=80=90
>        alone system, and calls to fork(2), vfork(2), or clone(2)  wil=
l
>        produce  processes  with PIDs that are unique within the names=
=E2=80=90
>        pace.
>
>        Use of PID namespaces requires a kernel that is configured wit=
h
>        the CONFIG_PID_NS option.
>
>    The namespace init process
>        The first process created in a new namespace (i.e., the proces=
s
>        created using clone(2) with the CLONE_NEWPID flag, or the firs=
t
>        child created by a process after a call to unshare(2) using th=
e
>        CLONE_NEWPID flag) has the PID 1, and is the "init" process fo=
r
>        the namespace (see init(1)).  Children that are orphaned withi=
n
>        the namespace will be reparented to this  process  rather  tha=
n
>        init(1).
>
>        If the "init" process of a PID namespace terminates, the kerne=
l
>        terminates all of the processes in the namespace via a  SIGKIL=
L
>        signal.   This  behavior  reflects  the  fact  that  the "init=
"
>        process is essential for the correct operation of a PID  names=
=E2=80=90
>        pace.   In this case, a subsequent fork(2) into this PID names=
=E2=80=90
>        pace (e.g., from a process that has done a  setns(2)  into  th=
e
>        namespace    using    an    open    file   descriptor   for   =
a
>        /proc/[pid]/ns/pid file corresponding to a process that was  i=
n
>        the  namespace) will fail with the error ENOMEM; it is not pos=
=E2=80=90
>        sible to create a new processes in a PID namespace whose "init=
"
>        process has terminated.

It may be useful to mention unshare in the case of fork(2) failing just
because that is such an easy mistake to make.

unshare(CLONE_NEWPID);
pid =3D fork();
waitpid(pid,...);
fork() -> ENOMEM=20

>        Only  signals  for  which  the "init" process has established =
a
>        signal handler can be sent to the "init" process by other  mem=
=E2=80=90
>        bers  of  the  PID namespace.  This restriction applies even t=
o
>        privileged processes, and prevents other  members  of  the  PI=
D
>        namespace from accidentally killing the "init" process.
>
>        Likewise, a process in an ancestor namespace can=E2=80=94subje=
ct to the
>        usual permission checks described in  kill(2)=E2=80=94send  si=
gnals  to
>        the  "init" process of a child PID namespace only if the "init=
"
>        process has established a handler for that signal.  (Within th=
e
>        handler,  the  siginfo_t si_pid field described in sigaction(2=
)
>        will be zero.)  SIGKILL or SIGSTOP are  treated  exceptionally=
:
>        these signals are forcibly delivered when sent from an ancesto=
r
>        PID namespace.  Neither of these signals can be caught  by  th=
e
>        "init" process, and so will result in the usual actions associ=
=E2=80=90
>        ated with those signals (respectively, terminating and stoppin=
g
>        the process).
>
>    Nesting PID namespaces
>        PID  namespaces can be nested: each PID namespace has a parent=
,
>        except for the initial ("root") PID namespace.  The parent of =
a
>        PID  namespace is the PID namespace of the process that create=
d
>        the namespace using clone(2)  or  unshare(2).   PID  namespace=
s
>        thus  form a tree, with all namespaces ultimately tracing thei=
r
>        ancestry to the root namespace.
>
>        A process is visible to other processes in its  PID  namespace=
,
>        and  to  the  processes  in  each direct ancestor PID namespac=
e
>        going back to the root PID namespace.  In this context,  "visi=
=E2=80=90
>        ble"  means that one process can be the target of operations b=
y
>        another process using system calls that specify a  process  ID=
=2E
>        Conversely,  the  processes  in a child PID namespace can't se=
e
>        processes in the parent and further removed ancestor namespace=
=2E
>        More  succinctly:  a  process  can see (e.g., send signals wit=
h
>        kill(2), set nice values with setpriority(2), etc.)  only  pro=
=E2=80=90
>        cesses contained in its own PID namespace and in descendants o=
f
>        that namespace.
>
>        A process has one process ID in each of the layers of  the  PI=
D
>        namespace  hierarchy  in  which  is  visible,  and walking bac=
k
>        though each direct ancestor namespace through to the  root  PI=
D
>        namespace.   System  calls  that  operate on process IDs alway=
s
>        operate using the process ID that is visible in the PID  names=
=E2=80=90
>        pace of the caller.  A call to getpid(2) always returns the PI=
D
>        associated with the namespace in which the process was created=
=2E
>
>        Some processes in a PID namespace may  have  parents  that  ar=
e
>        outside  of the namespace.  For example, the parent of the ini=
=E2=80=90
>        tial process in the namespace (i.e., the init(1)  process  wit=
h
>        PID  1)  is  necessarily  in  another namespace.  Likewise, th=
e
>        direct children of a process that uses setns(2)  to  cause  it=
s
>        children  to join a PID namespace are in a different PID names=
=E2=80=90
>        pace from the caller of setns(2).  Calls to getppid(2) for suc=
h
>        processes return 0.
>
>    setns(2) and unshare(2) semantics
>        Calls  to setns(2) that specify a PID namespace file descripto=
r
>        and calls to unshare(2) with the CLONE_NEWPID flag cause  chil=
=E2=80=90
>        dren  subsequently created by the caller to be placed in a dif=
=E2=80=90
>        ferent PID namespace from the caller.  These calls do not, how=
=E2=80=90
>        ever,  change the PID namespace of the calling process, becaus=
e
>        doing so would change the caller's idea  of  its  own  PID  (a=
s
>        reported  by getpid()), which would break many applications an=
d
>        libraries.
>
>        To put things another way: a process's PID namespace membershi=
p
>        is determined when the process is created and cannot be change=
d
>        thereafter.  Among other things, this means that  the  parenta=
l
>        relationship between processes mirrors the parental between PI=
D
>        namespaces: the parent of a  process  is  either  in  the  sam=
e
>        namespace or resides in the immediate parent PID namespace.

This is mostly true.  With setns it is possible to have a parent
in a pid namespace several steps up the pid namespace hierarchy.

>        Every  thread  in  a process must be in the same PID namespace=
=2E
>        For this reason, the two following call sequences will fail:
>
>            unshare(CLONE_NEWPID);
>            clone(..., CLONE_VM, ...);    /* Fails */
>
>            setns(fd, CLONE_NEWPID);
>            clone(..., CLONE_VM, ...);    /* Fails */
>
>        Because the above unshare(2) and setns(2) calls only change th=
e
>        PID  namespace  for created children, the clone(2) calls neces=
=E2=80=90
>        sarily put the new thread in a different PID namespace from th=
e
>        calling thread.

I don't know if it is interesting but these sequences also fail.  But I
suppose that is obvious?  Or documented at least Documented in the clon=
e
manpage and unshare manpages.

            clone(..., CLONE_VM, ...);
            unshare(CLONE_NEWPID);       /* Fails */

            clone(..., CLONE_VM, ...);
            setns(fd, CLONE_NEWPID);     /* Fails */
             =20
>    Miscellaneous
>        After  creating a new PID namespace, it is useful for the chil=
d
>        to change its root directory and mount a new procfs instance a=
t
>        /proc  so  that  tools such as ps(1) work correctly.  (If a ne=
w
>        mount  namespace  is  simultaneously   created   by   includin=
g
>        CLONE_NEWNS  in  the flags argument of clone(2) or unshare(2))=
,
>        then it isn't necessary to change the  root  directory:  a  ne=
w
>        procfs instance can be mounted directly over /proc.)

Should it be documented somewhere that /proc when mounted from a pid
namespace will use the pids of that pid namespace and /proc will only
show process for visible in the mounting pid namespace, even if that
mount of proc is accessed by processes in other pid namespaces?

You sort of say it here by saying it is useful to mount a new copy of
/proc, which it is.  I just don't see you coming out straight and sayin=
g
why it is.  It just seems to be implied.

>        Calling  readlink(2)  on the path /proc/self yields the proces=
s
>        ID of the caller in the  PID  namespace  of  the  procfs  moun=
t
>        (i.e.,  the  PID  namespace  of  the  process  that mounted th=
e
>        procfs).
>
>        When a process ID is passed over a  UNIX  domain  socket  to  =
a
>        process  in  a  different PID namespace (see the description o=
f
>        SCM_CREDENTIALS in unix(7)), it is translated into  the  corre=
=E2=80=90
>        sponding PID value in the receiving process's PID namespace.
>
> CONFORMING TO
>        Namespaces are a Linux-specific feature.
>
> SEE ALSO
>        unshare(1),  clone(2),  setns(2),  unshare(2), proc(5), creden=
=E2=80=90
>        tials(7), capabilities(7), user_namespaces(7), switch_root(8)
>
>
>
> Linux                         2013-01-14             PID_NAMESPACES(7=
)
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
