From: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Mon, 03 Nov 2014 09:55:09 -0600
Message-ID: <1415030109.4531.34.camel@triegel.csb>
References: <544118FA.3070003@gmail.com>
	 <CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	 <54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>
	 <1414056576.8483.79.camel@triegel.csb> <or38adofh9.fsf@free.home>
	 <1414152747.18538.26.camel@triegel.csb> <orioj9bfaa.fsf@free.home>
	 <544EAF20.8050509@jkqxz.net> <ork33jqmqe.fsf@free.home>
	 <1414573935.18538.74.camel@triegel.csb> <orfve5tp3e.fsf@free.home>
	 <1414694486.10085.165.camel@triegel.csb> <oregtn8h23.fsf@free.home>
	 <1414845631.10085.474.camel@triegel.csb> <or1tpm3hn5.fsf@free.home>
	 <1414871691.10085.529.camel@triegel.csb>  <orzjc8zvn6.fsf@free.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <orzjc8zvn6.fsf-pcXFJVXz+5uzQB+pC5nmwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Mark Thompson <mrt-W77v16wj1OVeoWH0uzbU5w@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, 2014-11-03 at 03:43 -0200, Alexandre Oliva wrote:
> On Nov  1, 2014, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> 
> >> The information is all there: there's a static shared buffer (as
> >> required by ctermid(NULL), and that's usually not thread-safe, but
> >> that's tacit knowledge of our time not explicitly duplicated there),
> 
> > Wow, really?  It supposed to be "tacit knowledge of our time" to not
> > have thread-safe initialization of a static buffer?
> 
> You seem to have misread what I wrote.  It's the fact that ctermid(NULL)
> is not required to be thread-safe that is tacit knowledge of our time.

I don't find that interpretation any less surprising.  So, again, why is
that "tacit knowledge of our time"?

> > "but the internal buffer is always set
> > to /dev/tty" makes it obvious that there's a data race?
> 
> The reasoning indicates there's something non-obvious going on there.
> When there isn't, there's no reason for any such note.

So, the note says that an internal buffer is used if NULL is returned,
but this buffer is always set to /dev/tty.  Why does that indicate that
there's a race, or that ctermid(NULL) is not MT-Safe, different from the
actual annotation you added?

> > Maybe we should make a poll on libc-alpha to see which percentage of
> > people actually understands this comment as implying that there is a
> > data race.
> 
> Will you please stop putting words I didn't say in my mouth?

That's the way I understood your comment but ...

> Where did I say the comment meant to imply that there was a data race in
> there?
> 
> All it was meant to do was justify why I regarded the function as
> MT-Safe and AS-Safe, in spite of the possibility of concurrent
> initializations of the buffer.

... we can as well make a poll about this reasoning of yours above.

> > Also note that "your wishes" isn't what this is about -- it is about
> > maintainable documentation.  This affects glibc in general.
> 
> That's still your wishes for additional documentation that nobody has
> stepped up to do.  Others (myself included) may share such a wish for
> better documentation on various fronts, but none of this would entitle
> you to demand me to do so, or to complain that I didn't, when I never
> agreed to do it.

Yeah, you never promised me to create maintainable documentation.  So I
can't demand it.  I just thought that this would be common sense, and as
here, it's actually not a lot of work.  You'd have had to just write
another sentence, or say
  @ data race on initialization of static buffer
or
  @ buffer initialized by running strcpy potentially concurrently

or really something like that.

Sorry if I've asked for something outrageous here...

> > 1) Do the loads use an acquire fence (ie, atomic_read_barrier)?
> 
> No.
> 
> > If not, is any new locale data they can read from initialized before
> > those reads (e.g., at program startup, so happening before any spawned
> > threads)?
> 
> No

Then this sounds like a bug that could trigger an error on archs with
weak HW memory models.

And to be clear, I'd never asked you to fix it, but I would have
appreciated if you gave me (or other glibc folks) a heads-up that
something might be fishy here, so *somebody* (not you, don't worry) can
revisit it later on.

I guess nobody specifically asked you to report potential bugs you've
found during the review for MT-Safety.  It would have just been better
if you did note them...

> > 2) If the compiler sees such a load (e.g., because it's a macro, or with
> > LTO and inlining), and it's not marked as an atomic access, it can be
> > free to reload it.  Which could lead to partially reading from the old
> > and new locale.
> 
> Yes, but only if there's more than one use (thus marked locale).  If
> there's only one use, the compiler could, but would not do something
> that stupid.

Register pressure?

Whenever you say "something that stupid", it should have a very simple
reason.  So if you can't give a one-sentence reply why reload would be
"that stupid", then maybe you're wrong, huh?

> >> Some functions access ctype data multiple times; given the above, and
> >> because the locale structures are accessed in a way that enable the
> >> compiler to load the global locale pointer only once, and the compiler
> >> performs this optimization
> 
> > So correctness applies in some cases on certain, optional compiler
> > optimizations to be performed?
> 
> That is glibc's locale design, yes.  Sane compilers help keep glibc sane
> and safe.  We are indeed relying on compiler sanity.

Sanity is not defined by adhering to the hacks you have in mind but by
adhering to the standards and following the conventions that all the
involved projects have agreed on.  Should we make a poll with the gcc
folks to see how many would agree reloading a nonatomic / non-shared mem
location would be insane?

> > Then please refer me to the concrete old standard (and we should support
> > it, actually) and the wording in there that *requires* strcpy to issue a
> > certain set of stores instead of just, for example, requiring that when
> > the function returns, the string has been copied.
> 
> These are equivalent requirements IMHO, because neither makes other
> allowances for using the user-visible storage as scratch space, and
> both, because of asynchronous signals, rule this possibility out for
> storage that the signal handler could observe.  Anyway, let's leave this
> point for the other sub-thread, to avoid duplication, shall we?

Fine, let's continue there...

> > Second, when you've done that, could you please explain to me how a
> > compiler is supposed to optimize code without something like an as-if
> > rule?
> 
> The key is external observability, and ordering requirements.
> 
> strcpy's sequential specification does not mandate chars to be copied in
> any predetermined order,

But it's not explicitly allowed either.  This contradicts with what you
said above.  Please make a consistent argument.  Otherwise, I'll reply:

strcpy's sequential specification does not mandata chars to be copied
atomically, so we can copy by adding 1 to each char until it reaches the
final value.

> so strcpy is free to reorder and regroup loads
> and stores as it sees fit.  None of this steps out of its explicit
> specification.  Writing garbage, however, would step out, but it might
> still be allowed under the as-if rule if this couldn't be legitimately
> observed, e.g. if any attempt to observe it would invoke undefined
> behavior.

If that is how you interpret the language standard, then please tell me
why we need volatile.  Seriously.

> >> and the
> >> no-data-races mandate.
> 
> > For there to be data races, the standard must actually acknowledge that
> > things are supposed to work in a multi-threaded setting.  Could you
> > refer me to the respective wording too, please?
> 
> Why are you doing this?  You know where this requirement is in POSIX!
> 
> For a long time we have had threads as a POSIX add-on to C standards
> that said nothing about threads.  POSIX imports (defers to) standard C
> without conflicting with it.  It logically follows from these two
> statements that all requirements from standard C on strcpy
> implementations still apply under POSIX.  If you agree that a signal
> handlers' ability to observe deviations from standard-mandated behavior

The question is still what standard-mandated behavior is.  Which you
don't constrain by bringing in POSIX.

> indicate deviation from the standard, rather than something that could
> be tolerated under the as-if rule, then this strcpy requirement carries
> over to the multi-thread extensions to C specified in POSIX.

Also, think about the compiler example with strcpy being replaced by the
compiler, that *you* brought up.  Do you think the compiler agrees with,
or is at least aware of your opinion, that it has to make strcpy
volatile because POSIX uses C and you interpret it to mean that every
handler can peek into intermediate state and find something that you
think makes sense?


A side note: We can keep discussing this, but I can't imagine any
further additional reasons you could bring up why either the ctermid
MT-Safety annotation is incomplete or the glibc implementation of
ctermid is wrong.  In this discussion, you and I disagree, and Mark
seems to disagree with your reasoning as well.  Maybe you should get
other opinions, or just agree that maybe your reasoning might not be as
fault-free as it may seem.

A second side note:  When us three here are discussing this for ages,
then obviously, your MT-Safety note on ctermid is NOT easy to
understand.  There should be absolutely no discussion that something
needs to change.
If any of our documentation leads to at least some disagreement between
glibc contributors, it's not clear enough.  Period.



--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
