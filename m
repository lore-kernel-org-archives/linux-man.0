From: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Mon, 03 Nov 2014 03:43:41 -0200
Message-ID: <orzjc8zvn6.fsf@free.home>
References: <544118FA.3070003@gmail.com>
	<CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	<54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>
	<1414056576.8483.79.camel@triegel.csb> <or38adofh9.fsf@free.home>
	<1414152747.18538.26.camel@triegel.csb> <orioj9bfaa.fsf@free.home>
	<544EAF20.8050509@jkqxz.net> <ork33jqmqe.fsf@free.home>
	<1414573935.18538.74.camel@triegel.csb> <orfve5tp3e.fsf@free.home>
	<1414694486.10085.165.camel@triegel.csb> <oregtn8h23.fsf@free.home>
	<1414845631.10085.474.camel@triegel.csb> <or1tpm3hn5.fsf@free.home>
	<1414871691.10085.529.camel@triegel.csb>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414871691.10085.529.camel-I2ZjUw8blINjztcc/or7kQ@public.gmane.org> (Torvald Riegel's
	message of "Sat, 01 Nov 2014 20:54:51 +0100")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Mark Thompson <mrt-W77v16wj1OVeoWH0uzbU5w@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man@vger.kernel.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Nov  1, 2014, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

>> The information is all there: there's a static shared buffer (as
>> required by ctermid(NULL), and that's usually not thread-safe, but
>> that's tacit knowledge of our time not explicitly duplicated there),

> Wow, really?  It supposed to be "tacit knowledge of our time" to not
> have thread-safe initialization of a static buffer?

You seem to have misread what I wrote.  It's the fact that ctermid(NULL)
is not required to be thread-safe that is tacit knowledge of our time.

> "but the internal buffer is always set
> to /dev/tty" makes it obvious that there's a data race?

The reasoning indicates there's something non-obvious going on there.
When there isn't, there's no reason for any such note.

> Maybe we should make a poll on libc-alpha to see which percentage of
> people actually understands this comment as implying that there is a
> data race.

Will you please stop putting words I didn't say in my mouth?

Where did I say the comment meant to imply that there was a data race in
there?

All it was meant to do was justify why I regarded the function as
MT-Safe and AS-Safe, in spite of the possibility of concurrent
initializations of the buffer.

> Also note that "your wishes" isn't what this is about -- it is about
> maintainable documentation.  This affects glibc in general.

That's still your wishes for additional documentation that nobody has
stepped up to do.  Others (myself included) may share such a wish for
better documentation on various fronts, but none of this would entitle
you to demand me to do so, or to complain that I didn't, when I never
agreed to do it.

> 1) Do the loads use an acquire fence (ie, atomic_read_barrier)?

No.

> If not, is any new locale data they can read from initialized before
> those reads (e.g., at program startup, so happening before any spawned
> threads)?

No

> 2) If the compiler sees such a load (e.g., because it's a macro, or with
> LTO and inlining), and it's not marked as an atomic access, it can be
> free to reload it.  Which could lead to partially reading from the old
> and new locale.

Yes, but only if there's more than one use (thus marked locale).  If
there's only one use, the compiler could, but would not do something
that stupid.

>> Some functions access ctype data multiple times; given the above, and
>> because the locale structures are accessed in a way that enable the
>> compiler to load the global locale pointer only once, and the compiler
>> performs this optimization

> So correctness applies in some cases on certain, optional compiler
> optimizations to be performed?

That is glibc's locale design, yes.  Sane compilers help keep glibc sane
and safe.  We are indeed relying on compiler sanity.

> Then please refer me to the concrete old standard (and we should support
> it, actually) and the wording in there that *requires* strcpy to issue a
> certain set of stores instead of just, for example, requiring that when
> the function returns, the string has been copied.

These are equivalent requirements IMHO, because neither makes other
allowances for using the user-visible storage as scratch space, and
both, because of asynchronous signals, rule this possibility out for
storage that the signal handler could observe.  Anyway, let's leave this
point for the other sub-thread, to avoid duplication, shall we?

> Second, when you've done that, could you please explain to me how a
> compiler is supposed to optimize code without something like an as-if
> rule?

The key is external observability, and ordering requirements.

strcpy's sequential specification does not mandate chars to be copied in
any predetermined order, so strcpy is free to reorder and regroup loads
and stores as it sees fit.  None of this steps out of its explicit
specification.  Writing garbage, however, would step out, but it might
still be allowed under the as-if rule if this couldn't be legitimately
observed, e.g. if any attempt to observe it would invoke undefined
behavior.

>> and the
>> no-data-races mandate.

> For there to be data races, the standard must actually acknowledge that
> things are supposed to work in a multi-threaded setting.  Could you
> refer me to the respective wording too, please?

Why are you doing this?  You know where this requirement is in POSIX!

For a long time we have had threads as a POSIX add-on to C standards
that said nothing about threads.  POSIX imports (defers to) standard C
without conflicting with it.  It logically follows from these two
statements that all requirements from standard C on strcpy
implementations still apply under POSIX.  If you agree that a signal
handlers' ability to observe deviations from standard-mandated behavior
indicate deviation from the standard, rather than something that could
be tolerated under the as-if rule, then this strcpy requirement carries
over to the multi-thread extensions to C specified in POSIX.

-- 
Alexandre Oliva, freedom fighter    http://FSFLA.org/~lxoliva/
You must be the change you wish to see in the world. -- Gandhi
Be Free! -- http://FSFLA.org/   FSF Latin America board member
Free Software Evangelist|Red Hat Brasil GNU Toolchain Engineer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
