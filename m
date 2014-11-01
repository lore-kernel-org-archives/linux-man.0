From: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Sat, 01 Nov 2014 20:54:51 +0100
Message-ID: <1414871691.10085.529.camel@triegel.csb>
References: <544118FA.3070003@gmail.com>
	 <CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	 <54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>
	 <1414056576.8483.79.camel@triegel.csb> <or38adofh9.fsf@free.home>
	 <1414152747.18538.26.camel@triegel.csb> <orioj9bfaa.fsf@free.home>
	 <544EAF20.8050509@jkqxz.net> <ork33jqmqe.fsf@free.home>
	 <1414573935.18538.74.camel@triegel.csb> <orfve5tp3e.fsf@free.home>
	 <1414694486.10085.165.camel@triegel.csb> <oregtn8h23.fsf@free.home>
	 <1414845631.10085.474.camel@triegel.csb>  <or1tpm3hn5.fsf@free.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <or1tpm3hn5.fsf-pcXFJVXz+5uzQB+pC5nmwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Mark Thompson <mrt-W77v16wj1OVeoWH0uzbU5w@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sat, 2014-11-01 at 16:22 -0200, Alexandre Oliva wrote:
> On Nov  1, 2014, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>=20
> > On Sat, 2014-11-01 at 06:24 -0200, Alexandre Oliva wrote:
> >> strcpy as it is implemented today makes ctermid MT-Safe.  That's w=
hat
> >> the current documentation states, and AFAICT that is correct.  Do =
you
> >> disagree?  If so, please point out in current code where it deviat=
es.
>=20
> > The fault is in the difference between what strcpy is specified to =
do
>=20
> Please point out the part of strcpy's contract that states it can wri=
te
> garbage to the destination before writing what it ought to, and then =
you
> (and Mark) might have a point.

It's a sequential specification, so before/after, the intermediate step=
s
are unspecified, so it is allowed to do what it wants there.  Within th=
e
rules of C -- so as-if applies here.  And that doesn't disallow strcpy
to prevent writing intermediate states (whether you consider them
garbage or not).

Would you make any assumptions about the stores performed by a sorting
function that is specified to take an array, and return with the array'=
s
elements being sorted?  Would you require it to only write finally
sorted data out, or would you allow it to use the array as scratch spac=
e
too?  I guess the latter.  And the same applies to strcpy, you don't
want to restrict whether it copies forwards or backwards, for example.
And you don't have to for sequential code.

> Don't even bother arguing a function might do things not explicitly
> written out in their specs, or I'll suggest functions might release
> locks and take them back at will, just to put things in a familiar
> context in which you'd see how bad that would be.

=46irst, now you're talking about concurrent code, not sequential code.

If we assume we have concurrent code, then you could even release and
acquire locks at will if you can prove that this is still okay under
as-if.  But that's besides the point we're discussing here because...

=2E. strcpy is not specified as a concurrent function, is it?  And it
doesn't operate on volatile data.  So, yes, it can write other stuff to
the strings it will overwrite eventually with the final results.  Same
as a sorting function might do.  The requirement is about the state
after the function has completed, not while it does something.  That's
why these things are called post-conditions.

>=20
> You may then resort to the as-if rule combined with the requirement f=
or
> synchronization points between reads and writes by different threads,
> and that would be correct for *current* standards.  Not so for much
> older standards, that had no such requirements,

If you're referring to pre-C11 C standards, then they had a
single-threaded abstract machine, didn't they?

> and that existing
> programs still target, so we should ideally provide an implementation
> suitable for them.
>=20
>=20
> So, who changed the contract and put in additional requirements, agai=
n?
>=20
> > See Mark's comments.  Are you saying that the implementation possib=
ility
> > he mentions is obviously wrong?
>=20
> It depends on the targeted standard.  For recent standards, it's a
> legitimate optimization.  For older standards, it would not be.

Unless you say which "older standards" you actually refer to, I can't
interpret your statement.  Because older standards for single-threaded
abstract machines do allow this.

> For
> future ones, I seem to have misplaced my crystal ball .
>=20
> > @c This function is a stub by default; the actual implementation, f=
or
> > @c posix systems, returns an internal buffer if passed a NULL strin=
g,
> > @c but the internal buffer is always set to /dev/tty.
>=20
> > Where does it talk about a potential data race?  It says that's the=
re a
> > shared buffer, but it does not mention that there's something speci=
al
> > about how the buffer is initialized.  Nor that this affects strcpy
> > implementations in any way.
>=20
> See?, that's what I said about the notes not being in a form you want=
ed.
> The information is all there: there's a static shared buffer (as
> required by ctermid(NULL), and that's usually not thread-safe, but
> that's tacit knowledge of our time not explicitly duplicated there),

Wow, really?  It supposed to be "tacit knowledge of our time" to not
have thread-safe initialization of a static buffer?  Or have a
pre-initialized static buffer?  "but the internal buffer is always set
to /dev/tty" makes it obvious that there's a data race?  Really?

Maybe we should make a poll on libc-alpha to see which percentage of
people actually understands this comment as implying that there is a
data race.

> and
> it's always set to /dev/tty (and the fact that it uses strcpy is just=
 an
> implementation detail that, after optimization, is not even true any
> more).

The validity of this comment relies on the "implementation detail" and
on other implementation details such as what the compiler does.  So tha=
t
doesn't look like "just an implementation detail" to me...

> > And how do you expect strcpy implementers to be aware of this, in
> > practice, with high probability?
>=20
> I don't.  You wish they would, and I understand why, but that's all.
> You wish I had solved a documentation problem, but I was under no
> obligation to do so and I had enough on my plate already so I did not
> jump through additional hoops just to satisfy your wishes.

I'm not really sure what to say after reading that.

Also note that "your wishes" isn't what this is about -- it is about
maintainable documentation.  This affects glibc in general.

> > Should they review all the callers and look for undocumented
> > assumptions?
>=20
> I'm afraid that's how things have usually been done.
>=20
> > Do you think that this scales well and keeps complexity down?
>=20
> No.  I don't disagree such documentation is desirable.
>=20
> >> Other pervasive cases I'm not sure I mentioned then have to
> >> do with unguarded access to constant locale data, that have only b=
een
> >> annotated when the pointer to the current locale object is accesse=
d more
> >> than once.
>=20
> > I can't quite follow that.  Do the accesses constitute data races? =
 Can
> > you give me some more pointers or background info?
>=20
> Look at the implementation of the ctype family of macros/functions, f=
or
> one.  Technically, there are data races in there: the global pointer =
to
> the current locale object can be modified by other threads and they
> don't take anything like a read lock to ensure they have the current
> pointer and that it's not being modified concurrently.
>=20
> However, because of the way locale is implemented, the pointer is
> modified atomically (while holding a write lock, and written as a sin=
gle
> word to a properly aligned location), so readers in other threads may
> get either the old pointer or the new one.
>=20
> The old locale data remains valid forever (till the end of the progra=
m),
> so it is safe to keep on using it until some synchronization point or
> whatever else updates the local view of the global pointer.
>=20
> Numerous functions access ctype data once; given the above, those are
> never a problem, in spite of the race in the global locale pointer.

I have to look at this in detail, but I'm concerned about two issues
there:
1) Do the loads use an acquire fence (ie, atomic_read_barrier)?  If not=
,
is any new locale data they can read from initialized before those read=
s
(e.g., at program startup, so happening before any spawned threads)?
2) If the compiler sees such a load (e.g., because it's a macro, or wit=
h
LTO and inlining), and it's not marked as an atomic access, it can be
free to reload it.  Which could lead to partially reading from the old
and new locale.

> Some functions access ctype data multiple times; given the above, and
> because the locale structures are accessed in a way that enable the
> compiler to load the global locale pointer only once, and the compile=
r
> performs this optimization

So correctness applies in some cases on certain, optional compiler
optimizations to be performed?  That wouldn't be good.

> (or, in some cases, the load is factored out
> explicitly in the source code), these are not a problem, in spite of =
the
> same race.
>=20
> Some functions call multiple functions that each access ctype data, e=
ach
> one loading the global locale pointer independently.  These are prone=
 to
> inconsistent behavior, since parts of their execution may use one loc=
ale
> while another part may use another locale.  These were consistently
> marked with the =E2=80=9Clocale=E2=80=9D keyword.

Thanks for the additional information.  It's helpful.

>=20
> >> That's really all I can think of that you might find
> >> objectionable, but I'm sure there'd be plenty of other cases you'd=
 have
> >> objected to if you had done the review.
>=20
> > Or maybe not.  What makes you think that way?
>=20
> That you've surprised me again and again with objections to issues I
> hadn't regarded as objectionable.
>=20
> > I'm asking to get a feel for what else you might have assumed to be
> > okay that I wouldn't.
>=20
> How could I do that without knowing what *your* criteria could be?

You can't a priori.  But we can keep talking, and you can explain more
of your reasoning, and we can further discuss it to see whether there
are differences.  The above is a good start, so I appreciate that.

> >> Now here's something that might make your head spin:
>=20
> > Sorry, but why?
>=20
> Because we've been talking about strcpy, because my recollection
> incorrectly told me ctermid used the internal, non-preemptible name f=
or
> strcpy, but strcpy happens to be actually irrelevant because it is
> optimized away.
>=20
> > So now you depend on the compiler's memcpy implementation.  Great. =
 We
> > can consider the optimized memcpy Mark mentions.  (strcpy on consta=
nt
> > string is strlen (known a priori) + memcpy.)
>=20
> Well, no, it's more efficient than that, because it doesn't have to l=
oad
> the src: it is a known constant.  It's more like an open-coded array
> initialization.

As I said in my previous email, how to write to the destination matters=
=2E

> > Please look again at the case he described.
>=20
> Likewise.  No, seriously, I mean, look at the *other* case he describ=
ed,
> the one that actually matters.  Not the one about invalidating a enti=
re
> cache line, that I've already demonstrated as not applicable to this
> short string, but you get back to with a hypothetical larger string t=
hat
> might indeed invalidate the underlying assumptions.

Oh great,=20

> I'm sorry to
> disappoint you, but my code review abilities do not cover hypothetica=
l
> and nonsensical changes you might want to suggest just to break
> observations derived from the code on which the documented properties
> were based.
>=20
> I was talking about the one that starts out by writing garbage to the
> first byte to trigger the prefetching of that cache line.  The one th=
at
> would break the strcpy contract of old standards, but that is valid
> under current standards' contracts that include the as-if rule

Then please refer me to the concrete old standard (and we should suppor=
t
it, actually) and the wording in there that *requires* strcpy to issue =
a
certain set of stores instead of just, for example, requiring that when
the function returns, the string has been copied.

Second, when you've done that, could you please explain to me how a
compiler is supposed to optimize code without something like an as-if
rule?

> and the
> no-data-races mandate.

=46or there to be data races, the standard must actually acknowledge th=
at
things are supposed to work in a multi-threaded setting.  Could you
refer me to the respective wording too, please?



--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
