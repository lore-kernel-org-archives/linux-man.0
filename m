From: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] clock_getres.2: ffix
Date: Wed, 8 Nov 2017 06:58:29 -0500
Message-ID: <20171108115827.rachl42whbklzlpi@crack.deadbeast.net>
References: <55b5b761-3b19-6578-a83d-a2a9f7452459@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="46auuh67u7ioewis"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55b5b761-3b19-6578-a83d-a2a9f7452459-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--46auuh67u7ioewis
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

At 2017-11-08T16:25:04+0900, Seonghun Lim wrote:
> --- a/man2/clock_getres.2
> +++ b/man2/clock_getres.2
> @@ -275,7 +275,7 @@ If the CPUs in an SMP system have different clock sou=
rces, then
> =A0there is no way to maintain a correlation between the timer registers =
since
> =A0each CPU will run at a slightly different frequency.
> =A0If that is the case, then
> -.I clock_getcpuclockid(0)
> +.BR clock_getcpuclockid(3)

That's not a man page cross reference, it's an example of a function
call.

Even if it were a man page cross reference, you would need a space
between "clock_getcpuclockid" and "(3)".

--=20
Regards,
Branden

--46auuh67u7ioewis
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAloC8VkACgkQ0Z6cfXEm
bc7fsg//aCoCa/g+lpalIWJ4wToX3BeMsv7q1TLn57YcWO9UJhh6LDtgvWguYxCD
DKG/gyzFS0l1oup5LkZMr6VH+EY1/WpCArVTEsyCCZUK1vJ93E6/KUgDflFGtZz1
QzJjerqK2R4XnQIBRpK2Z3Qde0Cnj9ZTeuIWSHHc98QLczro5pB8JqMvj+EFU6rJ
WgKqA4bze+fQMyJ2+yu1HPRLLi9g3zy7FHEWSU2BZ310ckHE3cWewbUUbSO8jbxA
h9XZyCkzC7sAv2RjcuVa4RpvADoy6dX6KNHY3cRSjoaPV1iosr5s66EtT9GzrztK
mkGFyeMIaUG1GhKv4TfQi2OmDlvYOvMqF9hhkI56Cd3RHDCJVUqGLgJ03VUNazqR
7vV2kN+fHVtilEk0mvcwe3wf1phB2UqPSj/zFakRbvvmHaczWplkc5MXG3Hu/TBL
zk9RMBxOeIN3E2aMBSFKwZu5RN1JX1NtZuBRbIr9rtZwoOnSd9GOFDONUybIy4DH
wyxknrPKH9zbYECjlviP8a8sb61zP1h3MYLaAoojlzfTay0mGXm651iibi6SiQrx
cTEEMVaMhq7+TwHBH44lMT4C70Cz8KBZym4MOJA5orKqJRR9rawsWpJPntzhQ0Yk
BgVs3e9ZoAA5bRwgRi2p7Ey39+3lBOZ0iouOcnagGRmxHx25PXU=
=0P38
-----END PGP SIGNATURE-----

--46auuh67u7ioewis--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
