From: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: futex(3) man page, final draft for pre-release review
Date: Fri, 18 Dec 2015 13:26:30 +0100
Message-ID: <1450441590.26597.74.camel@localhost.localdomain>
References: <56701916.4090203@gmail.com>
	 <20151215224119.GA28877@linux-uzut.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151215224119.GA28877-95RKjC4jbl+7r5TWoziOLQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>, Jakub Jelinek <jakub-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, bill o gallmeister <bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bert hubert <bert.hubert-dxZxOz86jR8sYtaaK7K+xw@public.gmane.org>, Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Daniel Wagner <wagi-kQCPcA+X3s7YtjvyW6yDsg@public.gmane.org>, Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, Jonathan Wakely <jwakely-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mik
List-Id: linux-man@vger.kernel.org

On Tue, 2015-12-15 at 14:41 -0800, Davidlohr Bueso wrote:
> On Tue, 15 Dec 2015, Michael Kerrisk (man-pages) wrote:
> 
> >       When executing a futex operation that requests to block a thread,
> >       the kernel will block only if the futex word has the  value  that
> >       the  calling  thread  supplied  (as  one  of the arguments of the
> >       futex() call) as the expected value of the futex word.  The load???
> >       ing  of the futex word's value, the comparison of that value with
> >       the expected value, and the actual blocking  will  happen  atomi???
> >
> >FIXME: for next line, it would be good to have an explanation of
> >"totally ordered" somewhere around here.
> >
> >       cally  and totally ordered with respect to concurrently executing
> >       futex operations on the same futex word.
> 
> So there are two things here regarding ordering. One is the most obvious
> which is ordered due to the taking/dropping the hb spinlock.

I suppose that this means what is described in the manpage already?
That is, that futex operations (ie, the syscalls) are atomic wrt each
other and in a strict total order?

> Secondly, its
> the cases which Peter brought up a while ago that involves atomic futex ops
> futex_atomic_*(), which	do not have clearly defined semantics, and you get
> inconsistencies with certain archs (tile being the worst iirc).

OK.  So, from a user's POV, this is about the semantics of the kernel's
accesses to the futex word.  I agree that specifying this more clearly
would be helpful.

First, there are the comparisons of the futex words used in, for
example, FUTEX_WAIT.  They should use an atomic load within the
conceptual critical sections that make up futex operations.  This load
itself doesn't need to establish any ordering, so it can be equivalent
to a C11 memory_order_relaxed load.  Are there any objections to that?

Second, We have the write accesses in FUTEX_[TRY]LOCK_PI and
FUTEX_UNLOCK_PI.  We already specify those as atomic and within the
conceptual critical sections of the futex operation.  In addition, they
should establish ordering themselves, so C11 have memory_order_acquire /
memory_order_release semantics.  Specifying this would be good.  Any
objections to these semantics?

Third, we have the atomic read-modify-write operation that is part of
FUTEX_WAKE_OP (ie, AFAIU, the case you pointed at specifically).  I
don't have a strong opinion on what it should be, because I think
userspace can enforce the orderings it needs on its own (eg, if I
interpret Peter Zijlstra's example correctly, userspace can add
appropriate fences before the CPU0/futex_unlock and after the
CPU2/futex_load calls).  FUTEX_WAKE_OP accesses no other userspace
memory location, so there's no ordering relation to other accesses to
userspace memory that userspace cannot affect.
OTOH, legacy userspace may have assumed strong semantics, so making the
read-modify-write have memory_order_seq_cst semantics is probably a safe
bet.  Futex operations typically shouldn't be on the fast paths anyway.

> But anyway, the important thing users need to know about is that the atomic
> futex operation must be totally ordered wrt any other user tasks that are trying
> to access that address.

I'm not sure what you mean precisely.  One can't order the whole futex
operations totally wrt memory accesses by userspace because they'd need
to synchronize to do that, and thus userspace would to hvae either hook
into the kernel's synchronization or use HTM or such.

> This is not necessarily the case for kernel ops. Peter
> illustrates this nicely with lock stealing example; 
> (see https://lkml.org/lkml/2015/8/26/596).
> 
> Internally, I believe we decided that making it fully ordered (as opposed to
> making use of implicit barriers for ACQUIRE/RELEASE), so you'd endup having
> an MB ll/sc MB kind of setup.

OK.  So, any objections to documenting that the read-modify-write op in
FUTEX_WAKE_OP has memory_order_seq_cst semantics?

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
