From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Report bugs for variations in error handling in math functions?
Date: Wed, 6 Aug 2008 11:27:55 +0200
Message-ID: <cfd18e0f0808060227m6d32409ale4e90cd592462a6@mail.gmail.com>
References: <cfd18e0f0807250314h5c063754gd672c04b2eeef2f6@mail.gmail.com>
	 <Pine.LNX.4.64.0807251535040.7701@digraph.polyomino.org.uk>
	 <4891C60A.5000103@gmail.com>
	 <cfd18e0f0808032248l3f9d7ef4r2af2a989da4d9eb9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0808032248l3f9d7ef4r2af2a989da4d9eb9-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Joseph S. Myers" <joseph-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org, Andreas Jaeger <aj-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Aug 4, 2008 at 7:48 AM, Michael Kerrisk
<mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> On Thu, Jul 31, 2008 at 4:02 PM, Michael Kerrisk
> <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>>> I think the correct approach is to consider it a bug if functions do not
>>> set errno, or do not raise exceptions - that is, all of (b), (c) and (d) are
>>> bugs.  This would allow math_errhandling to be MATH_ERRNO|MATH_ERREXCEPT
>>> unless translation units are compiled with options preventing this, and make
>>> the error handling options available consistent across the math.h functions
>>> supported by glibc.  To conform with C99, at least one approach (errno or
>>> exceptions) must be consistently supported across all the functions, in any
>>> case.
>>
>> I've reported bugs for all of the non-conformances I found.
>
> What I really should have said here is "non-conformances and
> deviations from the/my ideal that all errors would be reported both
> via errno and exceptions".  Anyway, one for the list:
>
> http://sources.redhat.com/bugzilla/show_bug.cgi?id=6814

A tabular summary of what I found is provided here:

http://linux-man-pages.blogspot.com/2008/08/math-functions-and-error-reporting.html

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
