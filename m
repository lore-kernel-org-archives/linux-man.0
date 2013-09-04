From: Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>
Subject: Re: [PATCH] clock_getres.2: Remove obsolete note on SMP systems
Date: Wed, 4 Sep 2013 14:32:17 +0100
Message-ID: <20130904133217.GC12620@sdfg.com.ar>
References: <1378202731-29738-1-git-send-email-rodrigo@sdfg.com.ar>
 <1378202731-29738-2-git-send-email-rodrigo@sdfg.com.ar>
 <CAKgNAkj_SumnwDQ=rxSBubybzOSTS9u0RjDBSR-1=KrTK7=L_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkj_SumnwDQ=rxSBubybzOSTS9u0RjDBSR-1=KrTK7=L_A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Sep 04, 2013 at 02:32:49PM +0200, Michael Kerrisk (man-pages) wrote:
> Hi Rodrigo,
> 
> On Tue, Sep 3, 2013 at 12:05 PM, Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org> wrote:
> > As confirmed by peterz on IRC, this note is obsolete:
> >
> >         <peterz> rata: that section is obsolete; CLOCK_THREAD_CPUTIME_ID is good
> >         <peterz> rata: CLOCK_PROCESS_CPUTIME_ID is also correct
> >
> > So this patch just removes it.
> 
> Clearly, the page needs amending. However, ideal would be to describe
> *when* the section became obsolete (which kernel version). Do you or
> Peter know, or have an idea how we can determine that information?

I don't know. But looking at the git repo, it seems in the first git commit
(1da177e4c3f41524e886b7f1b8a0c1fc7321cac2) it was already safe, because
in kernel/posix-cpu-timers.c cpu_clock_sample() uses the scheduler to get the
value. And the basic pattern:

	posix_cpu_clock_get() --> posix_cpu_clock_get() --> cpu_clock_sample()

(for the case of CLOCK_THREAD_CPUTIME_ID) seems unchanged. So, if I guess it was
safe on those days too.

And for CLOCK_PROCESS_CPUTIME_ID, something similar happens if I follow the code
correctly. The call chain I see is:

	process_cpu_clock_get() --> posix_cpu_clock_get() -->
	cpu_clock_sample_group() --> cpu_clock_sample_group_locked()

And if I follow the clock macros correctly, ends up calling
cpu_clock_sample_group_locked() with CPUCLOCK_SCHED, which calls the scheduler
and I *expect* that to be safe too.

But I would **really** like if Peter can confirm this, as I really don't know :-)



Btw, if in the first git commit it was safe, should I try to look to the history
before it ?




Thanks a lot,
Rodrigo
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
