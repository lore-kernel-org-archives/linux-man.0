Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB40F3AE197
	for <linux-man@vger.kernel.org>; Wed,  4 Mar 2026 15:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772636658; cv=none; b=Zn/17xOEOcBnFScEu1DXalgu1+kPhrbf1FeEPlteLgsY+kk+QH85wG1/OIx43TXR80vjcF3HRE4PBqxeTpQ6+vB+t1ehRUuOzGxQa7wwsX6FqrM5uiieuivNG4Y/+0BgljJfNEdMYrj6FRVEB8+/wamqj47SaRSL3oyBBgDblAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772636658; c=relaxed/simple;
	bh=uNyr35OF9ssP8IKDo31X3uUMUPjMdbIzL257OzJlIo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqrrqrFxH9Him68AVZxfH5039zhZalQbKg0UR6Xi40oovhxow2p6hG5nEGVpkO5ej79aVEomylyey/IUKB7YAjuw+pnMk820H+QQxPFxlh8Fgd92PtzYnLJTD95XEiSgFY/vQ0epdwbV7ad1KzeZLvXU4/U+moMqQ6iJaPMJVPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MpCwO/SR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MpCwO/SR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE17C19423;
	Wed,  4 Mar 2026 15:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772636657;
	bh=uNyr35OF9ssP8IKDo31X3uUMUPjMdbIzL257OzJlIo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MpCwO/SRz0+FuJAvExqSvAWqlF0OVRxJGE25+Q6O7Kkp958W0CA23ER0piq4fsmf7
	 9csn1JVBxaY9av1ZFUccf5Qbf1Ie8auUwJnmjtk2Pqt8nU/ImQ64lgaAVvhNLRdW7f
	 yWPy6a2glKsxwv3m0Dd2ipLGBOYgcPMdbIMH7/rkaPff3LQE4RSwiEzkdotvdRfW2h
	 LXFzzUPAn9lHso2WBEQZLIhf/YlAh+D87V8xDn0dIQQHcwyAGw0w88w56+o1Sc6Zu9
	 bK415nvYgBkFyZkrZwU1sAXrWQy9xYkScVAn1R1eX12Nznzz7r8CkIQfpnBJX/BAbS
	 QQbrgqcEnwh/Q==
Date: Wed, 4 Mar 2026 16:04:14 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Ben Kallus <benjamin.p.kallus.gr@dartmouth.edu>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man2/mmap.2: Document that MAP_GROWSDOWN doesn't
 affect mmap return value.
Message-ID: <aahJQb1CMG2kT59S@devuan>
References: <20260223160219.1015364-1-benjamin.p.kallus.gr@dartmouth.edu>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="spqbolr2snojqpq5"
Content-Disposition: inline
In-Reply-To: <20260223160219.1015364-1-benjamin.p.kallus.gr@dartmouth.edu>


--spqbolr2snojqpq5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Ben Kallus <benjamin.p.kallus.gr@dartmouth.edu>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man2/mmap.2: Document that MAP_GROWSDOWN doesn't
 affect mmap return value.
Message-ID: <aahJQb1CMG2kT59S@devuan>
References: <20260223160219.1015364-1-benjamin.p.kallus.gr@dartmouth.edu>
MIME-Version: 1.0
In-Reply-To: <20260223160219.1015364-1-benjamin.p.kallus.gr@dartmouth.edu>

Hi Ben,

Sorry for the delay in the review.

On 2026-02-23T11:02:19-0500, Ben Kallus wrote:
> The man page states that the MAP_GROWSDOWN flag causes the kernel to retu=
rn an
> address one page lower than the mapping created. This is not true; the ke=
rnel
> returns the base address of the mapping created, just as it does when
> MAP_GROWSDOWN is not passed. This can be confirmed by inspecting
> /proc/self/maps after making a gd mapping, and comparing it to the return=
ed
> value from mmap.

Okay, the patch looks good to me.  However, would you mind showing
a minimal C program that demonstrates the behavior?

Also, that text was added in the commit
176b1a76 (2016-11-21; "mmap.2: Add (much) more detail on MAP_GROWSDOWN")
If that commit was wrong (and thus the kernel has never behaved like
that), we should have the following tag in the commit message:

Fixes: 176b1a76 (2016-11-21; "mmap.2: Add (much) more detail on MAP_GROWSDO=
WN")

And if it was correct but the kernel has changed behavior, it would be
interesting to document when that happened (if we know).


Have a lovely day!
Alex

> ---
>  man/man2/mmap.2 | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/man/man2/mmap.2 b/man/man2/mmap.2
> index 09e7933d3..20b94c243 100644
> --- a/man/man2/mmap.2
> +++ b/man/man2/mmap.2
> @@ -276,8 +276,6 @@ should check the returned address against the request=
ed address.
>  This flag is used for stacks.
>  It indicates to the kernel virtual memory system that the mapping
>  should extend downward in memory.
> -The return address is one page lower than the memory area that is
> -actually created in the process's virtual address space.
>  Touching an address in the "guard" page below the mapping will cause
>  the mapping to grow by a page.
>  This growth can be repeated until the mapping grows to within a
> --=20
> 2.53.0
>=20

--=20
<https://www.alejandro-colomar.es>

--spqbolr2snojqpq5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmmoSe4ACgkQ64mZXMKQ
wqkLNA/+NS/qGxRB9BwtWr0cVvvmqdLP1ASdY6owryh4tM3ji2wLerxHNpl4fMmD
ggttKKRWCknPvDE1af3WnVdULCS61aWYhwVGmgAhvNuSBnKtABJtlNSqSrBJO/75
L3yabID7SADkwgKTZM2jjqCWfMmk5yAIk7o7A+dHHsREgEISBkH7CH8wAxvC46zB
yC8o3PB7xfhpHm0u5X7ac9DpZPrdGb9ND/gwwTn/VMjHRtXnPwRnKurQ0Wju3pRX
Od+L2InvjGH/H9MTGT0Zc/onniyro9FIlQwJWtxZaF624z6L7aLHihC/MyZWVQXL
xSjHVldGiWNLthm6gcsm4p53Ld2RzGIdxxUIeJKeGpxZ4tD2J668t6PWa3SNwcbG
iVpWw9KmQqg7qV5pHIttfWbGNJokpIg5mo+wZlEcK/bVgHvZd7Z8Jjx2I2bXYKBj
+KO0s99WW7jWbkrCYbW967R+5AOo4+X4S/Pp0dgi407l3AAOP+iamyxJQ6SdokBu
36bVAe+pZ1TRg0I85K+419TSDUUiSgRP9jR3ecuxyB1hZihciHCw8D7j9f4YkHZA
7pVSaG94cNMFooZ5dilirKT+NGZEaMe9DP1NeSPi3BiVFjn+CvKvVHPvpP97ydVj
HQuM5uooZ/W4bLoLdCVRvmKRhqvUbDPRKWOCtLuHubeESLKUc4I=
=cZBd
-----END PGP SIGNATURE-----

--spqbolr2snojqpq5--
