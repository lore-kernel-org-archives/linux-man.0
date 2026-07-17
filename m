Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C49369D50
	for <linux-man@vger.kernel.org>; Fri, 17 Jul 2026 17:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784309040; cv=none; b=MwhP4S13luCzoeFuYnPLr/PyWKXFLDrPrFXVWXM+z9AP7iWpsCfnWDhDAnmnQWEZ5ULiz8skvBKZ5DPSgITycDotY4xw0N2kQFDsR+jwoUgKQhhL7qEAjeci6RdNTlRwBMNFMVja9bimGjroTd1rZVen+KIwlmKjLUHp2+ZBtxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784309040; c=relaxed/simple;
	bh=jnOPL8huFNY/IfDkM1JFkLSzesNZkCHhiEdWkKK/n7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkvuVbHMm9003v8bTwtk0YqNL6QeSsDr1cFRbgyk8cj0a+0DJ1Nj5zPEJSTuc4TSNcUkKw2+nnuWLBAQcEwkcWl9kIid4bQWA0t7+zda8TMtMwWtrWzSl/3kAeFHFufvg8jlvFdvbEi26FPip0OweFpC0zvkOpjpbJ+gGiz9WKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXzgBj7I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXzgBj7I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397151F000E9;
	Fri, 17 Jul 2026 17:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784309039;
	bh=hEdYBa/RVP6OHYSABU4+cmUV7YCoYwi9t8x6piUsI5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XXzgBj7IZHZxzWqnFA2Zpcx/MnQg5nOgmlZr/RZaoBJhADp9sxTimygexoT6qbV8j
	 zbcQ/BNo5nEMLsGwZ1opRCWHLq2rfLEAaY4EqhfrBgRiWi3TI5pxjzeveCGNtaVEaq
	 BXC7f63lLPJzi0p+a1DCQ9GHUGF6qW767kKw1XhAnSSqGJ5sxwIxutacxI+ET73Mo1
	 XACM4EXkapzs22KUjhKi9OWBO9TsDtu6lLAwXh1b3tYWSnggOnFDVAn2D0W5E1v8NY
	 E6VPp3QKdFRl+q6n45KCBBFvEwcpHFrDRW4UEwlHhSvLq03rvFCzNpn53zNAH1ASPH
	 mhZJ3Qu+eWG4w==
Date: Fri, 17 Jul 2026 19:23:55 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, 
	linux-man@vger.kernel.org, "James K. Lowden" <jklowden@schemamania.org>
Subject: Re: syntax of options in man1
Message-ID: <alpkkFKmwAYZC7uU@devuan>
References: <CAKH6PiXDGL658h1t_bstW0Z+MjjJfcNmcde-DA3QNOYKc0TTGg@mail.gmail.com>
 <aljtsrJVLTN6qlxP@devuan>
 <CAKH6PiXx=WycAiPGti3LAAfpmDQExkcWsatXjOXpD=GdiMc0ng@mail.gmail.com>
 <alobDcKZVkwVqzRx@devuan>
 <20260717171509.4sdaukkhloy33lne@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7vxl7spbw7l6xkwq"
Content-Disposition: inline
In-Reply-To: <20260717171509.4sdaukkhloy33lne@illithid>


--7vxl7spbw7l6xkwq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, 
	linux-man@vger.kernel.org, "James K. Lowden" <jklowden@schemamania.org>
Subject: Re: syntax of options in man1
Message-ID: <alpkkFKmwAYZC7uU@devuan>
References: <CAKH6PiXDGL658h1t_bstW0Z+MjjJfcNmcde-DA3QNOYKc0TTGg@mail.gmail.com>
 <aljtsrJVLTN6qlxP@devuan>
 <CAKH6PiXx=WycAiPGti3LAAfpmDQExkcWsatXjOXpD=GdiMc0ng@mail.gmail.com>
 <alobDcKZVkwVqzRx@devuan>
 <20260717171509.4sdaukkhloy33lne@illithid>
MIME-Version: 1.0
In-Reply-To: <20260717171509.4sdaukkhloy33lne@illithid>

Hi Branden,

On 2026-07-17T12:15:09-0500, G. Branden Robinson wrote:
> Hi Alex,
>=20
> At 2026-07-17T14:10:23+0200, Alejandro Colomar wrote:
> > On 2026-07-16T13:19:20-0400, Douglas McIlroy wrote:
> > > > I think there should be a separation between an introduction to
> > > > the entire system (maybe this could be intro(0)), and an
> > > > introduction to the first section of the manual (intro(1)).
> > >=20
> > > I agree. In the early days, at least, there was such a section,
> > > called "getting started". I like the idea of calling it intro(0).
> > > The very name suggests that there are more intro(.) pages. Elegant!
> >=20
> > Thanks!  I've done the split already.
> >=20
> > 	commit 214f536963b0a108abc54b336d8ac21b4c9f1c7f
> > 	Author: Alejandro Colomar <alx@kernel.org>
> > 	Date:   2026-07-17 14:05:19 +0200
> >=20
> > 	    man/man?/intro.[01]: Split part of intro(1) into a new intro(0)
> > 	   =20
> > 	    Let's keep intro(1) for introducing just the man1 section,
> > 	    and move the more general introduction of the entire manual
> > 	    to a new intro(0).
> > 	   =20
> > 	    Acked-by: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
> > 	    Signed-off-by: Alejandro Colomar <alx@kernel.org>
>=20
> I wonder if James K. Lowden's proposed "man-intro" document might be
> worth a second look at this time.

Would you mind bouncing the email to me?  (If you have it.)

> https://lists.gnu.org/archive/html/groff/2021-05/msg00032.html

The thing is, I hate big-bang replacements.  I'd like to see small
patches that can be reviewed on their own.  If you would like to send
the most valuable pieces of it patch by patch, I'd like to have a look
at them.

Considering a full replacement of a manual page in a single commit is
something I don't enjoy.

Also, deciding on my own is boring and prone to mistakes.  I'd prefer
a long discussion where we iterate over versions of patches.


Have a lovely day!
Alex

>=20
> Regards,
> Branden



--=20
<https://www.alejandro-colomar.es>

--7vxl7spbw7l6xkwq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpaZSQACgkQ64mZXMKQ
wqkp1Q/9FxIbamsfnIFOFM8XNQ7Q/NMcM1BA5X3vz88acY4yLytourt0BKjINcUj
BE5YzQKjW3KT4zVUlI3nzDMeIIvBgf2imj7BcYv+xiWhZO+gwjUFgF3XuU9/43UN
yVMiuB8yWPm8DJi7WMmxO4onvkGAOWOIfePfIiTB5b+jhUdIC1NZz6wDvV/Z5IA7
HYRrQW/Si1ekVDdbMOg6q+3Snwidc/RZHJR8H9w2Q1980TLReHSbZTJh40UqZ0G9
aotXUmAik5QnlZ6sUgZC0b28TeJRDzCxgJwOPv1XPlrimIbCAgifOOZCz/nJqXby
Wr3BrfjKivIxDZgRV4Z2mkS3E7CtZYsMl+D8TNKXbUfJ53QmP566UxBG37PPcoOa
kieQDrBVOpUwK/Zv2ZV7WeMpxV4DaDWxcjr6rnCkxBHQLANQ8cPEK0r4eL1tu1R6
KjTFPZ//B21NuVITDU0cPco2j9Jep9kTwaMpU91FgZvTe3QIuTCc6grdCvhfrJJw
D7rnzte+8Urv4wmAFVhKV9PAgKZaAVeaeGD0bo5IVuLoBLBO84ElCt1fBqLqBVx3
8EDpME0g4BHR8h0OdQJ4PN5xKM3jmEtXR8Xsn8AOrr4R4VYZ6G9v00SVx3T2OsNX
U8PZyXF/EimqJ16841M6w9aN8RPiVxbFCeYOjtENmPpBM9syyWg=
=Vm31
-----END PGP SIGNATURE-----

--7vxl7spbw7l6xkwq--
