From: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Subject: Re: [PATCH] adjtimex: PPM scaling is by 2^-16
Date: Fri, 02 Jan 2015 23:48:43 +0100
Message-ID: <54A7204B.5020603@supelec.fr>
References: <54A2DEAD.2050708@supelec.fr> <20150102024118.GA8293@unpythonic.net> <20150102062920.GB4221@localhost.localdomain> <54A6C9B5.4050904@supelec.fr> <20150102211519.GA55815@unpythonic.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9nbil89coSbCvO5K6A8B26kx9NV0MJosQ"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150102211519.GA55815-ixP+gI44yfQ4d9/VWYMlNA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Epler <jepler-ixP+gI44yfQ4d9/VWYMlNA@public.gmane.org>
Cc: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9nbil89coSbCvO5K6A8B26kx9NV0MJosQ
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Le 02/01/2015 22:15, Jeff Epler a =E9crit :
> However, the patch got line-wrapped again (I fixed it manually above).
> With line-wrapped fix, consider it
>=20
> Reviewed-by: Jeff Epler <jepler-ixP+gI44yfQ4d9/VWYMlNA@public.gmane.org>

Sorry, I'm giving up on 'normal' email clients to send patchs. 'git
format-patch' and 'mutt' will do.

>=20
> hm, as a separate issue, "ppm" seems to typically be written in
> lowercase.  see e.g., http://en.wikipedia.org/wiki/Parts-per_notation
>=20

That's right. I'll send the coresponding fix in another patch.

Thanks

Laurent



--9nbil89coSbCvO5K6A8B26kx9NV0MJosQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREIAAYFAlSnIFsACgkQRTidSplJch7IkwD+JJaq+5FkHFLJ9di288HMkhoe
/sB4eRJD7un9Ya2NZhoBALd8UsZkZ97HkDPZ4Y1MsgzcFJwqWm57XrwLI4QToER/
=ISbo
-----END PGP SIGNATURE-----

--9nbil89coSbCvO5K6A8B26kx9NV0MJosQ--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
