From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: math_error.7 page for review
Date: Mon, 14 Jul 2008 15:37:40 +0200
Message-ID: <cfd18e0f0807140637n45d88e3hf880de462fdac81f@mail.gmail.com>
References: <487A2C29.8060303@gmail.com> <20080714025730.GA19705@ub>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080714025730.GA19705@ub>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andries E. Brouwer" <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Cc: Fabian Kreutz <kreutz-WMH0Fc3rTAP1qYPpFx2fzhvVK+yQ3ZXh@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Andries,

Thanks for looking at this.  I have one or two more questions, marked *** below.

On Mon, Jul 14, 2008 at 4:57 AM, Andries E. Brouwer
<Andries.Brouwer-rh8NL+sEX9E@public.gmane.org> wrote:
> On Sun, Jul 13, 2008 at 06:24:09PM +0200, Michael Kerrisk wrote:
>> Andries (and others),
>>
>> I'd appreciate comments on the following, especially the FIXMES.
>>
>> Cheers,
>>
>> Michael
>
> Hi Michael,
>
> The includes <math.h>, <errno.h>, <fenv.h> are not mentioned.
> The dependence on C99 is not mentioned.

Okay -- I added a SYNOPSIS section showing those headers.

>> The common convention of returning \-1 on error does not carry over well
>
> Often the special return value is NaN, and one can forget
> about all errno and fetestexcept nonsense.

Yes.  I'll rewrite the intro paragraph to say that.

>> The
>> .I math_errhandling
>> identifier defined by POSIX.1 is not supported.
>
> I think math_errhandling is part of C99.

True.  I added mention of C99 there.

>> A program that needs to check for an error from a mathematical
>> function should set errno to zero, and make the following call
>> feclearexcept(FE_ALL_EXCEPT);
>> before calling a mathematical function.
>> Upon return from the mathematical function, if errno
>> is non-zero, or the following call returns non-zero
>> fetestexcept(FE_INVALID | FE_DIVBYZERO | FE_OVERFLOW |
>>              FE_UNDERFLOW);
>> then an error occurred in the mathematical function.
>
>> .\" FIXME My understanding is that you must check *both* errno and
>> .\" fetestexcep() and an error has occurred if *either* of them
>> .\" is non-zero.  SUSv3 seems a little ambiguous on this point.
>> .\" I'd appreciate confirmation/contradiction that my understanding
>> .\" is correct.
>
> I think math_errhandling can have the MATH_ERRNO bit set to indicate
> that errors are signalled via errno, and it can have the MATH_ERREXCEPT
> bit set to indicate that errors are signalled via floating-point exceptions,
> but it can also be 0 and then neither errno nor fetestexcept are required
> to give information.

AFAICS, at least one of the bits must be set in a conforming implementation.

The POSIX.1-2001 specs of the various functions say:

[[
On error, the expressions (math_errhandling & MATH_ERRNO) and
(math_errhandling & MATH_ERREXCEPT) are independent of each other, but
at least one of them must be non-zero.
]]

And C99 Sec. 7.12 says:

[[
The macros

MATH_ERRNO
MATH_ERREXCEPT

expand to the integer constants 1 and 2, respectively; the macro

math_errhandling

expands to an expression that has type int and the value MATH_ERRNO,
MATH_ERREXCEPT, or the bitwise OR of both. The value of math_errhandling is
constant for the duration of the program. It is unspecified whether
math_errhandling is a macro or an identifier with external linkage. If a macro
definition is suppressed or a program defines an identifier with the name
math_errhandling, the behavior is undefined. If the expression
math_errhandling & MATH_ERREXCEPT can be nonzero, the implementation
shall define the macros FE_DIVBYZERO, FE_INVALID, and FE_OVERFLOW in
<fenv.h>.
]]

*** In the end, I'm still not certain whether *both* errno and
fetestexcept() need to be checked to determine if an error occurred,
or it if its sufficient to test either.  If I'm understanding right:
if we had math_errhandling support on gcc/glibc then we could test
which of the error notification mechanism(s) is provided and then test
just one of these.  But without the glibc/gcc support for
math_errhandling, it's not quite clear.  Looking through:

info libc "Math Error Reporting"

suggests that it's sufficient to test either, except in the case of
underflow, where it isn't guaranteed that ERANGE is assigned to errno.
 (I'm not quite sure how much to trust this info doc.)  Your thoughts?

> More precisely, the above is required for the float/double functions,

Yes, that's encapsulated in the mention of <math.h> at the start of
the DESCRIPTION.

> but for complex-valued functions setting of errno is never required.

But perhaps it's worth making that point clearer. I will add some text
to NOTES to make it clear that the discussion on this page does not
apply to complex math functions.

> (And in practice clog will not give any error for the call clog(-0.0).)

errno is not set in this case, but on glibc, at least, fetestexcept()
yields FE_DIVBYZERO.

> Since glibc/gcc do not support math_errhandling, the details
> of these requirements are not relevant for Linux.

It's not quite clear to me here whether you are suggesting that I need
to change something in the page, but I'm assuming not.

> gcc has options -ffast-math, -fno-math-errno that influence the
> error settings.

Thanks.  I was unaware of these options.  I've added a paragraph to
NOTES mentioning -fno-math-errno

> The standard does not follow the SUSv3 math_err setup.

*** I do not understand this last sentence.  Did you omit/mistype some
word here?  If not, can you say a little more?

> In reality it is often advised to check for bad
> parameters before calling the math functions, avoiding
> all this nonsense. See, e.g.,
> https://www.securecoding.cert.org/confluence/display/seccode/FLP32-C.+Prevent+or+detect+domain+and+range+errors+in+math+functions

Thanks.  I'll incorporate that topic into NOTES.

>> e.g., giving a negative argument to a logarithm function
>
> But z = clog(-1.0) is quite ok and returns pi
> (so instead of "a logarithm function you want perhaps "the function log").

Done.

>> The error conditions that can occur for mathematical functions
>> are described below.
>
> The text seems taken literally from the standard.
> Copyright?

I did a fair bit of rewriting, but was looking pretty closely at
POSIX.1 at the time.  Probably one or two sentence are still too close
to the standard's wording.  I'll try to reword them.

Thanks Andries.

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
