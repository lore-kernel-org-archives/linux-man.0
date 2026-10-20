Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506442;
	b=giVWiCjzKJPo0uHsfxdsU4gOxX3MCJIeP3RKc9Xe+3/M+/7G0FH79C9yQTVKVfUDReIF
	 ta+AzRTCCsF+cbO5xvFW8awQG78lub0p8bg0HbwNPv0C5fuyeaFpl8LhIePlkByoWOYcx
	 xK0jKcB98fpO08I8e60m4HdbNbRMnwEK0ND+3arWz5L1Osbxnh9h+BGFxp9CZHYuYaCl/
	 9rNGauqB2y8vQOBE5jD4iVGTR2lATnSRxIMaYwQkNMXki1h5ol8x2+1LqyjSK6sK7Q4Nq
	 iTyhBlJ8q83UEz3K1Y2ApC7JA3+EizZv6zKvnzbh0FX8f0+FdIezUsMIQd1+v0gYCUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506442;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=aW1GZYtbYM4K7sC9v2YrKmDhEyFkijfP24XzCUXAln8=;
	b=jJxwc5pBX1z78u89k41ojKiuycXuFmHY4luYPD84QE1J9p1+fIC3U507P2n1Sv3nYcji
	 NY41R+0iCvEfEUFt4dTmXkoOaJPz53ldExpNW+Ksd0GmLzpdrng4+SfCNgpf/Y/haOFGF
	 7Xkv8Xqm+s7PaFQEr9mdqjJFVhY2VZjnIgQKK5E3sFH7Zx9NS0VTs9nIuwc1AwtSVBGUP
	 4SOVfcbe0r6ZqHEjBZ+QQ5eauH5tiP72qacAvcFyJWzoOi2EqDAg08BvfmmG3yTAoB+aX
	 jP/V749e3cyURRgCFc0aGdoLp5Z2OwMgtA63WQOQ4Q9v9S10CqEzH4wy9zbKXPQ8SuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AIW+Nssi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D79606A320
	for <linux-man@vger.kernel.org>; Tue, 20 Oct 2026 14:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AIW+Nssi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47AD81F000D0;
	Tue, 20 Oct 2026 14:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792506441;
	bh=aW1GZYtbYM4K7sC9v2YrKmDhEyFkijfP24XzCUXAln8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AIW+NssiKTvrHYWn/rNaXHD8ec6t6wteyrJnNy6bTRyXLAY9Xsf9nYgu8d04ifY/2
	 QovdkJbsRdA/Hbm94bMihgm//Zf6qz0Am1aDHEUowRCODe5tigkA0NxTkiK4Ifhqnf
	 hn772lPJCTgAtXe9DudSdDsQrBKrx67myi9DnTLk/DlN5xZdQP99RoxBimJatLVbMl
	 SwQ2uBhI2lrLqwkf0xXYwrgWCxf7bwymC27Y8+Cj3JdES0FRmKsexT5xkN/1bl1+Ml
	 /UUPN2OfSHnl7JNgyba6RhMHatXQC/SbEPz1NWjf7pVDqV4scbXtwAbPEW1X2g5r19
	 cG3Qep9QTAd1w==
Date: Tue, 20 Oct 2026 16:27:14 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Jan Engelhardt <jengelh@inai.de>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man3/getnameinfo.3: Mention behavior for AF_UNIX
Message-ID: <atd04IuG4GBl6PxM@debian>
References: <20261020115143.75371-1-jengelh@inai.de>
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
	protocol="application/pgp-signature"; boundary="liu2yppanudfrwiu"
Content-Disposition: inline
In-Reply-To: <20261020115143.75371-1-jengelh@inai.de>


--liu2yppanudfrwiu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Jan Engelhardt <jengelh@inai.de>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man3/getnameinfo.3: Mention behavior for AF_UNIX
Message-ID: <atd04IuG4GBl6PxM@debian>
References: <20261020115143.75371-1-jengelh@inai.de>
MIME-Version: 1.0
In-Reply-To: <20261020115143.75371-1-jengelh@inai.de>

Hi Jan,

> Date: 2026-10-20 13:51:43+0200
> From: Jan Engelhardt <jengelh@inai.de>
>
> Signed-off-by: Jan Engelhardt <jengelh@inai.de>
> ---
>  man/man3/getnameinfo.3 | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/man/man3/getnameinfo.3 b/man/man3/getnameinfo.3
> index 7db812948..6c2a08275 100644
> --- a/man/man3/getnameinfo.3
> +++ b/man/man3/getnameinfo.3
> @@ -121,6 +121,14 @@ cannot be determined.)
>  If set, then the numeric form of the service address is returned.
>  (When not set, this will still happen in case the service's name
>  cannot be determined.)
> +.P
> +Behavior for passing other sockaddr types to getnameinfo is unspecified =
by

This 'other' seems out of context.  I don't see a recent earlier mention
that the address family of the socket should be AF_INET/6.  There's one
at the top, but that seems far enough that a reader might get confused.

Perhaps we could have this text in a VERSIONS section, and instead of
assuming the reader remembers, we could be explicit about it.

> +POSIX.
> +Portable programs should not expect any particular behavior.
> +For e.g. AF_UNIX/sockaddr_un,
> +many libc implementations fail such a call,
> +some succeed but provide zero-length strings in \fIhost\fP and \fIserv\f=
P,
> +and some fill these buffers with pseudo values.

I'd rewrite a little bit:

	.SH VERSIONS
	POSIX only specifies the behavior for sockets of the
	.B AF_INET
	and
	.B AF_INET6
	address families.
	Other address families are non-portable;
	for example, for
	.BR AF_UNIX ,
	many libc implementations fail,
	some succeed but provide zero-length strings in
	.I host
	and
	.IR serv ,
	and some fill these buffers with pseudo-values.

BTW, out of curiosity, what do those pseudo-values look like?


Have a lovely day!
Alex

>  .SS Extensions to getnameinfo() for Internationalized Domain Names
>  Starting with glibc 2.3.4,
>  .BR getnameinfo ()
> --=20
> 2.56.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--liu2yppanudfrwiu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrXejYACgkQ64mZXMKQ
wqnPWBAAjMZzamVj1vsvxvODAPSCdkgMVenjWBBNyZRzZsiABmjffSgc4ThQmIDN
mntfMV6q4Ttu9QZv9Op+o3yk4JrIPR02gh4uB/LwuqeoZZ6U6ybjsRtz68CKXtte
ZWVuj/JbddJDsYg4Zin1TLtU0ofdMkaJ3z0a3ClXyBsHHiwYOEfJLvi1Bjaeyl96
eJb09eAppIh5ekZOXQSGkpRPyfI/DN12zc3+Nln0a1kIDsbT1X748ji9GKSauTrZ
NeGYDTDRKV1rqzUPCk7C+z4g+dyZa4aohiRdryoJe8FP9FY04blwmlYxYOW4k5/m
cbvqK/08S3hCJKX78Au3uj9W5Cd6CLod4JtksCyU6G8tCIrvD4fwfmcqZPJME9NF
0qZrJE0f4FLtIr12wmOhVbPEkrg6MF2/mnKrnodZyoPkqIos30NA5+X0Uz+8kL91
RYNwWNOZOIgLeaNNOYfYUw0E8f7BX3RgFO9jqCZKCOsv8uJQ+VM3JNYTgjSeeQgW
f+c43CTXzs6inxU9kCdycqHcTjD+RAo/xnP+R5Gk1O1553iZ2kBOcutF0VWcwHqK
jDjZFLr3n/sDJJsC2lHjXKsJoze4SFtTga7TjsAoYbarLMurD04RrAeIiyCgVfH9
OP3zyun08V9MgDn1XTlgmaDqomN/0rWHjX06jgRMJhyBFwhtEtQ=
=OhOy
-----END PGP SIGNATURE-----

--liu2yppanudfrwiu--
