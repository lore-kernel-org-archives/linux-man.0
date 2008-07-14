From: "Andries E. Brouwer" <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Subject: Re: math_error.7 page for review
Date: Mon, 14 Jul 2008 19:26:48 +0200
Message-ID: <20080714172648.GA20534@ub>
References: <487A2C29.8060303@gmail.com> <20080714025730.GA19705@ub> <cfd18e0f0807140637n45d88e3hf880de462fdac81f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0807140637n45d88e3hf880de462fdac81f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: "Andries E. Brouwer" <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, Fabian Kreutz <kreutz-WMH0Fc3rTAP1qYPpFx2fzhvVK+yQ3ZXh@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Jul 14, 2008 at 03:37:40PM +0200, Michael Kerrisk wrote:
> Hi Andries,

Hi Michael,

> > The includes <math.h>, <errno.h>, <fenv.h> are not mentioned.
> > The dependence on C99 is not mentioned.
> 
> Okay -- I added a SYNOPSIS section showing those headers.

Yes. Maybe also .br

> > I think math_errhandling can have the MATH_ERRNO bit set to indicate
> > that errors are signalled via errno, and it can have the MATH_ERREXCEPT
> > bit set to indicate that errors are signalled via floating-point exceptions,
> > but it can also be 0 and then neither errno nor fetestexcept are required
> > to give information.
> 
> AFAICS, at least one of the bits must be set in a conforming implementation.
> POSIX.1-2001 ... C99 Sec. 7.12 ...

OK.

> *** In the end, I'm still not certain whether *both* errno and
> fetestexcept() need to be checked to determine if an error occurred,
> or it if its sufficient to test either.

errno is the old-fashioned way, fetestexcept the modern way
One would have to audit the glibc source (in various versions)
but I would guess that in all recent cases fetestexcept suffices.

(Since you want to adapt all math fn man pages, you would probably
test current situation, and check libc source to see from when on we
have the current situation.)

> > The standard does not follow the SUSv3 math_err setup.
> 
> *** I do not understand this last sentence.  Did you omit/mistype some
> word here?  If not, can you say a little more?

Yes, sorry, I meant matherr, see matherr(3) on some suitable system.
Earlier one could have a system- or user-provided routine matherr()
that was invoked on error (with a struct describing the error).
The C standard people decided against that setup, but I think glibc
still supports it (on some architectures), probably with a suitable
#define _FOO_SOURCE.

Andries


       On   error,  many  mathematical  functions  (i.e.,  those  declared  in
       <math.h>) return a NaN (not a number).

On error, many of the mathematical functions declared in <math.h> ...

[you do not want to say that "declared in <math.h>" is a synonym for
"mathematical function"]

       However, in error cases where a
       NaN is not returned, the techniques described below are required.

Instead of looking at the return value (which is not always possible)
one can also check whether an error was signalled. There are two
signalling mechanisms: the older one sets \fIerrno\fP (to EDOM or ERANGE),
the newer one uses the floating point exception mechanism described in
fenv(3).

C99 and POSIX describe the math_errhandling identifier, that is supposed
to indicate which of these two mechanisms is in use (if ... then ...,
if ... then ...; possibly both). However, glibc does not make such an
identifier available. In practice glibc supports both.

For programs intended to be portable: ...(errno=0; feclearexcept; etc).


{very abbreviated suggested text fragment}

{again note: I did not do the audit}

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
