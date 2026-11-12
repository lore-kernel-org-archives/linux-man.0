Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489979;
	b=N3bd81eh7nWbZ9a0HL32aIMKL5qIif5ffYw6FNeIPFM2YNbs9m3jiRxBltgYsbJnafzI
	 EUjD7r1TB0dwRdazEemnV/ZfukTWGgKfnRwfNuPK9XVbS1f64Nj4Okk1x4m6KvK0pkiX2
	 /Jytyw25WJP7rlqr0GIEQn15vFbS1FAQfeRZ3HXaG16vz8pVsuxhTMR+uiIicjZb2TrJE
	 i6Xa7NQcBoeGn0qisME3hc8RPdkYew2c1tmxXAu4OdeQH0hLiNZwQDT5do/Cn4jzKVo1b
	 AMgt7skl+NcW5qTKYzksYDyHiK2zhBL/Gs2Kd1vyB/YGoFAySwW68GQ8z5QoNyQVznA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489979;
	h=Received:DKIM-Signature:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/Iopv+L6gihIZ/EJET6qy5YTa1oSi3nM1g+Z+Rl+HSU=;
	b=5mO7dA/h1m+Gq0KHwBBhLZedb3uu6obYcdmxhmgCK4Jj8FxmXwKnZEypWg1D6p7T74Gz
	 XSJl10vvgMaWas/patS/gVXx6x0a/oGExm/rrScaxuSkrbo/2HEf4AHq20tVVSzLZzKpw
	 840hWDoF2g38YIul1ZIQZ5WZpx3Bp6oi9yzphWz32ckYA6BsVZS9XijVfsYDzKCw+Xwjm
	 euTaVAGkoBC0YSzcjZD1o1kuzYRkpD8C9Pv/8XsaWDw7aa+zFK+Y/1G8Ex36lYZqfzd4B
	 KE17Fmd9Nlcctzlj/HDN0RXsN7DnJOP69ByYVx/sVL671FMDBiv5dB17qGo28F0ZjCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PFK+j2v4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FC8606A323
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PFK+j2v4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FEEC1F00A06;
	Thu, 12 Nov 2026 13:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794489978;
	bh=/Iopv+L6gihIZ/EJET6qy5YTa1oSi3nM1g+Z+Rl+HSU=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=PFK+j2v4h5dHmYuM9NLdP75F5zbYKi9n619Fta3SIgriAg/qsZEgpZ0uPmwLomwSd
	 eP7rV5DCr2W44SEhFAhNfzRH49NerURCKvfoEbh2iTrE2/7y3F7F5P6/n5IpibfgxE
	 9RdTor40qQZDansxLgTIoCtmJeATqjr5GYJr4yWckCXaJdlAj9r8597g0WZZ5ncYv1
	 73VsIZ1jpKnR3irBdSOzXVTqM6DAGFWapZ3RvmjbpDfXW+SCGtEUXZ2b7F0O6a/1Ea
	 9HD2RnbybVj/6CyRuAGo0KsSwO+HW0pISqIQ9jnWXto3EIOq5rf8oeLa4SMjAYuHPX
	 xCaAveMrQI2jw==
Date: Thu, 12 Nov 2026 14:26:15 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Vincent Lefevre <vincent@vinc17.net>, 
	Alejandro Colomar <alx@kernel.org>, Rich Felker <dalias@libc.org>, linux-man@vger.kernel.org, 
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht, 
	musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <avW906X136SKnaX_@devuan>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <20261112015223.GA242717@joooj.vinc17.net>
 <20261112025339.GM26138@brightrain.aerifal.cx>
 <20261112032929.GB160897@qaa.vinc17.org>
 <20261112033742.GG5716@brightrain.aerifal.cx>
 <avWT2aQCFY2GIwLp@devuan>
 <20261112114033.GA167321@cventin.lip.ens-lyon.fr>
 <avWo_yv5znRjCPvO@devuan>
 <20261112131547.GA1951@disset.lip.ens-lyon.fr>
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
	protocol="application/pgp-signature"; boundary="emm3gwldcmfdiry5"
Content-Disposition: inline
In-Reply-To: <20261112131547.GA1951@disset.lip.ens-lyon.fr>


--emm3gwldcmfdiry5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Vincent Lefevre <vincent@vinc17.net>, 
	Alejandro Colomar <alx@kernel.org>, Rich Felker <dalias@libc.org>, linux-man@vger.kernel.org, 
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht, 
	musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <avW906X136SKnaX_@devuan>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <20261112015223.GA242717@joooj.vinc17.net>
 <20261112025339.GM26138@brightrain.aerifal.cx>
 <20261112032929.GB160897@qaa.vinc17.org>
 <20261112033742.GG5716@brightrain.aerifal.cx>
 <avWT2aQCFY2GIwLp@devuan>
 <20261112114033.GA167321@cventin.lip.ens-lyon.fr>
 <avWo_yv5znRjCPvO@devuan>
 <20261112131547.GA1951@disset.lip.ens-lyon.fr>
MIME-Version: 1.0
In-Reply-To: <20261112131547.GA1951@disset.lip.ens-lyon.fr>

Hi Vincent,

> Date: 2026-11-12 14:15:47+0100
> From: Vincent Lefevre <vincent@vinc17.net>
>
> On 2026-11-12 13:08:12 +0100, Alejandro Colomar wrote:
> > > This means that when "$" is supported by some implementation,
> > > the interpretation of the return value may be different from
> > > what POSIX specifies.
> >=20
> > Kind of.  They better don't deviate from it in non-confirming ways;
> > one could argue that musl's "x" return value is indeed such a
> > non-conforming return value, and a NULL return value would be better
> > (both more conforming and safer).
>=20
> This is more complex. The issue is that in the past, crypt() seemed to
> have been designed so that it could not fail (except in the case where
> it wasn't providing any implementation, i.e. it was always failing),
> so that applications did not expect a null pointer and some of them
> still do not check this case. Hence the choice done my musl.

It would be interesting to list all FOSS programs that forget to check
for NULL, and perhaps talk to them to update their code.


Cheers,
Alex

> Problems could be avoided only by writing more robust applications:
>   * They should have had a check for the null pointer.
>   * When a hash is obtained, applications should also check
>     whether the hash has the expected form (for instance,
>     the "*" returned by musl does not).
>=20
> --=20
> Vincent Lef=C3=A8vre <vincent@vinc17.net> - Web: <https://www.vinc17.net/>
> 100% accessible validated (X)HTML - Blog: <https://www.vinc17.net/blog/>
> Work: CR INRIA - computer arithmetic / Pascaline project (LIP, ENS-Lyon)

--=20
<https://www.alejandro-colomar.es>

--emm3gwldcmfdiry5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr1vnYACgkQ64mZXMKQ
wqm26xAAuZbxeoGZkmpdZKgW0nP7aQSt1n9kW4O+cS64xNYk8Fllaq5NdjmVHI1I
PM1QezaILGFcjvfhgnTEuMW2k/ZH/FKlvTWrs/NqtzKWCZLmvTAYP6VCil5AWwjZ
C2tWEKkMe3N7uaEuS+FC/JTeNc/dVeqJ6VZM5icVCYGs4BhDZtBxAXhcNwgM1knJ
dGlOMCl2BEYLSjI8CHfuRZ/sAKYtEWX7a4u9mKvhRYrbRqjIuyS7h9e2u9rxpLzP
hpaduJoNWpg45U4m03VoPpFUHpSgRcXUiniOEVhEeRhiYeoElqOV4zOaJ4pYQJGH
mUj11UB5PjY0ckEfQ+p6cr6HK1KRiWqpcRemvDwt/V2BQE2P+hO9Ge/VGcqiBixW
m6No+0DKt6LWxQJF/Ovv9xRe1S817VYeCiO2VZtKct0n7vSB6LZIThqwPZhros/K
u1PA8NXQMGX5okNJl8wwzRT30KoMWAk2lNxzkAmRYj6HFOCm1eS+UnPKIHpzMNHU
V0GlYtXrMlqvy/LSOkLZPGKbxVOir1+ATYnVEkPaxzZTEZAsSpo0mNf3xnDoKR/d
qc/aSbTeo0k4AH6DJgNpFOfksEE90kV9ex3OJOd5aHa2Z+SEWZ9xpvBwRtsyNsUf
P0iZk73WYtDdKpVqCYLsjrHLXzg8tGgKkTTLuiaEIB0KrlDRWd8=
=RgE5
-----END PGP SIGNATURE-----

--emm3gwldcmfdiry5--
