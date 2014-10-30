From: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Thu, 30 Oct 2014 19:41:26 +0100
Message-ID: <1414694486.10085.165.camel@triegel.csb>
References: <544118FA.3070003@gmail.com>
	 <CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	 <54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>
	 <1414056576.8483.79.camel@triegel.csb> <or38adofh9.fsf@free.home>
	 <1414152747.18538.26.camel@triegel.csb> <orioj9bfaa.fsf@free.home>
	 <544EAF20.8050509@jkqxz.net> <ork33jqmqe.fsf@free.home>
	 <1414573935.18538.74.camel@triegel.csb>  <orfve5tp3e.fsf@free.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <orfve5tp3e.fsf-pcXFJVXz+5uzQB+pC5nmwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Mark Thompson <mrt-W77v16wj1OVeoWH0uzbU5w@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, 2014-10-30 at 16:00 -0200, Alexandre Oliva wrote:
> On Oct 29, 2014, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> 
> > On Wed, 2014-10-29 at 06:55 -0200, Alexandre Oliva wrote:
> >> On Oct 27, 2014, Mark Thompson <mrt-W77v16wj1OVeoWH0uzbU5w@public.gmane.org> wrote:
> >> 
> >> > Now suppose we have such an implementation.  Consider two distinct
> >> > threads copying the same thing which is longer than a cache line
> >> 
> >> "/dev/tty" (the constant string copied in the case at hand) is not
> >> longer than a cache line (right? :-), so while your case is compelling,
> >> it doesn't apply.
> 
> > That depends on the alignment of the strings.
> 
> No, sorry.  The alignment of a string that is smaller than a cache can't
> possibly make the string itself bigger than a cache line, and any
> padding introduced by alignment, before or after the string, won't make
> strcpy copy more bytes than the size of the string.
> 
> Maybe you were thinking of straddling over more than one a cache line?

Yep, and agreed that this wasn't what Mark described.

> >> > Since strcpy will always write at least one byte, can you really argue
> >> > that adding "*dest = 0;" to the beginning of a strcpy function is
> >> > always a bad thing?
> >> 
> >> Now, this one is compelling *and* fitting IMHO.
> >> 
> >> Of course we could rule this out in glibc, but should we?  Maybe not.
> >> 
> >> So I guess we're better off fixing the implementation of ctermid(NULL)
> >> to return a pointer to a constant string that (per POSIX) must not be
> >> modified by the caller, rather than needlessly copying it to another
> >> buffer.  Then, if/when such a strcpy implementation comes up, we'll be
> >> ready for it ;-)
> 
> > Yes, we either need to change the implementation, or make it MT-Unsafe
> > for now.
> 
> We only have to make it MT-Unsafe for now if the scenario above, of
> strcpy *always* writing a zero byte to the beginning of the destination
> string, were present in any implementation of strcpy in glibc.
> 
> Do you see any implementations of strcpy in glibc doing that?

Can we please fix faults even if they are not triggering a error right
now?  Please?  Why should we jump through all those hoops, make all
those assumptions, just to stick to this unusual reasoning?  We want to
build stuff that's easy to maintain, not a maze.

> 
> > As this example shows, they can be not "benign" without this being
> > easy to spot.
> 
> As much as you might want it to be so, it doesn't show an such thing.

No, it definitely does.  You made an assumption about a "perfectly
reasonable requirement we already place on any strcpy implementation we
use".  Mark showed that there are reasonable, and existing, strcpy
implementations (or similar for memcpy) that conflict with your
assumption.  So, it seems your "perfectly reasonable requirement" is (1)
not so obviously clear at all and (2) would be easy to break by
perfectly reasonable implementations.

> The example just shows that changing part of the implementation can make
> other parts that rely on it racy, so changes that might affect safety
> properties have to be made with a lot of care.

That's the wrong way around.  The situation you describe exists in
practice, yes, but it's what we need to avoid, not the goal.  We have
contracts for functions, and documentation, to actually decrease
complexity.  This means that we need to be able to change
implementations of functions if they still satisfy the contract.  It's
simply a matter of trying to keep things modular -- divide an conquer.

In this example, strcpy is sequential code, period. (Of course, as far
as the string data is concerned.)  That's the existing contract.  You
made an assumption in your MT-Safe reasoning that *extends* this
contract with an additional rule (for which we needed several emails to
define it, so no, it's not a trivial addition) -- that certain race
conditions must be benign.  Thus, either you are breaking the contract,
or you need to document that this is the new contract.

> Now that's not much of a surprise, is it?
> 
> > Alex, when you did the MT Safety review, which other cases of "benign"
> > race conditions did you see?
> 
> We've already discussed them in the list where we should have been
> discussing this in the first place.
> 
> You have access to my notes in the comments added next to the safety
> annotations in the manual.  That's all I got.

In the notes for ctermid, I can't see anything that would hint at an
assumed benign race condition.  Does that mean that you didn't make
notes for benign race conditions in general?



--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
