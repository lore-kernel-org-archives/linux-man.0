Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5909937CD48
	for <linux-man@vger.kernel.org>; Sun, 22 Mar 2026 22:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774217441; cv=none; b=eFuBc1jiBv6fIc8XRCEEFM/b852CAEOYPqRewmdN8vxEktYSlyPPnwyt2d99Zr5iter+s6Qp0o4cmywW7YtQD1zozvTRM3yS4RxyciS74D+thI9LJROOGQCV9C/BQVJzltPFytvIhWmp3eaPQ7xvZgPs3AMTZ+jxzcrFo6eopyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774217441; c=relaxed/simple;
	bh=B9d8Dtw+Jkqq4t3yUHLjeTnA05iEijUXgFHGSOpPqEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RI3U/7hRP8/klqOuMSE/q+tRFISrtp9U6PQPQ/v66M4GKIwU5+qiZ5Rxxjv1xjem/07Mvlr2mVYHmI2ZZbLNZBZpwUDT4jtdyjudZfrPFSg0k6LZPM3ctQ9IACHN8mJGuE+nvNKJIKy2xXIT9qShrCaycs+WzN2pImcUa9X6xM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYfqXa4B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYfqXa4B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEC4C19424;
	Sun, 22 Mar 2026 22:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774217441;
	bh=B9d8Dtw+Jkqq4t3yUHLjeTnA05iEijUXgFHGSOpPqEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eYfqXa4BAM4O/VvAyJAoWEG5m/Z5nBfbpuzorIYLqawgDq9tb7GeVGhcNE3KxCIGk
	 DFtp/z0lt6rWn6iJNdTjEkOLowWQrjrCqrqQkn+VUuc1CaDXj2e3Kd1JuL02qB6AOL
	 5QNET1XHdA2FBJnC29NrwKTQxrLj3FzR207hnH9bVO8s612NdNQvEH3obOd0mZTUsA
	 /MYs5XaENwSDxa9V/43rWBn6vsCv/J86/xgDwQLkD1K+GLq9y0+rb5jK+9WMMNDewT
	 ydcv+vubB46+F0T6xM/sgzp+SBjZqv7nUtBhUFxMAHmTIrvVcGvPG/OEzdUpWwAiPX
	 YhSo9no5FbRVw==
Date: Sun, 22 Mar 2026 23:10:37 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Christoph Erhardt <fedora@sicherha.de>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man3/pthread_cond_init.3: Fix name of mutex unlock
 function
Message-ID: <acBonx5JCmbZGbtI@devuan>
References: <7245006.9J7NaK4W3v@framework>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="obdgq3z66prj6e5c"
Content-Disposition: inline
In-Reply-To: <7245006.9J7NaK4W3v@framework>


--obdgq3z66prj6e5c
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Christoph Erhardt <fedora@sicherha.de>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man3/pthread_cond_init.3: Fix name of mutex unlock
 function
Message-ID: <acBonx5JCmbZGbtI@devuan>
References: <7245006.9J7NaK4W3v@framework>
MIME-Version: 1.0
In-Reply-To: <7245006.9J7NaK4W3v@framework>

Hi Christoph

On 2026-03-22T12:09:09+0100, Christoph Erhardt wrote:
> Dear maintainers,
>=20
> please find attached a small patch for the `pthread_cond_init.3` man page=
 that=20
> fixes a typo in a function name.

Thanks!  I've applied the patch.


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--obdgq3z66prj6e5c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmnAaN0ACgkQ64mZXMKQ
wqkOLQ//aNWG/GEA9RW4f6DLZ6FGI8pBsVc2C+VqKiJlbps6gVWeJlLk33Qrjc1R
gJd3g2BeaHc3wCIVTKX+44g8g83j+Rfw4q62+GGY5rwpWVZMC2avn7TrNYQNjh0B
TQ+X1xItwh2E/EZtvinMkkaN87fTAjTD3M5MAsjPU7jUUAKo5wKuzcoaMJMmMyOX
yM+GhSV/CKAnjo/5kVPuzqZ3ud2JwaHRrCkWMpvwTA1Fi3pMNWSiE1PhOJNcBxOg
i1TOShqY8Phb3DE6Qag5Z5fXYi42Ie0GQuTJUXjIqaJBg4y+ErYcdzGdp1aswbcX
LGgJZcNaBPjZw4SMIl/79dkT8rq1Kcw1tYuEM2WnvV3DtZZkKUsEutsDDBcsqSux
W5wesPjQPgHltRtOaQicnDl+xwL5Ul3cA+NU0tKAFCCtMZXm2JQYGf3ItqxhBJv8
OnxbX3mVqA+kyZD9WCJufRghyksMaCmRnULMenm5NmzxqTgAvfcOFctHPAcFmX1P
+4xpGFSeiaOiLJ7JnKCY+hcl00MSZAkt/HdZ+KU0+j4HuHF1wbIWWdSL4oCc+E08
aD6DR5EEX2MS9oFMbI8kcJqvy7KzXzrIUfKHuQ7GiozR2VpDZnkyKHXDD3DeHGdN
rPvN4x2JZO9MC/lBd/PDIsawcCr/unWyGtNBw6jBZKXpHcUqWI4=
=7xJK
-----END PGP SIGNATURE-----

--obdgq3z66prj6e5c--
