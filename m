From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man strnlen
Date: Fri, 9 Sep 2011 15:54:08 +0200
Message-ID: <CAKgNAkgWXz21qOr0S3j-YOcn_XUZARE7gsYaR5uOiBwm2EB9tg@mail.gmail.com>
References: <AANLkTi=3H9mA+=c16qiS8TEfbxOaewvxxEJyDfELLRRG@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=3H9mA+=c16qiS8TEfbxOaewvxxEJyDfELLRRG-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jon,

On Tue, Nov 23, 2010 at 7:13 PM, Jon Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hello
>
> Just looking at this page:
>
> http://www.kernel.org/doc/man-pages/online/pages/man3/strnlen.3.html
>
>
> It says "This function is a GNU extension."
>
> Is strnlen still a GNU only extension?

Looks like it was added to POSIX.1-2008.

> Microsoft and also The Open Group also document this function.
>
> http://www.opengroup.org/onlinepubs/9699919799/functions/strlen.html
>
> http://msdn.microsoft.com/en-us/library/z50ty2zh%28VS.80%29.aspx
>
> Microsoft call it "ANSI"
>
>
>
> Could strlen page link to strnlen(3) as well please.

Done.

>
> http://www.kernel.org/doc/man-pages/online/pages/man3/strlen.3.html
>
> Likewise, should all four pages refer to each other:
>
> wcsnlen
> wcslen
> strlen
> strnlen

Seems like there's mostly enough xrefs in the SEE ALSO in these pages.
Can you be more specific?

> As there is a string(3) page, should there be a wchar(3) page? Even
> just a page to collectively refer to other pages.
>
> http://www.kernel.org/doc/man-pages/online/pages/man3/string.3.html
>
> wchar(3) page could list wcstok wcspbrk(3), wcsrchr(3), wcsstr(3), wm=
emchr(3)

Perhaps, but I suppose that it should have more pages than this. I'd
probably add such a page if someone wrote one.

> Thank you for taking a look at these.

No problem. The above changes will be in 3.33.

> p.s. I noticed the http://man7.org/tlpi/TLPI-front-cover.png is very
> large and slow to load. Also it is 674px =D7 890px (scaled to 454px =D7
> 600px). Reducing it and compressing would save a few seconds off the
> download!

I did by now compress it a little. Thanks.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
