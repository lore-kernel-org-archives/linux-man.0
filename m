From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: abort(3) and flushing
Date: Mon, 29 Jan 2018 03:38:27 -0500
Message-ID: <20180129083827.GH1731@vapier>
References: <CAGWcZkL5By_n8Z7Oa9jzLf75id1kK+cbOBbe84kkMsmEAqEd+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tT3UgwmDxwvOMqfu"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGWcZkL5By_n8Z7Oa9jzLf75id1kK+cbOBbe84kkMsmEAqEd+Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Egmont Koblinger <egmont-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--tT3UgwmDxwvOMqfu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 28 Jan 2018 22:35, Egmont Koblinger wrote:
> I accidentally came across this:
>=20
> The abort(3) man page says "[...] all open streams are closed and flushed"
>=20
> With glibc-2.27, to be released pretty soon now, file descriptors will
> no longer be flushed. See near the bottom of
> https://sourceware.org/glibc/wiki/Release/2.27 .

pedantically, it should prob say "flushed and closed" too ;)
-mike

--tT3UgwmDxwvOMqfu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEuQK1JxMl+JKsJRrUQWM7n+g39YEFAlpu3YMACgkQQWM7n+g3
9YFOzRAAo9SBKZ9pI6PsKc8wMhNWi/jhm6TtawHQZPSe6MZcmUyb2ZGSV3RSHUO3
f7PuJcH2STv4thLWayW8KH2xntmGL5lOAmjxodHQ/TmfS9s85PXFBtrKWJ/m50Fi
Ly7sRxQhIkBK1ULlDSlesba4DkJiCc4WuhmbATOFXkExcC2XcN1UfpWJ1/bqYmkR
KZ1X868pmkZ50auk3f4DAb1D1ctgM+k645MTBiGWx8VmAcSVB7/fxyXuHQL99l9d
KRAiAUCqQrs+DK2ippRSl1QUg0exXkZsRRCnpvRjrmzi0BgCcXZWVoB+gzgmDvhc
9coV6D5qd5vQ0i4F0ecVKmOXFec2IAGXKB2WyLePUeUk/X8KrngrlhFMPHE004EX
bzAh+qZFOlkehyA2UJxM30b5pZnGWTr65xlklgiKl74g+Pl/WL5SK+pFuaWnuwCC
jkT9H29lt0pbOzILZ2bfDC5EzUYfksyO4S/Y1vq2ICEfYTmRSqmUUNBKnPKSDVIz
c1UvOyYPc64LyghZXWxuPu7NqOljJB6YR5HYlxuTssHFmoUbHlvH0oFGRRywRpaR
UCv+T+5CqskL2/pnUlaKfm3f17z5HsPeQ8ztkdKuRn8PbiYLz6J6BJJAvI4VfxFI
4Jo3Q3ij6/h6kuUJMWXTxHvvjIOWyKG2H/0jAIzfJ4oxzNgzRZE=
=N6yU
-----END PGP SIGNATURE-----

--tT3UgwmDxwvOMqfu--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
