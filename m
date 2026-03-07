Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E3C2C1595
	for <linux-man@vger.kernel.org>; Sat,  7 Mar 2026 14:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772895392; cv=none; b=aHSnAvr8nJWbSSTTVH8H1p9n11hAz/wkOyEE6jzVbPw3XlzML4hbXCP9qz2PetMPEBsFWO1Iy2iUy/14TqkEqv1aaPet2lLDjUMNkTyKatgwoI/nwyZaEZZu+Q+qMWN6Bw0O+2+aC0VbwlCNqaKpi3hyG0Dqm4plD75C/OjIhb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772895392; c=relaxed/simple;
	bh=rn6Apx9jJ76rLghiBxSpkT8XfUinGhI6dAC0wIUr54w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i502HyNpo6jPP6XW4zhI5kxUXOFGQ19RaIaoxD/4aH8QGI7LLC2YLXg53vNnmAjK5FtbpuVGc5/rFEiB+uI66tOnZgo0lyEYaT3ADy6UJvfBOr0GZwbPXvyBVRm4nEv8wgWwdp2VxFUxzPwmp/OK/9HOVHtJRtGnzH+3TqgjaDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqqXD6uI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqqXD6uI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C088C19422;
	Sat,  7 Mar 2026 14:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772895392;
	bh=rn6Apx9jJ76rLghiBxSpkT8XfUinGhI6dAC0wIUr54w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fqqXD6uIqsJ5FFGdUczkwrF1MBxTCvq6xE0uoZgDq0vv7mgw5blw1d5nNyc64b7gK
	 GHshq8u+TV8b0BTP7DLbOJsd0+LVDDirCzgLwkcDdWJwMdbJl4F1USi01kAeFVFOjM
	 7I1UCsv6r3i3sT13BIP6/Ql+l+ryFtqJjHrCN4LOyqjrZ5eyNhPiAQorMgWVaOmX4C
	 cVZkQDUj2iJxZfA7cPsblU7eJ6+gtIPlSz/hjGuZg+9kxG+cVJOn1e2LuYZukPjwIR
	 nhjY6Rkv+g8vwTQFnsUS7rFVw3zxeVg/97v5ASlx4UxoCElryeCelFWn+1yydHPYNn
	 HIKV/x6KYfCHQ==
Date: Sat, 7 Mar 2026 15:56:28 +0100
From: Alejandro Colomar <alx@kernel.org>
To: bugzilla-daemon@kernel.org
Cc: linux-man@vger.kernel.org, Paul Eggert <eggert@cs.ucla.edu>
Subject: Re: [Bug 221186] New: clock_gettime CLOCK_TAI is incorrectly
 specified
Message-ID: <aaw8SLhwjSGR0X4m@devuan>
References: <bug-221186-11311@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pqmdcfjkeeuniwii"
Content-Disposition: inline
In-Reply-To: <bug-221186-11311@https.bugzilla.kernel.org/>


--pqmdcfjkeeuniwii
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: bugzilla-daemon@kernel.org
Cc: linux-man@vger.kernel.org, Paul Eggert <eggert@cs.ucla.edu>
Subject: Re: [Bug 221186] New: clock_gettime CLOCK_TAI is incorrectly
 specified
Message-ID: <aaw8SLhwjSGR0X4m@devuan>
References: <bug-221186-11311@https.bugzilla.kernel.org/>
MIME-Version: 1.0
In-Reply-To: <bug-221186-11311@https.bugzilla.kernel.org/>

Hi,

On 2026-03-07T14:21:17+0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221186
>=20
>             Bug ID: 221186
>            Summary: clock_gettime CLOCK_TAI is incorrectly specified
>            Product: Documentation
>            Version: unspecified
>           Hardware: All
>                 OS: Linux
>             Status: NEW
>           Severity: normal
>           Priority: P3
>          Component: man-pages
>           Assignee: documentation_man-pages@kernel-bugs.osdl.org
>           Reporter: mpatocka@redhat.com
>         Regression: No
>=20
> The man page for clock_gettime says "CLOCK_TAI (since Linux 3.10;
> Linux-specific)
> A nonsettable system-wide clock derived from wall-clock time but ignoring=
 leap
> seconds."
>=20
> When UTC was announced, it was already 10 seconds behind TAI. Since that,=
 27
> leap seconds have been added. According to the man page, the difference b=
etween
> wall clock an CLOCK_TAI should be 27 seconds, but in it is 37 seconds in =
fact.
> The kernel is correct (it returns 37 as the difference between TAI and UT=
C),
> but the man page should be fixed to reflect that.
>=20
> I suggest to change the man page to:
>=20
> CLOCK_TAI (since Linux 3.10; Linux-specific)
> A nonsettable system-wide clock showing physical time elapsed since Jan 1=
 1970
> 0:00:00.00 TAI (Dec 31 1969 23:59:50.00 UTC). This clock does not experie=
nce
> discontinuities and backwards jumps caused by NTP inserting leap seconds =
as
> CLOCK_REALTIME does. This clock changes when system time is adjusted by t=
he
> user or NTP for the purpose of correcting wrong time setting. TAI means t=
emps
> atomique international (International Atomic Time).

Would you mind sending a patch?

BTW, Paul, would you mind reviewing this bug report and suggestion?


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--pqmdcfjkeeuniwii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmmsPJYACgkQ64mZXMKQ
wqlbShAAijCykvHH6CBIGb4egDKZ2DQdEULeci8We4wGpgf5C919X0s6Ih/au+B5
vdrYcxZE0IuXgPHNbmX9YBsw4uQ/9QukReMmFEjmAcnU/YTkBD+Fulrxump4xthu
L2R/6KpErE9yOhUiViQnICoelUzHfap0mM2fzSvSRug9ucTWBkXQSOj5OXTI68GN
ViHqqxsZM1oxW86YRQait4dC0G+7TbthPDIsTiybey2aZZb6X/X9x5GYFhUnNvlE
NUeKkXyHZGxHR+AfgzaMO8zxfGke5QCsdj/9sA4uCVJm5aNgcZfCIPwIuH7O9b5Q
PYn0Rxtq7CZq61s1PHtGRBG66/YA3C9pTg+rMouJQebJ1G34PZjP7nS7Z+qaviEQ
X9XccUiBsMM5H/6onzakMdUVW6nK4kO4v873QLWZcWiwdus3ubtmDhysyN2ilOSN
+55OuJgH9cs6DJLVHhq6edNJOh6kFb9TTCbnYbHUIPqsSOBUyl6XHzfLNrD53J9d
ZmgKvDzZ1/ghnS41EWDdh9ytVzwTxRYdm4EECHla/i5hSKoQIkfooyIJ6kb3O86n
tetldUGX7eSDATfN+qbZK2GnN4wTND4v4MlOVal+lU61X58tjyG9+t5jNGtuOuVc
5uNTN2/hkkntpUs67u7bRD4ZEEYSPXxAcb0yisUxblumr5DCWEA=
=AeLn
-----END PGP SIGNATURE-----

--pqmdcfjkeeuniwii--
