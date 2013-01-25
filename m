From: =?UTF-8?B?RGF2aWQgUHLDqXZvdA==?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: [Bug 52741] getnameinfo man page has inappropriate text copied
 from getaddrinfo
Date: Fri, 25 Jan 2013 16:13:19 -0400
Message-ID: <kdup11$jhp$1@ger.gmane.org>
References: <bug-52741-11311@https.bugzilla.kernel.org/> <20130115194601.9BFD311FB6C@bugzilla.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------enigD25B0DAD01DE0DB3F8061763"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130115194601.9BFD311FB6C-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigD25B0DAD01DE0DB3F8061763
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le 15/01/2013 15:46,
bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org a =C3=A9=
crit :
> https://bugzilla.kernel.org/show_bug.cgi?id=3D52741

> --- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3=
w@public.gmane.org>  2013-01-15 19:46:01 ---
> Thkanks for the report Peter.
>=20
> So, it seems here were a confused references in both getnameinfo() and
> getaddrinfo(). I applied the following patch.
>=20
> --- a/man3/getaddrinfo.3
> +++ b/man3/getaddrinfo.3
> @@ -91,7 +91,7 @@ function combines the functionality provided by the
>  .\" .BR getipnodebyaddr (3),
>  .BR getservbyname (3)
>  and
> -.BR getservbyport (3)
> +.BR getservbyname (3)

That change doesn't seem right (duplicating the getservbyname(3) referenc=
e).

Regards

David



--------------enigD25B0DAD01DE0DB3F8061763
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRAudjAAoJELgqIXr9/gny2ScQAIcq/GvmcnmlDdP56RPwGT/I
YHvN+W7iKG/OXvcJbfMv/EfcCWzywwuSLlu94+Zz4zaNfqQrXTLB2E1k1s6wUNQw
ajhkPQ+a9NQpSwI9MBEr7XpbFbcUw/D7n3JnNNwcf6ZtZF98myREg650qb0buDnI
PCnDzorfRH9/Gsnzcpq9w38rrJwN283j5FbTKigx/3cO5addaxtK+BWIvBPna8M5
SQbFr9kxVmqLWR0JJvrGdDw3b+xFMaJ0mR/6OQhJSj/ZrZEx6On5Swc7GQENlvD7
E+ehOD1vJyh572aoS6HDBI2c8fED1GhOixhKkTPVT1gyuxAVTJ4vjH142SrifnbE
9IeVMQ1In56tucpJ+Y79gy5xO6htHa/h9FkmB+wE19/dVMOPoQ3gLPelgu/H8tMI
T2MGbalt2XUNEu6n/yUQ33Q5ulAAbBn9Z6oCwP+VHsaZfQi2ckxpWk5ylDDIwqWs
zwK3AoJzjNm/AwdhSOAcTy4yKUAEIK8on7/yDly86CBkqsaJib7D9hZa+NVk76bb
aG5/xA4k6kjeD7JKnVPlCg1G+HhJk23zm5Ufs5IwsrLdiAxbn56PUGj20gOwB/bb
VtK+W2pTWiMwOyIbc4Zt4wHOIW644Tmio6lVHIEtObN0kCVyc5qU0iuBsSux1k5c
oSzreKXgYu2BMWqagLZ1
=pAIa
-----END PGP SIGNATURE-----

--------------enigD25B0DAD01DE0DB3F8061763--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
