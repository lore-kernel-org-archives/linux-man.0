From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] man ptrace: add extended description of various ptrace quirks
Date: Mon, 3 Oct 2011 07:27:22 +0200
Message-ID: <CAKgNAkj8tjBk1mXO6WhwUyeZDrRC5ECzHXLzPQ0PCpbr34D4_A@mail.gmail.com>
References: <CAK1hOcPFXMoYsP6N6Hx5Qz3J4xj31TmSj7xo6SRVPegNCbhx7g@mail.gmail.com>
 <CAKgNAkicbgpSLZE6Wn_5ickGojJuGd4x2vMUG0491OB+O1Z_HA@mail.gmail.com> <CAK1hOcNEBFOd1MR6L+Fdj0paAGacmrepbyPmpT_J9wBQ7bxx=Q@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK1hOcNEBFOd1MR6L+Fdj0paAGacmrepbyPmpT_J9wBQ7bxx=Q@mail.gmail.com>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denys Vlasenko <vda.linux-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jan Kratochvil <jan.kratochvil-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Blaisorblade <blaisorblade-whZMOeQn8C0@public.gmane.org>, Daniel Jacobowitz <dan-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Denys,

Thanks for the detailed responses. Some comments to your remarks
below, and a couple of open questions (marked "????"). If you send me
the answers, then I can get another draft for review.

On Fri, Sep 30, 2011 at 4:14 PM, Denys Vlasenko
<vda.linux-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> On Thu, Sep 29, 2011 at 9:08 PM, Michael Kerrisk <mtk.manpages@gmail.=
com> wrote:
>> [CC+=3Dlinux-man + a few other possibly interested individuals]
>>
>> Hello Denys, (Oleg, Tejun),
>>
>> On Thu, Jul 21, 2011 at 1:09 PM, Denys Vlasenko
>> <vda.linux-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>>> Hi Michael,
>>>
>>> Please apply attached patch which updates ptrace manpage.
>>> (I'm not sending it inline, google web mail might mangle it. Sorry)=
=2E
>>
>> Thanks once again for this nice piece of work. Some comments, and a
>> revised page below.
>>
>>> Changes include:
>>>
>>> s/parent/tracer/g, s/child/tracee/g - ptrace interface now
>>> is sufficiently cleaned up to not treat tracing process as parent.
>>
>> Thanks!
>>
>>> Deleted several outright false statements:
>>> - pid 1 can be traced
>>
>> It looks to me as though this was once true, and I amended the page
>> accordingly. (Man-pages documents not just current behavior, but
>> historical behavior too.)
>>
>>> - tracer is not shown as parent in ps output
>>
>> Was this true at one time? If yes, then we should document past and
>> current behavior, and note when the change occurred.
>
> It stopped being true VERY long ago (think Linux 2.2 or even before).

Okay -- then I think we can drop it. (I'd ideally have wanted a note
somewhere describing the ancient behavior, and when it changed. But
when it's that long ago, it may be too much trouble to make the
details accurate.)


>>> - SIGSTOP _can_ be injected.
>>
>> Was this true at one time? If yes, then we should document past and
>> current behavior, and note when the change occurred.
>>
>> In the Linux 2.4 sources, I see the following in
>> arch/i386/kernel/signal.c::do_signal():
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* The debugger conti=
nued. =A0Ignore SIGSTOP. =A0*/
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (signr =3D=3D SIGS=
TOP)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0conti=
nue;
>>
>> Did that code prevent SIGSTOP being injected in the 2.4 series?
>
> Looks like it is indeed the code.

????
Sorry -- I'm not quite clear there. You're confirming that SIGSTOP
could not be injected in 2.4, right?


>> Rather than you writing a new patch to this version of the page, I
>> think it might be easiest if you just replied to the FIXMEs inline
>> below, then I can revise the page in the light of your comments.
>
> Ok --
>
>
> .\" FIXME Please check. In the following paragraphs, I substituted la=
nguage
> .\" such as:
> .\" =A0 =A0 Stop tracee at next fork(2) call with SIGTRAP|PTRACE_EVEN=
T_FORK<<8
> .\" with:
> .\" =A0 =A0 Stop tracee at next fork(2) call... A subsequent PTRACE_G=
ETSIGINFO
> .\" =A0 =A0 on the stopped tracee will return a siginfo_t structure w=
ith si_code
> .\" =A0 =A0 set to SIGTRAP|PTRACE_EVENT_FORK<<8.
> .\"
> .\" Is this change correct?
>
> No, it is not correct.
> SIGTRAP|PTRACE_EVENT_FORK<<8 value is returned in waitpid status word=
=2E
> See "PTRACE_EVENT stops" section.
>
> No need to do PTRACE_GETSIGINFO.
> Rememeber, requiring PTRACE_GETSIGINFO on every ptrace stop
> is a performance hit.

Thanks. So I'll change that sentence (and the others):

A subsequent PTRACE_GETSIGINFO on the stopped tracee will return a
siginfo_t structure with si_code set to SIGTRAP|PTRACE_EVENT_FORK<<8.

to:

A waitpid() by the tracer will return SIGTRAP|PTRACE_EVENT_FORK<<8 as
the status of the tracee.

> .B PTRACE_ATTACH
> Attach to the process specified in
> .IR pid ,
> making it a tracee of the calling process.
> .\" FIXME So, was the following EVER true? IF it was,
> .\" =A0 =A0 =A0 we should reinstate the text and add mention of
> .\" =A0 =A0 =A0 the kernel version where the behaviour changed.
> .\"
> .\" Not true: (removed by dv)
> .\" ; the behavior of the tracee is as if it had done a
> .\" .BR PTRACE_TRACEME .
> .\" The calling process actually becomes the parent of the tracee
> .\" process for most purposes (e.g., it will receive
> .\" notification of tracee events and appears in
> .\" .BR ps (1)
> .\" output as the tracee's parent), but a
> .\" .BR getppid (2)
> .\" by the tracee will still return the PID of the original parent.
>
> I think it isn't true in non-ancient 2.4 and in 2.6/3.x.
> Basically, it's not true for any Linux in practical use.

Okay.

> The tracer can't assume that the tracee
> .I always
> ends its life by reporting
> .I WIFEXITED(status)
> or
> .IR WIFSIGNALED(status) .
> .LP
> .\" =A0 =A0 or can it? Do we include such a promise into ptrace API?
> .\"
> .\" FIXME: The preceding comment seems to be unresolved?
> .\" =A0 =A0 =A0 =A0Do you want to add anything?
> .\"
>
> I know at least one case when tracee disappears without ever reportin=
g
> WIFEXITED(status) or WIFSIGNALED(status): if thread other than
> thread group leader execs, it disappears - its pid will never be seen
> again, any subsequent ptrace stops will be reported under thread grou=
p
> leader's pid.
>
> Maybe this example (and all other examples we will discover later)
> should be explicitly given here.

Okay. I've added that text.

The tracer can't assume that the tracee
=2EI always
ends its life by reporting
=2EI WIFEXITED(status)
or
=2EIR WIFSIGNALED(status) ;
there are cases where this does not occur.
=46or example, if a thread other than thread group leader does an
=2EBR execve (2),
it disappears;
its PID will never be seen again,
and any subsequent ptrace stops will be reported under
the thread group leader's PID.


> .\" FIXME: mtk: the following comment seems to be unresolved?
> .\" =A0 =A0 =A0 =A0Do you want to add anything?
> .\"
> .\" =A0 =A0 Do we require __WALL usage, or will just using 0 be ok? A=
re the
> .\" =A0 =A0 rules different if user wants to use waitid? Will waitid =
require
> .\" =A0 =A0 WEXITED?
> .\"
>
> Still not resolved. For now, I can only say that with __WALL, it work=
s.
> With 0, I am not 100% sure there aren't ugly corner cases.

Okay.


> .LP
> .\" FIXME: Is the following comment "__WALL... implies" true?
> The
> .B __WALL
> flag does not include the
> .B WSTOPPED
> and
> .B WEXITED
> flags, but implies their functionality.
>
> Yes, it's true.

Okay.


> They may be differentiated by examining the value
> .IR status>>8 ,
> and if there is ambiguity in that value, by querying
> .BR PTRACE_GETSIGINFO .
> .\"
> .\" FIXME What is the purpose of the following sentence? Is it to war=
n
> .\" =A0 =A0 =A0 the reader not to use WSTOPSIG()? If so, we should ma=
ke that
> .\" =A0 =A0 =A0 point more explicitly.
> (Note: the
> .I WSTOPSIG(status)
> macro returns the value
> .IR "(status>>8)\ &\ 0xff)" .)
>
> Yes. The purpose of this text is to say that WSTOPSIG() can't be used
> to check for PTRACE_EVENT stops. This won't work:
>
> =A0 =A0if (WSTOPSIG(status) =3D=3D (SIGTRAP | (PTRACE_EVENT_foo << 8)=
)) ...
>
> There are no macros for this, one needs to open-code it:
>
> =A0 =A0unsigned sig_and_event =3D status >> 8;
> =A0 =A0if (sig_and_event =3D=3D (SIGTRAP | (PTRACE_EVENT_foo << 8))) =
=2E..

Thanks. I added some words to the page to make this clear to the reader=
=2E


> If the tracer doesn't suppress the signal,
> .\"
> .\" FIXME: I added the word "restart" to the following line. Okay?
> it passes the signal to the tracee in the next ptrace restart request=
=2E
>
> Yes, it's ok.

Thanks.


> .\"
> .\" FIXME: the referrent of "This" in the next line is not clear.
> .\" =A0 =A0 =A0 =A0What does "This" refer to?
> This is a cause of confusion among ptrace users.
> One typical scenario is that the tracer observes group-stop,
> mistakes it for signal-delivery-stop, restarts the tracee with
> =A0 =A0ptrace(PTRACE_rest, pid, 0, stopsig)
> with the intention of injecting
> .IR stopsig ,
> but
> .I stopsig
> gets ignored and the tracee continues to run.
>
> "This" refers to the ptrace behavior of ignoring 'sig' argument
> on restarting ptrace commands if ptrace-stop is not a
> signal-delivery-stop. The confusion even reached ptrace manpage.
> The reason manpage used to claim that SIGSTOP
> can't be injected is because people were trying to inject it
> in the wrong ptrace-stop, which of course doesn't work.

Okay. I replaced "This" with some of your words above.


> As of kernel 2.6.38,
> after the tracer sees the tracee ptrace-stop and until it
> restarts or kills it, the tracee will not run,
> and will not send notifications (except
> .B SIGKILL
> death) to the tracer, even if the tracer enters into another
> .BR waitpid (2)
> call.
> .LP
> .\"
> .\" FIXME ??? referrent of "it" in the next line is unclear
> .\" =A0 =A0 =A0 =A0What does "it" refer to?
> Currently, it causes a problem with transparent handling of stopping
> signals: if the tracer restarts the tracee after group-stop,
> .B SIGSTOP
> is effectively ignored: the tracee doesn't remain stopped, it runs.
> If the tracer doesn't restart the tracee before entering into the nex=
t
> .BR waitpid (2),
> future
> .B SIGCONT
> signals will not be reported to the tracer.
> This would cause
> .B SIGCONT
> to have no effect.
>
> "it" refers to ptrace behavior versus group-stops and SIGCONT,
> as described. Feel free to rephrase.

????
Help! I'm still having problems here. The problem may possibly be
this: when one uses a pronoun like "it" in English, it's normally a
back reference to some text already given. Is this "it" a back
reference (In that case, could you please send me a rewritten version
of the sentence that replaces "it" by some descriptive text), or is it
a reference to the current paragraph (in other words, should this
paragraph rather start with the words "Currently, here is a problem
with...")?


> Syscall-stops can be distinguished from signal-delivery-stop with
> .B SIGTRAP
> by querying
> .BR PTRACE_GETSIGINFO
> for the following cases:
> .TP
> .IR si_code " <=3D 0"
> .B SIGTRAP
> .\" FIXME: Please confirm this is okay: I changed
> .\" =A0 =A0 =A0 =A0"the usual suspects" to "by a system call". Okay?
> .\" =A0 =A0 =A0 =A0Shouldn't we also add kill(2) here?
> was sent by a system call
> .RB ( tgkill (2),
> .BR sigqueue (3),
> etc.)
>
> No, it is not ok. Please consult sigaction(2) manpage and
> /usr/include/bits/siginfo.h
> For example, si_code =3D=3D SI_TIMER (-2) can be sent by timer
> expiration, which is not a system call. There are many other signal
> sources which are not systcalls.

Okay. So how about the following:

was delivered as a result of a userspace action,
for example, a direct system call
=2ERB ( tgkill (2),
=2EBR kill (2),
=2EBR sigqueue (3),
etc.),
expiration of a POSIX timer,
change of state on a POSIX message queue,
or completion of an asynchronous I/O request.


> However, syscall-stops happen very often (twice per system call),
> and performing
> .B PTRACE_GETSIGINFO
> for every syscall-stop may be somewhat expensive.
> .LP
> .\"
> .\" FIXME referrent of "them" in next line ???
> .\" =A0 =A0 =A0 What does "them" refer to?
> Some architectures allow the cases to be distinguished
> by examining registers.
> For example, on x86,
> .I rax
> =3D=3D
> .RB - ENOSYS
> in syscall-enter-stop.
>
> I don't see word "them" anywhere in that line...

Hmmm -- not sure what happened there. Ignore!


> .\"
> .\" FIXME I significantly rewrote the following sentence to try to ma=
ke it
> .\" clearer. Is the meaning still preserved?
> The design bug here is that a ptrace attach and a concurrently delive=
red
> .B SIGSTOP
> may race and the concurrent
> .B SIGSTOP
> may be lost.
>
> Yes, it looks ok.

Thanks.


> .SS execve(2) under ptrace
> .\" clone(2) THREAD_CLONE says:
> .\" =A0 =A0 If =A0any =A0of the threads in a thread group performs an=
 execve(2),
> .\" =A0 =A0 then all threads other than the thread group leader are t=
erminated,
> .\" =A0 =A0 and the new program is executed in the thread group leade=
r...
> .\"
> .\" FIXME mtk-addition: =A0please check: I added the following piece =
to
> .\" =A0 =A0 =A0 clarify that multithreaded here means clone()+CLONE_T=
HREAD
> .\"
> When one thread in a multithreaded process
> (i.e., a thread group consisting of threads created using the
> .BR clone (2)
> .B CLONE_THREAD
> flag) calls
> .\" FIXME end-mtk-addition
> .\"
>
> I think this addition is not necessary. If someone reached this point
> reading the documentation and he still doesn't understand what is mea=
nt
> by 'multithreaded' in this context, no amount of clarification will h=
elp
> that person...

Agreed, the text comes too late.

But (because the definition of thread is different in different
contexts--for example Pthreads) I think it's needed to make clear to
the reader what the definition of "multithreaded process" is for
purposes of the discussion on this man page. So, I moved that text
much close to the start of this page.


> .\"
> .\" FIXME mtk-addition: =A0please check: I added the following piece:
> (Or, to put things another way, when a multithreaded process does an
> .BR execve (2),
> the kernel makes it look as though the
> .BR execve (2)
> occurred in the thread group leader, regardless of which thread did t=
he
> .BR execve (2).)
> .\" FIXME end-mtk-addition
> .\"
>
> This is not exactly true. If tracer is tracking syscall entry/exit
> (e.g. strace),
> the entry into execve will be seen happening in the execing thread,
> but corresponding syscall exit will happen in thread leader.
> This doesn't look exactly like "execve occurred in the thread group l=
eader"!

True. I've changed it to:

(Or, to put things another way, when a multithreaded process does an
=2EBR execve (2),
at completion of the call, it appears as though the
=2EBR execve (2)
occurred in the thread group leader, regardless of which thread did the
=2EBR execve (2).)


> All other threads stop in
> .\" FIXME: mtk: What is "PTRACE_EXIT stop"?
> .\" =A0 =A0 =A0 =A0Should that be "PTRACE_EVENT_EXIT stop"?
> .B PTRACE_EXIT
> stop,
>
> Correct, it meant to be PTRACE_EVENT_EXIT

Thanks.


> .\" FIXME: mtk: In the next line, "by active ptrace option" is unclea=
r.
> .\" =A0 =A0 =A0 =A0What does it mean?
> if requested by active ptrace option.
>
> It means "if PTRACE_O_TRACEEXIT option was turned on".

Thanks; I made that change, and a similar one just below for PTRACE_EVE=
NT_EXEC


> .\"
> .\" FIXME Does "exits" in the following mean
> .\" just "_exit(2)" or or both "_exit(2) and exit_group(2)"?
> If a thread group leader is traced and exits by calling
> .BR _exit (2),
> a
> .B PTRACE_EVENT_EXIT
> stop will happen for it (if requested), but the subsequent
> .B WIFEXITED
> notification will not be delivered until all other threads exit.
>
> Here "exits" means any kind of death - _exit, exit_group,
> signal death. Signal death and exit_group cases are trivial,
> though: since signal death and exit_group kill all other threads
> too, "until all other threads exit" thing happens rather soon
> in these cases. Therefore, only _exit presents observably
> puzzling behavior to ptrace users: thread leader _exit's,
> but WIFEXITED isn't reported! We are trying to explain here
> why it is so.

Okay -- thanks.


> (Note: the
> .I WSTOPSIG(status)
> macro returns the value
> .IR "(status>>8)\ &\ 0xff)" .)
>
> Unpaired parentheses in the fragment above.
> I suggest:
>
> .IR "((status>>8)\ &\ 0xff)" .)

Thanks. Fixed now.

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
