From: "Joseph S. Myers" <joseph-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Subject: Re: Report bugs for variations in error handling in math functions?
Date: Fri, 25 Jul 2008 15:43:00 +0000 (UTC)
Message-ID: <Pine.LNX.4.64.0807251535040.7701@digraph.polyomino.org.uk>
References: <cfd18e0f0807250314h5c063754gd672c04b2eeef2f6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0807250314h5c063754gd672c04b2eeef2f6-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org, Andreas Jaeger <aj-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, 25 Jul 2008, Michael Kerrisk wrote:

> Currently, I'm revising all of the math pages in man-pages, and in the
> process testing the error handling (glibc 2.8) for each function.
> 
> I find the following:
> 
> a) on error, many (probably a majority of) functions set errno AND
> raise an exception (fetestexcept()).
> b) on error, a very few functions DO set errno but DON"T raise an
> exception (fetestexcept()).
> c) on error, a few functions DON'T set errno but DO raise an exception
> (fetestexcept()).
> d) on error, a very few functions pursue a mixture of all of the
> above, depending on the error.
> 
> A math_error(7) page that I recently wrote (see
> http://www.kernel.org/doc/man-pages/online/pages/man7/math_error.7.html
> ) currently implies that all functions should do a).  Clearly I'll
> need to amend that.
> 
> But the main question is, should I raise glibc bugs for the functions
> in cases b), c), and d)?

I've run third-party C conformance tests on glibc that have shown similar 
issues.

C90 requires errno to be set by various functions.  C99 allows it not to 
be set, in an incompatible quiet change from C90, if exceptions are used 
instead.  The correct handling under C99 depends on the value of 
math_errhandling.  Implementing math_errhandling requires compiler and 
linker support (see messages linked from the CONFORMANCE file): if any 
translation unit is compiled with -fno-math-errno then math_errhandling & 
MATH_ERRNO must not be set.  (I'd suggest that the compiler set object 
attributes which the static linker then uses to provide the relevant 
information to libc.)

I think the correct approach is to consider it a bug if functions do not 
set errno, or do not raise exceptions - that is, all of (b), (c) and (d) 
are bugs.  This would allow math_errhandling to be 
MATH_ERRNO|MATH_ERREXCEPT unless translation units are compiled with 
options preventing this, and make the error handling options available 
consistent across the math.h functions supported by glibc.  To conform 
with C99, at least one approach (errno or exceptions) must be consistently 
supported across all the functions, in any case.

-- 
Joseph S. Myers
joseph-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
