From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] ip.7: Convention, order, and typo
Date: Sun, 24 Oct 2010 08:22:46 +0200
Message-ID: <AANLkTimpJkye+Ja9SoKCctWPvwZ3wV07HZASZ_O+=Pdw@mail.gmail.com>
References: <i9qub7$jge$1@dough.gmane.org> <i9qukb$jge$2@dough.gmane.org> <i9s6a5$lic$1@dough.gmane.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <i9s6a5$lic$1@dough.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello David,

On Fri, Oct 22, 2010 at 4:15 PM, David Pr=E9vot <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi
>
> Le 21/10/2010 22:58, David Pr=E9vot a =E9crit :
>
>> Please find inline a patch against current ip(7) manual page, in ord=
er
>> to fix some issue spotted while reviewing it's translation.

Thanks. Applied for 3.30.

> Please find some more =93bold=93 issues spotted later (please let me =
know if
> you prefer various messages for this type of issues in the future,
> instead of just one typo patch).

I prefer to split things up logically (see how I split up your first
patch), but when all of the issues are minor, it's not too much of a
problem to get everything in one patch.

Cheers,

Michael

> @@ -609,11 +597,13 @@ caused the error, which can be accessed with th=
e
> =A0macro.
> =A0The
> =A0.I sin_family
> - -field of the SO_EE_OFFENDER address is
> +field of the
> +.B SO_EE_OFFENDER
> +address is
> =A0.B AF_UNSPEC
> =A0when the source was unknown.
> =A0When the error originated from the network, all IP options
> - -.RI ( IP_OPTIONS ", " IP_TTL ", "
> +.RB ( IP_OPTIONS ", " IP_TTL ", "
> =A0etc.) enabled on the socket and contained in the
> =A0error packet are passed as control messages.
> =A0The payload of the packet causing the error is returned as normal =
payload.
>
>
> Regards
>
> David
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.10 (GNU/Linux)
>
> iEYEARECAAYFAkzBnIMACgkQ18/WetbTC/q8KwCdGxXFKvfVi50Cfyq0ynuFLUrf
> 12cAn0ziNnze8W3FxXeyVUuX6gmA0nw9
> =3DaTsu
> -----END PGP SIGNATURE-----
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
