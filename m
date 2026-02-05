Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B82A22173D
	for <linux-man@vger.kernel.org>; Thu,  5 Feb 2026 17:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770311194; cv=none; b=UQYpcW3AtllHYPPWRrQVhi71BL0qNrlIOKne76fkBxdrpxiVvzJ/J1FZGqdrP5QFCNLkiQL0DSGnNeM1HjK/mHVZTl056ue3UDpRVX9LZMcVpXmac2YOAmB1dat4xTwmFeq9y7uj9S0e6lIWBMtnH0e15YHaNuz84WUtbh2EwOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770311194; c=relaxed/simple;
	bh=c9lidM8PIJIn+Q24aD4GM3XTmPwQorfATqYZU6PcY4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6Pe8N4ghC31xG2PnLEK+hOS5Ny/Ki6bkpQL0HxZVxEMYm9/lXp9eysm2EPTp69jHXeomss0eXl+JQBiuppIlWn+rsuPqWkgLbhh3UDg4073bshxu38asFDkN0rqDX+Fwp2vOBjAU5mYN6hrPFZA0IPey3VPa5CLStM9XzxSlGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQ+XRIvi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQ+XRIvi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E48C4CEF7;
	Thu,  5 Feb 2026 17:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770311193;
	bh=c9lidM8PIJIn+Q24aD4GM3XTmPwQorfATqYZU6PcY4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aQ+XRIviw7nZY+YgoOiM8uXT234IQYS08YGcYgKq8i2woADsA7NnAU0gFuxHDXf5S
	 wDToQ8EDGNG65P/EJ7sf6bpfU4YZiXfAX+7QrL1dsIg4iWQJkJpe94DLSZUu7AR/6o
	 yWAFvCg7AUjDKloYWxooF20NSK25wmFxU7MzpFlux1u/z91pYi0tgoipRud7o0dRMc
	 FKufQqQ/pUkk0zN21dvr9edd/aRkTUzwQ7vJ34Ps8FFS8EDnplaES47NGq8Onv4K38
	 ttzO+U+19274LWgBTeZ7njCe/yHH/Zvpo/bvNuWzFUs8kW1Yp57cWtiECgMgSeARqD
	 VACsalYva7Cmg==
Date: Thu, 5 Feb 2026 18:06:30 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 1/2] man/man7/feature_test_macros.7: Add _ISOC23_SOURCE,
 _ISOC2X_SOURCE
Message-ID: <sbgelevvyalrfiev3jbmn46wlbgmpnxfj7p74yowroy3zpfhe2@hxlqwxq6faxf>
References: <c52b599edf72f3e536ff6a5b846232ab15bc83d7.1769581650.git.mark.hsj@gmail.com>
 <CAMdZqKHXSJE5ZfmJZcOZqEYx-6ZoE22tQji501o6Yyf-gHgogQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4r4usqeyqho5r6xk"
Content-Disposition: inline
In-Reply-To: <CAMdZqKHXSJE5ZfmJZcOZqEYx-6ZoE22tQji501o6Yyf-gHgogQ@mail.gmail.com>


--4r4usqeyqho5r6xk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 1/2] man/man7/feature_test_macros.7: Add _ISOC23_SOURCE,
 _ISOC2X_SOURCE
Message-ID: <sbgelevvyalrfiev3jbmn46wlbgmpnxfj7p74yowroy3zpfhe2@hxlqwxq6faxf>
References: <c52b599edf72f3e536ff6a5b846232ab15bc83d7.1769581650.git.mark.hsj@gmail.com>
 <CAMdZqKHXSJE5ZfmJZcOZqEYx-6ZoE22tQji501o6Yyf-gHgogQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMdZqKHXSJE5ZfmJZcOZqEYx-6ZoE22tQji501o6Yyf-gHgogQ@mail.gmail.com>

Hi Mark,

On Thu, Feb 05, 2026 at 09:01:34AM -0800, Mark Harris wrote:
> Ping on these 4 patches:

Yup; sorry.  I'm a bit busy with C Committee meetings and preparing the
next release for this or next week.  I'll be back to reviewing
non-trivial or non-urgent patches next week or so.


Have a lovely day!
Alex

>=20
> [PATCH 1/2] man/man7/feature_test_macros.7: Add _ISOC23_SOURCE, _ISOC2X_S=
OURCE
> [PATCH 2/2] man/man7/feature_test_macros.7: Drop _ISOC9X_SOURCE
> (https://lore.kernel.org/linux-man/c52b599edf72f3e536ff6a5b846232ab15bc83=
d7.1769581650.git.mark.hsj@gmail.com/T/)
>=20
> [PATCH v3 1/2] man/man3/timespec_get.3: Refactor to prepare for new time =
bases
> [PATCH v3 2/2] man/man3/timespec_get.3: Add ISO C23 time bases
> (https://lore.kernel.org/linux-man/ec8dfdc495cb8d58e945b370658c6945cb4243=
27.1769705123.git.mark.hsj@gmail.com/T/#u)
>=20
>=20
>  - Mark
>=20

--=20
<https://www.alejandro-colomar.es>
Use port 80 (that is, <...:80/>).

--4r4usqeyqho5r6xk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmmEzgkACgkQ64mZXMKQ
wqlnsA//a/4m9nMAXZkpaKPMHeOxXs88mh+JEEeSqqBI6+X8WlzrvTsdoHKGC1Re
LOqN5nLxk4bNmDUuIbvfUJFx0zVRB/kZLHJqcn8YjCv12qkKiD0r58mWK4EoIqZT
r2ty4Dv1DuRb8EqtSWVM4DOTP1ZsGYt9I+YdPNbWOa+tkIhFhTZh14SOcTtF8jvo
6rv3BAwTeZQVzFjbDL3J7WoznfrjbVb4eX21c7/Zy18vOJWFsa4IYlTg2bEbfJJo
X7dF4Di44QipC3jZ62b5E0ldEN/fRZik8UvCIYQu8S/mv3nLT0nWHdM3gvjkTcbv
H1vFRTj1QJynGs8j5cWfeLreDBT1dOgF6te1eQOgQydSjEYLVDSyY6mBXqyF8x8/
U1p3CIv/SHAO4rsrHNf+c8jv2XUIEMTdx/6GaxpXZzYqP+dPSEqAz2UVo+IUyLTS
ZAKBfKUmFYtPzljLUDwUvNDAJqw+KnZsd0/nY15YEspgrDda7ccUd80+u9qB4bDA
m2OmrZvmFntpvWQl3cDIscN2+frcpQ4pIWhC4BV+Pynrp/CfOtBRBwq4Nlfvcin9
O/Nm1w1Tc7kTWJ3d1NwzzJeVFwO90MYCeOgDrMszq+4gN7SNj0+KXinvhpE3R8zu
Hk7PcrcKEwJuGX0/3OebUWV2xz/YkR5+gDNYXeZqY6uDAYHDwuk=
=sEbB
-----END PGP SIGNATURE-----

--4r4usqeyqho5r6xk--
