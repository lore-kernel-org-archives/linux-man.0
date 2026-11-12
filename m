Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495514;
	b=SjUMGgRwuy286VM6pCyvefF4bvN/94wOPKbsKDbkF7SRUAlRTxClEYDIQg56+tzCWAtv
	 /0n3vX7+83WPeY/RjmhgQCshKGAkHfgNMhxLBHnru6fxk5lpHtogfSCSgrw0pwzZpAGyV
	 jq23yvqFVrSDXT6FqM4B9bTJ97ScbeIuhT/b0mz67jPzsge48qeFInPtakcS+3z6xmdYN
	 9NVYJfjYvm0oq68nvT9bJtZKpXnfKqJFHsmvoPOLahBrR9uRODEcqS+3gzD3cAazm+f4m
	 6r8Ll0aUTW85+HfwxXobdPgDmiDvUSV043nEqe/PDKUpejCB/tkP4iV+dgc+gyMCVNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495514;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NFS24CojZoXvriDnshZcuZIuyfRMFoysdAd13a4HACY=;
	b=EuNzVXyLKL+zq9rg7X1y13oIRqZdxYL2uSvlipkZomZyTMT7lhM8IGRV9MpZheyevLRT
	 Egj8QEe8EAGFyaOJwgvfkum9bfO6J7/eQl99FenrEMV4U6A4Q9PN+NsjTnEr2nwIS6zkL
	 bfFT5FKQ+OG+4Wja1HtmH9Jdp1H5ZemH6sgT3wSHl1RWkieYfa3qYf9my49Hm0Izfrh96
	 Inq30DEsVr+mY4S1UUo/pAJikEQa4jjXa4BORjsFLA9QUok2Cr9DoswLqQ+6/K0YruvGq
	 wgTqhssX8JLEfyXFiiwWE3xIbcVqshBlNv65A04Hs7KOB8/pA8naQb5ET7rK8XmucGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oVqGvis+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4563606A321
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 14:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oVqGvis+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F831F00A05;
	Thu, 12 Nov 2026 14:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794495514;
	bh=NFS24CojZoXvriDnshZcuZIuyfRMFoysdAd13a4HACY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oVqGvis+FoCnrwB2NiAhN441GCwCph0FoICYlbB6nCqx5plCBmqf2k4DEsSHhCWJ2
	 ebr29PJOt0H7oxy1h7tF7/t5/mBXyKbDp4WOCji640jrVqGR4e8Udz7DReZoOvi0ao
	 OeSHf+RAnAoD78Q5+G7vpBk7yFJHXp0dMzvI2SYMNCfyDFhO4xjudua3o7qikh+XMR
	 jSyUxGmaok53tvzUD1Gdh0zTwLmUtgGpNDk5Su/aVYjPaWsAZUKCRQj+yOe6iAHFlJ
	 uQ+kgh04CmY7hfA8+Ddq/N7VailRiEB1qeUVwuhVzuSKQugTNJnvLl8Y65aCsxE86v
	 y1ofYPyAyOJuA==
Date: Thu, 12 Nov 2026 15:58:30 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Rich Felker <dalias@libc.org>
Cc: Vincent Lefevre <vincent@vinc17.net>, 
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, libc-alpha@sourceware.org, 
	Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <avXSmj4FXqnwZTwK@devuan>
References: <20261112033742.GG5716@brightrain.aerifal.cx>
 <avWT2aQCFY2GIwLp@devuan>
 <20261112120831.GH5716@brightrain.aerifal.cx>
 <avWwXGpq1OLtNDSV@devuan>
 <20261112131737.GB1951@disset.lip.ens-lyon.fr>
 <avW9PMcZ6Hm26hl3@devuan>
 <20261112134516.GD1951@disset.lip.ens-lyon.fr>
 <20261112135501.GI5716@brightrain.aerifal.cx>
 <avXFw_RUi0C4Ta1V@devuan>
 <20261112144349.GO26138@brightrain.aerifal.cx>
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
	protocol="application/pgp-signature"; boundary="24vjyvpl2oevxtwz"
Content-Disposition: inline
In-Reply-To: <20261112144349.GO26138@brightrain.aerifal.cx>


--24vjyvpl2oevxtwz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Rich Felker <dalias@libc.org>
Cc: Vincent Lefevre <vincent@vinc17.net>, 
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, libc-alpha@sourceware.org, 
	Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <avXSmj4FXqnwZTwK@devuan>
References: <20261112033742.GG5716@brightrain.aerifal.cx>
 <avWT2aQCFY2GIwLp@devuan>
 <20261112120831.GH5716@brightrain.aerifal.cx>
 <avWwXGpq1OLtNDSV@devuan>
 <20261112131737.GB1951@disset.lip.ens-lyon.fr>
 <avW9PMcZ6Hm26hl3@devuan>
 <20261112134516.GD1951@disset.lip.ens-lyon.fr>
 <20261112135501.GI5716@brightrain.aerifal.cx>
 <avXFw_RUi0C4Ta1V@devuan>
 <20261112144349.GO26138@brightrain.aerifal.cx>
MIME-Version: 1.0
In-Reply-To: <20261112144349.GO26138@brightrain.aerifal.cx>

Hi Rich,

> Date: 2026-11-12 09:43:49-0500
> From: Rich Felker <dalias@libc.org>
>
[...]
> > But is the POSIX specification really useful for applications?
>=20
> Yes. It tells you enough to validate a password for authentication
> purposes:
>=20
> 	const char *result =3D crypt(password, hash);
> 	if (result && strcmp(result, hash)=3D=3D0) {
> 		/* password validated */
> 	}

Is this really specified by POSIX?

Unless I'm missing something, I only see something about it in EXAMPLES,
which is non-normative, and it doesn't even explain that this is the
only way to do it correctly, but rather as a possible example.  Notably,
I don't find any text that says that passing a different hash as salt
could potentially result in a hash that matches the stored hash.

That is, I don't see any text (normative or non-normative) in the POSIX
specification that implies this:

            When comparing a password against an existing hash, that
            hash (and no other) must be passed as salt.  If and only
            if salt compares equal (see streq(3)) to the returned
            string, the password matches the existing hash specified
            by salt.

The example is useful, but I'd say it's not enough.  I think the example
should contain wording like that one above (which we're discussing in
the other thread for the manual page).


Cheers,
alex

[...]
>=20
> > An application should not rely on the specified return value either.
>=20
> It can rely on it for validating passwords against existing hashes.
> That is the more usual application need. Setting new passwords is
> usually an administrative task, except for non-system uses like making
> .htaccess files.
>=20
> Rich

--=20
<https://www.alejandro-colomar.es>

--24vjyvpl2oevxtwz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr11AwACgkQ64mZXMKQ
wqlTmA//e14Rh3KrFduVpEl36JFcoXrmPafV+ygFRMkSIWmHz0CUy6eHGZSrdQTP
JsypkOByBsXqlS72dhR5BFALCBDm4iEf1YkZnFAq5zuLpFdXOtEEixmfPk7UKYks
bsN7Hhc+tR9IN/k5LJFK5TNpXTcizaOy0k+e5WYTxMx8JrzUbOlyE5x4T1v+txm+
BMRTNuNNKBW0eeF+IfQS/yC8sCvbMJFe6AZYPoWMicFWDIUcoUEYeEWIw+jGmgRd
PTTbMylDDoY7US061nrmJMuwzHsDszOlMKnT9CwvE8ndKYvPZaeC2+HmaVaOn0Cr
nEFBfw2zWcfcL4sxj2C5Hr3U3R+mo5zXAEQsPaq4esGcYqtxgTGYfzrgSQ6ZkeEE
30LbwxI1ULIv8uKabcggoYSgNwzbkjP1wPz2jMU94jCNXJFJAZ5PFj7XDXlbWEG+
18ycwHdHWW1FA0Hgu5Swd4RCKbXvPmDojc6rdLPDaIArdCeVEFjY+aN95UvXEMQ7
1NTV+VvyphVORyxmpubM5NI64WeOZm2Ig5L1teJn7Qs9GkGJJB5xICi4iQpMGZlE
M/NYK94BeOmeXuD6+eT8yZjrHAbZM8Uo2A49oGUBjDQ4Wv8uXjiJzbpmaj7m0MBg
e0g16XHgrCHIAIR2NoB+Ku1NTGMW3tyYBkPlbwzcDr0lXQ5q31U=
=iXnM
-----END PGP SIGNATURE-----

--24vjyvpl2oevxtwz--
