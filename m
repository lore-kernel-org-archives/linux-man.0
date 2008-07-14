From: "Andries E. Brouwer" <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Subject: Re: math_error.7 page for review
Date: Mon, 14 Jul 2008 04:57:35 +0200
Message-ID: <20080714025730.GA19705@ub>
References: <487A2C29.8060303@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <487A2C29.8060303-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, Fabian Kreutz <kreutz-WMH0Fc3rTAP1qYPpFx2fzhvVK+yQ3ZXh@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Jul 13, 2008 at 06:24:09PM +0200, Michael Kerrisk wrote:
> Andries (and others),
>
> I'd appreciate comments on the following, especially the FIXMES.
>
> Cheers,
>
> Michael

Hi Michael,

The includes <math.h>, <errno.h>, <fenv.h> are not mentioned.
The dependence on C99 is not mentioned.

> The common convention of returning \-1 on error does not carry over well

Often the special return value is NaN, and one can forget
about all errno and fetestexcept nonsense.

> The
> .I math_errhandling
> identifier defined by POSIX.1 is not supported.

I think math_errhandling is part of C99.

> A program that needs to check for an error from a mathematical
> function should set errno to zero, and make the following call
> feclearexcept(FE_ALL_EXCEPT);
> before calling a mathematical function.
> Upon return from the mathematical function, if errno
> is non-zero, or the following call returns non-zero
> fetestexcept(FE_INVALID | FE_DIVBYZERO | FE_OVERFLOW |
>              FE_UNDERFLOW);
> then an error occurred in the mathematical function.

> .\" FIXME My understanding is that you must check *both* errno and
> .\" fetestexcep() and an error has occurred if *either* of them
> .\" is non-zero.  SUSv3 seems a little ambiguous on this point.
> .\" I'd appreciate confirmation/contradiction that my understanding
> .\" is correct.

I think math_errhandling can have the MATH_ERRNO bit set to indicate
that errors are signalled via errno, and it can have the MATH_ERREXCEPT
bit set to indicate that errors are signalled via floating-point exceptions,
but it can also be 0 and then neither errno nor fetestexcept are required
to give information.

More precisely, the above is required for the float/double functions,
but for complex-valued functions setting of errno is never required.
(And in practice clog will not give any error for the call clog(-0.0).)

Since glibc/gcc do not support math_errhandling, the details
of these requirements are not relevant for Linux.

gcc has options -ffast-math, -fno-math-errno that influence the
error settings.

The standard does not follow the SUSv3 math_err setup.

In reality it is often advised to check for bad
parameters before calling the math functions, avoiding
all this nonsense. See, e.g.,
https://www.securecoding.cert.org/confluence/display/seccode/FLP32-C.+Prevent+or+detect+domain+and+range+errors+in+math+functions

> e.g., giving a negative argument to a logarithm function

But z = clog(-1.0) is quite ok and returns pi
(so instead of "a logarithm function you want perhaps "the function log").

> The error conditions that can occur for mathematical functions
> are described below.

The text seems taken literally from the standard.
Copyright?

Andries

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
