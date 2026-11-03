Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793665492;
	b=qW+ObrN82XYF+Iprxo+emgJ6BrpW5Ajz4z5oQxodojepvVn3YcAER4v4OlSfyKci9vXW
	 ydJkGr1ceygndQU17Uf58vZZsUOCj2LCKWp6y+l8aoOgcKrcw0PIg7hworLogxmB3h/aQ
	 y7+3+Lm56ndDwKHWkBAzgVT/ob3DUPZ30Hb0GX/fn3Bu1ji6L0pY0F8cMe8xkUHx8Jal2
	 Zqe33Su9RzzNJ6gb95WxU3SyHWM7LHcRkfmqBlQvmckJ/F3DgZwwjNME6A5aZ4P/DS/9a
	 7QniXBkL1kgddbApeYffH9oFTa6nf2z1JRnL4NUytInFs7crWpReO0Y99VohA1Wsp5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793665492;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xjFLGwQhy2NuFYbIvaqAPgKQBpys36T/btvdzVwI+Z0=;
	b=IIKBgmoo3OqEV7KbNYu6DfSqV/yy6wEANebbg7Y04OdEyOvQLZsyKS0EBnWCtfGd++Wz
	 cjwqcMXlGxvBq4DCZeycd19wSn31Y7FtALhrkmYDxBIGIxafqRMmzZ7mRBl89fpKg1oDU
	 1sDCWBMxz9t1m+yVI+q7+iQgY/ki4U0dY5OaKbSvO6Aj8K22g3cddKwaDOnRMksOhgBQa
	 6E7OYaUzn2k8DLzbw+pLQz8XRtdZIug1hO3d2C/iQpMwInpsWI8qLJSE3YflF5gpF7wqz
	 giGRHABi2L7Bnn5TAnSf/FoVsXsob8vRtdcoGmJN1cx1hAHcPIlLRgUHadqQJrC/rsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="gi/6rSoU";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74F7606A324
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 00:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gi/6rSoU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 872081F000C1;
	Tue,  3 Nov 2026 00:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793665491;
	bh=xjFLGwQhy2NuFYbIvaqAPgKQBpys36T/btvdzVwI+Z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gi/6rSoUgayf2a/gxl90to/wIULP/m1OSKryAEljnfaVRHusxa7IzMOQ1rmpbVH7i
	 ohw1vOaqYWIfRehvnz8JE5s+rRTJrVjjKRI3bB9w4Z8m0ZBU7g6rfHMWEZrsKUaulQ
	 PBnGy1bPjyXgsbO1Fg8jC6CdhgDYT/NPFlPe8Yv3yrtnuKhcJ0EOw+JJG19qD+jFzt
	 la36WCYGjIXLOUhK0cj9m2hzHuk23anxfPNt4gSEZJcQb9z1x/ZarSclhjlno2uqbn
	 PgI7Lg2CmSc29/r6RNlTaAmSGMq8xMdlpH0Il8tM6+m1Jfq715sEKMB22hYJF/x70O
	 aqoaz0umb1ZRw==
Date: Tue, 3 Nov 2026 01:24:48 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Matthieu Buffet <matthieu@buffet.re>
Cc: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, linux-man@vger.kernel.org
Subject: Re: [PATCH 0/3] Add Landlock UDP support documentation
Message-ID: <aukpsnxRzT-TPvn6@devuan>
References: <20260917075853.10231-1-matthieu@buffet.re>
 <20260929.phoohohs5Hoo@digikod.net>
 <20261030.5b8905e593ff@gnoack.org>
 <e354fb0d-2173-4015-b945-c413bb1b1c44@buffet.re>
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
	protocol="application/pgp-signature"; boundary="25hvod335dg4xlqu"
Content-Disposition: inline
In-Reply-To: <e354fb0d-2173-4015-b945-c413bb1b1c44@buffet.re>


--25hvod335dg4xlqu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Matthieu Buffet <matthieu@buffet.re>
Cc: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, linux-man@vger.kernel.org
Subject: Re: [PATCH 0/3] Add Landlock UDP support documentation
Message-ID: <aukpsnxRzT-TPvn6@devuan>
References: <20260917075853.10231-1-matthieu@buffet.re>
 <20260929.phoohohs5Hoo@digikod.net>
 <20261030.5b8905e593ff@gnoack.org>
 <e354fb0d-2173-4015-b945-c413bb1b1c44@buffet.re>
MIME-Version: 1.0
In-Reply-To: <e354fb0d-2173-4015-b945-c413bb1b1c44@buffet.re>

Hi Matthieu,

> Date: 2026-11-03 00:37:34+0100
> From: Matthieu Buffet <matthieu@buffet.re>
>
> Hi G=C3=BCnther,
>=20
> On 10/30/26 8:24 PM, G=C3=BCnther Noack wrote:
> > Friendly ping on this, to make sure we don't forget it -- do you think
> > you could find the time to send a small follow-up to this?
> Sorry, busy days. Here are the patches with your comments taken into acco=
unt
> and fixed, and I have a patch ready to sync the UAPI header if these look
> ok.

I see v2 has 2 patches instead of 3.  What happened to patch 2/3?


Have a lovely night!
Alex

>=20
> Have a nice day,
>=20
> Matthieu

--=20
<https://www.alejandro-colomar.es>

--25hvod335dg4xlqu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrpKc8ACgkQ64mZXMKQ
wqmAdBAAvGP/TpB9ueBJ10CCJwlBbqNfQEG5mYR0vedSs4DJ9owi2PURybD/K2o2
kbLAM6i76rJ8+lhU65P6FU8FzUI9IqoN+XZ/kbpFRyemzNzLqY2WH64EML5rre73
A4Kq4R2hTNi83srv02LJlmS2aLhFMweUowwzG364r5uzJjHCrrwyfKp7JoLKMh2F
kF+GoKk8O1Av0zBOHpZKq8bWdRlzi/CmBps0mTfyqbiUtOPu0G4Td535Eh6NcqmV
pk+FXtV1uAt4nd1lMzHk+C4XTt7XyQKGBxfa8Vgpnl1RSNOzkIsodIodz2FTR+lD
aiQRPQx34bH+D4NyYuxqrNS3GAYu8tvzaBxygQC/vqfipnYpIeEozeL7tIsNvvBl
gNFKm5TiK6X8El9GXvxI1lp7gWs+uhugcUhZgw24mULb37DdfXxWayy6jonvgoaM
hXa8V1nTY2PtTte5eroVcvTl4LxE3/gQN3KDMKm7O9M9QhoFhFFSvA/xYK8weK5W
1KDicAI1sE1rdKcJZUfafRdPQ6aXc3nyvBuSMjRn8D6AiCaeYdNKQEdfdjauE29v
VVzEx7z3RAEegjoxo+U5wPoWrMjJrC6kxgWp9sJ9WCPQ1b/F8/+xuwNT4SiIb4KK
K8+ATVqgNtY20PkAevj39LQ1HkOPFtmw+/64vwxiWJWCLFgaFRc=
=/cgG
-----END PGP SIGNATURE-----

--25hvod335dg4xlqu--
