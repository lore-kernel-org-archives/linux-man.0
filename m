From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: man 1 getopts example code - wrong dash
Date: Sun, 12 Mar 2017 23:31:45 -0400
Message-ID: <20170313033145.GR31094@vapier>
References: <CADOJ=xsjhuZ7_r8JXgfcgXVRi-bf1gN9irBnOePra+i-xv9HuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yr6OvWOSyJed8q4v"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CADOJ=xsjhuZ7_r8JXgfcgXVRi-bf1gN9irBnOePra+i-xv9HuA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcus Geiger <geiger.marcus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--yr6OvWOSyJed8q4v
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 27 Feb 2017 15:16, Marcus Geiger wrote:
> in the examples section of `man 1 getopts`, every dash/minus used in the
> example code cannot be parsed by bash. vi claims it's 0x2212 instead of 0=
x2d.
>=20
> I'm on Ubuntu 16.04 with bash 4.3.46(1)-release. Unfortunately I couldn't=
 find
> the source code for this man page, but the current online pages entry als=
o has
> this problem: http://man7.org/linux/man-pages/man1/getopts.1p.html
>=20
> The containing package is:
>=20
>    $ dpkg -S $(man -w 1 getopts)
>    manpages-posix: /usr/share/man/man1/getopts.1posix.gz

looks like a bug in the man page itself.  it uses \(mi instead of \- in
the example code.  might be an artifact of the conversion process though
as iirc, the posix pages are generated.
-mike

--yr6OvWOSyJed8q4v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEuQK1JxMl+JKsJRrUQWM7n+g39YEFAljGEqEACgkQQWM7n+g3
9YGpTQ/+Ij9s453sAT1CB7cOpSjz2Odx7f9eitOuxfW0n/kPs89lBVqC/w388Btk
VNIFYKbGof1MdN8lT+Qd+nw1CX/DRNHpx3Ha/6F35LtsiRRJ+a+n7qXgjSRIpo+b
XLCRwOX94KL9XnzdpmEV071KNVnHFlv6yn5s9BsyXis73aQWZKyxM46U1V1nw8DO
AcGX3Euxuz8uFi8kc9wCx8bQAjhlXFwrYBIj9uE+hfC+ft21rlyXxRhTAQL2L5Vu
PdyUIkDNWyMs8HLlFpA+TKmCnBAk2rZ4Sj6+A3pVdC/LJyR8EcTYsxKQh766WdaL
Uj5u7KgkhhPd/jq9T326UGo35ky6qTvd5CQ8Bg/vVeODqPvYXkimgn/OMfbgqQo7
R/WP5IVCPCD//7CiocyDgaFWStw+KE3afbtuCgAha1LP8qLKUZy5wOIKJyOnFdZC
U4KnDwIPu0wM3ivaC7a3vOG0CWdCN128npnzBy2aSeUeAe8HK0078vtLGsk17nKn
w/bQ7SQj1/entRbtJCSlYuab1rbo6ip9qTfb3ifDXS6jQyMEa7ojWSaDyoBjfVE0
cKB2t03UjiPELQKWc+KEhu2QJGDzuSWuQ2N6NK8iXvhixhXkseog+lrtfgS6vpQM
Vov9PAcY26gq5FnR33C6FQotbOrMsi1DE5cesiJWgzZfkKtli+g=
=aqRN
-----END PGP SIGNATURE-----

--yr6OvWOSyJed8q4v--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
