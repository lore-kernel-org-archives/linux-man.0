From: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Wed, 29 Oct 2014 06:55:05 -0200
Message-ID: <ork33jqmqe.fsf@free.home>
References: <544118FA.3070003@gmail.com>
	<CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	<54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>
	<1414056576.8483.79.camel@triegel.csb> <or38adofh9.fsf@free.home>
	<1414152747.18538.26.camel@triegel.csb> <orioj9bfaa.fsf@free.home>
	<544EAF20.8050509@jkqxz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <544EAF20.8050509-W77v16wj1OVeoWH0uzbU5w@public.gmane.org> (Mark Thompson's message of "Mon, 27
	Oct 2014 20:46:24 +0000")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Thompson <mrt-W77v16wj1OVeoWH0uzbU5w@public.gmane.org>
Cc: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man@vger.kernel.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Oct 27, 2014, Mark Thompson <mrt-W77v16wj1OVeoWH0uzbU5w@public.gmane.org> wrote:

> Now suppose we have such an implementation.  Consider two distinct
> threads copying the same thing which is longer than a cache line

"/dev/tty" (the constant string copied in the case at hand) is not
longer than a cache line (right? :-), so while your case is compelling,
it doesn't apply.

> Since strcpy will always write at least one byte, can you really argue
> that adding "*dest = 0;" to the beginning of a strcpy function is
> always a bad thing?

Now, this one is compelling *and* fitting IMHO.

Of course we could rule this out in glibc, but should we?  Maybe not.

So I guess we're better off fixing the implementation of ctermid(NULL)
to return a pointer to a constant string that (per POSIX) must not be
modified by the caller, rather than needlessly copying it to another
buffer.  Then, if/when such a strcpy implementation comes up, we'll be
ready for it ;-)

Thanks,

-- 
Alexandre Oliva, freedom fighter    http://FSFLA.org/~lxoliva/
You must be the change you wish to see in the world. -- Gandhi
Be Free! -- http://FSFLA.org/   FSF Latin America board member
Free Software Evangelist|Red Hat Brasil GNU Toolchain Engineer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
