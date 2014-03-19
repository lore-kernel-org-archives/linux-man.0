From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: is _ISOC95_SOURCE a valid feature test macro or not?
Date: Wed, 19 Mar 2014 14:23:39 +0100
Message-ID: <53299A5B.3060801@gmail.com>
References: <alpine.LFD.2.11.1403190818350.5322@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.11.1403190818350.5322@localhost>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/19/2014 01:30 PM, Robert P. J. Day wrote:
> 
>   another possibly silly observation -- /usr/include/features.h makes
> no mention of _ISOC95_SOURCE in the early comment listing all(?) of
> the possible feature test macros:
> 
>    ... snip ...
>    __STRICT_ANSI__      ISO Standard C.
>    _ISOC99_SOURCE       Extensions to ISO C89 from ISO C99.
>    _ISOC11_SOURCE       Extensions to ISO C99 from ISO C11.
>    _POSIX_SOURCE        IEEE Std 1003.1.
>    ... snip ...
> 
> despite its "USE" macro being mentioned further down in the same
> comment:
> 
>    ... snip ...
>    __USE_ISOC11         Define ISO C11 things.
>    __USE_ISOC99         Define ISO C99 things.
>    __USE_ISOC95         Define ISO C90 AMD1 (C95) things.
>    ... snip ...
> 
> as well as even further down:
> 
> #undef  __USE_ISOC95
> ...
> #ifdef _GNU_SOURCE
> # undef  _ISOC95_SOURCE
> # define _ISOC95_SOURCE 1
> ...
> /* This is to enable the ISO C90 Amendment 1:1995 extension.  */
> #if (defined _ISOC99_SOURCE || defined _ISOC11_SOURCE \
>      || (defined __STDC_VERSION__ && __STDC_VERSION__ >= 199409L))
> # define __USE_ISOC95   1
> #endif
> ...
> 
>   i notice in the man pages Changes file the reference that
> _ISOC95_SOURCE is now allegedly bogus:
> 
> feature_test_macros.7
>     Michael Kerrisk  [Joseph S. Myers]
>         Remove mention of bogus _ISOC95_SOURCE macro
>             The _ISOC95_SOURCE macro is defined in <features.h>, but it
>             does nothing. So remove discussion of it, and move some of
>             the discussion of C95 under the ISOC99_SOURCE subhead.

Joseph pointed out to me that defining _ISOC95_SOURCE actually does 
nothing. So it really is bogus. There is the __USE_ISOC95 macro
that is used internally. But, I think for most purposes
we can consider that to be subsumed under C99.

> but there appear to still be a couple checks for it:
> 
> man3/fwide.3:_ISOC95_SOURCE /* Since glibc 2.12 */ ||
> man3/wprintf.3:_ISOC95_SOURCE /* Since glibc 2.12 */ ||

Those to are bogus, and now I've removed them. Thanks for 
catching that.

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
