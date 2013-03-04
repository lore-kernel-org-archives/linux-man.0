From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: For review: pid_namespaces(7) man page
Date: Mon, 4 Mar 2013 13:46:57 +0100
Message-ID: <CAKgNAkjGD0FdQqpA+rYR=+Yc5uVPB8mE5JjCqy-5WS85cPsvng@mail.gmail.com>
References: <CAKgNAki=mUYuu_Ewhe7sjCmo+Dq2Vr+FZCixqNRaadcvAxtpFw@mail.gmail.com>
 <1362110504.15531.4@driftwood> <CAKgNAkgVKnhRT1Lpq4a_UdBKB+tn6XmWSDF2QJXG0aSLtNH6dg@mail.gmail.com>
 <87wqtr3zg5.fsf@xmission.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87wqtr3zg5.fsf-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Containers <containers-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Mar 1, 2013 at 4:35 PM, Eric W. Biederman <ebiederm-aS9lmoZGLiXQFizaE/u3fw@public.gmane.org=
m> wrote:
> "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
>> Hi Rob,
>>
>> On Fri, Mar 1, 2013 at 5:01 AM, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org> wrote:
>>> On 02/28/2013 05:24:07 AM, Michael Kerrisk (man-pages) wrote:
>> [...]
>>
>>>> DESCRIPTION
>>>>        For an overview of namespaces, see namespaces(7).
>>>>
>>>>        PID  namespaces  isolate  the  process ID number space, mea=
ning
>>>>        that processes in different PID namespaces can  have  the  =
same
>>>>        PID.
>>>
>>>
>>> Um, perhaps "different processes"? Slightly repetitive, but trying =
to avoid
>>> the potential misreading that "a processes can have the same PID in
>>> different namespaces". (A single process can't be a member of more =
than one
>>> namespace. This is not about selective visibility.)
>>
>> I'm not sure this clarifies things...
>>
>>>> PID namespaces allow containers to migrate to a new host
>>>>        while the processes inside  the  container  maintain  the  =
same
>>>>        PIDs.
>>>
>>>
>>> I thought suspend/resume a container was the simple case. Migration=
 to a new
>>> host is built on top of that. (On resume in a new container on the =
same
>>> system, if other stuff is going on in the system so the available P=
IDs have
>>> shifted.)
>>
>> I'll add some words here on suspend/resume.
>>
>>>>        Likewise, a process in an ancestor namespace can=E2=80=94su=
bject to the
>>>>        usual permission checks described in  kill(2)=E2=80=94send =
 signals  to
>>>>        the  "init" process of a child PID namespace only if the "i=
nit"
>>>>        process has established a handler for that signal.  (Within=
 the
>>>>        handler,  the  siginfo_t si_pid field described in sigactio=
n(2)
>>>>        will be zero.)  SIGKILL or SIGSTOP are  treated  exceptiona=
lly:
>>>>        these signals are forcibly delivered when sent from an ance=
stor
>>>>        PID namespace.  Neither of these signals can be caught  by =
 the
>>>>        "init" process, and so will result in the usual actions ass=
oci=E2=80=90
>>>>        ated with those signals (respectively, terminating and stop=
ping
>>>>        the process).
>>>
>>>
>>> If SIGKILL to init is propogated to all the children of init, is SI=
GSTOP
>>> also propogated to all the children? (I.E. will SIGSTOP to containe=
r's init
>>> suspend the whole container, and will SIGCONT resume the whole cont=
ainer? If
>>> the latter, will it only resume processes that weren't previously s=
topped?
>>> :)
>>
>> Covered by Eric.
>>
>>>>        To put things another way: a process's PID namespace member=
ship
>>>>        is determined when the process is created and cannot be cha=
nged
>>>>        thereafter.  Among other things, this means that  the  pare=
ntal
>>>>        relationship between processes mirrors the parental between=
 PID
>>>
>>>
>>> mirrors the relationship
>>
>> Thanks.
>>
>>>>        namespaces: the parent of a  process  is  either  in  the  =
same
>>>>        namespace or resides in the immediate parent PID namespace.
>>>>
>>>>        Every  thread  in  a process must be in the same PID namesp=
ace.
>>>>        For this reason, the two following call sequences will fail=
:
>>>>
>>>>            unshare(CLONE_NEWPID);
>>>>            clone(..., CLONE_VM, ...);    /* Fails */
>>>>
>>>>            setns(fd, CLONE_NEWPID);
>>>>            clone(..., CLONE_VM, ...);    /* Fails */
>>>
>>>
>>> They fail with -EUNDOCUMENTED
>>
>> Added EINVAL, as per Eric's reply. (Eric does that error also apply
>> for the two new cases you added?).
>>
>>>>        Because the above unshare(2) and setns(2) calls only change=
 the
>>>>        PID  namespace  for created children, the clone(2) calls ne=
ces=E2=80=90
>>>>        sarily put the new thread in a different PID namespace from=
 the
>>>>        calling thread.
>>>
>>>
>>> Um, no they don't. They fail. That's the point.
>>
>> (Good catch.)
>>
>>> They _would_ put the new
>>> thread in a different PID namespace, which breaks the definition of=
 threads.
>>>
>>> How about:
>>>
>>> The above unshare(2) and setns(2) calls change the PID namespace of
>>> children created by subsequent clone(2) calls, which is incompatibl=
e
>>> with CLONE_VM.
>>
>> I decided on:
>>
>>        The  point  here is that unshare(2) and setns(2) change the P=
ID
>>        namespace for created children but not for the calling proces=
s,
>>        while  clone(2) CLONE_VM specifies the creation of a new thre=
ad
>>        in the same process.
>
> Can we make that "for all new tasks created" instead of "created
> children"
>
> Othewise someone might expect CLONE_THREAD would work as you
> CLONE_THREAD creates a thread and not a child...

The term "task" is kernel-space talk that rarely appears in man pages,
so I am reluctant to use it.

How about this:

       The  point  here is that unshare(2) and setns(2) change the PID
       namespace for processes subsequently created by the caller, but
       not  for the calling process, while clone(2) CLONE_VM specifies
       the creation of a new thread in the same process.

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
