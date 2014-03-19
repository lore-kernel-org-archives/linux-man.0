From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: Re: is there any effective distinction between XPG and XPG XSI?
Date: Wed, 19 Mar 2014 10:46:18 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1403191045370.19414@localhost>
References: <alpine.LFD.2.11.1403190927130.17724@localhost> <CAKgNAkgBGc-5eFUjy=FoVOwc7=Cubx87VC7P335+ce=+bfqqkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgBGc-5eFUjy=FoVOwc7=Cubx87VC7P335+ce=+bfqqkA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, 19 Mar 2014, Michael Kerrisk (man-pages) wrote:

> On Wed, Mar 19, 2014 at 2:48 PM, Robert P. J. Day <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org> wrote:
> >
> >   last quibble for the day ... perusing the feature test macros
> > related to XPG and XPG XSI in features.h, starting with the comment:
> >
> >    _XOPEN_SOURCE        Includes POSIX and XPG things.  Set to 500 if
> >                         Single Unix conformance is wanted, to 600 for the
> >                         sixth revision, to 700 for the seventh revision.
> >
> > ok, fair enough, and if we read further, we see the explanation of the
> > associated __USE macros:
> >
> >    __USE_XOPEN2K        Define XPG6 things.
> >    __USE_XOPEN2KXSI     Define XPG6 XSI things.
> >    __USE_XOPEN2K8       Define XPG7 things.
> >    __USE_XOPEN2K8XSI    Define XPG7 XSI things.
> >
> > which *suggests* that those represent distinct use definitions.
>
> Yes, they are. Translate the above parlance as follows
>
> XPG == POSIX Base specification
> XSI == POSIX base specification + XSI extension
> (Since I know you have it, see also TLPI pages 14, 15, and 61ff)
>
> > but
> > reading further:
> >
> > #ifdef  _XOPEN_SOURCE
> > # define __USE_XOPEN    1
> > # if (_XOPEN_SOURCE - 0) >= 500
> > #  define __USE_XOPEN_EXTENDED  1
> > #  define __USE_UNIX98  1
> > #  undef _LARGEFILE_SOURCE
> > #  define _LARGEFILE_SOURCE     1
> > #  if (_XOPEN_SOURCE - 0) >= 600
> > #   if (_XOPEN_SOURCE - 0) >= 700
> > #    define __USE_XOPEN2K8      1
> > #    define __USE_XOPEN2K8XSI   1
> > #   endif
> > #   define __USE_XOPEN2K        1
> > #   define __USE_XOPEN2KXSI     1
> >
> > it seems clear that, based on the value of _XOPEN_SOURCE, you get
> > either both of the related __USE macros, or neither of them. as in,
> > based on _XOPEN_SOURCE, you'll get both of these defined:
> >
> > #   define __USE_XOPEN2K        1
> > #   define __USE_XOPEN2KXSI     1
>
> But note that there is also:
>
> #if (_POSIX_C_SOURCE - 0) >= 200112L
> # define __USE_XOPEN2K          1
> ...
> #endif
>
> So, __USE_XOPEN2K might be set when __USE_XOPEN2KXSI is not.

  ah, that's that bit i missed, thanks. so many variables ...

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
