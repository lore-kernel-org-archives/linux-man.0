From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] core(5): add more details for output paths and the
 crash handler
Date: Fri, 7 Oct 2016 12:18:00 -0700
Message-ID: <20161007191800.GX21655@vapier.lan>
References: <20160928111450.32157-1-vapier@gentoo.org>
 <20161006172437.3329-1-vapier@gentoo.org>
 <50b6faa5-d490-4a18-f2c5-87241fd0aeee@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="O/sh2HmV2lEgPixT"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50b6faa5-d490-4a18-f2c5-87241fd0aeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--O/sh2HmV2lEgPixT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07 Oct 2016 14:34, Michael Kerrisk (man-pages) wrote:
> On 10/06/2016 07:24 PM, Mike Frysinger wrote:
> > People sometimes assume that the crash handler runs in the same context
> > as the crashing process.  They would be incorrect :).
>=20
> Nice details to add to the page! Thanks for that. I've tweaked the
> text a little, so you might want to take a look at my changes in
> commit 4389c7abfffbe.

looks fine.  wrt /proc/PID vs /proc/[pid], i was using the form that
core(5) already appeared to use.  should all cases of /proc/PID be
changed to /proc/[pid] in there ?  there's both now ...
-mike

--O/sh2HmV2lEgPixT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX9/ToAAoJEEFjO5/oN/WBkPQP/ipti2PjdM9TiwMkWf6tYSTR
afV2AZP8EBzm70lAu0VKMeuxPyKyxw+H+wB3MqE6J8bS6Vou48YWNGgq8Bpg6Rjy
Dg6LdVZfgrHmONLCEtrcLdDFcLNSzO7OJSatzhYgy5AN/uoawXHcTq/J+5XmXNGF
iEIE/P/jGzncvcSiXfz8i1UW6JROK6MPw83YBwtu0Bd/NUhJc/GlVyQmg527I6vT
7LWpEp6qElq5/3h2axLvXA0tECOJHb05nB0d2CmZgCxA/5NfH43Mrxg5hgxTxP0f
5GwfvQs+xdY2D2kGtY/JPbMMn1dxxQEnzot5ieh8sVRDAL5J7H2Pl/YUBG9pc6K4
FJEzKdDz6UR+GbRcNQpi/X21NX0C8WOKvI/MTCA3RNPoqTTyUiSaVnVqBDoiIkeL
waXkOL5KWRGEIlwzQD9RgtyiGtGrY7828eTJUoEUZufsGWxHbUvIRAkCz9rcqULU
dgu70bEVh4oWPgofdo1ybc4BqPWBqj9no9OcayEmON6BRu53SZ+WUZJwL5QJPwbC
nPW+BTNmZddn6OlJtzN+R2eQ29IeWpSwjIuBvt1DzVewMFgXFHpZc/b2Xb9wHxNK
7WvjEh9nIryZvIuL8aHkvMaturyBEUKGmv2xD0GCnlpfGOlf2L6cDiOPLZ2gMwzC
1QLmYbAM/LZECRmdYSgU
=OEJd
-----END PGP SIGNATURE-----

--O/sh2HmV2lEgPixT--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
