From: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Sat, 01 Nov 2014 11:47:47 +0100
Message-ID: <1414838867.10085.431.camel@triegel.csb>
References: <544118FA.3070003@gmail.com>
	 <CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	 <54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>
	 <1414056576.8483.79.camel@triegel.csb> <or38adofh9.fsf@free.home>
	 <1414152747.18538.26.camel@triegel.csb> <orioj9bfaa.fsf@free.home>
	 <1414178101.18538.53.camel@triegel.csb> <orbnottnzb.fsf@free.home>
	 <1414695671.10085.180.camel@triegel.csb>  <ora94b8fxl.fsf@free.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ora94b8fxl.fsf-pcXFJVXz+5uzQB+pC5nmwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sat, 2014-11-01 at 06:48 -0200, Alexandre Oliva wrote:
> On Oct 30, 2014, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>=20
> > On Thu, 2014-10-30 at 16:24 -0200, Alexandre Oliva wrote:
> >> >> > The hardware requires synchronizing accesses, and just the me=
re presence
> >> >> > of a data race may lead to undefined behavior of the program.
> >>=20
> >> Sorry, but =E2=80=9Cundefined behavior=E2=80=9D is standardese for=
 =E2=80=9Cdon't do that=E2=80=9D.
>=20
> > It's don't do that for a reason, not just don't do that and you'll =
be
> > fine.
>=20
> Yup.  But remember, it's users of the standard we implement that are =
not
> supposed to do that.  We can and often do get away with such stuff as
> part of the implementation of the standard.  There's a long history o=
f
> doing so: remember when we implemented mutexes without standard atomi=
cs?
> Nowadays, you might look at them and find those implementations
> disgusting, and think =E2=80=9Chow the heck nobody thought of documen=
ting the
> reliance of this code on certain memory model properties that no long=
er
> hold?=E2=80=9D  The obvious answer is that, back then, such propertie=
s were
> perfectly normal and they had no idea something else might take over =
in
> the distant future.  The point I'm trying to make is that there's onl=
y
> so much future-proofness you can put into this sort of documentation.

I don't disagree with this in general.  But in the concrete case we're
talking about, it's really not that hard.  Does strcpy need to consider
that there are concurrent accesses and that it has to do achieve
something under concurrent execution, or does it not?

It's not surprising that this matters today (ie, when you made the
choices), and it's not like we've been aware of this since just
yesterday.

> The most difficult bits to document are not those that are surprising=
 as
> of the writing of the docs, but those that are blatantly obvious to
> pretty much anyone at that time, but that over time become surprising=
=2E
> Historians run into lots of walls related with this sort of implicit
> knowledge of a time.

That's why I'm arguing for being conservative: Be a little cautious wit=
h
what you consider obvious.  I definitely agree that one can't be perfec=
t
with that but, for example, it's a clear difference whether you
implement on an additional implementation property or can just rely on
the sequential contract of the function.

> > Please try to understand the issue.
>=20
> I do.  It's very clear to me.  You wanted and hoped me to do a lot of
> work that I was not supposed to do, and I didn't do it, in part becau=
se
> I have little hope of seeing the future as well as you claim to be ab=
le
> to.

I don't asked you to know about everything that happens in the future.
Because that will be hard, as you say.  But the result of this is that
it helps to be cautious when making assumptions about things that may
easily change in the future and that you can't predict.

IOW, when you can't easily predict future implementations, be
conservative when making assumptions about them.  Or at least document
that.

> > How is that supposed to work if you haven't documented all the
> > assumptions you made (i.e., if ctermid is not just an outlier)?
>=20
> It is, but if I were to document all the assumptions I made, I'd have=
 to
> write several books of assumptions, encoding all the knowledge I've
> accumulated about how past and present hardware architectures work, a=
ny
> one of which might change in future architectures.

I don't think it's that hard.  Coming back to the "being conservative"
point, if you feel like you have to write a book about the assumptions
you make that your code (or your documentation, annotations, ...) rely
on, then maybe it's better to take a step back and do not make those
assumptions in the first place.

In our case here, if you feel like what you require from the strcpy
implementation is very complex, perhaps just not make the requirement
and tag ctermid as unsafe?

Or, don't go for specifying assumptions about strcpy in the ctermid
docs, but rather try to solve it at the other end by documenting that
strcpy has to work well under concurrent execution, in particular under
concurrent but "idempotent" copies to a memory range.

> > what assumptions you made beyond the contracts of functions
>=20
> Heh.  It's almost funny that you talk about the contracts of function=
s,
> when you yourself claimed their definitions were not clear enough to
> figure out what the precise requirements were.  Please make up your m=
ind
> about that point before wasting more my time, will you?

I never said that the sequential contract of strcpy would be incomplete
or wrong in some way.  I said that the MT-Safety definition needs
improvement.
When you make the assumption that it has to work even under concurrent
accesses to the destination string, you go beyond the sequential
contract of the function.  You specified it as MT-Safe, but in your
specification that means that the caller-provided data is supposed to b=
e
protected from concurrent accesses by the caller.  So, your assumption
still conflicts with the contract when taking MT-Safe docs into account=
=2E
Thus, what I said was not inconsistent.



--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
