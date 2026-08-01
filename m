Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37FF179A3
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 23:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785627393; cv=none; b=agLQ/cDn+y2CuP8ET8suP3KqQwEZwkYi6jy/R1jdSIv+MyNMPg63Ao2HYa2lNzFGoQ6j2Yf871agu/negMyjw0AEsteuuE1gqS+VONOSjcfWBAnlNY8y9r1oEgdeTSiErglD5iYQXkkGpmGZATRSi6+RRu7596Rkp2CxJvh9gHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785627393; c=relaxed/simple;
	bh=91Uj0zcTVwDy/c8wj+ELbYg8n2bnlVjS+yQKbL36TSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yp4eXPn4+UZHzE/Wqk4oJFs3CegNUpKuTv2ToFk4sLcXW83EY/0OzWOoFEZA7iOAuMtPg882tZJob/il1nWiwkEwGR//GgY8VvrBzAxB3jLbk/Bw3b/ik8eJPSexlZJeWXA8IMMe9+PNAQdjOIGwpk+G8Uz9E8wYWkKKHRhMR1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GeHOqEyK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GeHOqEyK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696571F00AC4;
	Sat,  1 Aug 2026 23:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785627391;
	bh=bGrzywxCtRMs+uVO11c0DA0+Va3pgmpZMJpwIBpFz1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GeHOqEyK7dT3rhqs/NK3FgtjRI3GbmU5rW2duHiRn1Hp+T829eYK8e7QLapMrDbQq
	 1XW6Umqm3Ss10QaOYYnC+liWpmzkdv3Ui9Dzpiam0PIP5KVJFJcAw2mKqlH9tN8QK1
	 Ci2LLMB4v9Ysu9KQ1A8N2nWRgGeyClJErV76TZp9mVLVmT7yz6zXeBpzttU+sd4HTU
	 sxWkrYc3hqgqGwdSOt5fShVhsPXhf41EhxpyYeACDCu90scdP9AN2ncCYA1Gf35z8f
	 jIOWhWu4HWXPBi8O3m6OC73cKijvvTyswBKzh2MxAHrGwT8g4jjPm900m1LKYQIegS
	 zrSouG8Dzro7A==
Date: Sun, 2 Aug 2026 01:36:28 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Paul Eggert <eggert@cs.ucla.edu>
Cc: linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: [PATCH v2] man/man3/mem*(): SYNOPSIS: Document non-standard
 mem*() functions as provided by <memory.h>
Message-ID: <am6CnOddgaM10pry@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <3556566.BddDVKsqQX@cagnes>
 <am50AM0bdufHa9W3@devuan>
 <15288158.RDIVbhacDa@cagnes>
 <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="upcygev6dgigdzdi"
Content-Disposition: inline
In-Reply-To: <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>


--upcygev6dgigdzdi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Paul Eggert <eggert@cs.ucla.edu>
Cc: linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: [PATCH v2] man/man3/mem*(): SYNOPSIS: Document non-standard
 mem*() functions as provided by <memory.h>
Message-ID: <am6CnOddgaM10pry@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <3556566.BddDVKsqQX@cagnes>
 <am50AM0bdufHa9W3@devuan>
 <15288158.RDIVbhacDa@cagnes>
 <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
MIME-Version: 1.0
In-Reply-To: <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>

Hi Paul,

> Date: 2026-08-01 18:29:13-0500
> From: Paul Eggert <eggert@cs.ucla.edu>
>
> On 8/1/26 17:10, Alejandro Colomar wrote:
> > #include's aren't that important.
>=20
> But this whole thread is about #includes, no?
>=20
> I would focus energy on areas of the manual where effort provides the most
> bang for the buck. As your remark suggests, this particular area is low
> priority.

I wouldn't call it low priority or low bang for the buck.  What I mean
is that it's not a breaking change.

I believe education is important, and provides bang for the buck.  It's
not all about features.  The features are already there, but misused.


Have a lovely night!
Alex

> Also, given what I've seen in the thread so far, the proposed
> change could even yield a negative return overall.

--=20
<https://www.alejandro-colomar.es>

--upcygev6dgigdzdi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpugvwACgkQ64mZXMKQ
wqnJCw/+K70FdSWHsgEvfwDFmvpXNot2DWc1wcpK+oQ7TWMdYTgZ2gUEx75B6BB4
Wnfy0aPkxOcAO/A/h7fipZFD3tn7tCWkqhSUi18ZM6BgvkuASSNPOTgYvFtdsKte
l6XX8U1797C1msNtuecerSDAtOsWhlS6Px3pEyWqT+wtW//T1X3B+FkMQKVG9+U9
beKf2wg8uh6L8b09wSCfds/yWsaaisOLd705FiVrlM9rcWbbmaowg/Q+NWVa3JaG
ZAnimXMx6WKpSNU9q+NYV3IhEWuQRmzvKv5bAs0JcRHa0oc199mXV52MqAuu7mkW
LhE3P4eQTEEQPUv91BKdkq9c1Rj7ANbAgJZiqqn20PHFWP7nqZiYl/UMc8rBP/Ng
tWTGUcNgW8yvW2J08B+4cUOejrckJkWg9c1KEKcSU+ISnCZ0l0IR4y7kCHU8dDui
cTU/asKIwEFiENyEvadbe5xGwI8VrnPJeZVUfl7wfPbHzzFy5OTZJFXA/MY65IxA
Xwt13FloQ0sDpQQUe8jU8WbKfzcG2ce/bWMgu6Sr/fKGja5ujfGlhhLzSY+nt5GU
6ssaGGb/rdHh7+SIHw5KLE0YrV/35LMMnM5F7z0gFhwSIAWM+l0Re1nHLI3ipsC6
H/tZIIqJRNmFlv2/zPoFNm4NdSrxX44rcNZWXNVUgCX2tu4FTW8=
=QboE
-----END PGP SIGNATURE-----

--upcygev6dgigdzdi--
