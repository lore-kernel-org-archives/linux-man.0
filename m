Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEEC1E531
	for <linux-man@vger.kernel.org>; Sun, 19 Jul 2026 11:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784460100; cv=none; b=sVcMdwIft+upfAWEhNKxElXzztU28rvGqcIp5cfsCRMKfXJdhQV2duAgE91UTfl6YC1N2atrMhMcEvoK+Fh/Ag+Dz0/TeEVJC++DVI/EWAVJ5sDnWjgEzp1Qfgmlke3w/PQyWAhX6QPRi+vBzZQYoRJyEJYYbiifJyCugrVXtl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784460100; c=relaxed/simple;
	bh=hO1JLX+4yS8u3lGJwdWbCU5bbyJiky4U+R0AsUfBlPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sI3aav1sFSlOZTKzwXxkra+ayB4RLmZO7nx3D/h50ShhmXt7XGfXgVrfw9/qZwGzOTUXc1Zz13kon7xhvL9yTd3qK2unQvBwysbGc6B9ZNJOwoPVayc/BggwOWOhBEZKPBoJUR7FbvcE6d8fFHtbLZCQfOwuxjvnjQdhsAhr+gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJ5iU0U0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJ5iU0U0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CEB1F000E9;
	Sun, 19 Jul 2026 11:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784460099;
	bh=a9o7DfkvZ4UV+iYDr7iOZsl+yvhE9zbKpDHf65BZVpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aJ5iU0U05Y4QvNPvob39IN5wOsVsABMtN1+w8rObggOneScQeqPEmMjHPKFOHifUp
	 qn296w9JUb/lXnPIKVXENgu4/4McWUEbKdDcaSdB97EcwMEvoYmp8Cr1pK2JwUs/Vt
	 /xDpG7MmK0Gnjwn5Yf8jIzCtXesYyRKHHsIskIZ7QOHPYRDE0vz1JA43XfF9lwfvCy
	 H8wM1fq9TV+bqVSf4MGfrtyEfP0esMFywAt+tB2PSmPrqPAzw62MFXEO95tJM1DqKr
	 catcETVPjII2jHoa/QUT6+VKvtWwMZ0F2SzRes1puGKJbUcHDhGQ38wQpDcXCALTV7
	 iCDhHmaFnajBg==
Date: Sun, 19 Jul 2026 13:21:35 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>
Cc: coreutils@gnu.org, linux-man@vger.kernel.org
Subject: Re: ls/dir/vdir(1)
Message-ID: <alyx4-PfUx9zh0tc@devuan>
References: <aluIbrKBtAxweITC@devuan>
 <alueABs-ZbwayZdu@devuan>
 <86qzkzpaof.fsf@aarsen.me>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nkvowf3w2pgvvkrr"
Content-Disposition: inline
In-Reply-To: <86qzkzpaof.fsf@aarsen.me>


--nkvowf3w2pgvvkrr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>
Cc: coreutils@gnu.org, linux-man@vger.kernel.org
Subject: Re: ls/dir/vdir(1)
Message-ID: <alyx4-PfUx9zh0tc@devuan>
References: <aluIbrKBtAxweITC@devuan>
 <alueABs-ZbwayZdu@devuan>
 <86qzkzpaof.fsf@aarsen.me>
MIME-Version: 1.0
In-Reply-To: <86qzkzpaof.fsf@aarsen.me>

Hi Arsen,

On 2026-07-19T11:53:52+0200, Arsen Arsenovi=C4=87 wrote:
> Alejandro Colomar <alx@kernel.org> writes:
>=20
> > [[PGP Signed Part:No public key for EB89995CC290C2A9 created at 2026-07=
-18T17:42:18+0200 using RSA]]
> > Hi,
> >
> > I have some doubts about specific pages; let's start with ls/dir/vdir.
> >
> > Experimentally, ls(1) and dir(1) seem to be exactly the same.  I'd like
> > to document dir(1) with a short page saying that it's equivalent to
> > ls(1).  Is this correct, or is there any subtle difference?
>=20
> Quoting the documentation:
>=20
>=20
> > 10.2 =E2=80=98dir=E2=80=99: Briefly list directory contents
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > =E2=80=98dir=E2=80=99 is equivalent to =E2=80=98ls -C -b=E2=80=99; that=
 is, by default files are
> > listed in columns, sorted vertically, and special characters are
> > represented by backslash escape sequences.
> >=20
> >    *Note =E2=80=98ls=E2=80=99: ls invocation.
>=20
> > 10.3 =E2=80=98vdir=E2=80=99: Verbosely list directory contents
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > =E2=80=98vdir=E2=80=99 is equivalent to =E2=80=98ls -l -b=E2=80=99; tha=
t is, by default files are
> > listed in long format and special characters are represented by
> > backslash escape sequences.
> >=20
> >    *Note =E2=80=98ls=E2=80=99: ls invocation.

Thanks!  I've changed the descriptions of these two programs to the
following short and simple descriptions:

	DESCRIPTION
	     vdir is equivalent to ls -l -b.

	DESCRIPTION
	     dir is equivalent to ls -C -b.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--nkvowf3w2pgvvkrr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpcszgACgkQ64mZXMKQ
wqkZcQ//X+KfJybWy9CXDSChTAAsoS5SIO+dObN/W4IQ8s8B3w6cBuGZZuGDmIVr
ogoKHIw1WmQPm5E1rmBAkDBXRgy9Fbha+KPWgexoM1ezjvKf8tWljPaCWGNd80Zj
CbOT4R8sV3KUSrXdN8e+UNvi9Zw7NwqNfLAzBONE3OhJ1o1HVgZ5P+pQYTkqq1nF
m+Kw7J8dA5jonQX6Fv2g3YGTGr9m9fsOzZIliye2MPpNoK90TANizYh+ggCDhWo3
RCq8qpMTzMeqY8nb7phL4TACIluVaWpq+7EkIxavgzPg0Gq2QWJwuXmOe5uElOsh
FL/JUMwEDpwwVsO7ubxwc1QuDSzYUUGW9Q3tGQRGyVbAkG5ij13WAsVsIoo25+lF
xMY5z8SoODbPuOeE41c8YfHgIK2vBvLxLvB6HJHsYHJjynNlqSqcTSfSpPUHX990
1NBO+CIV9YgNx3rb+My4rLxenmNIkPeU9/G9IADO+nTUVE+MK/kqaYrefV0F81b6
FVkyQ44omT8rzzUnJ6daMB9cuufHW7Rm0Smgom5dMe0nALkv6b9TTZbxs9euKOZS
U3pKnatBn6uatwVAmiIfRHNwDWKRjF23V3IN3/PdqRfz6cLUl7TIh7Hib7Fbz596
O2OLFDgj+Qp0HFbK7bjwnPgTCDlWu4XCwG4qz2++1Fu8TiBa2Fc=
=FUvT
-----END PGP SIGNATURE-----

--nkvowf3w2pgvvkrr--
