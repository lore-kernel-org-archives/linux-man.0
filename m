From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [patch] system.3: Document additional return values
Date: Tue, 22 Nov 2016 12:46:29 -0800
Message-ID: <20161122204629.GC21655@vapier.lan>
References: <1479749656-6643-1-git-send-email-quentin@armitage.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FkXAmcdYvda1Og8f"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479749656-6643-1-git-send-email-quentin-/BKvNsQo1N6tmTQ+vhA3Yw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Quentin Armitage <quentin-/BKvNsQo1N6tmTQ+vhA3Yw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--FkXAmcdYvda1Og8f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> system.3: Document additional return values
>=20
> The man page did not include return values 126 (for no permission to
> execute command), or values 128+n when command is terminated by
> signal n.

this is not system(), this is the shell that system() happens to run.
i'm not against covering this in the man page, but it needs to be very
clear that the behavior is entirely shell specific.
-mike

--FkXAmcdYvda1Og8f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYNK6lAAoJEEFjO5/oN/WB+A0P/jwL6baS5UB60A0d3kNrz9DQ
ejQl7cpN/YSIYFlEGO6ppFXUhm2Mft1cOqVyQJJIU0sKGMvESM0xhiDYC/+V7l5t
GyXUe/UZH0YxeBZTBLuAeoid1CSDKrLCI9i1ZOq+e6gmu5cKqNlG2nLgqkb21Ywa
Z6tiVuxZi9SKEFvs6+FOBrk4XPh6oEMBDs9/aEtqUYtMROoPnLPSlaqMYQa8TYEI
wRPvyqRBj8X8y36mpQuf7eYP44nVygV1AwH6S+8efpyQ5rpLI7O1rg3Sdzn/kEOQ
D1FiQNkTDyNQUax5tjmlTED3JONcKOV712FcaiqYp9qFL0X39DFqPyX0WiC1DeHD
oQoEOXcPmpe/geA/J9edAFeh1dAvg+PzbwnONbUdBxLsXi5K0XhS1osw/3jkah/2
hrABBYUGKqz5n/Tx65Sk1GtEUFSGIOSjDiLaTh+bXgWsFJMvljgUGOIffOznWX09
PqAi2nepGOZ3aG49PXASc7wO+MUrX8Aa+zlyQi84ZhjlLJQ+vdDs764hgb7vnjd3
fom2uPRkngps8wwRd2IfRiiwqjIFjbJT8AM7QpFohd/yp31eYC+/UpDUCUaUgLQV
JV4vvo85Tww+5KUTdek/dz5TWyFx9ogpeYB7eq4nXHER9pLgt190OEmQBuavz5+9
C1pbNTf7K4R1Mrt/nfay
=58HI
-----END PGP SIGNATURE-----

--FkXAmcdYvda1Og8f--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
