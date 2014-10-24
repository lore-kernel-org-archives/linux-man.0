From: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Fri, 24 Oct 2014 14:12:27 +0200
Message-ID: <1414152747.18538.26.camel@triegel.csb>
References: <544118FA.3070003@gmail.com>
	 <CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	 <54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>
	 <1414056576.8483.79.camel@triegel.csb>  <or38adofh9.fsf@free.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <or38adofh9.fsf-pcXFJVXz+5uzQB+pC5nmwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, 2014-10-24 at 09:48 -0200, Alexandre Oliva wrote:
> On Oct 23, 2014, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> 
> > I don't think it's easy to classify something as a harmless race.
> 
> In general, I'd agree with you.
> 
> But writing the same data onto the same memory range with code under our
> entire control that completes execution on any thread before returning
> control to any potental reader can access it is such a case IMHO.

The contract for a normal sequential function is that there must be a
certain state or output *after* it has completed execution.  There is no
guarantee whatsoever about what happens during its execution -- you only
get this for concurrent specifications, to some extent.

> > In this case, you must make assumptions about strcpy's implementation
> 
> I did, and I'm quite comfortable with them.

But did you at the very least document those assumptions on all the
strcpy implementations?  If not, nothing warns anyone working on those
implementations.

> Do you have any evidence that they don't hold, or that they might not
> hold, or are you just making wild speculations about compliant but
> entirely nonsensical implementations of strcpy that we'd likely never
> bring into glibc?

Why do you think that they are nonsensical?  strcpy is a sequential
function, so as long as it doesn't touch memory outside of what it is
supposed to access, and as long as the state/output matches it's
contract when it returns, then the implementation is free to do what it
thinks works best.

> > It could also use funny SIMD instructions or such that don't work like
> > normal memory accesses in a concurrent setting.
> 
> As long as they don't write outside the memory area of the static char[]
> where we're to store the constant string forever, they should still be
> safe, because callers can only get to the data after their own thread
> finishes writing to the string.

I agree that they will not see state before the execution of any of the
concurrent strcpys, and I never said that.  The point is that they can
see intermediate writes of other threads, which are allowed to be
anything.

To put it abstractly: Just because the sequential composition of two
strcpy's copying the same string to the same location is as if the two
strcpy's were idempotent wrt. each other, it doesn't mean that
concurrent execution provides the same guarantees. 

> And if the caller wishes to pass the
> string on to another thread, then it must ensure the transfer is
> properly synchronized.

That's not the point.

> So the only potentially dangerous case really is that of strcpy writing
> intermediate nonsense, or the case I discussed in my previous email, of
> larger-than-byte read-modify-write cycles that pick up uninitialized
> fragments and then, after another thread initializes those fragments,
> overwrite parts of the same word with the uninitialized fragments they
> read before.
> 
> 
> > I think there's also hardware being designed on which synchronizing
> > loads/stores differ from nonsynchronizing ones.
> 
> It *still* wouldn't be a problem.  A reader only gets a chance to read
> after its own writer completed (over?)writing the memory area with the
> bits that shall remain there forever.

The hardware requires synchronizing accesses, and just the mere presence
of a data race may lead to undefined behavior of the program.  We
typically don't have this on current CPUs, where individual loads/stores
are basically atomic, or at least are a combination of the individual
bytes stored concurrently.  But if you bring in a GPU whose firmware, or
the driver, is actually a compiler that may do whole-program
optimization, things look differently.

> 
> Given this more detailed explanation of the conditions that apply and
> that IMHO make it perfectly safe, do you still see any concrete error
> situation here?

Yes.  We can make the trade-off that it's safe *if* in turn, we put the
required assumptions (and check them) on all strcpy implementations.
But if we don't do the latter, then we're introducing a fault, and even
if it may not lead to errors in the present, it's still a fault we're
adding.  I don't see any point in digging our own bug grave, even if
this one here is just a part of it.

So, in my opinion, this should either be unsafe (which would be easy --
is there a real benefit to have it be safe?), or we make it safe and
document the trade-off, and document the constraints on all strcpy
implementations so that future implementers are aware of it.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
