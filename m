From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Wrong formulae for complex elementary functions
Date: Sat, 27 Nov 2010 08:37:43 +0100
Message-ID: <AANLkTinAUyVTdjxY9KVgnOerWxhXtnvmHeTQ-Gb0-TxC@mail.gmail.com>
References: <4CEF7677.30500@ginac.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4CEF7677.30500-HEL5OUoDxoc@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Richard B. Kreckel" <kreckel-HEL5OUoDxoc@public.gmane.org>, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andreas Enge <andreas.enge-MZpvjPyXg2s@public.gmane.org>, Bill Allombert <Bill.Allombert-AE+LCD0i0auq1rftRos53FaPQRlvutdw@public.gmane.org>, Karim Belabas <Karim.Belabas-AE+LCD0i0auq1rftRos53FaPQRlvutdw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Andries,

Since you are the mathematician, can you comment?

Thanks,

Michael

On Fri, Nov 26, 2010 at 9:57 AM, Richard B. Kreckel <kreckel-HEL5OUoDxoc@public.gmane.org> =
wrote:
> Hi!
>
> The man pages for cacos, cacosf, cacosl, catan, catanf, catanl, cacos=
h,
> cacoshf, cacoshl, catanh, catanhf, and catanhl contain wrong maths.
>
> cacos, cacosf, cacosl:
> =A0The formula given in the man page
> =A0 =A0cacos(z) =3D -i clog(z + csqrt(z * z - 1))
> =A0gives wrong results in second and fourth quadrant of complex plain=
=2E
> =A0The formula
> =A0 =A0cacos(z) =3D -i clog(z + I*csqrt(1 - z * z))
> =A0gives correct results.
>
> catan, catanf, catanl:
> =A0The formula given in the man page
> =A0 =A0catan(z) =3D 1 / 2i clog((1 + iz) / (1 - iz))
> =A0gives wrong results on the negative imaginary axis beginning at -I
> =A0(along one of the two branch cuts). Besides, the formula is writte=
n
> =A0in an ambiguous way.
> =A0The formula
> =A0 =A0catan(z) =3D (clog(1 + iz) - clog(1 - iz)) / 2i
> =A0gives correct results.
>
> cacosh, cacoshf, cacoshl:
> =A0The formula given in the man page
> =A0 =A0cacosh(z) =3D (0.5) * clog((1 + z) / (1 - z))
> =A0gives wrong results everywhere in the complex plain. (The formula
> =A0seems to be copied from the one for catanh, where it is sometimes
> =A0correct.)
> =A0The formula
> =A0 =A0cacosh(z) =3D 2 * clog(csqrt((z + 1)/2) + csqrt((z - 1)/2))
> =A0gives correct results.
>
> catanh, catanhf, catanhl:
> =A0The formula given in the man page
> =A0 =A0catanh(z) =3D 0.5 * clog((1 + z) / (1 - z))
> =A0gives wrong results on the positive real axis beginning at 1 (alon=
g
> =A0one of the two branch cuts).
> =A0The formula
> =A0 =A0catanh(z) =3D 0.5 * (clog(1 + z) - clog(1 - z))
> =A0gives correct results.
>
> I've also checked casin, casinf, casinl, casinh, casinhf, and casinhl=
 and
> the formulae given there
> =A0 =A0casin(z) =3D -i clog(iz + csqrt(1 - z * z))
> =A0 =A0casinh(z) =3D clog(z + csqrt(z * z + 1))
> are actually correct.
>
> I suspect that some of these errors are due to somebody trying to "si=
mplify"
> these formulae. Since this can ruin the behavior, I recommend to add =
a
> comment to the upstream sources that warns against attempt of
> simplification.
>
> For the sake of reference, I am looking at manpages-dev 3.25-1 on
> Debian/squeeze.
>
> Bye!
> =A0-richy.
> --
> Richard B. Kreckel
> <http://www.ginac.de/~kreckel/>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
