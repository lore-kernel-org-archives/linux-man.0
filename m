From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: For review: pid_namespaces(7) man page
Date: Fri, 1 Mar 2013 11:20:40 +0100
Message-ID: <CAKgNAkiBrVP71Q67ORMZm93-5=aBL+KTyCo0KVeTpDju-z05ZA@mail.gmail.com>
References: <CAKgNAki=mUYuu_Ewhe7sjCmo+Dq2Vr+FZCixqNRaadcvAxtpFw@mail.gmail.com>
 <87txowa2cm.fsf@xmission.com> <CAKgNAkjxrbcpONCU4UdD0-cjXwbHr+YwkOR0H_aXp3CGB283Uw@mail.gmail.com>
 <877glr5vuo.fsf@xmission.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <877glr5vuo.fsf-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Cc: Linux Containers <containers-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "Serge E. Hallyn" <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Mar 1, 2013 at 10:10 AM, Eric W. Biederman
<ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org> wrote:
> "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
>> Hi Eric,
>>
>> On Thu, Feb 28, 2013 at 4:24 PM, Eric W. Biederman
>> <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org> wrote:
>>> "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>
>> [...]
>>
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> PID_NAMESPACES(7)      Linux Programmer's Manual     PID_NAMESPACE=
S(7)
>>>>
>>>> NAME
>>>>        pid_namespaces - overview of Linux PID namespaces
>>>>
>>>> DESCRIPTION
>> [...]
>>
>>>>    The namespace init process
>>>>        The first process created in a new namespace (i.e., the pro=
cess
>>>>        created using clone(2) with the CLONE_NEWPID flag, or the f=
irst
>>>>        child created by a process after a call to unshare(2) using=
 the
>>>>        CLONE_NEWPID flag) has the PID 1, and is the "init" process=
 for
>>>>        the namespace (see init(1)).  Children that are orphaned wi=
thin
>>>>        the namespace will be reparented to this  process  rather  =
than
>>>>        init(1).
>>>>
>>>>        If the "init" process of a PID namespace terminates, the ke=
rnel
>>>>        terminates all of the processes in the namespace via a  SIG=
KILL
>>>>        signal.   This  behavior  reflects  the  fact  that  the "i=
nit"
>>>>        process is essential for the correct operation of a PID  na=
mes=E2=80=90
>>>>        pace.   In this case, a subsequent fork(2) into this PID na=
mes=E2=80=90
>>>>        pace (e.g., from a process that has done a  setns(2)  into =
 the
>>>>        namespace    using    an    open    file   descriptor   for=
   a
>>>>        /proc/[pid]/ns/pid file corresponding to a process that was=
  in
>>>>        the  namespace) will fail with the error ENOMEM; it is not =
pos=E2=80=90
>>>>        sible to create a new processes in a PID namespace whose "i=
nit"
>>>>        process has terminated.
>>>
>>> It may be useful to mention unshare in the case of fork(2) failing =
just
>>> because that is such an easy mistake to make.
>>>
>>> unshare(CLONE_NEWPID);
>>> pid =3D fork();
>>> waitpid(pid,...);
>>> fork() -> ENOMEM
>>
>> I'm lost. Why does that sequence fail? The child of fork() becomes P=
ID
>> 1 in the new PID namespace.
>
> Correct.
> Then we wait for the child of the fork to exit();
> Then we fork again into the new pid namespace.
> The second fork fails because init has exited.

Ahhh -- I misapprehended the scenario you were describing. Got it now.
I'll add that case.

Thanks,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
