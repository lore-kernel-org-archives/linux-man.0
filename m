Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793312878;
	b=BPzmfZ8R5ElF+B8SCZfyBPSxFa+/so0RmoXJ3SEkG7R4DFFEMGboJQyJx+/HFdzh0xLY
	 1Z2QQw2Aa6smntnNCTUH6TqqWbv4nUMiyHaB7zgo8hiu7VnTETUeM6hZNdIn5bBHGHo15
	 QzGRmMwZ0rLFeTXxs9aztf5B/IlupyKQJnGUxdzqAK0NRrWObgXshn9LEgFlsbN+ohJ2z
	 srbpr4zPOGNhSvNEXIBTTO8iE47lnHLzH/TxPS6+RhOToAtznrEZmc5RDJBdC78Ix1uH3
	 82REvbar83MFJ0TFbAqgSe93iEWsvLuYk51RET1kOwBZxywT+m9AmFlgWXCjy1Gm1uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793312878;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pGtW9ptIdnM9RBBQP7C0poKrxh7hvZdQARusDoTXktc=;
	b=X8GozPZKP5yfPGQHMQPam+7e8PEudZS6Ab6+jkscWMIzoHBg15rn4tfRVNhRvN8lbLV2
	 rhS1Tjesm7G2WwhiuvRaHWsZMxeJuBPh1Hqa8uKEtV1EflqcYgtpvEhWAMiGDrDnen4kR
	 LydoIKJHOLJSRIouKdPuR79CxUbtthpYpSzZ62tJCFdOwL2JdZe8NyzJMWKcvV3Yj1zyr
	 tsakwJi/hqJRRlsJgiAWlVVeNASN+syU5Fhg5iV4OssqoO1kvn22QmPGLNkwZka68czcB
	 4zwbVzUr/KFjD3xtytDF9AQdOQK8G2haa7J4NcX4VmTJtM8mGgvVufKyQLZ8njoN1Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsZnhmgV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4EB606A31D
	for <linux-man@vger.kernel.org>; Thu, 29 Oct 2026 22:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsZnhmgV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475C01F01824;
	Thu, 29 Oct 2026 22:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793312877;
	bh=pGtW9ptIdnM9RBBQP7C0poKrxh7hvZdQARusDoTXktc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AsZnhmgVzSmAazahXYhbNes2uzlKmBIg0t1PRF70/us1y9E4UpQ9KbK3ySMu3orFg
	 2E6ybbgqfYQpzHpETm5VV6qEoGQK7ybnwqCEvtl63YCNHh4E+OVKfH4lsBCLAP7dYz
	 J939i8oLuR+hJ00wrg1v09Fa/+o5j8aS+EvoXQhXNWYfon9nGBXQjSglrogsuiZSKW
	 9OOHXOusTOfsPwA5vrsuZGjyyiw+ToJmIZQ7Ef14w63STs4BgANRQqITfBXnIGEVex
	 hU1fW8F0+t58hHcrXt6BAmvl7AjuzXhy+YXquNT07loSGWsx8zdyw1yCv3uOrUsobz
	 ALssihwnvebeQ==
Date: Thu, 29 Oct 2026 23:27:52 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Stefan Puiu <stefan.puiu@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: Serbia
Message-ID: <auPFMcZfChP7YxMq@devuan>
References: <auFA7dfNv4jk3R9e@devuan>
 <auHu-XoGs3jufdhY@devuan>
 <CACKs7VCkdNRyfsPZU-859vjPzfeHTPo14gj3Ezgu3JYEGLyiZw@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="nmx6oqnqkqhquwt6"
Content-Disposition: inline
In-Reply-To: <CACKs7VCkdNRyfsPZU-859vjPzfeHTPo14gj3Ezgu3JYEGLyiZw@mail.gmail.com>


--nmx6oqnqkqhquwt6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Stefan Puiu <stefan.puiu@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: Serbia
Message-ID: <auPFMcZfChP7YxMq@devuan>
References: <auFA7dfNv4jk3R9e@devuan>
 <auHu-XoGs3jufdhY@devuan>
 <CACKs7VCkdNRyfsPZU-859vjPzfeHTPo14gj3Ezgu3JYEGLyiZw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACKs7VCkdNRyfsPZU-859vjPzfeHTPo14gj3Ezgu3JYEGLyiZw@mail.gmail.com>

Hi Stefan,

> Date: 2026-10-29 20:49:06+0200
> From: Stefan Puiu <stefan.puiu@gmail.com>
>
> Hi Alex,
>=20
> Sorry to hear about your Serbian "experience".

Thanks!

[...]
>=20
> I'm from a country neighbouring Serbia - Romania. I've been there a
> few times, though it's been a while - in 2007, 2011 and 2012 (the
> latter two for the Exit Festival, which was quite nice). In 2007 a
> police car stopped us and started checking our papers, and were a bit
> aggressive verbally, but eventually they let us go, they did not find
> anything wrong. They only spoke Serbian, which I don't understand,
> luckily we had a guy who could translate with us.

The cop that stopped me was actually quite nice.  Other than the evident
discomfort of being retained for so many hours, I must say he was nice
verbally, and he was very transparent when searching my bad so that I
saw he didn't take any money (or anything else) from it.  And he spoke
good English.

His boss also offered some soap when I went to his bathroom (which was
quite dirty).

And they didn't hand-cuff me at any time.

> Also, they had a
> system where foreigners had to tell the police when they were staying
> somewhere in Serbia; they were a bit pissed off in 2007 when we did
> not have the paper from the police when crossing the border back to
> Romania. My impression was that they still had the old police state
> behavior from communist times, and also suspicion towards foreigners
> of any kind. Were you there before the elections? Maybe there was some
> paranoia in the mix as well, who knows... Ceau=C8=99escu was quite parano=
id
> before his overthrow, he was suspecting all kinds of foreign
> interference, who knows, maybe Vucic took a page from our guy's
> manual.

Hmmmm, I entered the country on 2026-10-14, the incident happened on
2026-10-15, and I left the country on 2026-10-16.  It seems I was there
10 days before the election (I only learnt about that election yesterday
night, after writing the email).  That probably made them suspect of
foreign interference, indeed.

> Anyway, I hope you are OK now.

Yup!  Thanks!  :-)


Have a lovely night!
Alex

>=20
> Regards,
> Stefan.

--=20
<https://www.alejandro-colomar.es>

--nmx6oqnqkqhquwt6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrjyGIACgkQ64mZXMKQ
wqlTaRAAtZgV+9PXoDykL3S7lpmkLuaTI7mjVxC7fGsxfyoii7QGU/98KyYCGe2w
2SCpzd+Xssyn7OAWbL3ZNZmNcIdfSnECpBhEdbYRh2EkpgcY95XiJejkTX+SnA1D
5BduRcIUjL14WNmWTuWYw6TGwl96wm/rKTKEguHWc8mkI3kVhkXjUbmG7lPRygQd
GpV+9TvgNQ72nT0quWPDNdGV74c4D735s1aaLhHXPlP8aCvfd1DFMscFrvzAcLFR
Iv9cMa9BIlA5cnl/nkRgyJ7p2nn80CqtykvTwLwNLP/gZoEErxSGqNNOHs4rjv80
swYYqVYZofJmvlO9qW83mlzQYcKPBz7zYLdDBZ2snQYeynq4xaqPxbjxXf+djW+y
3g/gMIu+hl56Bz9ypO1nIx5x7sZI/+Npq5uqgPcXFS/+sCUPlVNbH9maV0uxUfLZ
6eGZrO+WM947dqubyU58nnbBq8lus4I6OEnSFrFt0BkL243/FOSzkvJCqYGfBtG6
eG1IeuB0GfA0tInuk5c3u0pXA4UsFx3Utm14PAhyJCJpMmnotSlI/HxO5MRIz6ng
3HXgs3iAzU96nNS2n5IKoxQvfSLSiYRaFj6ObSkKROZhE+UuPbVnzntjjivoE6B4
MI23C8cgp0triwes0tM7pJIvhrO4vQDIchGV2LRkZjIqNO+AeBk=
=JY2m
-----END PGP SIGNATURE-----

--nmx6oqnqkqhquwt6--
