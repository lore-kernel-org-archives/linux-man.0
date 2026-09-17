Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BE54DD3B3
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 12:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646790; cv=none; b=eKZtPYHQ+4XCwXHrBwbErrGoW8cQgx0NZCmXlJ7//EJK/I4m48ap2hKbViVOeI1koNJhD4mBbJmPRMTFsuJnwzmdi4ePusPPJtJhAzaVbV2uzV1e49uGw+MV2OWz5wrgo86MfqGp74/mUZlp1S+CW7KYCM+037SHXWCDf6LbpAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646790; c=relaxed/simple;
	bh=nYihFaCQDqvLBCZQHWbRx560C2zRMQzBsiwKFovlDag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LstZ93WBv19uTCMo9Fm+81ejtQOLvOBoZeAd8ZrB1AC8HZW/qJU/2sdiSiZrXBjfGcKDzny87LShR4jDSkdfmrAU1ogCsaRsvcAs1MHHw2xJJO3XlY+aDyjVhAztZ2dbiMMqli1yOMM/sGRgdWFduze/biL4w3NEMbdssmmKDHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IpgaSTLc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IpgaSTLc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAABD1F00893;
	Thu, 17 Sep 2026 12:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789646782;
	bh=OHNlmtU1VST0JUzOOX4y2sX9IFs4VO7n5IRlp6oLdSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IpgaSTLcKlxE7rE9aZ8FnUDvG6dEErrA4wNx0vNnzAGNbbSUCIdWvyDZH3/YRXGZj
	 FF2UA+N7+J/cF4dSLiuaDI5HZeVhTOY9eemI/GZbsgzLQ9bTygpLoDKVpPvqpiqPO4
	 LGTua15tbwF1uSRDpZL1CbcfVUc1KX4QgcrmiK1j8k/H/siYxSteYpOd/XHT9lD/+J
	 5wRI48x11VutlnnKyhMvUy4WVphiub6yBRQUNW1lA+X9eRnwTJn5DPfbtMsO8YVA5q
	 UFJrcm4r+6cI393Bd0VYMjCh5h5f6FZC+a6mf6beJctqi3QZW7D2NLb+cTKVsmrjaS
	 6GN/eo4zxzBZQ==
Date: Thu, 17 Sep 2026 14:06:19 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Max Chernoff <git@maxchernoff.ca>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v2 0/4] /proc/pid/smaps_rollup + CAP_MAC_ADMIN
Message-ID: <aqvXnNyYz2UItr6I@devuan>
References: <2129b0c39ad5248641f24b43a4b1750bb62be43f.1789212041.git.git@maxchernoff.ca>
 <cover.1789386106.git.git@maxchernoff.ca>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="en3i4kxpqxzypgxt"
Content-Disposition: inline
In-Reply-To: <cover.1789386106.git.git@maxchernoff.ca>


--en3i4kxpqxzypgxt
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Max Chernoff <git@maxchernoff.ca>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v2 0/4] /proc/pid/smaps_rollup + CAP_MAC_ADMIN
Message-ID: <aqvXnNyYz2UItr6I@devuan>
References: <2129b0c39ad5248641f24b43a4b1750bb62be43f.1789212041.git.git@maxchernoff.ca>
 <cover.1789386106.git.git@maxchernoff.ca>
MIME-Version: 1.0
In-Reply-To: <cover.1789386106.git.git@maxchernoff.ca>

Hi Max,

> Date: 2026-09-14 05:51:44-0600
> From: Max Chernoff <git@maxchernoff.ca>
>
> Thanks for the review; I've split the first commit into two, and quoted
> the relevant lines from the long thread. The last two commits are both
> unchanged, aside from being renumbered.
>=20
> Max Chernoff (4):
>   man/man5/proc_pid_smaps.5: Add description
>   man/man5/proc_pid_smaps{,_rollup}.5: Add proc_pid_smaps_rollup(5)
>   man/man5/proc_pid_{smaps,smaps_rollup,maps}.5,
>     man/man7/capabilities.7: CAP_PERFMON allows reading
>     /proc/pid/{smaps,smaps_rollup,maps}
>   man/man7/capabilities.7: CAP_MAC_ADMIN allows setting undefined
>     SELinux contexts

Thanks!  I've applied the entire patch set.


Have a lovely day!
Alex

>=20
>  man/man5/proc_pid_maps.5         |  5 ++++-
>  man/man5/proc_pid_smaps.5        | 17 ++++++++++++++++-
>  man/man5/proc_pid_smaps_rollup.5 |  1 +
>  man/man7/capabilities.7          | 21 ++++++++++++++++++---
>  4 files changed, 39 insertions(+), 5 deletions(-)
>  create mode 100644 man/man5/proc_pid_smaps_rollup.5
>=20
>=20
> base-commit: 59ba1c34fb6538206e96597739f053183d1e6428
> --=20
> 2.55.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--en3i4kxpqxzypgxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqr17sACgkQ64mZXMKQ
wqn7WBAAkJMgoP3uaCWNjOzEvPtkv7r0+1da2iZ52ot9xIhcrwCwkVgo+1FSgEXD
Oune1ldjx7WCZkWa7JvYsuQg1u/6I4Glqmlgi0CpdWMbiSippFeTfNB4U5lzXJZZ
tr1l++GRfIFHLwx2DVxNxbDYN89StsEvuN0gaiR+CeNbvDWXts7RxiNwrWtvh8ll
tIjh31Wjl3JGXQRdlbEL9lkrKxBh+b7OvrNjGatJWWoIBIbm2BFeDV5mHnIheucJ
dkfEMcVyU9M6nNB8TGMQCkKizVNFBS1PdrbAUZnn5byh0Mk8xIe5gXADye5G/ALB
0xF+kCJHcMWubs3Ihw0tyd+TZH9ilgc3q1NLwMsKLT3riK1OQm8/0wEi6+rUUFHZ
C3lqZZM9Ca9iyPwtJlUhW295Su4HpERZuTxZBkR/warC8uWuPG+fXlgso1NKWHUn
CyrP+C077TY/FoZFV8W21RRIiGDTTu2q63hJwENSBPfBcGLSqJAfNkEu0sU9Fz91
LEUdL5krXx4/qxyqjqKVRYXb0QvrNyyaUxiw82f3pELg4EhuYlcMHKpvgwnrA2mD
ivXmgaydBjk4fCZnwE58WepAruuRxT/rRfe7QYnJBQH94zkWU7upYQastkbCHijt
aBtNSJitf18qtAyjKHcnDoDfsTsVGU7frw6cOJrHGOWGDVdZRhI=
=mRWM
-----END PGP SIGNATURE-----

--en3i4kxpqxzypgxt--
