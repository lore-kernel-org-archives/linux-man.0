Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE112FDC30
	for <linux-man@vger.kernel.org>; Thu, 22 Jan 2026 00:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769042478; cv=none; b=jaJJioMsA+80YFFzR0e/9pVb827LyrvKXyo8AyRSOOQIQm1IXwu66FiZmGnUAPzM0MaFSsBkcPwKPhWOMGs+k1ifpO/pdU9v30oQZmyelv2BFJIiG34jiU/iyymD2cCD9HFR4I6c5k29eTal13EbUSLP1HTnPb7SUwEn1TsArTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769042478; c=relaxed/simple;
	bh=xYZP3wBYqp87YfZr1IlSViQPpVGLMuz8zS4BdO1ubhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4DX4p/UX8ra0EflywwdK39nL9Id5heSmYCpXI1E86SEmsab+SNEdhB/b5V9L7KBCd0MZhgYF/3d0B4gKIhDJF2K83x57WJpTznvbl8ZEHWmAIsWv+jtcc2yJRQnBPZ6X/SzJxHyT1fRRHjfhmchA2O2JyhkMGUVMNqGe4sVEFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JK5rnxDD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JK5rnxDD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3D7C4CEF1;
	Thu, 22 Jan 2026 00:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769042476;
	bh=xYZP3wBYqp87YfZr1IlSViQPpVGLMuz8zS4BdO1ubhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JK5rnxDDayl6Yncs3niL65Oy95oNQsd6ccgQ/Q50L4RdIbjMpy2po6KnTE8gG0HqA
	 O4RSJB5jpQM22ndz1mbzaRNYGZJwllQLL79ceUWb/W9K77quuMrP0NGuFoZuSQsJc2
	 0tA53qPJgWrvsGXYEv8WjRTYuNokmIq+c6g8RAN8V4kRUgfoL7RQ9LhFhQF2/v1NQx
	 n4cSVtDoopFSEq4FyiIwRj2Ug4VMvBJZXsTGmx3o96qNnGccEtdPJN/znAoi+BvTYK
	 fRzvFsoySpekz0ctmvOWBYVk4+8RCp8sFQZYCkgIae8Me1LDb+oaSDzBXTfNl8EtaR
	 cz3mnCKjLPRUQ==
Date: Thu, 22 Jan 2026 01:41:13 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Seth McDonald <sethmcmail@pm.me>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v1 01/23] man/man2/clock_getres.2: HISTORY: Update first
 POSIX appearance of clock_* syscalls
Message-ID: <aXFwqEqGsAU9FwfD@devuan>
References: <cover.1768995315.git.sethmcmail@pm.me>
 <1a421b5ee130c1d5892791060b6fdf8d911d8362.1768995315.git.sethmcmail@pm.me>
 <aXD1GRoxwzGA5Gsn@devuan>
 <aXFwMamVRAdu-NuR@McDaDebianPC>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ldmldiboyd52aksp"
Content-Disposition: inline
In-Reply-To: <aXFwMamVRAdu-NuR@McDaDebianPC>


--ldmldiboyd52aksp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Seth McDonald <sethmcmail@pm.me>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v1 01/23] man/man2/clock_getres.2: HISTORY: Update first
 POSIX appearance of clock_* syscalls
Message-ID: <aXFwqEqGsAU9FwfD@devuan>
References: <cover.1768995315.git.sethmcmail@pm.me>
 <1a421b5ee130c1d5892791060b6fdf8d911d8362.1768995315.git.sethmcmail@pm.me>
 <aXD1GRoxwzGA5Gsn@devuan>
 <aXFwMamVRAdu-NuR@McDaDebianPC>
MIME-Version: 1.0
In-Reply-To: <aXFwMamVRAdu-NuR@McDaDebianPC>

Hi Seth,

On Thu, Jan 22, 2026 at 12:32:55AM +0000, Seth McDonald wrote:
> Hi Alex,
>=20
> On Wed, Jan 21, 2026 at 04:49:25PM +0100, Alejandro Colomar wrote:
> > Hi Seth,
> >=20
> > On Wed, Jan 21, 2026 at 12:06:57PM +0000, Seth McDonald wrote:
> > > clock_getres(2), clock_gettime(2), and clock_settime(2) first appeared
> > > in POSIX.1-1996.[1]  SUSv2 incorporates POSIX.1-1996, so listing both=
 is
> > > redundant.
> >=20
> > Are you sure SUSv2 incorporates POSIX.1-1996?  Could you please show
> > sources for that?
>=20
> We can reference the following SUSv2 PDF:
> CAE Specification, System Interfaces and Headers, Issue 5.
> <https://pubs.opengroup.org/onlinepubs/009639399/toc.pdf>
>=20
> Section 1.6 "Relationship to Formal Standards", page 11 states:
>=20
> 	Great care has been taken to ensure that this specification is
> 	fully aligned with the following formal standards:
> 	- ISO/IEC 9945-1:1996
> 	- ISO/IEC 9945-2:1993
> 	- ISO/IEC 9899:1990
> 	- ISO/IEC 9899:1990/Amendment 1:1994 (E) (MSE)
> 	- Federal Information Procurement Standards (FIPS) 151-2.
>=20
> 	Any conflict between this specification and any of these
> 	standards is unintentional.
>=20
> Additionally, section 1.7 "Portability", page 12 states:
>=20
> 	This document describes a superset of the requirements of the
> 	ISO POSIX-1 standard and the ISO C standard. [...] (The ISO
> 	POSIX-1 standard is identical to IEEE Std 1003.1-1996, which is
> 	often referred to as the POSIX.1 standard. [...])
>=20
> For context, page xiii defines "ISO C" as ISO/IEC 9899:1990 including
> Technical Corrigendum 1:1994 and Amendment 1:1994.  And "ISO POSIX-1" as
> ISO/IEC 9945-1:1996.
>=20
> So SUSv2 XSH is a superset of POSIX.1-1996 and C95.

Thanks!  And then I guess POSIX.1-1996 would also be based on C95.
This is quite interesting!


Have a lovely night!
Alex

>=20
> --=20
> Take care,
> 	Seth McDonald.
>=20
> On-list:  2336 E8D2 FEB1 5300 692C  62A9 5839 6AD8 9243 D369
> Off-list: 82B9 620E 53D0 A1AE 2D69  6111 C267 B002 0A90 0289



--=20
<https://www.alejandro-colomar.es>

--ldmldiboyd52aksp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmlxciMACgkQ64mZXMKQ
wqm+2w/9F/b3q0h6YupggL72U1kYcQ0d5GOSUNVVq9mIGuaMmwdiLTnh3+s6FgsK
C7Rk/gJ0/5r2EVaMwf8OFZBjzO7YuP5nlY2zBdWiNE9AeyiRGvqutXpPyQw9Dk5/
PwKT4QGLk1wt/ljM+/BXDnV8R75DOWbU/Reho8W2mDQEIP0ECY9MQD0xLK+9zohl
HyU1+l/DsOpsCEr4hiCsF6i5vvfXtO6whAUSGasdK8oSfaZ9dTCBH9BHVVUKJHRN
OalhD8DezkXwbLJFWEv5cVkNxhRqpUqL2L9xqg9pcTiqOqV0On20SsVL2Hwvik7A
58wQNUyAl6YVv4OntcOvwfY6czFRx5EWWtheTnIT3F5yCbOv/q0XSyWs1m84TrgL
P5B2SjRBfvBxqcbWtCGCdeJEbevOfpKfXOgsBhZmsbkOxLjjZWlHePKG9rovmxGv
CXC+MWIsktRGAFOv2rS7fX1X61UA6Vm3LqFDtYHYm0af0l2vBj9hVa3/77dhI2iL
LegqQkCKAQjUUMvXLSsPHIFEUB/hCc8EVqPr7VZjhLtnGIOMXDs+UrZHOwTr9RQ3
HNUGZ5xdYohuTy4YrIdybKHei3330P3ODPUvJ2EG3XXdnv4KkEQEIfqo3ZDWCskH
ZEJ8EaFgFvYLe0PAsnmjFbxGoZe4LHZ7Q5V7duYoMc6Z0djz7JA=
=R7hU
-----END PGP SIGNATURE-----

--ldmldiboyd52aksp--
