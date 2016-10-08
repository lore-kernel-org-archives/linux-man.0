From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ffs.3 is missing XSI reference for ffs
Date: Sat, 8 Oct 2016 12:30:15 +0200
Message-ID: <ebb92581-52d1-b519-d00d-3577f6a160c9@gmail.com>
References: <20161007172237.28b0e46b@tauner-w510>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161007172237.28b0e46b@tauner-w510>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Tauner <tauner-1IEs1BiS2Ng4SCxGYwAy/16hYfS7NtTn@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Stefan,

On 10/07/2016 05:22 PM, Stefan Tauner wrote:
> Hi,
> 
> the current man page indicates the following feature flags for ffs(3):
> 
> Since glibc 2.12:
> _POSIX_C_SOURCE\ >=\ 200809L
>     || /* Glibc since 2.19: */ _DEFAULT_SOURCE
>     || /* Glibc versions <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE
> 
> So I would expect the following program to compile well without
> warnings:
> 
> #define _POSIX_C_SOURCE 200809L
> #include <strings.h>
> int main(void) {
>     return ffs(0x4);
> }
> 
> However, it does not and warns about the implicit reference of ffs.
> It compiles fine _without_ the POSIX define though (as expected due to
> _DEFAULT_SOURCE).

Confirmed, and thanks for the report!


> According to the standard, ffs(3) is indeed an XSI function:
> http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/strings.h.html
> 
> Looking at my local system header from glibc 2.23 seems to confirm
> that glibc handles it that way too:
> 
> features.h has:
> #if defined _POSIX_C_SOURCE && (_POSIX_C_SOURCE - 0) >= 200809L
> # define __USE_XOPEN2K8		1
> # undef  _ATFILE_SOURCE
> # define _ATFILE_SOURCE	1
> #endif
> 
> which is used by strings.h:
> #if defined __USE_MISC || !defined __USE_XOPEN2K8 || defined __USE_XOPEN2K8XSI
> /* Return the position of the first bit set in I, or 0 if none are set.
>    The least-significant bit is position 1, the most-significant 32.  */
> extern int ffs (int __i) __THROW __attribute__ ((const));
> #endif
> 
> Note the ! in the _USE_XOPEN2K8 clause.

Yes, I suspect that I overlooked that '!' when I documented this!

> I am not 100% sure, but I guess that the right fix would be to replace
> the _POSIX_C_SOURCE clause in ffs.3 with _XOPEN_SOURCE >= 700?

I've changed the page to show the corrected details, which I make to be:

       ffs():
           Since glibc 2.12:
                   _XOPEN_SOURCE >= 700
                   || ! (_POSIX_C_SOURCE >= 200809L)
                   || /* Glibc since 2.19: */ _DEFAULT_SOURCE
                   || /* Glibc versions <= 2.19: */ _BSD_SOURCE ||
               _SVID_SOURCE
           Before glibc 2.12:
               none

That of course covers what you found, w.r.t. _XOPEN_SOURCE.

> FWIW, this also makes the test program above work fine on my system.
> I have not checked in detail if the current manpage was correct with
> glibc 2.12 or anything before my 2.23 but I don't think so from looking
> at some relevant changes of strings.h in the glibc repo.

No, the man page has always been wrong :-(. Fixed now, thanks to 
your report!

> HTH, thanks for your work Michael and KR,

You're very welcome. Did we meet at KR? (sorry, two conferences
in two weeks; lots of new names...)

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
