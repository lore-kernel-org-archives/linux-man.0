From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: aio_cancel
Date: Wed, 18 Apr 2012 08:16:42 +1200
Message-ID: <CAKgNAkj30OzoQXAx00ep9P=Zetx1W+pg-y9+Cd4GFXRJygftMw@mail.gmail.com>
References: <CAGc9Evf=94fyfYM67q0BRJCN=vu14aYV91pE+Hw=uhgkVS5p5g@mail.gmail.com>
 <CAKgNAkgcKRrdepNS9jQw=MzNY+sRpP+-idDEfpT0ALBJOJ3w1w@mail.gmail.com>
 <4E8BA018.5070707@jguk.org> <CAKgNAkhdZwP7hVH2GdmMV9CH4LTXURbO=TrAg0QgiG7_XXdQFg@mail.gmail.com>
 <4E90D1C4.3090104@jguk.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E90D1C4.3090104-hus3n9K41k0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

[...]
> BTW, could this aio_cancel text be updated to clarify if aio_error or
> aio_cancel is returning AIO_ALLDONE.
>
> " This function returns AIO_ALLDONE if
> =A0 =A0 =A0 all requests had already been completed before this call.=
 =A0When some
> error
> =A0 =A0 =A0 occurs, -1 is returned, and errno is set appropriately."
>
> My assumption would be that it refers to aio_Cancel, but as it follow=
s
> aio_error description.. could be unclear. Maybe the function name can=
 be
> added to the description.

Yes, I've made that change for man-pages-3.40.

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
