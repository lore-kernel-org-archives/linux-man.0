Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605680;
	b=kT9K9zBU9AnApxOX+7LCx6iNpW0EfYe6Ap4ua/j3yRssmi8wI1SmmAse3ONfn3OS7a30
	 zqSO/IxA//l8p9KxCKYnQcFtEPINbr2mFR7RWTWIqgfrVLgfqzV5Q7wFHcLEBInfkSCA/
	 DN2nl1qTVQ17jCX8dkSF3n7jeYAkFfOFXzaP1M62fZ0WBA0M7fj77kW62VM9+Q4M3/tsn
	 U/9zjX602V/WwlacVcbZuC6k59rQfky5oT6tjAbnaJQeRu3io56zVf4jRPNyY7SkRSJK4
	 yjGq62Wfn9OuhJnSzih+0jvCz7fFtK/MDqIt727T57t+6hSpR2C0e8IGr4mRUdkj00A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605680;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=rNn+gD2JT+VkMQKNh3JkCeZ5/6F+VJUyBx3plqwq0yc=;
	b=emy+KAaYN3XKzG8K74ltjAy6LiOMMED3sgmX0iTX6XfKplKmiU5tb/Yt0Llfn9Gw2yX6
	 /TQRdiiRR3vC8xpsJXX+VcMlSk/g0XVHF5kTtmvA/YtEh4FgOLNDbovGPe8UqueUBblTI
	 VQ/C/7mfUlqS14fdCFxcAegQJZvKiRN0G9VhJGLJZl2cR5LmwSvLPHfAPpXeIQIP3osfK
	 MjZbTDolSuZmT3E04NbAjh1gKvnDhTiT6LcLaawqKEIpC1icOi46K7PrQlgQvTDcxYcCs
	 CCC27yTv24MRRHWE2j9MAkedwYcOf4rK7l3WDjCx1FeA5CD9ebOexe5Xv98QBskpmqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eYSG8Mr+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8A6606A31A
	for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 18:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eYSG8Mr+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE2D1F000C1;
	Wed, 21 Oct 2026 18:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792605680;
	bh=rNn+gD2JT+VkMQKNh3JkCeZ5/6F+VJUyBx3plqwq0yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eYSG8Mr+OdV4eBPn3Bl+cAYnru9evYrV/MykZyOs42fs17v+PKa24MmdmglZtj+DC
	 uDBSOOK5192OlPEvz0jkM05zBe0j2Ei5OJnlh1IIkFJ9YvTR0pXxl6XSrCcoJ07854
	 5mmWGbTvendNZ0n6DcgBRgOGfw+3D8fkVo/4Nw5p71BYFkHGcgwZ3mQKY7PtT6Hpsd
	 k2rGHfLXUlHvq+o35cEdfwNeaKTdhmCV5TxI/6ejIeEiXonPSBWN7pttaSQUeoqZcD
	 dtXSrVPeLh9+6cptIddGN38y6D2MyA+tY0dryRdANt+pm7BxisPBxc8UQG1YygxSFe
	 4hcKAS5U1Hmfg==
Date: Wed, 21 Oct 2026 20:01:15 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Jan Engelhardt <ej@inai.de>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man3/getnameinfo.3: Mention behavior for AF_UNIX
Message-ID: <atj9pv8lxtunlOiM@debian>
References: <20261020115143.75371-1-jengelh@inai.de>
 <atd04IuG4GBl6PxM@debian>
 <q790883o-osno-6n75-230r-485465rpq4r7@vanv.qr>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pzn7zblf47jamynh"
Content-Disposition: inline
In-Reply-To: <q790883o-osno-6n75-230r-485465rpq4r7@vanv.qr>


--pzn7zblf47jamynh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Jan Engelhardt <ej@inai.de>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man3/getnameinfo.3: Mention behavior for AF_UNIX
Message-ID: <atj9pv8lxtunlOiM@debian>
References: <20261020115143.75371-1-jengelh@inai.de>
 <atd04IuG4GBl6PxM@debian>
 <q790883o-osno-6n75-230r-485465rpq4r7@vanv.qr>
MIME-Version: 1.0
In-Reply-To: <q790883o-osno-6n75-230r-485465rpq4r7@vanv.qr>

Hi Jan,

> Date: 2026-10-20 18:01:02+0200
> From: Jan Engelhardt <ej@inai.de>
>
>=20
> On Tuesday 2026-10-20 16:27, Alejandro Colomar wrote:
> >
> >I'd rewrite a little bit:
> >
> >	.SH VERSIONS
> >	POSIX only specifies the behavior for sockets of the
> >	.B AF_INET
> >	and
> >	.B AF_INET6
> >	address families.
> >	Other address families are non-portable;
> >	for example, for
> >	.BR AF_UNIX ,
> >	many libc implementations fail,
> >	some succeed but provide zero-length strings in
> >	.I host
> >	and
> >	.IR serv ,
> >	and some fill these buffers with pseudo-values.
> >
> >BTW, out of curiosity, what do those pseudo-values look like?
>=20
> (Something must have gone wrong seeing zero-length output.
> So I redid the test program and runs.)

Thanks!  It'd be very useful to have this test program in the commit
message.  Would you mind sending v2 and incorporating it?  Please indent
the program with one tab, so the #include lines are not removed by
git(1).


Have a lovely night!
Alex

>=20
> getnameinfo:
>=20
> * FreeBSD 15: fills host=3D"/path", serv=3D"", returns success(0).
>=20
> * glibc 2.44: fills host=3D<utsname> (flags=3D0) or host=3D"localhost"
>   (flags=3DNI_NUMERICHOST), and serv=3D"/path", returns success(0).
>=20
> * OpenBSD 7.9: signals EAI_FAMILY. Upon seeing NI_NUMERICHOST,
>   signals EAI_SYSTEM instead (odd).
>=20
> * OmniOS r151046 (Solaris): signals EAI_FAMILY.
>=20
> * musl-libc 1.2.6 (Alpine Linux): signals EAI_FAMILY.
>=20
> * cygwin 3.6.11: signals EAI_FAMILY.
>=20
> getaddrinfo:
>=20
> * FreeBSD: getaddrinfo("/the/socket/path", nullptr,
>   hints_with_AF_UNIX, ...) succeeds.
>=20
> * the rest: signals EAI_FAMILY.
>=20
>=20
> ---
> #include <sys/un.h>
> #include <netdb.h>
> #include <sys/socket.h>
> #include <cstdio>
> #include <cstring>
>=20
> int main()
> {
> 	struct sockaddr_un u{};
> 	u.sun_family =3D AF_UNIX;
> 	strcpy(u.sun_path, "/pa");
> 	char host[320] =3D "!", serv[320] =3D "!";
>=20
> 	auto ret =3D getnameinfo(reinterpret_cast<struct sockaddr *>(&u),
> 	           sizeof(u), host, sizeof(host), serv, sizeof(serv), 0);
> 	printf("GNI %d %s\n", ret, gai_strerror(ret));
> 	if (ret =3D=3D 0)
> 		printf("GNI <%s> <%s>\n", host, serv);
>=20
> 	ret =3D getnameinfo(reinterpret_cast<struct sockaddr *>(&u),
> 	      sizeof(u), host, sizeof(host), serv, sizeof(serv), NI_NUMERICHOST =
| NI_NUMERICSERV);
> 	printf("GNI %d %s\n", ret, gai_strerror(ret));
> 	if (ret =3D=3D 0)
> 		printf("GNI <%s> <%s>\n", host, serv);
>=20
> 	struct addrinfo hints{};
> 	hints.ai_family =3D AF_UNIX;
> 	hints.ai_socktype =3D 0;
> 	struct addrinfo *res =3D nullptr;
> 	ret =3D getaddrinfo(host, serv, &hints, &res);
> 	printf("GAI %d %s\n", ret, gai_strerror(ret));
> 	if (ret =3D=3D 0)
> 		for (; res !=3D nullptr; res =3D res->ai_next)
> 			printf("GAI fam %u %u %u\n", res->ai_family,
> 				res->ai_socktype, res->ai_protocol);
> 	return 0;
> }

--=20
<https://www.alejandro-colomar.es>

--pzn7zblf47jamynh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrY/esACgkQ64mZXMKQ
wqnRSA/+MCknw7KUQeSRRuO7v7o3r8iUWct5bZQuI3EKEr2t49BxYR9baqBJwv5T
CUrvZO2pXADS6GEsZsyiy68wujdkvi6wBNUUmibYxB7rTkAjT5f/+1yuFSA1vXba
nv+Nd0+JV+I5axIKpu5hShXcBlsw3K+KalsrYVz0dh/4eLa9ukwJgspjP8/+3v3b
RRRei0l1TpDu1yJ3nQuhWSQqbwYzlLyZvL9/Od/1BiwFH6qP8sQH807bT82EN2UQ
a8jjFtM++jm7PvRcfPGx2LAsQEhq7ZTk6eNe9LUybW5k/VEgTOMKTtiOvPRwwuo8
LHqW/O5PyWZv2CQ4YX6vdDfwZYIoXoh54Jfr6gQ8Hwd5K3Qde775I9YhJrYnuVYf
fsuxjuGA1cLTiqq8GRORXcmTTjfTpy5sAHSjlWLI04QsylU7gltMKHjd7CzwKgH3
W0c49G6ij1tyjVtZjD1I83lmi7lGAwTQJFFExTv5WN2gbNWzJXHX9+fwnWJH1w8e
xSeQYiPVVy/k9qet8sDDn8v/dao/seIQrO84aNEaXCKoxC84Jod7F1u3f1E7WAlI
EAwkYkyc+idvgismWJNa+NVVktRVzFBwBUYzvQdyn+xgnxN7+SCPv8yFyluBNMGZ
vpc1b+hM/Xcn7uWucu5FyI40puMUet0kLMcabddzvMCD/1f4G5c=
=OaZS
-----END PGP SIGNATURE-----

--pzn7zblf47jamynh--
