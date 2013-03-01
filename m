From: ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org (Eric W. Biederman)
Subject: Re: For review: pid_namespaces(7) man page
Date: Thu, 28 Feb 2013 22:58:11 -0800
Message-ID: <878v677gjg.fsf@xmission.com>
References: <CAKgNAki=mUYuu_Ewhe7sjCmo+Dq2Vr+FZCixqNRaadcvAxtpFw@mail.gmail.com>
	<1362110504.15531.4@driftwood>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362110504.15531.4@driftwood> (Rob Landley's message of "Thu, 28
	Feb 2013 22:01:44 -0600")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Containers <containers-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org> writes:

> On 02/28/2013 05:24:07 AM, Michael Kerrisk (man-pages) wrote:
>> Eric et al,
>>=20
>> Eventually, there will be more namespace man pages, but let us start
>> now with one for PID namespaces. The attached page aims to provide a
>> fairly complete overview of PID namespaces.
>
> Onward!
>
>> PID_NAMESPACES(7)      Linux Programmer's Manual     PID_NAMESPACES(=
7)
>>=20
>> NAME
>>        pid_namespaces - overview of Linux PID namespaces
>>=20
>> DESCRIPTION
>>        For an overview of namespaces, see namespaces(7).
>>=20
>>        PID  namespaces  isolate  the  process ID number space, meani=
ng
>>        that processes in different PID namespaces can  have  the  sa=
me
>>        PID.
>
> Um, perhaps "different processes"? Slightly repetitive, but trying to=
 =20
> avoid the potential misreading that "a processes can have the same PI=
D =20
> in different namespaces". (A single process can't be a member of more=
 =20
> than one namespace. This is not about selective visibility.)

Well actually a process is visible and arguably a member of all parent
pid namespaces, and a process certainly had a pid value in each pid
namespace up to the root of the pid namespace tree.

>> PID namespaces allow containers to migrate to a new host
>>        while the processes inside  the  container  maintain  the  sa=
me
>>        PIDs.
>
> I thought suspend/resume a container was the simple case. Migration t=
o =20
> a new host is built on top of that. (On resume in a new container on =
=20
> the same system, if other stuff is going on in the system so the =20
> available PIDs have shifted.)

I don't know if there is a difference at the implementation level.

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
>
> If SIGKILL to init is propogated to all the children of init, is =20
> SIGSTOP also propogated to all the children? (I.E. will SIGSTOP to =20
> container's init suspend the whole container, and will SIGCONT resume=
 =20
> the whole container? If the latter, will it only resume processes tha=
t =20
> weren't previously stopped? :)

No.  SIGSTOP stops sent to init stops just init.

It isn't SIGKILL that is propogated it is the exiting of init that is
propogated by way of SIGKILL.  If your init process calls _exit() or
hits a SIGSEGV and dies all of the other processes in the pid namespace
will be sent a SIGKILL and be forced down.

This is similar to a the system panic if the global init exits.

>>        To put things another way: a process's PID namespace membersh=
ip
>>        is determined when the process is created and cannot be chang=
ed
>>        thereafter.  Among other things, this means that  the  parent=
al
>>        relationship between processes mirrors the parental between P=
ID
>
> mirrors the relationship
>
>>        namespaces: the parent of a  process  is  either  in  the  sa=
me
>>        namespace or resides in the immediate parent PID namespace.
>>=20
>>        Every  thread  in  a process must be in the same PID namespac=
e.
>>        For this reason, the two following call sequences will fail:
>>=20
>>            unshare(CLONE_NEWPID);
>>            clone(..., CLONE_VM, ...);    /* Fails */
>>=20
>>            setns(fd, CLONE_NEWPID);
>>            clone(..., CLONE_VM, ...);    /* Fails */
>
> They fail with -EUNDOCUMENTED
Make that -EINVAL.

>>        Because the above unshare(2) and setns(2) calls only change t=
he
>>        PID  namespace  for created children, the clone(2) calls nece=
s=E2=80=90
>>        sarily put the new thread in a different PID namespace from t=
he
>>        calling thread.
>
> Um, no they don't. They fail. That's the point. They _would_ put the =
=20
> new thread in a different PID namespace, which breaks the definition =
of =20
> threads.
>
> How about:
>
> The above unshare(2) and setns(2) calls change the PID namespace of
> children created by subsequent clone(2) calls, which is incompatible
> with CLONE_VM.
>
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
> Why is the (If) clause in parentheses? And unshare(2)) has a Bruce.
> (I.E. unbalanced parens.).
>
>>        Calling  readlink(2)  on the path /proc/self yields the proce=
ss
>>        ID of the caller in the  PID  namespace  of  the  procfs  mou=
nt
>>        (i.e.,  the  PID  namespace  of  the  process  that mounted t=
he
>>        procfs).
>
> This is per-filesystem rather than using the process's namespace =20
> because...?=20

The entire proc filesystem mount is in the pid namespace of the mountin=
g
process.  Every pid that proc reports.  /proc/self is not a special
case, but /proc/self can be interesting if you want to find your pid
in that other guys pid namespace.

> (Where /proc/self points is already process-local data, so the races =
=20
> here can't be too horrible...)

It actually is moderately important for /proc/self to do the right thin=
g
here.  It means you can run against a /proc that is not for your pid
namespace and all of the /proc/self things that glibc and various other
programs and libraries due continue to work.

>>        When a process ID is passed over a  UNIX  domain  socket  to =
 a
>>        process  in  a  different PID namespace (see the description =
of
>>        SCM_CREDENTIALS in unix(7)), it is translated into  the  corr=
e=E2=80=90
>>        sponding PID value in the receiving process's PID namespace.
>
> Heh. :)
>
>> CONFORMING TO
>>        Namespaces are a Linux-specific feature.
>
> And yet the glibc guys insist on #define GNU_GNU_GNU_ALL_HAIL_STALLMA=
N =20
> in order to access this Linux-specific feature which has nothing =20
> whatsoever to do with the FSF.

I read it _GNU_SOURCE just implies a libc extensions specific to glibc.
Of course now that you mention it _GNU_SOURCE implies that we can
reasonably file a bug against glibc on the HURD or BSD for not
implementing this feature can't we?

> The unshare() call originally _didn't_ require this define, but they =
=20
> retroactively added the requirement in a version "upgrade" to match =20
> your man page. This made me sad. It also made me prototype it myself =
=20
> rather than expecting the header to provide it.

Eric
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
