Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E177C22E3F0;
	Fri, 13 Feb 2026 13:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770989503; cv=none; b=sZ4sBhHkjVnLZtuOLM+fKQuTPCpOzcIpAn7uTzLy8ThIOwPo6woxetJ8LNIkBn/LdLh6oPMRDkIIYE5bKUsmVg7aTzjjhB+BvJcZ03fspKM/SYyOIos0/uAwIc2EPTk99AngenpcMfhtpG3na+xXeKOrK4+1+E/0zuE9C7uB+OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770989503; c=relaxed/simple;
	bh=M2ZVSx3wIiNd5Omjhbc4yq9S1giOg3wWl2ZpKdtyQ/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skrwVhOC7XpAstBpJ560KESQEBuNsKuP/goYU1ohn33/DWcfXzaCW1u4eZ/PP3ZoSh8o9bNJ/7hG6jY/cnhn6+l0tWru+DDyUFXprF6UkzteoOVwg+sWtfMXy7zDAN9R+I43im8Fb1vzYJ74WtGCSoSvQ8dQaF46kWkWzuCLTzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDJVPmUC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDJVPmUC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF77C116C6;
	Fri, 13 Feb 2026 13:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770989502;
	bh=M2ZVSx3wIiNd5Omjhbc4yq9S1giOg3wWl2ZpKdtyQ/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FDJVPmUC5Pun9tYtmvpIjsd9KlqL+EzfhPfiCl5iwv44wIv920MP35+BpntAGvtT5
	 UaREHf0i1nPdZZAq/4fbOtBdGRE/D4M0CXzdhPNYY2BZQ08/8MfBLibPVeENcTYHIT
	 Dfcud0BpiYxsQ+4LvjBcjUY4ATXdkj8Mi1GPAlvnBhY0rdXmGQnsThm6g8Cj4X0qos
	 K3THYXaTCncn3CWrhqTjIiuOrK3QpQIZ/yFjCJWoa06KfBOwmHHKcKy+/6s5PusZRO
	 K3C0CCGof7lEAeZaxyrFjNgpFV/zUjH5e7G/szHgV1V+FhB77wB1izodFrzmoYZE91
	 C5xrslXtYsd5Q==
Date: Fri, 13 Feb 2026 14:31:38 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Bhavik Sachdev <b.sachdev1904@gmail.com>
Cc: linux-man@vger.kernel.org, criu@lists.linux.dev, 
	Andrei Vagin <avagin@gmail.com>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
	Jeff Layton <jlayton@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, 
	Josef Bacik <josef@toxicpanda.com>, Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v1 07/10] man/man2/statmount.2: Document
 STATMOUNT_{UIDMAP,GIDMAP}
Message-ID: <aY8nm6CyBZT56RIq@devuan>
References: <cover.1770671863.git.b.sachdev1904@gmail.com>
 <fe86edd32cea5b9bf80320fc2ce9b6507a85af1c.1770671863.git.b.sachdev1904@gmail.com>
 <aYyJMflAWPJu7_EQ@devuan>
 <DGDR05PJO22F.33BTDW19HI4KM@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4bopajp5zwwyjk7y"
Content-Disposition: inline
In-Reply-To: <DGDR05PJO22F.33BTDW19HI4KM@gmail.com>


--4bopajp5zwwyjk7y
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Bhavik Sachdev <b.sachdev1904@gmail.com>
Cc: linux-man@vger.kernel.org, criu@lists.linux.dev, 
	Andrei Vagin <avagin@gmail.com>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
	Jeff Layton <jlayton@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, 
	Josef Bacik <josef@toxicpanda.com>, Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v1 07/10] man/man2/statmount.2: Document
 STATMOUNT_{UIDMAP,GIDMAP}
Message-ID: <aY8nm6CyBZT56RIq@devuan>
References: <cover.1770671863.git.b.sachdev1904@gmail.com>
 <fe86edd32cea5b9bf80320fc2ce9b6507a85af1c.1770671863.git.b.sachdev1904@gmail.com>
 <aYyJMflAWPJu7_EQ@devuan>
 <DGDR05PJO22F.33BTDW19HI4KM@gmail.com>
MIME-Version: 1.0
In-Reply-To: <DGDR05PJO22F.33BTDW19HI4KM@gmail.com>

On 2026-02-13T15:35:46+0530, Bhavik Sachdev wrote:
> On Wed Feb 11, 2026 at 7:29 PM IST, Alejandro Colomar wrote:
> > Hi Bhavik,
>=20
> Hey Alex!

Hey Bhavik!

[...]
> I have taken a look at the rest of your comments as well, I will send
> out a revision with the fixes soon!
> Thanks for all your help :)

Thank you!  Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--4bopajp5zwwyjk7y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmmPJ7kACgkQ64mZXMKQ
wqkTtg//ctOrdeFJvdgR2S6+lt6N9XvypbRIedT+THjjsUflAqADx1ND+0g9gmzf
4XzfVlq8XOteoBFg+kogugSAFv5niYY5WKCkwjG8scDtcCOsWJPB42XsyNwhJ+42
2IlpxHi9mNxHyRjllb8np3DKonV/e2JVZM62Myu9C76OTfE7Vl0ff5tJcC9EdO8f
+xhoYWvHeY8MuTepmDa5sk2U35MirC4xLK7plAz4Fr2JpTn8cOB+A6tLPWxfGq02
Y/+zLGvPJI7rvHZMAVVfpMc+sIuK/0arkNHlg3S1XtcdZZBKXbimCGDMu6P8T7tM
dus5JAQMlYTXpQVSN4h7WkicPK8fcA1PPvWNdJyXjwKQH3GUaHRPRCbPk5jHqjNG
ww0PvkOSNhV8Yi4GjXg4NknDJZZFczPJfsgIJYAhqSbS2aoU3NW7bcD3U7bM+Hfe
Ym5jWfPIKIvauU/3HdGGhSe1Ckt15TPE+UNqN9cDpM6RUcfAfDuGeThr37jgvwNs
DqseAT/hOGNC6tX0kKFvOyxCpL2p8kEMl0ZOzYcJYsT4MOU5Uwsh1dQvyRjGV5ih
jeBh6WTljpwYtY/rdke2GEAOYSO3UlVZMfSkzvwpxaYn5CbEUc3uSm0MwPtzGHOu
pPWLU7j3SesBpw+/g2fHE96vzdHItMlalnoxK51vELgMnbZ6C5A=
=8ERw
-----END PGP SIGNATURE-----

--4bopajp5zwwyjk7y--
