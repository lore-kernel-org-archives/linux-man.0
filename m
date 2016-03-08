From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: locale.5: drop tel/fax description
Date: Tue, 8 Mar 2016 09:21:03 -0500
Message-ID: <20160308142103.GL6588@vapier.lan>
References: <56DD6B93.8070802@redhat.com>
 <20160307174850.GI6588@vapier.lan>
 <56DEA266.2000400@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+GiWpZ/vZzfY9+ZQ"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56DEA266.2000400-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--+GiWpZ/vZzfY9+ZQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08 Mar 2016 11:59, Marko Myllynen wrote:
> On 2016-03-07 19:48, Mike Frysinger wrote:
> > On 07 Mar 2016 13:52, Marko Myllynen wrote:
> >> glibc upstream recently deemed that the tel/fax fields are not useful
> >> and dropped them from the few locales which had them defined. Do you
> >> think we could/should drop the descriptions from the man page as well?
> >=20
> > the fields are technically still supported, we've just emptied them out.
> > i would add a note saying that their use is discouraged in favor of the
> > other fields like e-mail.
>=20
> Fair enough, how about this?

lgtm
-mike

--+GiWpZ/vZzfY9+ZQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW3t/PAAoJEEFjO5/oN/WBcTYQALaNuL29iIfvY+gJZVek7ohg
tehKouVS1QlBLBrC0ZSWRutPsWlJrnDhL20C749ILwq95BhMtWg41FhiisKmHtPJ
xPcJAf2/AENZvIG5/7Js8pPCS1qyu2J4mhJdKuD8Jaw+kmS8CuljRuQhYZQDLHf5
JcLRqR8VwmkgmANX/h9rhaWE6p53QG5ij8E2YWy027cGnVylJY5MmO3SCk0XvARi
zwK4/j4EN/DDMueM79P3TkK2xvKg7ZWosYdt6P/RqAXpKDJZqgMnjclOTWXiyOo8
jVDQhc8LQ6MWcxdnlJDv4ucCF3s37WF7F3U01DPXDwPDWVPRiH4f3WdwT5YCG+bs
H8Eqt4JkJlNOe6mApsUs3IqU671MdfN91JftfMZ6oI/RSYMYFjTa/RVwiaHw0Yb/
df3kYRLUc0LJ8qbdrRgp0UKzMoYE19G2UBVp1kuBVyoy5OjwWhL7BcG7QUR2nCSL
Dxaar2g0TCD9alyXmESXJjOIURMraAoPZW0bSL1RjsmV1yJKsweN0BaQ6WrZsb2t
jJS2675Wa2tj0ZFuS9RfEcupBRR6R/Haxl+Kb5z2KYTvEU+il6UD1Kx1YXQTkq3G
PDvcP4MvKMFkRtsiKmWnDyrnhKwo7nVA08+6KCwlWhalA+3sp8QUOR5hbKPCKp/C
fz/YwtiNtE1GTxaP/yxh
=+Am8
-----END PGP SIGNATURE-----

--+GiWpZ/vZzfY9+ZQ--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
