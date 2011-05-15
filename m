From: nick black <dankamongmen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: error in socket(7) -- ref bind(2), not bind(8)
Date: Sun, 15 May 2011 10:49:48 -0400
Message-ID: <20110515144948.GA14265@qemfd.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

socket(7)'s SO_BINDTODEVICE description suggests use of bind(8) with
packet(7) sockets. i'm pretty sure you mean the system call bind(2),
not the name server.

--=20
                                         Nick Black <nblack-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
                                       Senior Compiler Engineer, NVIDIA
                    "NP: the class of dashed hopes, and idle dreams..."

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk3P6AYACgkQzjCRTpolKGtOUACePsA0LqoSjEcekDUX/ngMX72A
0hYAoIXrrTqk+QVapq/G6ky1S85gft+O
=oONQ
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
