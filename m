From: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Fri, 24 Oct 2014 21:15:01 +0200
Message-ID: <1414178101.18538.53.camel@triegel.csb>
References: <544118FA.3070003@gmail.com>
	 <CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	 <54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>
	 <1414056576.8483.79.camel@triegel.csb> <or38adofh9.fsf@free.home>
	 <1414152747.18538.26.camel@triegel.csb>  <orioj9bfaa.fsf@free.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <orioj9bfaa.fsf-pcXFJVXz+5uzQB+pC5nmwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, 2014-10-24 at 14:31 -0200, Alexandre Oliva wrote:
> On Oct 24, 2014, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> 
> > On Fri, 2014-10-24 at 09:48 -0200, Alexandre Oliva wrote:
> >> On Oct 23, 2014, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> >> 
> >> > I don't think it's easy to classify something as a harmless race.
> >> 
> >> In general, I'd agree with you.
> >> 
> >> But writing the same data onto the same memory range with code under our
> >> entire control that completes execution on any thread before returning
> >> control to any potental reader can access it is such a case IMHO.
> 
> > The contract for a normal sequential function is that there must be a
> > certain state or output *after* it has completed execution.
> 
> We're not talking about the strcpy contract in the abstract.

When somebody works on a strcpy implementation, the strcpy contract is
the law.

> We're
> talking about implementations we control, and that ought to be as
> efficient as possible because it's such a frequently used function.
> Writing intermediate states is not something such a function would want
> to do.

Please.  We're talking corner cases here.  Just because there's
obviously bogus stuff that shares a property with a corner case doesn't
mean that no corner cases would ever arise in practice.

> > There is no
> > guarantee whatsoever about what happens during its execution
> 
> There are plenty of guarantees in the existing implementations.
> Admittedly, I didn't look at all of them,

So you looked at some.  Did you look at future ones?  Is your future
self guaranteed to tell other future implementers about the assumptions
you make?

> but logic tells me they won't
> add writes to memory just because they can just so as to feed your FUD.

Please try to understand the difference between being conservative,
defensive, or just mindful of future people working on glibc -- and FUD.
Trying to not create a potential future problem is not FUD.

> > But did you at the very least document those assumptions on all the
> > strcpy implementations?
> 
> No.

So how should people implementing strcpy differently, in the future,
have any idea about your reasoning?

> I rather derived my reasoning from a perfectly reasonable
> requirement we already place on any strcpy implementation we use: that
> it shouldn't do more work than what is expected of it.

And that's not what needs to happen.  Doing extra, intermediate writes
could be one reason.  But preventing that doesn't prevent the problem in
general.  See my remarks about GPUs etc.

> > Why do you think that they are nonsensical?  strcpy is a sequential
> > function, so as long as it doesn't touch memory outside of what it is
> > supposed to access, and as long as the state/output matches it's
> > contract when it returns, then the implementation is free to do what it
> > thinks works best.
> 
> Sorry, no, we're not living in a purely theoretical world.  We're living
> in a world of real and efficient implementations of strcpy.  They don't
> waste cycles doing useless work such as writing garbage before writing
> what is expected of them.

Likewise.  Please, just try to be a bit more conservative in the
assumptions you make about future HW and potential implementations.

> > The point is that they can see intermediate writes of other threads
> 
> Which, except for the case I mentioned, are writes of the same data that
> was already there.  What's the problem with that, again?
> 
> > To put it abstractly: Just because the sequential composition of two
> > strcpy's copying the same string to the same location is as if the two
> > strcpy's were idempotent wrt. each other, it doesn't mean that
> > concurrent execution provides the same guarantees. 
> 
> Will you please come down to Earth and have a look at actual strcpy
> implementations we ship?

This is not the point!  I already said that I would also guess that it
works in practice on current systems.

Also, if someone should have looked at them, then this would be you.

> >> > I think there's also hardware being designed on which synchronizing
> >> > loads/stores differ from nonsynchronizing ones.
> >> 
> >> It *still* wouldn't be a problem.  A reader only gets a chance to read
> >> after its own writer completed (over?)writing the memory area with the
> >> bits that shall remain there forever.
> 
> > The hardware requires synchronizing accesses, and just the mere presence
> > of a data race may lead to undefined behavior of the program.  We
> > typically don't have this on current CPUs, where individual loads/stores
> > are basically atomic, or at least are a combination of the individual
> > bytes stored concurrently.  But if you bring in a GPU whose firmware, or
> > the driver, is actually a compiler that may do whole-program
> > optimization, things look differently.
> 
> If we get there, we can change this function to use a pre-initialized
> static buffer and skip the strcpy altogether if the user doesn't supply
> a buffer.

But we won't know!  Because nobody (except you maybe, unless you forgot)
will remember that there is this relationship -- you haven't documented
the constraint anywhere.  And when somebody else implements strcpy, then
she'll think about just strcpy, not the additional requirement you added
without documenting it.

> > Yes.  We can make the trade-off that it's safe *if* in turn, we put the
> > required assumptions (and check them) on all strcpy implementations.
> 
> If you think that necessary, would you please submit a patch to all
> implementations of such performance-critical micro functions indicating
> they must not do needless work such as writing garbage before writing
> what they're told to write at a certain portion of memory?

1.) That is not what we'd have to document.
2.) You should have done that when deciding to rely on this for making
the function MT-Safe.

> That would be totally redundant IMHO, and it should probably be in
> pretty much every glibc source file, but if it makes you happy, I
> wouldn't oppose that.

That's not the point.  Let me try to make another, similar example, to
perhaps make it clearer.

nptl has very little documentation of the precise contracts / semantics
of many of the synchronization mechanisms etc.  So when the people
actively working on it change, all the silent assumptions get lost.
Which leaves us in a state like now where for a lot of things, we don't
really know why they work, under which additional assumptions, etc.  And
it's so much harder to maintain as a result.

Another good example, and one that I've been looking at recently, are
the atomic operations.  If you look closely, you'll see that on the
different archs, some of them vary in terms of the included barriers.
And it's not even an obvious bug, because if you look at just all the
atomics and not all uses of them in glibc, then making those choices is
understandable.  It looks reasonable from an arch maintainer
perspective.  But it's either too few or more barriers than necessary.
And what happens with some of the powerpc or x86 atomic ops is that if
you use them in a way that seems to match what they promise, it won't
work.  Yes, it works in (most of) the current code, but it's
error-prone.  How do we expect to keep this consistent and keep on top
of all this if we're not programming defensively and document properly?

Do you see the similarities?  What did you say about me spreading FUD
again?

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
