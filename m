From: Denys Vlasenko <vda.linux@googlemail.com>
Subject: Re: [PATCH] man ptrace: add extended description of various ptrace quirks
Date: Fri, 30 Sep 2011 16:14:13 +0200
Message-ID: <CAK1hOcNEBFOd1MR6L+Fdj0paAGacmrepbyPmpT_J9wBQ7bxx=Q@mail.gmail.com>
References: <CAK1hOcPFXMoYsP6N6Hx5Qz3J4xj31TmSj7xo6SRVPegNCbhx7g@mail.gmail.com>
 <CAKgNAkicbgpSLZE6Wn_5ickGojJuGd4x2vMUG0491OB+O1Z_HA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKgNAkicbgpSLZE6Wn_5ickGojJuGd4x2vMUG0491OB+O1Z_HA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mtk.manpages@gmail.com
Cc: Oleg Nesterov <oleg@redhat.com>, Jan Kratochvil <jan.kratochvil@redhat.com>, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, linux-man <linux-man@vger.kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Chuck Ebbert <76306.1226@compuserve.com>, Blaisorblade <blaisorblade@yahoo.it>, Daniel Jacobowitz <dan@debian.org>
List-Id: linux-man@vger.kernel.org

On Thu, Sep 29, 2011 at 9:08 PM, Michael Kerrisk <mtk.manpages@gmail.co=
m> wrote:
> [CC+=3Dlinux-man + a few other possibly interested individuals]
>
> Hello Denys, (Oleg, Tejun),
>
> On Thu, Jul 21, 2011 at 1:09 PM, Denys Vlasenko
> <vda.linux@googlemail.com> wrote:
>> Hi Michael,
>>
>> Please apply attached patch which updates ptrace manpage.
>> (I'm not sending it inline, google web mail might mangle it. Sorry).
>
> Thanks once again for this nice piece of work. Some comments, and a
> revised page below.
>
>> Changes include:
>>
>> s/parent/tracer/g, s/child/tracee/g - ptrace interface now
>> is sufficiently cleaned up to not treat tracing process as parent.
>
> Thanks!
>
>> Deleted several outright false statements:
>> - pid 1 can be traced
>
> It looks to me as though this was once true, and I amended the page
> accordingly. (Man-pages documents not just current behavior, but
> historical behavior too.)
>
>> - tracer is not shown as parent in ps output
>
> Was this true at one time? If yes, then we should document past and
> current behavior, and note when the change occurred.

It stopped being true VERY long ago (think Linux 2.2 or even before).


>> - SIGSTOP _can_ be injected.
>
> Was this true at one time? If yes, then we should document past and
> current behavior, and note when the change occurred.
>
> In the Linux 2.4 sources, I see the following in
> arch/i386/kernel/signal.c::do_signal():
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* The debugger contin=
ued. =A0Ignore SIGSTOP. =A0*/
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (signr =3D=3D SIGST=
OP)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0contin=
ue;
>
> Did that code prevent SIGSTOP being injected in the 2.4 series?

Looks like it is indeed the code.


> Rather than you writing a new patch to this version of the page, I
> think it might be easiest if you just replied to the FIXMEs inline
> below, then I can revise the page in the light of your comments.

Ok --


=2E\" FIXME Please check. In the following paragraphs, I substituted la=
nguage
=2E\" such as:
=2E\"     Stop tracee at next fork(2) call with SIGTRAP|PTRACE_EVENT_FO=
RK<<8
=2E\" with:
=2E\"     Stop tracee at next fork(2) call... A subsequent PTRACE_GETSI=
GINFO
=2E\"     on the stopped tracee will return a siginfo_t structure with =
si_code
=2E\"     set to SIGTRAP|PTRACE_EVENT_FORK<<8.
=2E\"
=2E\" Is this change correct?

No, it is not correct.
SIGTRAP|PTRACE_EVENT_FORK<<8 value is returned in waitpid status word.
See "PTRACE_EVENT stops" section.

No need to do PTRACE_GETSIGINFO.
Rememeber, requiring PTRACE_GETSIGINFO on every ptrace stop
is a performance hit.



=2EB PTRACE_ATTACH
Attach to the process specified in
=2EIR pid ,
making it a tracee of the calling process.
=2E\" FIXME So, was the following EVER true? IF it was,
=2E\"       we should reinstate the text and add mention of
=2E\"       the kernel version where the behaviour changed.
=2E\"
=2E\" Not true: (removed by dv)
=2E\" ; the behavior of the tracee is as if it had done a
=2E\" .BR PTRACE_TRACEME .
=2E\" The calling process actually becomes the parent of the tracee
=2E\" process for most purposes (e.g., it will receive
=2E\" notification of tracee events and appears in
=2E\" .BR ps (1)
=2E\" output as the tracee's parent), but a
=2E\" .BR getppid (2)
=2E\" by the tracee will still return the PID of the original parent.

I think it isn't true in non-ancient 2.4 and in 2.6/3.x.
Basically, it's not true for any Linux in practical use.



The tracer can't assume that the tracee
=2EI always
ends its life by reporting
=2EI WIFEXITED(status)
or
=2EIR WIFSIGNALED(status) .
=2ELP
=2E\"     or can it? Do we include such a promise into ptrace API?
=2E\"
=2E\" FIXME: The preceding comment seems to be unresolved?
=2E\"        Do you want to add anything?
=2E\"

I know at least one case when tracee disappears without ever reporting
WIFEXITED(status) or WIFSIGNALED(status): if thread other than
thread group leader execs, it disappears - its pid will never be seen
again, any subsequent ptrace stops will be reported under thread group
leader's pid.

Maybe this example (and all other examples we will discover later)
should be explicitly given here.



=2E\" FIXME: mtk: the following comment seems to be unresolved?
=2E\"        Do you want to add anything?
=2E\"
=2E\"     Do we require __WALL usage, or will just using 0 be ok? Are t=
he
=2E\"     rules different if user wants to use waitid? Will waitid requ=
ire
=2E\"     WEXITED?
=2E\"

Still not resolved. For now, I can only say that with __WALL, it works.
With 0, I am not 100% sure there aren't ugly corner cases.



=2ELP
=2E\" FIXME: Is the following comment "__WALL... implies" true?
The
=2EB __WALL
flag does not include the
=2EB WSTOPPED
and
=2EB WEXITED
flags, but implies their functionality.

Yes, it's true.



They may be differentiated by examining the value
=2EIR status>>8 ,
and if there is ambiguity in that value, by querying
=2EBR PTRACE_GETSIGINFO .
=2E\"
=2E\" FIXME What is the purpose of the following sentence? Is it to war=
n
=2E\"       the reader not to use WSTOPSIG()? If so, we should make tha=
t
=2E\"       point more explicitly.
(Note: the
=2EI WSTOPSIG(status)
macro returns the value
=2EIR "(status>>8)\ &\ 0xff)" .)

Yes. The purpose of this text is to say that WSTOPSIG() can't be used
to check for PTRACE_EVENT stops. This won't work:

    if (WSTOPSIG(status) =3D=3D (SIGTRAP | (PTRACE_EVENT_foo << 8))) ..=
=2E

There are no macros for this, one needs to open-code it:

    unsigned sig_and_event =3D status >> 8;
    if (sig_and_event =3D=3D (SIGTRAP | (PTRACE_EVENT_foo << 8))) ...



If the tracer doesn't suppress the signal,
=2E\"
=2E\" FIXME: I added the word "restart" to the following line. Okay?
it passes the signal to the tracee in the next ptrace restart request.

Yes, it's ok.



=2E\"
=2E\" FIXME: the referrent of "This" in the next line is not clear.
=2E\"        What does "This" refer to?
This is a cause of confusion among ptrace users.
One typical scenario is that the tracer observes group-stop,
mistakes it for signal-delivery-stop, restarts the tracee with
    ptrace(PTRACE_rest, pid, 0, stopsig)
with the intention of injecting
=2EIR stopsig ,
but
=2EI stopsig
gets ignored and the tracee continues to run.

"This" refers to the ptrace behavior of ignoring 'sig' argument
on restarting ptrace commands if ptrace-stop is not a
signal-delivery-stop. The confusion even reached ptrace manpage.
The reason manpage used to claim that SIGSTOP
can't be injected is because people were trying to inject it
in the wrong ptrace-stop, which of course doesn't work.



As of kernel 2.6.38,
after the tracer sees the tracee ptrace-stop and until it
restarts or kills it, the tracee will not run,
and will not send notifications (except
=2EB SIGKILL
death) to the tracer, even if the tracer enters into another
=2EBR waitpid (2)
call.
=2ELP
=2E\"
=2E\" FIXME ??? referrent of "it" in the next line is unclear
=2E\"        What does "it" refer to?
Currently, it causes a problem with transparent handling of stopping
signals: if the tracer restarts the tracee after group-stop,
=2EB SIGSTOP
is effectively ignored: the tracee doesn't remain stopped, it runs.
If the tracer doesn't restart the tracee before entering into the next
=2EBR waitpid (2),
future
=2EB SIGCONT
signals will not be reported to the tracer.
This would cause
=2EB SIGCONT
to have no effect.

"it" refers to ptrace behavior versus group-stops and SIGCONT,
as described. Feel free to rephrase.



Syscall-stops can be distinguished from signal-delivery-stop with
=2EB SIGTRAP
by querying
=2EBR PTRACE_GETSIGINFO
for the following cases:
=2ETP
=2EIR si_code " <=3D 0"
=2EB SIGTRAP
=2E\" FIXME: Please confirm this is okay: I changed
=2E\"        "the usual suspects" to "by a system call". Okay?
=2E\"        Shouldn't we also add kill(2) here?
was sent by a system call
=2ERB ( tgkill (2),
=2EBR sigqueue (3),
etc.)

No, it is not ok. Please consult sigaction(2) manpage and
/usr/include/bits/siginfo.h
=46or example, si_code =3D=3D SI_TIMER (-2) can be sent by timer
expiration, which is not a system call. There are many other signal
sources which are not systcalls.



However, syscall-stops happen very often (twice per system call),
and performing
=2EB PTRACE_GETSIGINFO
for every syscall-stop may be somewhat expensive.
=2ELP
=2E\"
=2E\" FIXME referrent of "them" in next line ???
=2E\"       What does "them" refer to?
Some architectures allow the cases to be distinguished
by examining registers.
=46or example, on x86,
=2EI rax
=3D=3D
=2ERB - ENOSYS
in syscall-enter-stop.

I don't see word "them" anywhere in that line...



=2E\"
=2E\" FIXME I significantly rewrote the following sentence to try to ma=
ke it
=2E\" clearer. Is the meaning still preserved?
The design bug here is that a ptrace attach and a concurrently delivere=
d
=2EB SIGSTOP
may race and the concurrent
=2EB SIGSTOP
may be lost.

Yes, it looks ok.



=2ESS execve(2) under ptrace
=2E\" clone(2) THREAD_CLONE says:
=2E\"     If  any  of the threads in a thread group performs an execve(=
2),
=2E\"     then all threads other than the thread group leader are termi=
nated,
=2E\"     and the new program is executed in the thread group leader...
=2E\"
=2E\" FIXME mtk-addition:  please check: I added the following piece to
=2E\"       clarify that multithreaded here means clone()+CLONE_THREAD
=2E\"
When one thread in a multithreaded process
(i.e., a thread group consisting of threads created using the
=2EBR clone (2)
=2EB CLONE_THREAD
flag) calls
=2E\" FIXME end-mtk-addition
=2E\"

I think this addition is not necessary. If someone reached this point
reading the documentation and he still doesn't understand what is meant
by 'multithreaded' in this context, no amount of clarification will hel=
p
that person...



=2E\"
=2E\" FIXME mtk-addition:  please check: I added the following piece:
(Or, to put things another way, when a multithreaded process does an
=2EBR execve (2),
the kernel makes it look as though the
=2EBR execve (2)
occurred in the thread group leader, regardless of which thread did the
=2EBR execve (2).)
=2E\" FIXME end-mtk-addition
=2E\"

This is not exactly true. If tracer is tracking syscall entry/exit
(e.g. strace),
the entry into execve will be seen happening in the execing thread,
but corresponding syscall exit will happen in thread leader.
This doesn't look exactly like "execve occurred in the thread group lea=
der"!



All other threads stop in
=2E\" FIXME: mtk: What is "PTRACE_EXIT stop"?
=2E\"        Should that be "PTRACE_EVENT_EXIT stop"?
=2EB PTRACE_EXIT
stop,

Correct, it meant to be PTRACE_EVENT_EXIT



=2E\" FIXME: mtk: In the next line, "by active ptrace option" is unclea=
r.
=2E\"        What does it mean?
if requested by active ptrace option.

It means "if PTRACE_O_TRACEEXIT option was turned on".



=2E\"
=2E\" FIXME Does "exits" in the following mean
=2E\" just "_exit(2)" or or both "_exit(2) and exit_group(2)"?
If a thread group leader is traced and exits by calling
=2EBR _exit (2),
a
=2EB PTRACE_EVENT_EXIT
stop will happen for it (if requested), but the subsequent
=2EB WIFEXITED
notification will not be delivered until all other threads exit.

Here "exits" means any kind of death - _exit, exit_group,
signal death. Signal death and exit_group cases are trivial,
though: since signal death and exit_group kill all other threads
too, "until all other threads exit" thing happens rather soon
in these cases. Therefore, only _exit presents observably
puzzling behavior to ptrace users: thread leader _exit's,
but WIFEXITED isn't reported! We are trying to explain here
why it is so.



(Note: the
=2EI WSTOPSIG(status)
macro returns the value
=2EIR "(status>>8)\ &\ 0xff)" .)

Unpaired parentheses in the fragment above.
I suggest:

=2EIR "((status>>8)\ &\ 0xff)" .)

--=20
vda
