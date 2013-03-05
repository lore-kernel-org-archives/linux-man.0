From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: For review: pid_namespaces(7) man page
Date: Tue, 5 Mar 2013 09:37:05 +0100
Message-ID: <CAKgNAkgqE7owqsmD+9-9fZtzMQ76H53a+Aat0CH670jNTUfbFA@mail.gmail.com>
References: <CAKgNAki=mUYuu_Ewhe7sjCmo+Dq2Vr+FZCixqNRaadcvAxtpFw@mail.gmail.com>
 <1362110504.15531.4@driftwood> <CAKgNAkgVKnhRT1Lpq4a_UdBKB+tn6XmWSDF2QJXG0aSLtNH6dg@mail.gmail.com>
 <87wqtr3zg5.fsf@xmission.com> <CAKgNAkjGD0FdQqpA+rYR=+Yc5uVPB8mE5JjCqy-5WS85cPsvng@mail.gmail.com>
 <87k3pnhx2k.fsf@xmission.com> <CAKgNAkjYmvjMzC+nYqsjHf4bQn2ZwdE5wawoP2p32ZSo+0dfcQ@mail.gmail.com>
 <87r4jucprp.fsf@xmission.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87r4jucprp.fsf-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Containers <containers-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Mar 5, 2013 at 7:41 AM, Eric W. Biederman <ebiederm-aS9lmoZGLiXQFizaE/u3fw@public.gmane.org=
m> wrote:
> "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
>> Eric,
>>
>> On Mon, Mar 4, 2013 at 6:52 PM, Eric W. Biederman
>> <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org> wrote:
>>> "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>>
>>>> On Fri, Mar 1, 2013 at 4:35 PM, Eric W. Biederman
>> <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org> wrote:
>>>>> "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>>>>
>>>>>> Hi Rob,
>>>>>>
>>>>>> On Fri, Mar 1, 2013 at 5:01 AM, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
>> wrote:
>>>>>>> On 02/28/2013 05:24:07 AM, Michael Kerrisk (man-pages) wrote:
>> [...]
>>>>>>>> Because the above unshare(2) and setns(2) calls only change th=
e
>>>>>>>> PID namespace for created children, the clone(2) calls neces=E2=
=80=90
>>>>>>>> sarily put the new thread in a different PID namespace from th=
e
>>>>>>>> calling thread.
>>>>>>>
>>>>>>>
>>>>>>> Um, no they don't. They fail. That's the point.
>>>>>>
>>>>>> (Good catch.)
>>>>>>
>>>>>>> They _would_ put the new
>>>>>>> thread in a different PID namespace, which breaks the definitio=
n
>> of threads.
>>>>>>>
>>>>>>> How about:
>>>>>>>
>>>>>>> The above unshare(2) and setns(2) calls change the PID namespac=
e
>> of
>>>>>>> children created by subsequent clone(2) calls, which is
>> incompatible
>>>>>>> with CLONE_VM.
>>>>>>
>>>>>> I decided on:
>>>>>>
>>>>>> The point here is that unshare(2) and setns(2) change the PID
>>>>>> namespace for created children but not for the calling process,
>>>>>> while clone(2) CLONE_VM specifies the creation of a new thread
>>>>>> in the same process.
>>>>>
>>>>> Can we make that "for all new tasks created" instead of "created
>>>>> children"
>>>>>
>>>>> Othewise someone might expect CLONE_THREAD would work as you
>>>>> CLONE_THREAD creates a thread and not a child...
>>>>
>>>> The term "task" is kernel-space talk that rarely appears in man
>> pages,
>>>> so I am reluctant to use it.
>>>
>>> With respect to clone and in this case I am not certain we can
>> properly
>>> describe what happens without talking about tasks. But it is worth
>>> a try.
>>>
>>>
>>>> How about this:
>>>>
>>>> The point here is that unshare(2) and setns(2) change the PID
>>>> namespace for processes subsequently created by the caller, but
>>>> not for the calling process, while clone(2) CLONE_VM specifies
>>>> the creation of a new thread in the same process.
>>>
>>> Hmm. How about this.
>>>
>>> The point here is that unshare(2) and setns(2) change the PID
>>> namespace that will be used by in all subsequent calls to clone
>>> and fork by the caller, but not for the calling process, and
>>> that all threads in a process must share the same PID
>>> namespace. Which makes a subsequent clone(2) CLONE_VM
>>> specify the creation of a new thread in the a different PID
>>> namespace but in the same process which is impossible.
>>
>> I did a little tidying:
>>
>> The point here is that unshare(2) and setns(2) change the
>> PID namespace that will be used in all subsequent calls
>> to clone(2) and fork(2), but do not change the PID names=E2=80=90
>> pace of the calling process. Because a subsequent
>> clone(2) CLONE_VM would imply the creation of a new
>> thread in a different PID namespace, the operation is not
>> permitted.
>>
>> Okay?
>
> That seems reasonable.
>
> CLONE_THREAD might be better to talk about.  The check is CLONE_VM
> because it is easier and CLONE_THREAD implies CLONE_THREAD.
>
>> Having asked that, I realize that I'm still not quite comfortable wi=
th
>> this text. I think the problem is really one of terminology. At the
>> start of this passage in the page, there is the sentence:
>>
>> Every thread in a process must be in the
>> same PID namespace.
>>
>> Can you define "thread" in this context?
>
> Most definitely a thread group created with CLONE_THREAD.  It is pret=
ty
> ugly in just the old fashioned CLONE_VM case too, but that might be
> legal.
>
> In a few cases I think the implementation overshoots and test for VM
> sharing instead of thread group membership because VM sharing is easi=
er
> to test for, and we already have tests for that.

So, in summary, the point is that CLONE_VM is being used as a proxy
for CLONE_THREAD because the former is easier to test for, and
CLONE_THREAD requires CLONE_VM, right?

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
