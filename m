From: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Thu, 30 Oct 2014 20:01:11 +0100
Message-ID: <1414695671.10085.180.camel@triegel.csb>
References: <544118FA.3070003@gmail.com>
	 <CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	 <54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>
	 <1414056576.8483.79.camel@triegel.csb> <or38adofh9.fsf@free.home>
	 <1414152747.18538.26.camel@triegel.csb> <orioj9bfaa.fsf@free.home>
	 <1414178101.18538.53.camel@triegel.csb>  <orbnottnzb.fsf@free.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <orbnottnzb.fsf-pcXFJVXz+5uzQB+pC5nmwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, 2014-10-30 at 16:24 -0200, Alexandre Oliva wrote:
> On Oct 24, 2014, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>=20
> >> There are plenty of guarantees in the existing implementations.
> >> Admittedly, I didn't look at all of them,
>=20
> > So you looked at some.  Did you look at future ones?
>=20
> I see that's a rhetorical question.  How could anyone?

Yep it's a trick question, to some extent.  The point I'm trying to mak=
e
is that future implementations are constrained by the contract of the
function, including the MT-Safety guarantees you give.  At the very
least it's a big heads-up to any future implementation, right?

> How are they
> relevant to *current* properties, that I've been asked to document in
> glibc?  Do you remember that that very manual states they are not
> promises of future behavior of future releases of glibc?

I would have hoped that another goal had been to also come up with
documentation that can be easily maintained and adapted when
implementations change.  I agree that the annotations are no promise of
future behavior.  But that does not mean that they should bit-rot
quickly because it's unclear whether they still hold when anything was
changed, like a strcpy implementation that still perfectly fits the
strcpy contract and MT-Safety annotations and comments.

> >> > But did you at the very least document those assumptions on all =
the
> >> > strcpy implementations?
>=20
> >> No.
>=20
> > So how should people implementing strcpy differently, in the future=
,
> > have any idea about your reasoning?
>=20
> How could documentation next to current implementations possibly affe=
ct
> people implementing strcpy from scratch in new architectures?

Well, they look at other code, you put the constraint in the manual as
comments, or anywhere else where it makes future contributors notice it=
=2E
YOu can't put the comment on a nonexisting future implementation, but
there's certainly other ways to do it.

> How am I
> supposed to divine what the important features of such future
> architectures are so that I can document them?  How would you?

You stick to the contract of a function.  In the strcpy example, you sa=
y
that the string data is required to not be subject to concurrent
accesses.

> > I already said that I would also guess that it works in practice on
> > current systems.
>=20
> Good.  Then we're in agreement that the current documentation is
> accurate, in spite of the potential race that future implementations =
of
> strcpy might introduce.
>=20
>=20
> >> > The hardware requires synchronizing accesses, and just the mere =
presence
> >> > of a data race may lead to undefined behavior of the program.
>=20
> Sorry, but =E2=80=9Cundefined behavior=E2=80=9D is standardese for =E2=
=80=9Cdon't do that=E2=80=9D.

It's don't do that for a reason, not just don't do that and you'll be
fine.

> Real hardware doesn't behave in undefined ways.  Since we're talking
> about existing code running on actual hardware, it is always possible=
 to
> enumerate what kinds of behaviors may be observed as a consequence of=
 a
> running certain instruction sequences, with or without interference o=
f
> other processors/threads/whatever.  In some cases, like this one, it =
can
> be proven that none of the potential behaviors deviates from that whi=
ch
> is desired.
>=20
> >> > But if you bring in a GPU whose firmware, or
> >> > the driver, is actually a compiler that may do whole-program
> >> > optimization, things look differently.
>=20
> Yeah, it can just optimize away the strcpy and use the original strin=
g,
> since it's not modified by the caller and its address is not compared
> wtih anything else.  Way to go!  And still safe.

Do you see that this is just what you would be hoping for, but not all
that the compiler would be allowed to do?

> > But we won't know!
>=20
> Enters your hypothetical race detector for the hypothetical future
> architecture to report the hypothetical race introduced by the
> hypothetical strcpy.

Please try to understand the issue.  Maybe you can't imagine someone
building glibc with ThreadSanitizer or such, but that doesn't mean it
won't happen.

> > How do we expect to keep this consistent and keep on top of all thi=
s
> > if we're not programming defensively and document properly?
>=20
> I agree it might be useful to have some part of the manual, or some
> other piece of internal documentation, where we document assumptions
> guiding implementation decisions.  We'll have a maintenance challenge=
 in
> keeping them accurate over time, but I guess they might be better tha=
n
> nothing.  Rather than documenting properties of one specific (per-arc=
h,
> per-ABI, whatever) implementation in its own file, it would be a
> reference point for anyone starting a new arch from scratch.
>=20
> Maybe you can use whatever pearls you find while going through my not=
es
> in the manual to start such a section with information you might find
> useful.
>=20
> I say you, singular, because, well, you pose as having a much better
> understanding of the issues than I do, so you couldn't possibly disag=
ree
> that you're far better suited to do this job than I am.

How is that supposed to work if you haven't documented all the
assumptions you made (i.e., if ctermid is not just an outlier)?  Should
I review all the code again?  I offered help in working on a way to
define the MT-Safety annotations thoroughly and in a hopefully more
future-proof way before you started to work -- but you didn't seem
interested back then.

You said elsewhere in the thread that you have no other information tha=
n
what's in the manual.  If you have anything else, in general, that migh=
t
hint at what assumptions you made beyond the contracts of functions
(e.g., assumptions about reasonable implementations) but didn't make
explicit in the manual, please share this.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
