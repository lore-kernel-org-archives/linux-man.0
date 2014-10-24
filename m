From: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Fri, 24 Oct 2014 14:31:25 -0200
Message-ID: <orioj9bfaa.fsf@free.home>
References: <544118FA.3070003@gmail.com>
	<CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	<54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>
	<1414056576.8483.79.camel@triegel.csb> <or38adofh9.fsf@free.home>
	<1414152747.18538.26.camel@triegel.csb>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414152747.18538.26.camel-I2ZjUw8blINjztcc/or7kQ@public.gmane.org> (Torvald Riegel's message
	of "Fri, 24 Oct 2014 14:12:27 +0200")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man@vger.kernel.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Oct 24, 2014, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> On Fri, 2014-10-24 at 09:48 -0200, Alexandre Oliva wrote:
>> On Oct 23, 2014, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> 
>> > I don't think it's easy to classify something as a harmless race.
>> 
>> In general, I'd agree with you.
>> 
>> But writing the same data onto the same memory range with code under our
>> entire control that completes execution on any thread before returning
>> control to any potental reader can access it is such a case IMHO.

> The contract for a normal sequential function is that there must be a
> certain state or output *after* it has completed execution.

We're not talking about the strcpy contract in the abstract.  We're
talking about implementations we control, and that ought to be as
efficient as possible because it's such a frequently used function.
Writing intermediate states is not something such a function would want
to do.

> There is no
> guarantee whatsoever about what happens during its execution

There are plenty of guarantees in the existing implementations.
Admittedly, I didn't look at all of them, but logic tells me they won't
add writes to memory just because they can just so as to feed your FUD.

> But did you at the very least document those assumptions on all the
> strcpy implementations?

No.  I rather derived my reasoning from a perfectly reasonable
requirement we already place on any strcpy implementation we use: that
it shouldn't do more work than what is expected of it.

> Why do you think that they are nonsensical?  strcpy is a sequential
> function, so as long as it doesn't touch memory outside of what it is
> supposed to access, and as long as the state/output matches it's
> contract when it returns, then the implementation is free to do what it
> thinks works best.

Sorry, no, we're not living in a purely theoretical world.  We're living
in a world of real and efficient implementations of strcpy.  They don't
waste cycles doing useless work such as writing garbage before writing
what is expected of them.

> The point is that they can see intermediate writes of other threads

Which, except for the case I mentioned, are writes of the same data that
was already there.  What's the problem with that, again?

> To put it abstractly: Just because the sequential composition of two
> strcpy's copying the same string to the same location is as if the two
> strcpy's were idempotent wrt. each other, it doesn't mean that
> concurrent execution provides the same guarantees. 

Will you please come down to Earth and have a look at actual strcpy
implementations we ship?

>> > I think there's also hardware being designed on which synchronizing
>> > loads/stores differ from nonsynchronizing ones.
>> 
>> It *still* wouldn't be a problem.  A reader only gets a chance to read
>> after its own writer completed (over?)writing the memory area with the
>> bits that shall remain there forever.

> The hardware requires synchronizing accesses, and just the mere presence
> of a data race may lead to undefined behavior of the program.  We
> typically don't have this on current CPUs, where individual loads/stores
> are basically atomic, or at least are a combination of the individual
> bytes stored concurrently.  But if you bring in a GPU whose firmware, or
> the driver, is actually a compiler that may do whole-program
> optimization, things look differently.

If we get there, we can change this function to use a pre-initialized
static buffer and skip the strcpy altogether if the user doesn't supply
a buffer.

> Yes.  We can make the trade-off that it's safe *if* in turn, we put the
> required assumptions (and check them) on all strcpy implementations.

If you think that necessary, would you please submit a patch to all
implementations of such performance-critical micro functions indicating
they must not do needless work such as writing garbage before writing
what they're told to write at a certain portion of memory?

That would be totally redundant IMHO, and it should probably be in
pretty much every glibc source file, but if it makes you happy, I
wouldn't oppose that.

-- 
Alexandre Oliva, freedom fighter    http://FSFLA.org/~lxoliva/
You must be the change you wish to see in the world. -- Gandhi
Be Free! -- http://FSFLA.org/   FSF Latin America board member
Free Software Evangelist|Red Hat Brasil GNU Toolchain Engineer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
