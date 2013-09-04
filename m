From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clock_getres.2: Remove obsolete note on SMP systems
Date: Wed, 4 Sep 2013 17:01:26 +0200
Message-ID: <CAKgNAkjwVc3HLOL0n5upE5rOgqCN3TYGacrWMOzJ=uyv1mbHUg@mail.gmail.com>
References: <1378202731-29738-1-git-send-email-rodrigo@sdfg.com.ar>
 <1378202731-29738-2-git-send-email-rodrigo@sdfg.com.ar> <CAKgNAkj_SumnwDQ=rxSBubybzOSTS9u0RjDBSR-1=KrTK7=L_A@mail.gmail.com>
 <20130904133217.GC12620@sdfg.com.ar>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130904133217.GC12620-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Christoph Lameter <cl-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC=3D+Christoph Lameter, since it looks likes he wrote that text in th=
e
man page, and I hope he might be able to offer some insight.]

Christoph, the text we're talking about is the "Note for SMP systems"
that you wrote for the clock_getres() man page, back around 2004.:

   Note for SMP systems
       The CLOCK_PROCESS_CPUTIME_ID and CLOCK_THREAD_CPUTIME_ID
       clocks are realized on many platforms using timers  from
       the CPUs (TSC on i386, AR.ITC on Itanium).  These regis=E2=80=90
       ters may differ between CPUs and as a consequence  these
       clocks may return bogus results if a process is migrated
       to another CPU.

       If the CPUs  in  an  SMP  system  have  different  clock
       sources  then  there is no way to maintain a correlation
       between the timer registers since each CPU will run at a
       slightly  different frequency.  If that is the case then
       clock_getcpuclockid(0) will  return  ENOENT  to  signify
       this condition.  The two clocks will then be useful only
       if it can be ensured that a process stays on  a  certain
       CPU.

       The  processors  in  an  SMP  system do not start all at
       exactly the same time and therefore the timer  registers
       are  typically running at an offset.  Some architectures
       include code that attempts to  limit  these  offsets  on
       bootup.   However,  the  code  cannot guarantee to accu=E2=80=90
       rately tune the offsets.  Glibc contains  no  provisions
       to  deal  with  these offsets (unlike the Linux Kernel).
       Typically these offsets  are  small  and  therefore  the
       effects may be negligible in most cases.

On Wed, Sep 4, 2013 at 3:32 PM, Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org> wr=
ote:
> On Wed, Sep 04, 2013 at 02:32:49PM +0200, Michael Kerrisk (man-pages)=
 wrote:
>> Hi Rodrigo,
>>
>> On Tue, Sep 3, 2013 at 12:05 PM, Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org=
> wrote:
>> > As confirmed by peterz on IRC, this note is obsolete:
>> >
>> >         <peterz> rata: that section is obsolete; CLOCK_THREAD_CPUT=
IME_ID is good
>> >         <peterz> rata: CLOCK_PROCESS_CPUTIME_ID is also correct
>> >
>> > So this patch just removes it.
>>
>> Clearly, the page needs amending. However, ideal would be to describ=
e
>> *when* the section became obsolete (which kernel version). Do you or
>> Peter know, or have an idea how we can determine that information?
>
> I don't know. But looking at the git repo, it seems in the first git =
commit
> (1da177e4c3f41524e886b7f1b8a0c1fc7321cac2) it was already safe,

So, some history: CLOCK_THREAD_CPUTIME_ID and CLOCK_PROCESS_CPUTIME_ID
first appeared in 2.6.12, as far as I know.

Your suggesting that these clocks were safe in 2.6.12-rc2 (April
2005). At this point, I'm confused. AFAICT, Christoph wrote his text
in mid-2004, quite some time before 2.61.12 was released with the
initial CLOCK_THREAD_CPUTIME_ID and CLOCK_PROCESS_CPUTIME_ID
implementations. The thing is, Christoph, is usually pretty sharp, so
I assume that he was talking about something that was true at some
point, but it's unclear to me when that point could have been, since
the timelines don't seem to match up (unless, of course, your
suppositions are wrong, Rodrigo, but I'm not assuming that at this
point).

> in kernel/posix-cpu-timers.c cpu_clock_sample() uses the scheduler to=
 get the
> value. And the basic pattern:
>
>         posix_cpu_clock_get() --> posix_cpu_clock_get() --> cpu_clock=
_sample()
>
> (for the case of CLOCK_THREAD_CPUTIME_ID) seems unchanged. So, if I g=
uess it was
> safe on those days too.
>
> And for CLOCK_PROCESS_CPUTIME_ID, something similar happens if I foll=
ow the code
> correctly. The call chain I see is:
>
>         process_cpu_clock_get() --> posix_cpu_clock_get() -->
>         cpu_clock_sample_group() --> cpu_clock_sample_group_locked()
>
> And if I follow the clock macros correctly, ends up calling
> cpu_clock_sample_group_locked() with CPUCLOCK_SCHED, which calls the =
scheduler
> and I *expect* that to be safe too.
>
> But I would **really** like if Peter can confirm this, as I really do=
n't know :-)
>
>
>
> Btw, if in the first git commit it was safe, should I try to look to =
the history
> before it ?

Let's see is Christoph or Peter has something to say.

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
