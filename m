From: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Sat, 01 Nov 2014 16:22:38 -0200
Message-ID: <or1tpm3hn5.fsf@free.home>
References: <544118FA.3070003@gmail.com>
	<CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	<54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>
	<1414056576.8483.79.camel@triegel.csb> <or38adofh9.fsf@free.home>
	<1414152747.18538.26.camel@triegel.csb> <orioj9bfaa.fsf@free.home>
	<544EAF20.8050509@jkqxz.net> <ork33jqmqe.fsf@free.home>
	<1414573935.18538.74.camel@triegel.csb> <orfve5tp3e.fsf@free.home>
	<1414694486.10085.165.camel@triegel.csb> <oregtn8h23.fsf@free.home>
	<1414845631.10085.474.camel@triegel.csb>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414845631.10085.474.camel-I2ZjUw8blINjztcc/or7kQ@public.gmane.org> (Torvald Riegel's
	message of "Sat, 01 Nov 2014 13:40:31 +0100")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Mark Thompson <mrt-W77v16wj1OVeoWH0uzbU5w@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man@vger.kernel.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Nov  1, 2014, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> On Sat, 2014-11-01 at 06:24 -0200, Alexandre Oliva wrote:
>> strcpy as it is implemented today makes ctermid MT-Safe.  That's wha=
t
>> the current documentation states, and AFAICT that is correct.  Do yo=
u
>> disagree?  If so, please point out in current code where it deviates=
=2E

> The fault is in the difference between what strcpy is specified to do

Please point out the part of strcpy's contract that states it can write
garbage to the destination before writing what it ought to, and then yo=
u
(and Mark) might have a point.


Don't even bother arguing a function might do things not explicitly
written out in their specs, or I'll suggest functions might release
locks and take them back at will, just to put things in a familiar
context in which you'd see how bad that would be.


You may then resort to the as-if rule combined with the requirement for
synchronization points between reads and writes by different threads,
and that would be correct for *current* standards.  Not so for much
older standards, that had no such requirements, and that existing
programs still target, so we should ideally provide an implementation
suitable for them.


So, who changed the contract and put in additional requirements, again?

> See Mark's comments.  Are you saying that the implementation possibil=
ity
> he mentions is obviously wrong?

It depends on the targeted standard.  For recent standards, it's a
legitimate optimization.  For older standards, it would not be.  For
future ones, I seem to have misplaced my crystal ball .

> @c This function is a stub by default; the actual implementation, for
> @c posix systems, returns an internal buffer if passed a NULL string,
> @c but the internal buffer is always set to /dev/tty.

> Where does it talk about a potential data race?  It says that's there=
 a
> shared buffer, but it does not mention that there's something special
> about how the buffer is initialized.  Nor that this affects strcpy
> implementations in any way.

See?, that's what I said about the notes not being in a form you wanted=
=2E
The information is all there: there's a static shared buffer (as
required by ctermid(NULL), and that's usually not thread-safe, but
that's tacit knowledge of our time not explicitly duplicated there), an=
d
it's always set to /dev/tty (and the fact that it uses strcpy is just a=
n
implementation detail that, after optimization, is not even true any
more).

> And how do you expect strcpy implementers to be aware of this, in
> practice, with high probability?

I don't.  You wish they would, and I understand why, but that's all.
You wish I had solved a documentation problem, but I was under no
obligation to do so and I had enough on my plate already so I did not
jump through additional hoops just to satisfy your wishes.

> Should they review all the callers and look for undocumented
> assumptions?

I'm afraid that's how things have usually been done.

> Do you think that this scales well and keeps complexity down?

No.  I don't disagree such documentation is desirable.

>> Other pervasive cases I'm not sure I mentioned then have to
>> do with unguarded access to constant locale data, that have only bee=
n
>> annotated when the pointer to the current locale object is accessed =
more
>> than once.

> I can't quite follow that.  Do the accesses constitute data races?  C=
an
> you give me some more pointers or background info?

Look at the implementation of the ctype family of macros/functions, for
one.  Technically, there are data races in there: the global pointer to
the current locale object can be modified by other threads and they
don't take anything like a read lock to ensure they have the current
pointer and that it's not being modified concurrently.

However, because of the way locale is implemented, the pointer is
modified atomically (while holding a write lock, and written as a singl=
e
word to a properly aligned location), so readers in other threads may
get either the old pointer or the new one.

The old locale data remains valid forever (till the end of the program)=
,
so it is safe to keep on using it until some synchronization point or
whatever else updates the local view of the global pointer.

Numerous functions access ctype data once; given the above, those are
never a problem, in spite of the race in the global locale pointer.

Some functions access ctype data multiple times; given the above, and
because the locale structures are accessed in a way that enable the
compiler to load the global locale pointer only once, and the compiler
performs this optimization (or, in some cases, the load is factored out
explicitly in the source code), these are not a problem, in spite of th=
e
same race.

Some functions call multiple functions that each access ctype data, eac=
h
one loading the global locale pointer independently.  These are prone t=
o
inconsistent behavior, since parts of their execution may use one local=
e
while another part may use another locale.  These were consistently
marked with the =E2=80=9Clocale=E2=80=9D keyword.


>> That's really all I can think of that you might find
>> objectionable, but I'm sure there'd be plenty of other cases you'd h=
ave
>> objected to if you had done the review.

> Or maybe not.  What makes you think that way?

That you've surprised me again and again with objections to issues I
hadn't regarded as objectionable.

> I'm asking to get a feel for what else you might have assumed to be
> okay that I wouldn't.

How could I do that without knowing what *your* criteria could be?


>> Now here's something that might make your head spin:

> Sorry, but why?

Because we've been talking about strcpy, because my recollection
incorrectly told me ctermid used the internal, non-preemptible name for
strcpy, but strcpy happens to be actually irrelevant because it is
optimized away.

> So now you depend on the compiler's memcpy implementation.  Great.  W=
e
> can consider the optimized memcpy Mark mentions.  (strcpy on constant
> string is strlen (known a priori) + memcpy.)

Well, no, it's more efficient than that, because it doesn't have to loa=
d
the src: it is a known constant.  It's more like an open-coded array
initialization.

> Please look again at the case he described.

Likewise.  No, seriously, I mean, look at the *other* case he described=
,
the one that actually matters.  Not the one about invalidating a entire
cache line, that I've already demonstrated as not applicable to this
short string, but you get back to with a hypothetical larger string tha=
t
might indeed invalidate the underlying assumptions.  I'm sorry to
disappoint you, but my code review abilities do not cover hypothetical
and nonsensical changes you might want to suggest just to break
observations derived from the code on which the documented properties
were based.

I was talking about the one that starts out by writing garbage to the
first byte to trigger the prefetching of that cache line.  The one that
would break the strcpy contract of old standards, but that is valid
under current standards' contracts that include the as-if rule and the
no-data-races mandate.

--=20
Alexandre Oliva, freedom fighter    http://FSFLA.org/~lxoliva/
You must be the change you wish to see in the world. -- Gandhi
Be Free! -- http://FSFLA.org/   FSF Latin America board member
=46ree Software Evangelist|Red Hat Brasil GNU Toolchain Engineer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
