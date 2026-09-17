Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623064E06DA
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 11:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646395; cv=none; b=deU1ovPNAZvjnGdXu6wl1H+kF3i2zk4XBMIR0oZBySJvt1cygwHH/3GL/fgxv3zdHhVZ1/D8xu4hTn+GxkA1zKFv/TbLd58aL6numbR49t+sCkqecilXryPFI1mXi2VHaY9sC1/vZrNvs0s84pfnbyX2/rIciz9W01o8WiSQmGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646395; c=relaxed/simple;
	bh=e8ZBVUdnD/vk3qU2RWfN3Bc2qQ7TJndixZgij99/l5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NE4ac1pTlkSoY4yawmdAQobZ72KFcSBHVJKihRpmrbLAb5ReTfQ02+QVLN/PhhlxZQIzfrAiAt0xmm9NMLgQBz44/z2rMphUDQxjC0y30MJvlijumUXHoHq26+0JpeaVZ3IkjjtnpWZX/gdYzvii73RjpVFfiEPb25hgNmTb1uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYy+dMPF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYy+dMPF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F541F000FF;
	Thu, 17 Sep 2026 11:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789646386;
	bh=g8MX24c1H0DANf2YMmzpXAGxT2i9EXgmSds+hffeut0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cYy+dMPF2Gbr2O3A4DCGeE7nI/rfKG9cbnMEMOmhQMHTzDy9QOO43VJ11aSW8j4o+
	 LBuXVBmpNlmnuH7n2uteZco6IBh+4k924PP4Is/BjXf7EtYuyI+dTqMOBu8SXIJ2z/
	 eyLgo0YNH0KvXuXtyFslm/C+f5EBM5RMhq+byLVNnDrM9rdE3jS/6V9CRSuFVNhcVm
	 2TLfzlLqRUfeYD8LHaHuSoB+LItUeb11n9ZM4MG1hhR5nfeOl6nwClcge3kml03CyL
	 YjQc3tsXKaFZDvctDjHHc6XdyEerhylTXpyCHd/ueJdcgXVZMjZaB3AK9IOQlCXmWe
	 /QgfCu8cui5iw==
Date: Thu, 17 Sep 2026 13:59:44 +0200
From: Alejandro Colomar <alx@kernel.org>
To: astian <astian@memeware.net>
Cc: linux-man <linux-man@vger.kernel.org>
Subject: Re: [PATCH 1/2] man/man2/ioperm.2: Reword slightly for clarity
Message-ID: <aqvWHiz44NxkDbPh@devuan>
References: <aqXOgqne-v4GtglY@devuan>
 <20260917062039.1365378-1-astian@memeware.net>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bsa3j5yme7rt2sro"
Content-Disposition: inline
In-Reply-To: <20260917062039.1365378-1-astian@memeware.net>


--bsa3j5yme7rt2sro
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: astian <astian@memeware.net>
Cc: linux-man <linux-man@vger.kernel.org>
Subject: Re: [PATCH 1/2] man/man2/ioperm.2: Reword slightly for clarity
Message-ID: <aqvWHiz44NxkDbPh@devuan>
References: <aqXOgqne-v4GtglY@devuan>
 <20260917062039.1365378-1-astian@memeware.net>
MIME-Version: 1.0
In-Reply-To: <20260917062039.1365378-1-astian@memeware.net>

Hi astian,

> Date: 2026-09-17 06:16:00+0000
> From: astian <astian@memeware.net>
>
> Replace unexplained mention of "bits" (implicit reference to a
> kernel-maintained permissions bitmap) with "ports".
>=20
> Link: <https://lore.kernel.org/linux-man/aqfsMbQWdqq_TG_b@devuan/T/>
> Signed-off-by: astian <astian@memeware.net>
> ---
> Didn't address your questions about general arch support and the
> EIO/ENOSYS on PowerPC.


Thanks!  I've applied patch 1/2.


Cheers,
Alex

>=20
>  man/man2/ioperm.2 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/man/man2/ioperm.2 b/man/man2/ioperm.2
> index cb2c48652b5d..e4a058164f6f 100644
> --- a/man/man2/ioperm.2
> +++ b/man/man2/ioperm.2
> @@ -16,13 +16,13 @@ .SH SYNOPSIS
>  .fi
>  .SH DESCRIPTION
>  .BR ioperm ()
> -sets the port access permission bits for the calling thread for
> +sets the calling thread's access permission for
>  .I num
> -bits starting from port address
> +ports starting from port address
>  .IR from .
>  If
>  .I turn_on
> -is nonzero, then permission for the specified bits is enabled;
> +is nonzero, then permission for the specified ports is enabled;
>  otherwise it is disabled.
>  If
>  .I turn_on
> --=20
> 2.55.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--bsa3j5yme7rt2sro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqr1i8ACgkQ64mZXMKQ
wqnhUg/+LdLnBZZbXLPXrtym5WBUBz6kPT9ehFw0zdlNFEGLrwVa1/No3VxjeN+r
m2ToL++hRNTQ0sUmdECqiUmZ6lDVXhBL8mwGjiY/vDTQ6yoCJLF2qbSbOtSRX7CG
dZIyk3QPlzD4taAygTwtLEdXKQmr3sV4+HIpmOnN3h6Fkesk4IyJZ9hTSrLUrIyb
ry7eiSdGdQ+C2JujepPxZDNPxCtM4d+s1LoSe8PsK77dN/wvwr6WXhXWdx1jmsqV
ozOHjEKYxTtey1UpxUP9kJx45Xw20m6u7ac2T5eAkO7V2NIKAllvXXdiq4qAVHFZ
0PYsV5BE0rTqpY4UL7qq6xzCgLqAO12iCKoApQb6G1qK7/c0TednAhBsEZnwxdAF
2Rl6qY5Bwa/rrnLYQKmo0rvnSKhdFzUKsH6NV1J0yUublzfyrUER9xfbHNombIK8
QblYHFk9LKxkDi20GkyE2dbRkYcO/C9hlquW6m73eqqIuUumzN+NKMpniu+M/fqD
rWXrtraYjUDtR3UOmFzwRypz8CsLGMWMuA6YGVzZ63/2fCQkKQpybfFmznYBGQEs
z8Q1o56M/wwLiQgnZlnmCNUIzqV5evak/mHArxQf1GHh/vnr8whdXmvMQBuftYPI
bnBRu+Wdh1ezE6VkoP44gnXXvVT+99/9okEChyaWNszgqj+HjNI=
=q3y6
-----END PGP SIGNATURE-----

--bsa3j5yme7rt2sro--
