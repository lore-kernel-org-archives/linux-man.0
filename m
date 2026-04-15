Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C28419D8BC
	for <linux-man@vger.kernel.org>; Wed, 15 Apr 2026 21:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776287948; cv=none; b=EASgAVX0+aKSnN9qpMPs/JH9T/ZwCvKyonyKPrXIaULumTlzw02WvJmtJCsQKGBac4Q6zv/6s5M9/onj6WJMyYNbY1PTdN2Lu4ayrTz00Fv2t4YMcqC/22/aeewvUnSN/1jDAWFy6vkT03otosCfmWYl4HonbfwJ/BtwmgSIkrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776287948; c=relaxed/simple;
	bh=nPPWEBvvYNibO4vuu13yJ5QtRWtvTnFTt+S5/vIGk5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQccVNfRGD3TpEITqT5UWPV3iGL3WtQGwm8rIzyPK5cYer+Kum51aEDeUMT14M092FNnzzEmgFjzHzThmjXgSMYi/NyYKNAKAsjN5rgTKZgjRciX8c4NqWccnv9mKMWHshs430cuogLIDxhNJxBwmT1zaHit14hCMWwBgNfBa+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ikfpj6Yb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ikfpj6Yb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761E5C19424;
	Wed, 15 Apr 2026 21:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776287948;
	bh=nPPWEBvvYNibO4vuu13yJ5QtRWtvTnFTt+S5/vIGk5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ikfpj6Ybzcu2k9a9ZA0ImCsnyFDSh8UaHaK9XjFpGgfBa8us/dyQXUwWILv3RvcwZ
	 BdWTFcn7eUs035IF6LLj0c/NyBMYaBC1lUK6Nn/UBAlG5nEdhBOg/tOYudQJiGkXND
	 BbHwlFZbV18bQDLVYA7e7Al5T9PoWBy55CI4/mRJECm/bbV/K96ABjp7poYTPNr6Xn
	 6PKhKx4YXf858BRFTSmVxl5G+SWdvRHGrg9XHFW4CEtoqiod+gKlT5sHPQEF/arPaA
	 vE+dNEAXIjLaOf9qxuVU2F9yhmQ63C4tcX7RONGcXNl9LzBfAPRKH4aX/tHB9foHTQ
	 pX3bYJydhN1+Q==
Date: Wed, 15 Apr 2026 23:19:04 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Josh Triplett <josh@joshtriplett.org>
Cc: linux-man@vger.kernel.org
Subject: Re: TCP_DEFER_ACCEPT documentation should be more precise about
 rounding to retransmits
Message-ID: <aeAAXdBe1f2THR2N@devuan>
References: <ad50CQgF_gNtB1Kr@localhost>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cbzqkzfmh775eaiw"
Content-Disposition: inline
In-Reply-To: <ad50CQgF_gNtB1Kr@localhost>


--cbzqkzfmh775eaiw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Josh Triplett <josh@joshtriplett.org>
Cc: linux-man@vger.kernel.org
Subject: Re: TCP_DEFER_ACCEPT documentation should be more precise about
 rounding to retransmits
Message-ID: <aeAAXdBe1f2THR2N@devuan>
References: <ad50CQgF_gNtB1Kr@localhost>
MIME-Version: 1.0
In-Reply-To: <ad50CQgF_gNtB1Kr@localhost>

Hi Josh,

On 2026-04-14T10:06:17-0700, Josh Triplett wrote:
> `tcp(7)` says:
> > Takes an integer value (seconds), this can bound the maximum number of =
attempts TCP will make to complete the connection.
>=20
> However, it doesn't say *how* it bounds the attempts. From the kernel
> code, it appears to round up to the first retransmit time that's larger
> than the specified bound. Could the manpage please document this?

Would you mind sending a patch?  (And if appropriate, CC someone.)


Have a lovely night!
Alex

>=20
> (Discovered when adding Rust bindings to this, and trying to figure out
> and document the rounding behavior.)
>=20
> - Josh Triplett
>=20

--=20
<https://www.alejandro-colomar.es>

--cbzqkzfmh775eaiw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmngAMAACgkQ64mZXMKQ
wqlzMRAAgbryMhaOpeJjsMIRibTV5s/ZOkvCXfhVEIkS8TlF8+AbkanVEOmit6b7
1dkgoz5iGHXWOKMlENQpYnR8NgtSp+4w2J1/D2cwHz5YkApAVr0df5VYkz6vjiWv
pqFH2+JIftXHTx/fKelBFlUOmN7XqgPkqWtf5JwcHHm2sQMI52Q+lk8cudRVPzjx
O29avWaaejJ33GgeNcBOCryl9ErnquWngJYWJvOwqEfPpohVMp/TDDBBA0850VlD
KjP22fpwZXwsyPCMlL8HEH01QecyUQAP33FQ/zaqK4M0B4bsFNNZoIlxb/CHNeNu
lbrbcTzsVGXasYi2cFXNBoU64Oii8K+6qp5SPrSWZNUD4vMupSTZqzkS7CLEv/mP
VZ1RXt45bUldOwZXXDDih/KYHu7J2pcdDlVvvam9jmYPm9N94z8ZWPMuY3ZLoPjo
RWfCERvjlX0148tDLAGRs0rO3njDwWLGXfgey//5KV7JL6LlTas3PFaeCSGnuhKy
gE2MTr9xy38PeutZ3foc35AsTT/1LdAOLeSTr0AIpvdm/abexHnruE0OZvHNliga
Lw9Xdirs1wBGLMABsyARe5jaCr1rZ534NEyL+SNUEArpabjlrHRP3n9jgxr5zjHO
9DuFWLeC6Mp1wTZ5+7X+ClrX5XO/igacx/C3pPU9ieA8Pgo7ZrQ=
=Z2lC
-----END PGP SIGNATURE-----

--cbzqkzfmh775eaiw--
