Received: from tarta.nabijaczleweli.xyz (tarta.nabijaczleweli.xyz [139.28.40.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6792F5487
	for <linux-man@vger.kernel.org>; Wed, 18 Feb 2026 20:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.28.40.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771446658; cv=none; b=s63hGOcTfWYdm4Fo5Tjp8OHQUiTja3FyicJBgvHkl3KIxSUb9ayZoUTwRnUjvTx3FEGN1zGmJA/z1efXasS/wjjDrj6LvWnFb5JvIvY40NE01IcwGzaN8n44AjL4Pb0GkCe8RMw2JIq2pWcugyhBR7sLQ7A0dC8xKsmQKak6Ybs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771446658; c=relaxed/simple;
	bh=NGgwD/zfKu/WYxQhApyPngurSyNeIRDqNJVnbNAjExA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhRLIoSufMYYAZYCEP94sPjFCjmiVJjLUApNzcNjE2olkFIl8JgotYRo2AUNP/kGWXkFtMBVkoE+F3MoTMpi5nDbf3LJD/nlPXGfne7/bQq4f/y0zU9s6pZmRiky3ikjvn35kYtzPhD6N5DNiFQxooe790vGUsM13x4DDFDmIEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nabijaczleweli.xyz; spf=pass smtp.mailfrom=nabijaczleweli.xyz; dkim=pass (2048-bit key) header.d=nabijaczleweli.xyz header.i=@nabijaczleweli.xyz header.b=K5wofWfA; arc=none smtp.client-ip=139.28.40.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nabijaczleweli.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabijaczleweli.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabijaczleweli.xyz header.i=@nabijaczleweli.xyz header.b="K5wofWfA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nabijaczleweli.xyz;
	s=202505; t=1771446654;
	bh=NGgwD/zfKu/WYxQhApyPngurSyNeIRDqNJVnbNAjExA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K5wofWfAy0Hzss0K7JWN2+d3/P5C+1DFor/zlrlt7rnmkVh/cpoeBaadicf5vB03U
	 E2AWIkfvDp08F/UOR2gc0fSy4/o5S0evzsYTePNAiO9FCBNAqBDFOe6hNHS177iJWz
	 Y4up+miV+MsiwxZpe591tvIE1OrblhS3xmtE7/CcBwRrcC+TyOs9ikvEx4GxBQzGte
	 pi0YrQBKGIMyG+94jDu+FUnj6Lakm72VZvFP+RulsowHT1MdjHZSgdcNSg2f5HjOq7
	 /qW+DdUBOEFxMYu0WBuHu1PnSqyZ0xwEDpOyO15iGF6HPscbGnyZhBHiMNReXc4QoH
	 vG6e6xi0R+6wQ==
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
	by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 30D8B2B58;
	Wed, 18 Feb 2026 21:30:54 +0100 (CET)
Date: Wed, 18 Feb 2026 21:30:53 +0100
From: =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v1 0/1] futex_waitv.2: Move text to a new PARAMETERS
 section
Message-ID: <cieq4a5bknvcu6oykfehgc76djihdiy6fuats2nqbcnznojdyx@tarta.nabijaczleweli.xyz>
References: <jpyv367v4jdxfxebxw6wh7rgqdfeswzp44dzsycfjt5k2pxe4j@tarta.nabijaczleweli.xyz>
 <cover.1771374933.git.alx@kernel.org>
 <wkb6g6eqsjol24fyermtgntg3yuzgrbs6z3bz5vfy5x6psy57r@tarta.nabijaczleweli.xyz>
 <aZYgLav9DxDExlQL@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ifudli2zf3eb6jvi"
Content-Disposition: inline
In-Reply-To: <aZYgLav9DxDExlQL@devuan>
User-Agent: NeoMutt/20231221-2-4202cf-dirty


--ifudli2zf3eb6jvi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 09:26:38PM +0100, Alejandro Colomar wrote:
> On 2026-02-18T21:16:06+0100, =D0=BD=D0=B0=D0=B1 wrote:
> > On Wed, Feb 18, 2026 at 01:41:38AM +0100, Alejandro Colomar wrote:
> > > Please let me know what you think of this patch?
> > > Here's how the patch changes the page:
> [...]
> > > What do you think?  I think the formatted page is more readable.
> > I really hate it.
> Okay.  Do you like any part, or is it all hateful?  :-)
The format annoys me, the layout infuriates me, I find the tone insulting.

--ifudli2zf3eb6jvi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmmWIX0ACgkQvP0LAY0m
WPHp1Q/+N+6tD4sBn+VelMQfq7HzcInqyOsJSolf7+PPXrjN/5HsiCbrkFpWGNsS
3J+XT9XjgBCzmyDdwYmqxQw/JjyfAw13CJ2GDIMGV/79Y050EMy4nBlilG1ItpPx
zFb1iFNaSegBuRxVcF59pEa/CDJeGHbvmu4cEirDqhd7LTNNZjTH8AlBQoJPlBbs
SrZTyfC5e2R2Q0NWg7CVHoLF+z2LKRyiZQCFGLjZXUHbL/lHQftDc0og7XGFggLT
TafqGbHWXeBkLeg7f56mQOM/MdivNvRrLGAkG/vD5MbaEBgPGzyI5RXlRueuUu0F
wIxlescBrwFNFxxD8mEKkF9yR8hynPTGjJK4AhAgEk7TjG0xkhTqI0a/OZJBJNgw
TwX5yumLiuBsuImWD6MuYmHVRvtbdFKbEsER9eW6QqR4isbm2sP8MuEaDyXdT96q
DgQbFshmTkfnhgkDepup7Xp/eVmnXOmWVPfHC5mkZBwgwoPq04EwKqVFfAmSh0uP
JDoIk3XOHi+d1DbTUZksQFQ8HGxGUKX9d9qJVQ9HHPOvkDdfsLli4WE0qzZ7ADpa
Le/U6vvVJw+GpDY1hNk66gDPGzohCO/Mu1kakDMA2p+gDx6z5UEGHt0gwivqLUwr
hooqLH9u/sWLYVuGTLkPJWjGQ7/6ojlTMQHOoUqBVWBcMstLiZ0=
=oTO0
-----END PGP SIGNATURE-----

--ifudli2zf3eb6jvi--
