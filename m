From: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Thu, 30 Oct 2014 16:24:24 -0200
Message-ID: <orbnottnzb.fsf@free.home>
References: <544118FA.3070003@gmail.com>
	<CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	<54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>
	<1414056576.8483.79.camel@triegel.csb> <or38adofh9.fsf@free.home>
	<1414152747.18538.26.camel@triegel.csb> <orioj9bfaa.fsf@free.home>
	<1414178101.18538.53.camel@triegel.csb>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414178101.18538.53.camel-I2ZjUw8blINjztcc/or7kQ@public.gmane.org> (Torvald Riegel's message
	of "Fri, 24 Oct 2014 21:15:01 +0200")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man@vger.kernel.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Oct 24, 2014, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

>> There are plenty of guarantees in the existing implementations.
>> Admittedly, I didn't look at all of them,

> So you looked at some.  Did you look at future ones?

I see that's a rhetorical question.  How could anyone?  How are they
relevant to *current* properties, that I've been asked to document in
glibc?  Do you remember that that very manual states they are not
promises of future behavior of future releases of glibc?

>> > But did you at the very least document those assumptions on all th=
e
>> > strcpy implementations?

>> No.

> So how should people implementing strcpy differently, in the future,
> have any idea about your reasoning?

How could documentation next to current implementations possibly affect
people implementing strcpy from scratch in new architectures?  How am I
supposed to divine what the important features of such future
architectures are so that I can document them?  How would you?

> I already said that I would also guess that it works in practice on
> current systems.

Good.  Then we're in agreement that the current documentation is
accurate, in spite of the potential race that future implementations of
strcpy might introduce.


>> > The hardware requires synchronizing accesses, and just the mere pr=
esence
>> > of a data race may lead to undefined behavior of the program.

Sorry, but =E2=80=9Cundefined behavior=E2=80=9D is standardese for =E2=80=
=9Cdon't do that=E2=80=9D.
Real hardware doesn't behave in undefined ways.  Since we're talking
about existing code running on actual hardware, it is always possible t=
o
enumerate what kinds of behaviors may be observed as a consequence of a
running certain instruction sequences, with or without interference of
other processors/threads/whatever.  In some cases, like this one, it ca=
n
be proven that none of the potential behaviors deviates from that which
is desired.

>> > But if you bring in a GPU whose firmware, or
>> > the driver, is actually a compiler that may do whole-program
>> > optimization, things look differently.

Yeah, it can just optimize away the strcpy and use the original string,
since it's not modified by the caller and its address is not compared
wtih anything else.  Way to go!  And still safe.

> But we won't know!

Enters your hypothetical race detector for the hypothetical future
architecture to report the hypothetical race introduced by the
hypothetical strcpy.

> How do we expect to keep this consistent and keep on top of all this
> if we're not programming defensively and document properly?

I agree it might be useful to have some part of the manual, or some
other piece of internal documentation, where we document assumptions
guiding implementation decisions.  We'll have a maintenance challenge i=
n
keeping them accurate over time, but I guess they might be better than
nothing.  Rather than documenting properties of one specific (per-arch,
per-ABI, whatever) implementation in its own file, it would be a
reference point for anyone starting a new arch from scratch.

Maybe you can use whatever pearls you find while going through my notes
in the manual to start such a section with information you might find
useful.

I say you, singular, because, well, you pose as having a much better
understanding of the issues than I do, so you couldn't possibly disagre=
e
that you're far better suited to do this job than I am.


> Do you see the similarities?

Not much, really.  IIUC, you described cases in which low-level
implementations didn't offer standard-imposed guarantees that users
expected and relied on, whereas what we are speaking of here is
implementations going beyond standard-imposed guarantees, and other
implementation internals relying on these (observable but undocumented)
guarantees to offer safety properties that, per the standard, need not
even be offered in the first place.  I wish I could say this reliance
led to better performance too, but in this case, it doesn't.

--=20
Alexandre Oliva, freedom fighter    http://FSFLA.org/~lxoliva/
You must be the change you wish to see in the world. -- Gandhi
Be Free! -- http://FSFLA.org/   FSF Latin America board member
=46ree Software Evangelist|Red Hat Brasil GNU Toolchain Engineer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
