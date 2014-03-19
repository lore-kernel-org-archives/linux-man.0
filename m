From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: is there any effective distinction between XPG and XPG XSI?
Date: Wed, 19 Mar 2014 15:42:46 +0100
Message-ID: <CAKgNAkgBGc-5eFUjy=FoVOwc7=Cubx87VC7P335+ce=+bfqqkA@mail.gmail.com>
References: <alpine.LFD.2.11.1403190927130.17724@localhost>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.11.1403190927130.17724@localhost>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Mar 19, 2014 at 2:48 PM, Robert P. J. Day <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org> wrote:
>
>   last quibble for the day ... perusing the feature test macros
> related to XPG and XPG XSI in features.h, starting with the comment:
>
>    _XOPEN_SOURCE        Includes POSIX and XPG things.  Set to 500 if
>                         Single Unix conformance is wanted, to 600 for the
>                         sixth revision, to 700 for the seventh revision.
>
> ok, fair enough, and if we read further, we see the explanation of the
> associated __USE macros:
>
>    __USE_XOPEN2K        Define XPG6 things.
>    __USE_XOPEN2KXSI     Define XPG6 XSI things.
>    __USE_XOPEN2K8       Define XPG7 things.
>    __USE_XOPEN2K8XSI    Define XPG7 XSI things.
>
> which *suggests* that those represent distinct use definitions.

Yes, they are. Translate the above parlance as follows

XPG == POSIX Base specification
XSI == POSIX base specification + XSI extension
(Since I know you have it, see also TLPI pages 14, 15, and 61ff)

> but
> reading further:
>
> #ifdef  _XOPEN_SOURCE
> # define __USE_XOPEN    1
> # if (_XOPEN_SOURCE - 0) >= 500
> #  define __USE_XOPEN_EXTENDED  1
> #  define __USE_UNIX98  1
> #  undef _LARGEFILE_SOURCE
> #  define _LARGEFILE_SOURCE     1
> #  if (_XOPEN_SOURCE - 0) >= 600
> #   if (_XOPEN_SOURCE - 0) >= 700
> #    define __USE_XOPEN2K8      1
> #    define __USE_XOPEN2K8XSI   1
> #   endif
> #   define __USE_XOPEN2K        1
> #   define __USE_XOPEN2KXSI     1
>
> it seems clear that, based on the value of _XOPEN_SOURCE, you get
> either both of the related __USE macros, or neither of them. as in,
> based on _XOPEN_SOURCE, you'll get both of these defined:
>
> #   define __USE_XOPEN2K        1
> #   define __USE_XOPEN2KXSI     1

But note that there is also:

#if (_POSIX_C_SOURCE - 0) >= 200112L
# define __USE_XOPEN2K          1
...
#endif

So, __USE_XOPEN2K might be set when __USE_XOPEN2KXSI is not.

> in other words, using only official feature test macros, you can't,
> for example, select XPG6 *without* selecting XPG6 XSI. is that about
> right?

See above.

>   i ask only because if you check the man page for posix_openpt(),
> you see the FTM requirement:
>
>   posix_openpt(): _XOPEN_SOURCE >= 600
>
> which covers all of XPG6, but if you look in <stdlib.h>, you see the
> more specific XSI-related conditional:
>
> #ifdef __USE_XOPEN2KXSI
> /* Return a master pseudo-terminal handle.  */
> extern int posix_openpt (int __oflag) __wur;
> #endif
>
>   it just seems like there's a bit of fuzziness between what the
> developer can specify, and the test being made in the header file.
> does that make sense?
>
>   it also makes tests like this in <strings.h> a bit confusing at
> first glance:
>
> #if defined __USE_MISC || !defined __USE_XOPEN2K8 || defined __USE_XOPEN2K8XSI
>
> those last two tests seem weird since, if i understand the earlier
> stuff correctly, you either get both of those, or neither, so it seems

See my comments above.

Cheers,

Michael


> strange to test whether the first macro is undefined or the *second*
> is defined. again, am i making any sense?
>
>   thoughts?
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
