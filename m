From: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Wed, 29 Oct 2014 10:12:15 +0100
Message-ID: <1414573935.18538.74.camel@triegel.csb>
References: <544118FA.3070003@gmail.com>
	 <CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	 <54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>
	 <1414056576.8483.79.camel@triegel.csb> <or38adofh9.fsf@free.home>
	 <1414152747.18538.26.camel@triegel.csb> <orioj9bfaa.fsf@free.home>
	 <544EAF20.8050509@jkqxz.net>  <ork33jqmqe.fsf@free.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ork33jqmqe.fsf-pcXFJVXz+5uzQB+pC5nmwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Mark Thompson <mrt-W77v16wj1OVeoWH0uzbU5w@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, 2014-10-29 at 06:55 -0200, Alexandre Oliva wrote:
> On Oct 27, 2014, Mark Thompson <mrt-W77v16wj1OVeoWH0uzbU5w@public.gmane.org> wrote:
> 
> > Now suppose we have such an implementation.  Consider two distinct
> > threads copying the same thing which is longer than a cache line
> 
> "/dev/tty" (the constant string copied in the case at hand) is not
> longer than a cache line (right? :-), so while your case is compelling,
> it doesn't apply.

That depends on the alignment of the strings.  It's 9 bytes including
trailing zero...

> > Since strcpy will always write at least one byte, can you really argue
> > that adding "*dest = 0;" to the beginning of a strcpy function is
> > always a bad thing?
> 
> Now, this one is compelling *and* fitting IMHO.
> 
> Of course we could rule this out in glibc, but should we?  Maybe not.
> 
> So I guess we're better off fixing the implementation of ctermid(NULL)
> to return a pointer to a constant string that (per POSIX) must not be
> modified by the caller, rather than needlessly copying it to another
> buffer.  Then, if/when such a strcpy implementation comes up, we'll be
> ready for it ;-)

Yes, we either need to change the implementation, or make it MT-Unsafe
for now.

We should also review all other cases of "benign" race conditions.  As
this example shows, they can be not "benign" without this being easy to
spot.  So, IMO, we should really avoid them unless we have a strong
reason not to.

This will also give less false positives when using race detectors.

Alex, when you did the MT Safety review, which other cases of "benign"
race conditions did you see?  It would be useful to revisit those, I
think.



--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
