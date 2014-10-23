From: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Thu, 23 Oct 2014 11:29:36 +0200
Message-ID: <1414056576.8483.79.camel@triegel.csb>
References: <544118FA.3070003@gmail.com>
	 <CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	 <54461F16.2080705@cn.fujitsu.com>  <oroat3wbsl.fsf@free.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <oroat3wbsl.fsf-pcXFJVXz+5uzQB+pC5nmwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, 2014-10-23 at 04:16 -0200, Alexandre Oliva wrote:
> On Oct 21, 2014, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
> 
> > The codes of ctermid() and cuserid() are similar to tmpnam(),
> 
> Not quite.
> 
> ctermid copies a constant string to the static buffer, so any thread
> calls it with a NULL string will cause the copy to be done, and when it
> is complete, nothing different will ever be stored in that buffer, so
> the thread that completed the call can safely read from the static
> buffer, and expect to get the constant string.
> 
> tmpnam does not copy a constant string to the static buffer, so each
> call may store a different string in it, so race protection is
> necessary.
> 
> 
> cuserid is somewhere in between: as long as euid doesn't change, and the
> same login name is found for that euid, the string will remain the same.
> I'm concerned I may have missed the static buffer in the analysis,
> though, because I didn't mention it in the comments, and I don't
> remember having taking it into account (but then, I don't remember the
> analysis of this particular function in any other way ;-).
> 
> I'm inclined to decide the glibc manual entry is missing a MT-Unsafe
> race:cuserid/!string annotation for cuserid.
> 
> As for ctermid, I admit that, strictly speaking, there's a potential
> race as defined by POSIX: one thread may be reading from the static
> buffer while another is overwriting it with the same bytes, without any
> intervening synchronization operation.  I decided that this is a
> harmless race.

I don't think it's easy to classify something as a harmless race.  If
you violate the data-race-freedom assumption of an implementation, or of
the compiler, you're really making assumptions about those
implementations.

In this case, you must make assumptions about strcpy's implementation to
prove that this race condition won't trigger an error in any execution.

> However, should a machine be unable to perform
> char-sized writes, and instead resorted to larger-sized
> read-modify-write cycles, then a strcpy implementation that modified one
> byte at a time with such cycles could race with itself, even writing the
> same sequence of bytes in the same order.  However, if we had such a
> machine, and we didn't optimize strcpy to coalesce writes to bytes in
> the same word into a single read-modify-write cycle, we'd be failing at
> a far more fundamental level.

A strcpy implementation can assume that no other thread is observing the
data during the execution of the function.  Thus, it would be allowed to
write intermediate results.  For example, it could be allowed to write
the whole string, but garbage for the terminating zero, and then fix up
the zero afterwards.  It could also use funny SIMD instructions or such
that don't work like normal memory accesses in a concurrent setting.
And so on.

So, to make ctermid safe we would have to put these constraints on the
implementation, compiler, etc.  While I would also guess that none of
the above seems likely on current systems, I don't think we can actually
track and maintain such requirements -- because they're hacks.

This would also be detected by data race detectors, so they would
complain about a MT-Safe function.

I think there's also hardware being designed on which synchronizing
loads/stores differ from nonsynchronizing ones.  glibc doesn't run on
such hardware today, but if we want to do at some point, this would be
an issue.

> So I crossed my fingers and hoped we'd
> always have such optimizations, so that the potential race would never
> become a real problem in this case.

I think we should be much more conservative here.  Having to cross
fingers is not something I want to have to rely on :)

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
