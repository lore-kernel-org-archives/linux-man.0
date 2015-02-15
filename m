From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] syscall.2: add arm64 and mips
Date: Sun, 15 Feb 2015 12:51:07 -0500
Message-ID: <20150215175107.GC3910@vapier>
References: <20150118072204.GA12237@www.outflux.net>
 <20150215104609.GF32251@vapier>
 <54E0B77E.5090306@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/unnNtmY43mpUSKx"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54E0B77E.5090306-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--/unnNtmY43mpUSKx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 15 Feb 2015 16:13, Michael Kerrisk (man-pages) wrote:
> On 02/15/2015 11:46 AM, Mike Frysinger wrote:
> > On 17 Jan 2015 23:22, Kees Cook wrote:
> >> --- a/man2/syscall.2
> >> +++ b/man2/syscall.2
> >> @@ -36,6 +36,8 @@
> >>  .\"
> >>  .\" 2002-03-20  Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> >>  .\"	- adopted for Linux
> >> +.\" 2015-01-17, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> +.\"	Added mips and arm64.
> >>  .\"
> >=20
> > can we scrub changelogs from the man pages in general ?  they're usuall=
y=20
> > incomplete and rarely provide more than `git log -p`.
>=20
> Yes, I tend to discourage them these days, but don't always worry too muc=
h if
> someone adds them to  patch.

in this case, i think Kees was following apparent convention rather than=20
thinking he always add one.  so i'm suggesting we help out at least the=20
people who are just trying to DTRT by scrubbing the tree of existing ones=
=20
that aren't useful.
-mike

--/unnNtmY43mpUSKx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJU4NyLAAoJEEFjO5/oN/WBU1AP/jYo7DJULvHGYuRbERTKpD2A
IAUMnt06feGHuBSJqtTNvbt8JrcCTJQEw8SdBaMlDHtcjExhr7EcZUnQfCZ7d1xY
LgFP4vX12fNUXLBExd2nix2NH1iOjEsLjSyMWvLSedCFr62wXJt0vhdbmPtvr/vl
omN9Zb7eNIgFU55ImFo3y+p2PaNS9c4FKle7GApXO+y/0bOnGs3uMCEJ6iK7NIpY
qivO5fs83ahYG9arhSATqdpsaUXkS3MT5AcohO/jPoAkZOlkELKjc8yOT9uwkjH1
H4wcZvKzhLE9VTy3DOlDS/gtpSYh7rAGdk6z1TyWB86J3n1PthYPMCe/2YnC7iKG
isLGsIybdh+o2TryNiIhHhhjTgSisoP0nC4qmooKXYCQmdm+8khbyOyI9v74qR5z
C8Qzl99HwHniHx+Czk0fd13SOtbKZb1KBNIkI4g7oUA0nGT6NOzsB6DLqiMY0UIc
YwIrkfEhDBUgyQLcPrXHQMLZRAHDEzHjP0IsD6jkD+/DEnGv7ZSRr3hGNcTA+4/E
7zkZTJDXuliAyBr39PLqwq9mEutbmFyK+Z/0j7OFn19PYr0OFzHjkCmldDtoprDf
cerNiVT117x3WYHBKAcFaTK/UHNvgnbaqkblo4bMKnEtDYn3hrwX8AitkJOBWu3b
+cFQEKIKHiFzZ1ii5Z3y
=kAMt
-----END PGP SIGNATURE-----

--/unnNtmY43mpUSKx--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
