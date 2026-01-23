Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108AB86323
	for <linux-man@vger.kernel.org>; Fri, 23 Jan 2026 14:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769178997; cv=none; b=FSfhokvT5POLpQGAN4zTaHdGuM7MQnVooL2JUQzi4IvVEOu1NA1vJwnou0WDt+2A9ihK2rSwPEhAbM9R0AbCL60o2tHIM+3Fr0bqZZpAgdRXiShIrrAWXqnvBJNzyhY/mYAq7p0jNgglWLLWOWSethOOgFoN7etkzxjy+DPn1bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769178997; c=relaxed/simple;
	bh=qfe0Ve9sxcrhUzwFpBP30jb/8oTBJBCFnVOtFsr2tyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/5hbr8IqM1wyzj3LCex+a81sZW5Y8QOoo/YMZQTzJ9/FCEdsgzIrNNV1T+g0w6FvaQc9TqjmspkaFmIhyq73A2pNr0l5H1NAv8Qe8FDSmCRzrVeFYLYlQDhLGuexm2obFl00MudlznJUDwJ5843qV2Sv/J3SyGvnGRF4/Vx6HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uttz+cT7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uttz+cT7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955B2C19421;
	Fri, 23 Jan 2026 14:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769178996;
	bh=qfe0Ve9sxcrhUzwFpBP30jb/8oTBJBCFnVOtFsr2tyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uttz+cT7lrmnbqi9lr5ATzfmi8AV/FCCtdJR0Q/ziiY6yJjk6rGNcb1kyn+lvOyWK
	 RGYNwlQabapGQoTJ2HdQBWyMPiP5tD01bvVGvITYe7kFyvKeh/IQnU4UBr5EBskRF9
	 AAM68UMe9/2y2Kwx7Vjbwv4+NyRDx3x/yysOO+kaEs24j+oMKp7fbPKUDycxXlWy8A
	 TcDNsAwMlPXsIdZxRShqMh8Cej477t9UjY0v784VTP4zRu06OGOa2bn7J72+imZoIc
	 3UjPX915Zpgvi6cCMFtHAMX6fEcs4RF+HZHT1jj2/4cEvaR/YjqV8CzNVQE/5buEFv
	 rx3gAoe2lmbmg==
Date: Fri, 23 Jan 2026 15:36:32 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Ole Wiedemann <wiedemann@cs.fau.de>
Cc: austin-group-permissions@opengroup.org, linux-man@vger.kernel.org, 
	Andrew Josey <ajosey@opengroup.org>, Geoff Clare <gwc@opengroup.org>, Eric Blake <eblake@redhat.com>, 
	Brian Inglis <Brian.Inglis@shaw.ca>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Michael Kerrisk <mtk.manpages@gmail.com>
Subject: Re: Question about the availability of POSIX 2024 man pages
Message-ID: <aXODRzxM431LVqkD@devuan>
References: <6a5f52e4-f7e4-4d7e-9f4b-3c10722904a4@cs.fau.de>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3mfcxtmw672yu5e2"
Content-Disposition: inline
In-Reply-To: <6a5f52e4-f7e4-4d7e-9f4b-3c10722904a4@cs.fau.de>


--3mfcxtmw672yu5e2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Ole Wiedemann <wiedemann@cs.fau.de>
Cc: austin-group-permissions@opengroup.org, linux-man@vger.kernel.org, 
	Andrew Josey <ajosey@opengroup.org>, Geoff Clare <gwc@opengroup.org>, Eric Blake <eblake@redhat.com>, 
	Brian Inglis <Brian.Inglis@shaw.ca>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Michael Kerrisk <mtk.manpages@gmail.com>
Subject: Re: Question about the availability of POSIX 2024 man pages
Message-ID: <aXODRzxM431LVqkD@devuan>
References: <6a5f52e4-f7e4-4d7e-9f4b-3c10722904a4@cs.fau.de>
MIME-Version: 1.0
In-Reply-To: <6a5f52e4-f7e4-4d7e-9f4b-3c10722904a4@cs.fau.de>

[CC +=3D linux-man@, austin-group-permissions@, and a few interested people]

On Fri, Jan 23, 2026 at 11:53:08AM +0100, Ole Wiedemann wrote:
> Dear Mr. Colomar,

Hello Ole,

> We are currently overseeing a university course on systems programming th=
at
> uses the POSIX 2008 interfaces. There are some interfaces in the newer PO=
SIX
> 2024 specifications that we would like to use, as they eliminate some com=
mon
> pitfalls. However, there are seemingly no man pages anywhere for the newer
> standard.
>=20
> Thus I wanted to ask kindly if you have any idea when (or if) man pages f=
or
> POSIX 2024 will be available?

Currently, there are no POSIX.1-2024 manual pages.

The main problem is that the POSIX sources are not public.  Michael, the
previous maintainer, had agreed (AFAIK) with POSIX to receive privately
a copy of POSIX (I don't know in which format; IIRC, it was HTML?), and
then run them through a script to produce the published POSIX manual
pages.  I find the burden of that to be too excessive.

If POSIX makes their roff sources public (preferably, in a git
repository) (not necessarily under a free software license, but publicly
readable), I'd be happy to work with those.  That depends on the
Copyright holders (IEEE and the Open Group).


> Kind regards,
> Ole Wiedemann

Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--3mfcxtmw672yu5e2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmlzh2oACgkQ64mZXMKQ
wqnZThAAo81xulFNFrqmB9B3G3EtRacD9tVMpKN36ffvm+phuvgQ8WF+unditwI6
QeFkFQlMEUKGqAXd0gVRcF9qiZpBl1XsYUalRkCfxK1dovElK1M87rcdqNy1r4ij
xn1YuA3wRS0EyJtSStyGo7wXogsniS3K/jAfYhTtCVPertI+rHU8P++2dhNT00bA
AWRXw5wJJeqWoWnSfMjnurDPVM9qScYlZuCyAuAqMlDjK42znBFKGEIwIJDiEqex
QLu18HSjrGYd+Btr/p8Or1ZLJ+Gw0dQ7YW5pOneYt8ZDeV2YlMoNbiZNbPuV683E
hWrsljFAKJegIgrUf8MSD8QyAsQwP4pcEWkoCq14nar7dIrsN1D8tfjNv1S7GQ3C
RoU8QPTFWAlsl++PzpEdXiOVMXCiA7VLQVmTn+WLVZT8Q2E4Iwnf3wOlbzXWzF9r
CY58PQTXHGAh57WKgH+cpFyt5aaaWcRo2O9awSjXn/BOuonPXBemuOMoYJ6HNpOg
fe78A6roBZw3p4C0lyOzb8ONE5ziasTXXTOpct24ocSB5p9W3YvfFnZB21Uzizu9
BUDfW5jqqzEXbB7yJ606kwkwtW1B/1+2R4JpoOOwlA32w/pFfzKvtrSuVGZRyJoi
K7TrlUdgSFYxx19qycbn46X/2JGpjLcZeJi6VPf3vXXSmy1abmI=
=0s28
-----END PGP SIGNATURE-----

--3mfcxtmw672yu5e2--
