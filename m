From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] proc(5): clarify /proc/pid/environ behavior
Date: Mon, 20 Feb 2017 13:54:58 -0500
Message-ID: <20170220185458.GH28432@vapier>
References: <20170215221654.10293-1-vapier@gentoo.org>
 <a6982b2f-7cd6-ad1d-d375-0a41ab539084@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tjOMJDssiV0CZSJH"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a6982b2f-7cd6-ad1d-d375-0a41ab539084-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--tjOMJDssiV0CZSJH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 20 Feb 2017 15:16, Michael Kerrisk (man-pages) wrote:
> Thanks! Patch applied. I tweaked somewhat, in particular to further clarify
> the file content is set at execve(2) time. Does the following look okay
> to you?

looks good, thanks
-mike

--tjOMJDssiV0CZSJH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEuQK1JxMl+JKsJRrUQWM7n+g39YEFAlirO30ACgkQQWM7n+g3
9YHphg/+JvhXpqLZ8QSOeLtfl2p/vNFAB+c6MT6bwy2gTtJHgXCU3b7dMp+iusYm
/IhqNIiopgROh7fehhDsx2YwJhkZtcl8VREu/8RsUTa/OSS6vZ4q8993VmMdL7iO
hUF7XZcdkdXHv2kxw+9PwHuf98K890e+rCVfogy+mhaXMWeFlfKVTCwKMhtmktB1
NxD1GbPTlzBeyKTw5ZfLHSOElttkzSEc1s9fQyjZxLW7iKzoRlrS8JUXI/LqaNPa
zATLnA471yShoAk+79opUtjrrGJmdbp+lvRoAlIKglVjo8uc7VPbcWH0/8H6bOyP
4msXHJii7rYY1B0YWOCjfhYM8i3i6R5zdAAk+Mu7C1SdLgNFiU2xhIhMNeWN4IL2
Gr3Ec4Qvp8+Z5/eE/As/HfQlNn9PFL/+alli7D5/ywENM/K5JcwwVWAtAtpNiaq/
xjuEJ22Vs+fjMz22Q2J+Di4Px7MpKHVQ3VZHqNIGUea1siiJu6y6nFvpPguvYUd7
L3Wov26SEuY1HoM+ihiV105yzhQwwSEAh9g1jUPUiKjHRogr2xWNupQlF9nUDCZa
hGFdqXEsrw6B2i2ZQa6UjRPOPQmdr1Y9kxKbl5i+2ew9kX/pIhFHFhguK4xxXcoS
nV/vW8ezKUmMtybeA2D53pyXN/hdv7AHt6JoSEtg2PF2hKIEMzU=
=9B4t
-----END PGP SIGNATURE-----

--tjOMJDssiV0CZSJH--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
