Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079AC3358D6
	for <linux-man@vger.kernel.org>; Tue, 10 Feb 2026 23:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770766760; cv=none; b=fGdBOoLYU6O+y4kpSTh1qzUgSIX7GBXCrE9Bdrn06FII0rwWOnNDPCtLdIWAfg5/vkyXVJeVTf4U1W81J/pok5hCiJqssa0WFB/zeB4uKxclz5Pzxnv1t+ZUrKt4RzHV2iv6CT+o9twGEfX9DRvFMcmq4QzSQozSlXosUhWUjPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770766760; c=relaxed/simple;
	bh=myGCErcrqdJEUD9Px1Fg6s9xJVRUEAO27p3YF1SQvFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0FxfBtPQi3syxWU4W+eRdduFi6aAoeTmXQKfnGOkzFNgowK/l8BnC295JmyRr7ExQi5FLVusWGTSIcsBGbrHmW7fjGu8K+2wMGw7s9JxRXWI7uzc7j6Xzm08anQ+HhpueE5PuWymWg9V+xU0ZJY4Tq0LaaP9tsRGsq0mGFXkLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pmT0os98; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pmT0os98"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B7FDC19423;
	Tue, 10 Feb 2026 23:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770766759;
	bh=myGCErcrqdJEUD9Px1Fg6s9xJVRUEAO27p3YF1SQvFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pmT0os98dlHip2ewZnCREzQE8ZKsEwvNsHl9J07HeW1lHPZNT2wKCPo9zreC9qgbe
	 xKTe3kUc5NDtQMDCUZhUa5zUR2zyUy6/l1KwL6XZdluBD8PYWAu918wsGxWHfa9tFL
	 mwD6eOXhl3NCVho2Twaaan0MEUkUGBsIVfPIKiehxa5Y0qnxvDKtxIjn45e9jvXLSE
	 m2Cy/P9x4GMs2vZjurFQt/ckXuUuFEEP4OGmbGH+b06Rdv/7ibzf2vE5pH6ILs5uzP
	 e345DvE5MAUz5GpHp3zkvs7o/tPMxC5OI2dpLXCs91lENIAnKjsF3bZRjk7wweKzkL
	 gv7qEbFrD2XvA==
Date: Wed, 11 Feb 2026 00:39:17 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Ben Kallus <benjamin.p.kallus.gr@dartmouth.edu>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man2/mmap.2: Document MAP_GROWSDOWN return val
Message-ID: <aYvBiXYLMypY91Gp@devuan>
References: <20260127142545.3328119-1-benjamin.p.kallus.gr@dartmouth.edu>
 <aXk13qiCiMyzqWu1@devuan>
 <CAB6pCSaAuXkRMYUErv0NDMq+o_=a2pTkdZoNvq--U3-tt89mhQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wr5k7gnmpo6zrbla"
Content-Disposition: inline
In-Reply-To: <CAB6pCSaAuXkRMYUErv0NDMq+o_=a2pTkdZoNvq--U3-tt89mhQ@mail.gmail.com>


--wr5k7gnmpo6zrbla
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Ben Kallus <benjamin.p.kallus.gr@dartmouth.edu>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man2/mmap.2: Document MAP_GROWSDOWN return val
Message-ID: <aYvBiXYLMypY91Gp@devuan>
References: <20260127142545.3328119-1-benjamin.p.kallus.gr@dartmouth.edu>
 <aXk13qiCiMyzqWu1@devuan>
 <CAB6pCSaAuXkRMYUErv0NDMq+o_=a2pTkdZoNvq--U3-tt89mhQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAB6pCSaAuXkRMYUErv0NDMq+o_=a2pTkdZoNvq--U3-tt89mhQ@mail.gmail.com>

Hi Ben,

On 2026-01-28T01:14:11+0000, Ben Kallus wrote:
> Hi Alex,
>=20
> > The patch only removes code.  Is this accidental or intended?  I think
> > this does not match the commit subject (which BTW has a cut word?)
>=20
> This is intended.
>=20
> Basically this patch just removes an incorrect statement about the
> address returned by mmap when the MAP_GROWSDOWN flag is passed. I
> could make the subject line more specific if you'd prefer. Also happy
> to change "val" to "value" if the shorthand isn't sufficiently clear.

Yes, please, send the patch with a more specific commit subject.


Have a lovely night!
Alex

>=20
> Thanks,
> Ben

--=20
<https://www.alejandro-colomar.es>

--wr5k7gnmpo6zrbla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmmLwaQACgkQ64mZXMKQ
wqlGbA//cuXpkoEVuOVYICxrDvvOPVnS0tGm4czt61uz3RuQmjjfupENnX9AXb3f
HIfMyRHiCO4Ep1ReuJ5yEO4uY3bh+SYMeoOdteBKxmsGUut4mvpRZVQcd2TfQlH/
YfM3LVPYvn2sEhHcju+Fmp5z1STHW/twh+VGvw+JfEVFZIDyCTjMbavuv96W3zbo
gHDlL0OD8819UIo6K0Rlr9SPAJMUzkYjPhZqC9/KsbxgQPzqEWhsvnrL32ZueM9G
pMdATL5jVzr5ykwBnuDTfAEYTxCJeUWqPLsPLIRoT/StwRUnzyRYd+4U88yMKumu
JLYWn3inDhB+JYrmIbkYmpNfedYTAKz1ysvlLt5as9feRft1sGVWihyIlVMYkeI7
i+iSO+gKF1qlaECpqYTzptJkfJdungr6FWP063uU/5IAvexKGG3EXIrz2iEF2zFg
evX3p+iQY9XRBYLDEKBncIY0jbXNmxDikz2JEw1YKV8F698NV/E/0UpsH2MnNGyB
GtbMCIOSpXcwYUoOadxlqkhoVRGNy75xuMA76lGfsutXGbwOnBf3/gqNYiG1Sonh
1TB7FySDWB3FBy8auWTgOvz8Fx9xzZYAV6ZTHtIlqGD3gbf/dLTL7gfaMrnU9mSx
7BPwZQytPMvCALSnr96iKjNTjt5Ob+M/+Nwv6THnf5JAvmJVVR0=
=I6uA
-----END PGP SIGNATURE-----

--wr5k7gnmpo6zrbla--
