From: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ld.so.8: update and expand
Date: Wed, 10 May 2017 12:58:14 -0400
Message-ID: <20170510165812.m7dts3gs2m6ze7lp@crack.deadbeast.net>
References: <20170510044742.ntq2g5vdnb7q3lf7@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6rghp4py452y3zem"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170510044742.ntq2g5vdnb7q3lf7-Z0uaYDh/Ni4SozaZsD9aTtHuzzzSOjJt@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--6rghp4py452y3zem
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Er, I neglected to number my patches to ld.so.8 in their Subject lines.

This one is intended to follow "ld.so.8: ffix, tfix, wfix".

I apologize for the oversight.

At 2017-05-10T00:47:43-0400, G. Branden Robinson wrote:
>     ld.so.8: update and expand
>=20
>     * Discuss possible observable effects of running on a multiarch-capab=
le
>       system (the linker may be in a different directory under a different
>       name, for instance).
>=20
>     * Add some basic background material for the novice reader.
>=20
>     * Call out use of shell glob in filenames, particularly in the topic =
of
>       the man page itself since this is a little unusual.
>=20
>     * Connect discussion of --audit option and LD_AUDIT environment
>       variable.
>=20
>     * Explain where shared object dependencies are declared and connec to
>       elf(5) (already mentioned in See Also section).

Regards,
Branden

--6rghp4py452y3zem
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAlkTRp0ACgkQ0Z6cfXEm
bc6EDxAAhpYm5+bnfr7XwluLVRIFAwIrEI+8l6s5xVVcRtdIdpXCUGKy9YU6MFsf
o2eG9MTTvhbTYtXlDMzP5LHzhjL70kgPg3tNaKezRTsCv8UE4c2WlgybFlQN6lpH
ocRweShEI0oFDS7cWB9TFDyNtNpRrr+ddxwRYZBPhtYIb1h4y1D4t9Y4h4bPYeM3
vDlf03QvVakOV/pVYMUgNDKoSfnU5wq36ds0EDdAhL2Gz45x51+i71YRHvbTBAj4
6lwjBjFm8oqutIrRKwAKEhAd1c1Uk37WpZB0kL8Zpd3x4lMJTY2KrHStbNoZ8ip1
55JYmBvsZaMALYK+qNx4k7/9Tnqzoa+L9f93rZEeSF+nl24XM0mei2RV4P3iqMqj
3oySbiRkSSwftk1BHa4aqtwROof+gX0aSS+7jQ0Sx5Kek/mJgxNpCGvq9Tp9Ad6N
Bd0E843+Makp+fOvu0nJJ9mDNqrm8h0znldUZqwFcMB2ZUYIfUIJqG9G6/UTDuri
JI0t3//4kyve7L1tyFmb4vI7GRSVUBAzLu5zNO8cLNEvmpyfmGn1VW7VJLkfHk9l
TUdk6JeXtZSzjsxdC4on6+HD2MUk7lftRqnPUrMq7Jp4H/7ZFjciuU/leR87mC1a
hTFJX0qbEyON8oFbU9/aquCb1r/VKTWrJHx4inxIpHFYT3nW248=
=D+be
-----END PGP SIGNATURE-----

--6rghp4py452y3zem--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
