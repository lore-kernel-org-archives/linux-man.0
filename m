From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] koi8-r.7: potential wrong link, and letter names
Date: Sun, 24 Oct 2010 16:45:54 +0200
Message-ID: <AANLkTinDWgcL1hBr0BRwfb6vc5xPPiJiaeHZUkrWDbEj@mail.gmail.com>
References: <i9srb4$sk2$1@dough.gmane.org> <AANLkTi=t2G87OYioUg8reifMaPBiC=cYjE3uJSBNnAhs@mail.gmail.com>
 <ia1d6v$1m2$1@dough.gmane.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ia1d6v$1m2$1@dough.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello David,

On Sun, Oct 24, 2010 at 3:43 PM, David Pr=E9vot <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org> wro=
te:
> Hi,
>
> Le 24/10/2010 02:59, Michael Kerrisk a =E9crit :
>
>>> Could you please check the git. I had some problem saving and apply=
ing
>>> this patch, so made the changes manually.
>
> Sorry, I guess this was due to my GPG signature. please find attached
> just two s/LETTE /LETTER / in order to correct two typos, everything
> else seems fine, thanks.

Thanks for checking. I've applied these fixes.

Cheers,

Michael


> diff --git a/man7/koi8-r.7 b/man7/koi8-r.7
> index 8b7bf67..075dab7 100644
> --- a/man7/koi8-r.7
> +++ b/man7/koi8-r.7
> @@ -128,7 +128,7 @@ _
> =A0305 =A0 =A0197 =A0 =A0 C5 =A0 =A0 =A0<C5> =A0 =A0CYRILLIC SMALL LE=
TTER IE
> =A0306 =A0 =A0198 =A0 =A0 C6 =A0 =A0 =A0<C6> =A0 =A0CYRILLIC SMALL LE=
TTER EF
> =A0307 =A0 =A0199 =A0 =A0 C7 =A0 =A0 =A0<C7> =A0 =A0CYRILLIC SMALL LE=
TTER GHE
> -310 =A0 =A0200 =A0 =A0 C8 =A0 =A0 =A0<C8> =A0 =A0CYRILLIC SMALL LETT=
E HA
> +310 =A0 =A0200 =A0 =A0 C8 =A0 =A0 =A0<C8> =A0 =A0CYRILLIC SMALL LETT=
ER HA
> =A0311 =A0 =A0201 =A0 =A0 C9 =A0 =A0 =A0<C9> =A0 =A0CYRILLIC SMALL LE=
TTER I
> =A0312 =A0 =A0202 =A0 =A0 CA =A0 =A0 =A0<CA> =A0 =A0CYRILLIC SMALL LE=
TTER SHORT I
> =A0313 =A0 =A0203 =A0 =A0 CB =A0 =A0 =A0<CB> =A0 =A0CYRILLIC SMALL LE=
TTER KA
> @@ -137,7 +137,7 @@ _
> =A0316 =A0 =A0206 =A0 =A0 CE =A0 =A0 =A0<CE> =A0 =A0CYRILLIC SMALL LE=
TTER EN
> =A0317 =A0 =A0207 =A0 =A0 CF =A0 =A0 =A0<CF> =A0 =A0CYRILLIC SMALL LE=
TTER O
> =A0320 =A0 =A0208 =A0 =A0 D0 =A0 =A0 =A0<D0> =A0 =A0CYRILLIC SMALL LE=
TTER PE
> -321 =A0 =A0209 =A0 =A0 D1 =A0 =A0 =A0<D1> =A0 =A0CYRILLIC SMALL LETT=
E YA
> +321 =A0 =A0209 =A0 =A0 D1 =A0 =A0 =A0<D1> =A0 =A0CYRILLIC SMALL LETT=
ER YA
> =A0322 =A0 =A0210 =A0 =A0 D2 =A0 =A0 =A0<D2> =A0 =A0CYRILLIC SMALL LE=
TTER ER
> =A0323 =A0 =A0211 =A0 =A0 D3 =A0 =A0 =A0<D3> =A0 =A0CYRILLIC SMALL LE=
TTER ES
> =A0324 =A0 =A0212 =A0 =A0 D4 =A0 =A0 =A0<D4> =A0 =A0CYRILLIC SMALL LE=
TTER TE
>
>
> Regards
>
> David
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
