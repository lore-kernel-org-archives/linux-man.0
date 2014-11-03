From: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Mon, 03 Nov 2014 10:10:06 -0600
Message-ID: <1415031006.4531.44.camel@triegel.csb>
References: <544118FA.3070003@gmail.com>
	 <CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	 <54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>
	 <1414056576.8483.79.camel@triegel.csb> <or38adofh9.fsf@free.home>
	 <1414152747.18538.26.camel@triegel.csb> <orioj9bfaa.fsf@free.home>
	 <1414178101.18538.53.camel@triegel.csb> <orbnottnzb.fsf@free.home>
	 <1414695671.10085.180.camel@triegel.csb> <ora94b8fxl.fsf@free.home>
	 <1414838867.10085.431.camel@triegel.csb> <orwq7e22n2.fsf@free.home>
	 <1414868298.10085.488.camel@triegel.csb>  <or4mug27f7.fsf@free.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <or4mug27f7.fsf-pcXFJVXz+5uzQB+pC5nmwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, 2014-11-03 at 03:13 -0200, Alexandre Oliva wrote:
> On Nov  1, 2014, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>=20
> > On Sat, 2014-11-01 at 16:32 -0200, Alexandre Oliva wrote:
> >> That goes both ways.  While strcpy coded for current standards mig=
ht
> >> wish to make such optimizations, old code written for earlier stan=
dards
> >> that did not make allowances for the proposed strcpy optimization =
would
> >> break.
>=20
> > Which earlier standard are you referring to?
>=20
> I think going back to C90 would do.
>=20
> > Did any old standard have strcpy as something else than a
> > sequentially-specified function?
>=20
> Your question needs to be rephrased to take out the =E2=80=9Csequenti=
ally-=E2=80=9D
> noise that distorts your reasoning into some kind of tunnel vision.

Ignoring perhaps signal handlers for a second, is there anything in C90
that is not a sequential program?

> There's nothing specifically sequential about it, nor is it only
> before/after invocation: the standard states what the function does,

Yes.  And how do function definitions work?  You specify before and
after.  Because you couldn't reasonably specify how it's implemented,
nor would you want to.  So it has a precondition, and it has a
postcondition.

Just think about the sorting function analogy I mentioned, will you?

> and
> if it does something else that conflicts with the specification and i=
s
> observable, it diverges from the specification.  Right?

Sure, but we still don't agree what is specified, so this sentence here
doesn't add anything.

>=20
> > especially if all it does is write to the destination
> > string, in some way.
>=20
> The way is not specified,

Exactly.  Period.  Can it set bit by bit?  Sure it can, why not?

But you would end up with the same kind of "garbage" as you call it.  O=
r
you could write by adding 1's until it reaches the final value.

> but it does not state that it is to write
> something else there before, and doing so is NOT allowed by the as-if
> rule.  Consider a function that goes:
>=20
>   for (;;) {
>     extern char buffer[];
>     strcpy (buffer, "foo");
>     signal (SIGUSR1, testme);
>     strcpy (buffer, "fool");
>     signal (SIGUSR1, SIG_IGN);
>   }=20
>=20
>=20
> Now, if the signal handler testme were to inspect buffer[1] (knowing =
the
> only window in which it may be activated is the above, in a
> single-threaded program), what values could it possibly find there?
> Please justify with quotes from combinations of C and POSIX standards=
 of
> the same vintage you can find.  How about buffer[0], and buffer[3]?

I find it very telling that you completely ignored the sorting function
analogy I mentioned.  Here is the paragraph again, from my previous
email:

Would you make any assumptions about the stores performed by a sorting
function that is specified to take an array, and return with the array'=
s
elements being sorted?  Would you require it to only write finally
sorted data out, or would you allow it to use the array as scratch spac=
e
too?  I guess the latter.  And the same applies to strcpy, you don't
want to restrict whether it copies forwards or backwards, for example.
And you don't have to for sequential code.

Unless you reply to that, I won't spend further time discussing with
you.

>=20
> > It is not specified as operating on volatile-qualified data
>=20
> volatile doesn't mean what you appear to suggest it does.
>=20
> volatile means operations are not to be reordered, combined or otherw=
ise
> optimized.

Precisely, it means that volatile accesses have to executed as-if by th=
e
abstract machine.  So, if we have volatile for that, do you see that
something of this won't hold for nonvolatile?

> It does not mean writing garbage to a global variable is
> allowed just because it's not volatile, any more than it means the as=
-if
> rule allows a function to release a lock on entry and take it again
> before returning.  What if printf were to do that on the lock that
> controls stdout?  Surely that would be observable, as much as the
> contents of the buffer within the signal handler.

Those examples don't apply here, and I said before why, and you didn't
dispute that, so I'm not writing that again.

> > They didn't specify rules for multi-threaded execution, did they?
>=20
> Exactly!

Good. Because then effects of multi-threaded execution are not
specified.  So there's no constraints.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
