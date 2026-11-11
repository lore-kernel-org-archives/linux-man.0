Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423306;
	b=El7w41XeNPcF1MozoZFFJLp3PwPRfqRBkhir4qDtkLjHlAdx9iuNEaDKtlD0IF5AQf40
	 gYzMyTY0Cw0E9MMbvZcG3U31qG2GKv6NHtShaWD4KwTbXVWUwtYDz0o3b1mFBrEvibb9e
	 4OyYa7ZgXXgW3xPkBXRxRv0Ur3FypzL1dyT9FbbMEhyh9AD5m1VDgglUrPzO/WG5CcnxY
	 i9sZitLuvmxE7SdH2w7hNgvWZG5nuXXX2yKHnpQvu6Qx06QSwieIU5uI6A4rglCixZtNo
	 whEVkxAOPJVv6wpNV36SEyYt9TLdUhYTElDs8J1TUhxzaiIXDOphquQP566ozq36khQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423306;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=v2UGi616wecO96Wk8ED5mPwio0ZiL0v7X7VdLSYIbG4=;
	b=PjtPD/QCMJmsQn3CHgvkMso9Bfb9y9+eZfaWNfd0Agf5PJiaKrk7xZYbkKgVPGrs9iON
	 Eo57anZw+PB9XWIAl75J5NMuI4NkxHHAI9C0T8wpBy/QMfqDdPy0gdQoj8QoNgvPJaky6
	 nYgx6JgN8hR+6ZczUa2cMXm1HlX2nUxf92K7L2YbKQbnIDaGYu4otGJPFdETIGZ1kW6nl
	 j+0aPtPWMwbLbN31vTwL6h5OKagYGMCYfuoiU20OoVcabFsijZa8Gq7ldZ4uCxtTfB7ah
	 j33wURnnubWem7K10BBltN3jEtmqbWVRbM7YdZagjOTAvAkS1vNpmsCr23QG+XCKZug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E+1WYav0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482D7606A326
	for <linux-man@vger.kernel.org>; Wed, 11 Nov 2026 18:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E+1WYav0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231DA1F00A05;
	Wed, 11 Nov 2026 18:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794423305;
	bh=v2UGi616wecO96Wk8ED5mPwio0ZiL0v7X7VdLSYIbG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E+1WYav0eDdPtI7NXUdYNExz+YzWiGAxnB1brR8yQn9zeKzYdACDN0z4JvXgwcvmb
	 z3q7TuX2Ck++beqn/Ye0V7iTKMohH303gQ5mLNSbWXZibnwe+iIX5TPtaOa51H5r5v
	 IbicZU5Gyy9igDXOrxVEqj1THpvRrVtXkPsnlYk4IWBypXyzNMaJOL6if1pZYid8q6
	 8EZcvokY/0pwp7kBFLbTH45IP2nT4HiJE4iuvOmEAO/vgqRIMy207WdcFFSzlcLRBa
	 1dVfDMYQJbXWm1uPOiK4smqrZ2bvrOZbNAimu3ZehQRzrwuqJSyze38Vggc8NI+L8V
	 9s1GEXlQBKqUg==
Date: Wed, 11 Nov 2026 19:55:01 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, 
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>, Rich Felker <dalias@libc.org>, 
	~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [PATCH v1] man/man3/crypt.3: These functions accept many
 algorithms, not only DES
Message-ID: <avS4ybx_EfRvGsw1@devuan>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <avSERDjw/CeqN60U@hallyn.com>
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
	protocol="application/pgp-signature"; boundary="7rfq4hoqfv75h2jr"
Content-Disposition: inline
In-Reply-To: <avSERDjw/CeqN60U@hallyn.com>


--7rfq4hoqfv75h2jr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, 
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>, Rich Felker <dalias@libc.org>, 
	~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [PATCH v1] man/man3/crypt.3: These functions accept many
 algorithms, not only DES
Message-ID: <avS4ybx_EfRvGsw1@devuan>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <avSERDjw/CeqN60U@hallyn.com>
MIME-Version: 1.0
In-Reply-To: <avSERDjw/CeqN60U@hallyn.com>

Hi Serge,

> Date: 2026-11-11 09:05:40-0600
> From: "Serge E. Hallyn" <serge@hallyn.com>
>
[...]
> > -     salt is a two=E2=80=90character string chosen from the set
> > -     [a-zA-Z0-9./].  This string is used to perturb the algo=E2=80=90
> > -     rithm in one of 4096 different ways.
> > -
> > -     By taking the lowest 7 bits of each of the first eight
> > -     characters of the key, a 56=E2=80=90bit key is obtained.  This
> > -     56=E2=80=90bit key is used to encrypt repeatedly a constant string
> > -     (usually a string consisting of all zeros).  The returned
> > -     value points to the hashed password, a series of 13 print=E2=80=90
> > -     able ASCII characters (the first two characters represent
> > -     the salt itself).  The return value points to static data
> > -     whose content is overwritten by each call.
> > -
> > -     Warning: the key space consists of 2**56 equal 7.2e16 pos=E2=80=90
> > -     sible values.  Exhaustive searches of this key space are
> > -     possible using massively parallel computers.  Software,
> > -     such as crack(1), is available which will search the por=E2=80=90
> > -     tion of this key space that is generally used by humans
> > -     for passwords.  Hence, password selection should, at mini=E2=80=90
> > -     mum, avoid common words and names.  The use of a passwd(1)
> > -     program that checks for crackable passwords during the se=E2=80=90
> > -     lection process is recommended.
> > -
> > -     The DES algorithm itself has a few quirks which make the
> > -     use of the crypt() interface a very poor choice for any=E2=80=90
> > -     thing other than password authentication.  If you are
> > -     planning on using the crypt() interface for a cryptography
> > -     project, don=E2=80=99t do it: get a good book on encryption and
> > -     one of the widely available DES libraries.
> > +     salt is a string used for determining the hasing algorithm
>=20
> typo: hashing

Thanks!  Fixed.

> > +     (possibly including parameters).  It is also used to per=E2=80=90
> > +     turb the algorithm.

BTW, I suspect the salt is not used for perturbing the algorithm
anymore.  From musl's source code, at least for SHA-512, I _think_ it's
not reading past the third '$', and thus it's not reading any random-ish
bytes.

Should I drop the second sentence?


Have a lovely night!
Alex

> > +
> > +     The returned value points to the hashed password.  The re=E2=80=90
> > +     turn value points to static data whose content is over=E2=80=90
> > +     written by each call.

--=20
<https://www.alejandro-colomar.es>

--7rfq4hoqfv75h2jr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr0ugUACgkQ64mZXMKQ
wqk/fQ//X8id1XH1RfsW4OIURfA9df7nXb0w4hGV74ruqayjlmx58NDifJDpQgi8
EZEXZeBA/+iscNbO+t3zus0JIdqnjmtY9HKrE8uN+amD4eHWquXGpYSWngHWxSzM
u+hAuICx4l3/OVXmWlekHV+bssExgRcNAzkd70fJiYCnVrDGFMG8RB8bWYhM8aLK
8SyJxLhG6MSx5DL/W99CRtehlfvb2vJtCNPDxdR0z/4EoUuOjg2OMNlxZM2ffdST
wR4txqa0RsrtEvIyaYvdfNcVv7YYv4943CTwaV8zXilyAY72LGU0Y6Puqx4s5IOs
FZnpiETieAwABay4hImmhn1ZERojJsUnK7gUoenz5L/aRC3tW4nhjbz2twI+IBlF
B2J1qsiAVLL+n+9x2nIkkYQfUPWiU3+HOtrZ4CviBVmhUS5Nhpv99wqsVgzBvAyS
5oXwUEpqxvRsqe6Q6bNVA9UcoDgVy2ZCriHp1kbaYVtW8dxQx1TzslfPq60AvoXn
GPjomhtNfzIb9M1emN/Ij7f0y+P6YavjL9oK0eA2B19Y+DknQmFAt9QgiYfTienX
dn4eT0FQP75v7WnrUo35AGyjZ4GVOnw/eNPtoD23qZHFkBTKJunXg91EPiP3CgYP
sFVaqhbpzzIydojq5UkfNXv3ylgIG16JvO04NDwWwcO8QDZsSgU=
=cyZU
-----END PGP SIGNATURE-----

--7rfq4hoqfv75h2jr--
