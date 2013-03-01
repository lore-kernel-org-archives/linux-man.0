From: ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org (Eric W. Biederman)
Subject: Re: For review: pid_namespaces(7) man page
Date: Fri, 01 Mar 2013 07:35:38 -0800
Message-ID: <87wqtr3zg5.fsf@xmission.com>
References: <CAKgNAki=mUYuu_Ewhe7sjCmo+Dq2Vr+FZCixqNRaadcvAxtpFw@mail.gmail.com>
	<1362110504.15531.4@driftwood>
	<CAKgNAkgVKnhRT1Lpq4a_UdBKB+tn6XmWSDF2QJXG0aSLtNH6dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgVKnhRT1Lpq4a_UdBKB+tn6XmWSDF2QJXG0aSLtNH6dg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Michael Kerrisk's message of "Fri, 1 Mar 2013 10:57:40 +0100")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Containers <containers-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

"Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> Hi Rob,
>
> On Fri, Mar 1, 2013 at 5:01 AM, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org> wrote:
>> On 02/28/2013 05:24:07 AM, Michael Kerrisk (man-pages) wrote:
> [...]
>
>>> DESCRIPTION
>>>        For an overview of namespaces, see namespaces(7).
>>>
>>>        PID  namespaces  isolate  the  process ID number space, mean=
ing
>>>        that processes in different PID namespaces can  have  the  s=
ame
>>>        PID.
>>
>>
>> Um, perhaps "different processes"? Slightly repetitive, but trying t=
o avoid
>> the potential misreading that "a processes can have the same PID in
>> different namespaces". (A single process can't be a member of more t=
han one
>> namespace. This is not about selective visibility.)
>
> I'm not sure this clarifies things...
>
>>> PID namespaces allow containers to migrate to a new host
>>>        while the processes inside  the  container  maintain  the  s=
ame
>>>        PIDs.
>>
>>
>> I thought suspend/resume a container was the simple case. Migration =
to a new
>> host is built on top of that. (On resume in a new container on the s=
ame
>> system, if other stuff is going on in the system so the available PI=
Ds have
>> shifted.)
>
> I'll add some words here on suspend/resume.
>
>>>        Likewise, a process in an ancestor namespace can=E2=80=94sub=
ject to the
>>>        usual permission checks described in  kill(2)=E2=80=94send  =
signals  to
>>>        the  "init" process of a child PID namespace only if the "in=
it"
>>>        process has established a handler for that signal.  (Within =
the
>>>        handler,  the  siginfo_t si_pid field described in sigaction=
(2)
>>>        will be zero.)  SIGKILL or SIGSTOP are  treated  exceptional=
ly:
>>>        these signals are forcibly delivered when sent from an ances=
tor
>>>        PID namespace.  Neither of these signals can be caught  by  =
the
>>>        "init" process, and so will result in the usual actions asso=
ci=E2=80=90
>>>        ated with those signals (respectively, terminating and stopp=
ing
>>>        the process).
>>
>>
>> If SIGKILL to init is propogated to all the children of init, is SIG=
STOP
>> also propogated to all the children? (I.E. will SIGSTOP to container=
's init
>> suspend the whole container, and will SIGCONT resume the whole conta=
iner? If
>> the latter, will it only resume processes that weren't previously st=
opped?
>> :)
>
> Covered by Eric.
>
>>>        To put things another way: a process's PID namespace members=
hip
>>>        is determined when the process is created and cannot be chan=
ged
>>>        thereafter.  Among other things, this means that  the  paren=
tal
>>>        relationship between processes mirrors the parental between =
PID
>>
>>
>> mirrors the relationship
>
> Thanks.
>
>>>        namespaces: the parent of a  process  is  either  in  the  s=
ame
>>>        namespace or resides in the immediate parent PID namespace.
>>>
>>>        Every  thread  in  a process must be in the same PID namespa=
ce.
>>>        For this reason, the two following call sequences will fail:
>>>
>>>            unshare(CLONE_NEWPID);
>>>            clone(..., CLONE_VM, ...);    /* Fails */
>>>
>>>            setns(fd, CLONE_NEWPID);
>>>            clone(..., CLONE_VM, ...);    /* Fails */
>>
>>
>> They fail with -EUNDOCUMENTED
>
> Added EINVAL, as per Eric's reply. (Eric does that error also apply
> for the two new cases you added?).
>
>>>        Because the above unshare(2) and setns(2) calls only change =
the
>>>        PID  namespace  for created children, the clone(2) calls nec=
es=E2=80=90
>>>        sarily put the new thread in a different PID namespace from =
the
>>>        calling thread.
>>
>>
>> Um, no they don't. They fail. That's the point.
>
> (Good catch.)
>
>> They _would_ put the new
>> thread in a different PID namespace, which breaks the definition of =
threads.
>>
>> How about:
>>
>> The above unshare(2) and setns(2) calls change the PID namespace of
>> children created by subsequent clone(2) calls, which is incompatible
>> with CLONE_VM.
>
> I decided on:
>
>        The  point  here is that unshare(2) and setns(2) change the PI=
D
>        namespace for created children but not for the calling process=
,
>        while  clone(2) CLONE_VM specifies the creation of a new threa=
d
>        in the same process.

Can we make that "for all new tasks created" instead of "created
children"

Othewise someone might expect CLONE_THREAD would work as you
CLONE_THREAD creates a thread and not a child...

Eric
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
