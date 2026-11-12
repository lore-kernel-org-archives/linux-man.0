Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489793;
	b=ioy7CS+5mYWFGHjJSYfrploQPwbwPJmFjMfbmZV9R1DY+DsReIp+AqHEs3XjeSY3JfVB
	 BR4ZGHq1djkt8WmbrQCpMHeS/e7ej4cKpErLfIf2AVKf0IZ46bUNM402I4u/VOLesFhoW
	 yuEjpATMdqNS2GJgcscliZoTQI/JP76ioSEBQbH4MFo6Y8HQCU4L/v38jxGn5tcZtan9S
	 N8stw6ZGERaAX0Q8FDhH8OvT9oWVfF8+bEki4+2yW8LQS+8QtULZtdbO1IaT+ABJa0Xef
	 YrUofK+ICeoPgbrJdjVyRXVbYwOaRoZL5sLj7o+YIrSCSW0wTmyortoHqgmj9dVs1YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489793;
	h=Received:DKIM-Signature:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YHxsFB/a2Ot1DGzDeC8U6atCI0O0+4cX+9Uw4WFr8Fk=;
	b=d7UczsihxyHiqMpwKb68w9Ty0spS0U6owMtBDHGRSCX4VAKtyCu8zoekybfDO8osx1kw
	 4p4fCONFivMBaW0YB8Sy0um2mF6+t8HTaTiklwy68Tt/RFtYyP9tIpQ72RkaPneP+G9/h
	 fG6oUjkwoLJgWoQ1tlA1xyzdstO2k1irY8chrvg2Uj0lQpnKGiuTt8y+M3Lox7kfynu+A
	 0xrUELQV1GANU18F7KfFZ80wiBQUpQwjZfa+tjkUxJy/hxd3T0MSodhnNYGg11uA17dCq
	 tLDVZQY4PFXQ7Cv7SWHoFsJpxWvBrd7oJwkgKOzXhMnY36DZ179y/7wqz/XaHe7sp4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QeqPkFKm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C06606A31C
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 13:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QeqPkFKm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62FCB1F00A07;
	Thu, 12 Nov 2026 13:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794489793;
	bh=YHxsFB/a2Ot1DGzDeC8U6atCI0O0+4cX+9Uw4WFr8Fk=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=QeqPkFKmYxciZ/ASewBGbTqwg6+O17sVEDZ95bElGkCLlJV5hJp2Eln1bx8satijY
	 /TMVXFD32fygesCce0e3znyQTtKy8nMwRl8ONBAAYr7x3mwrj5aEL/CJw+piubmYuC
	 pPEqlePZsogRLLH3erjBF0uU6kIIx3k2mksSQ2etLMAN4wZSMEchPbYsUT1qboQNCZ
	 nKvvTC/iGe1cVaYzJ4nWCbbc+2hJNnK0MfXA7xdnOu9pl6EIkD/pW41YJPJ88kFUtj
	 np5rlWlYhE0JtLTMFKni2I8FSguLwCfd/Jm3VOlUAy33ZlSVZMJodHJhdAeLhPePKn
	 0LCmAnVxVrbMw==
Date: Thu, 12 Nov 2026 14:23:08 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Vincent Lefevre <vincent@vinc17.net>, Rich Felker <dalias@libc.org>, 
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, libc-alpha@sourceware.org, 
	Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <avW9PMcZ6Hm26hl3@devuan>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <20261112015223.GA242717@joooj.vinc17.net>
 <20261112025339.GM26138@brightrain.aerifal.cx>
 <20261112032929.GB160897@qaa.vinc17.org>
 <20261112033742.GG5716@brightrain.aerifal.cx>
 <avWT2aQCFY2GIwLp@devuan>
 <20261112120831.GH5716@brightrain.aerifal.cx>
 <avWwXGpq1OLtNDSV@devuan>
 <20261112131737.GB1951@disset.lip.ens-lyon.fr>
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
	protocol="application/pgp-signature"; boundary="ilr5ohgqogulba2z"
Content-Disposition: inline
In-Reply-To: <20261112131737.GB1951@disset.lip.ens-lyon.fr>


--ilr5ohgqogulba2z
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Vincent Lefevre <vincent@vinc17.net>, Rich Felker <dalias@libc.org>, 
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, libc-alpha@sourceware.org, 
	Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <avW9PMcZ6Hm26hl3@devuan>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <20261112015223.GA242717@joooj.vinc17.net>
 <20261112025339.GM26138@brightrain.aerifal.cx>
 <20261112032929.GB160897@qaa.vinc17.org>
 <20261112033742.GG5716@brightrain.aerifal.cx>
 <avWT2aQCFY2GIwLp@devuan>
 <20261112120831.GH5716@brightrain.aerifal.cx>
 <avWwXGpq1OLtNDSV@devuan>
 <20261112131737.GB1951@disset.lip.ens-lyon.fr>
MIME-Version: 1.0
In-Reply-To: <20261112131737.GB1951@disset.lip.ens-lyon.fr>

Hi Vincent,

> Date: 2026-11-12 14:17:37+0100
> From: Vincent Lefevre <vincent@vinc17.net>
>
> On 2026-11-12 13:27:13 +0100, Alejandro Colomar wrote:
> > How about something this (we can improve the wording)?
> >=20
> > 	diff --git i/man/man3/crypt.3 w/man/man3/crypt.3
> > 	index 524781d3c2a0..d579bc5394fb 100644
> > 	--- i/man/man3/crypt.3
> > 	+++ w/man/man3/crypt.3
> > 	@@ -111,6 +111,9 @@ .SH ATTRIBUTES
> > 	 .BR crypt_r ()
> > 	 T}     Thread safety   MT-Safe
> > 	 .TE
> > 	+.SH VERSIONS
> > 	+POSIX specifies a quite useless API,
> > 	+and all systems extend it significantly.
> > 	 .SH STANDARDS
> > 	 .TP
> > 	 .BR crypt ()
>=20
> The API was useful in the past, but things have evolved.
> Just say that all systems extend the POSIX specification
> significantly.

Hmm, yeah, I didn't intend to say POSIX is bad; I just wanted to let
people know that POSIX is irrelevant about crypt(3) these days (as Rich
said).  Perhaps:

	The POSIX specification is significantly outdated,
	and all systems extend it significantly.

What do you think?


Cheers,
Alex

>=20
> --=20
> Vincent Lef=C3=A8vre <vincent@vinc17.net> - Web: <https://www.vinc17.net/>
> 100% accessible validated (X)HTML - Blog: <https://www.vinc17.net/blog/>
> Work: CR INRIA - computer arithmetic / Pascaline project (LIP, ENS-Lyon)
>=20

--=20
<https://www.alejandro-colomar.es>

--ilr5ohgqogulba2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr1vbYACgkQ64mZXMKQ
wqmLihAAt68t3R7uOpEdZRZ04b+twSGdyNYoB51EeXS/cwp1UGddZRRvTtHo0fh4
0x2vRA1i6e2yYiXoPNsSnjNzwuCv7SUA3u/+x62jOb0uswQyU8QRY13fs34kwl+R
MD1ehEx6tNZn7L5D1do+LPTFV3h1iFb256q2h/2xthXiM/ano2cg3Y2WBmxyOUh7
92bQKp+R31UtmB9/9ooHzYqrlCQhFMGL/IEPzreg1RYueNHTG71MPhmTh5HjtCEy
1hsU6v1empkuzNLlI+g0819lEQJtTsh9X4FLpIObEblTTMO4psD2lAZfpkI2vs/o
6PPLB2qwsh9nTz1HVtEwDZevo2JE3jP3DK6IOP5U/OR7mZYm1goN073fIKK3YdTS
CYNROkqpQeUytjWqRupi5APbOJpVj+GFTfZ1vjVdDOv8Ykqb7Zkg+PKAsiZM4vFA
0QQvm4UWY+KULyYL00EEdW2g/ewuocD+FnsN/ZwVQDrXn3oVjgwH0Vo2hRqORmnR
i8YDrH0LD34RzRC6KGq/6lhcQwgQvmkdWL75OVbaHxy96wy7RwSyVn6iXbE93cY9
QOOXcLKiUnHO0v+tNvy9i2YK4C36PccMhVO3vszy8mb5XF6QWtf0Lm7BW5wH690A
tukztE6fnNKpi90C1I4JzGmTpx0gZmyyRyvZq6jIZeXMMKrJZZY=
=I6xw
-----END PGP SIGNATURE-----

--ilr5ohgqogulba2z--
