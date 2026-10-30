Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367272;
	b=Ag5OPLqAjcmgq9Ue4kdij4pMo8dtHf1PK4HZYK5MfIsO5xOkN87z87ahW/7qJLB+KKlP
	 aNiWn+oYpBa0ZqBy8VRfWAr1RAykkd7WfVKU/4h5bEJMscmECZpmQvgYq11tn0wl1BsqW
	 7lzGtbwKY/0c+GTBxeJqZ72I4DBzZmJhCU9AhmeYg3kVQbrnKFGU9/B2cvr+XM7yegxra
	 GXjdPJYsVCy5FNa9iMy6a1j2UmhhaSK+Tyh8RaQqlRhnM68TWxAn7Fc47rvcK/8MEA7Uh
	 +fHH8o7yOuSVBKQTjayfEvrcyM0O4uul6FnZm9II1Baj3TMDQy1O6tHsphbAyEpJ/xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367272;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lXgNYfuFvSNDrfV/ZuLgjw5xZjRVYQdNyyhtYjujhPw=;
	b=NHGA9qdcjw94W619e8R3ch6sHyjUMuZuiNOHIio2JttzBhXsuUMAOCu3FBYRcMXQvejF
	 C4N9p5Zs49pwOemezWoFBwh7crkvy/2EI0swMi7eFkHtVijr7cTze4qwIY5yvg64tQZUb
	 uu2c1MvcjC/M97NcKMftCQdP3l07BgiNtlgpkKbgFGXQfWpZM1qzjaoQkPAljro9Z8qsS
	 cE91leSjaqltnzp6tQl1IPY+0hFEM16BSfmyc09poO0ro8ScwR4HD1RorEhXuN0hT0sBH
	 U/GEYP86RgXHpvbZhRZAEftX5t85uCrWncp+oIeDgbPC28b4IZDVgpnL/BVfUX50njg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lv1SLl8P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CEE606A31D
	for <linux-man@vger.kernel.org>; Fri, 30 Oct 2026 13:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lv1SLl8P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9BE61F000C1;
	Fri, 30 Oct 2026 13:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793367271;
	bh=lXgNYfuFvSNDrfV/ZuLgjw5xZjRVYQdNyyhtYjujhPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lv1SLl8P406RJTNtsm3r6uZEE6VWpnyLytgvo15YDs47/wx/wQO2lNCtZ4QnkjyhO
	 Bl4hP6FSTxgVWz6FDeR1SNqDgVP8t9PD45qnso6wtf8BPDpV2IFt4ITto5UzWUw++8
	 j7b1jtwOhBmg+4A+H+S++Adw6RsUbGhv6jcuwRs6j9WejHvGIofhCnNES67Z1mqIhi
	 8BzhbaJCVBCBqsvor4IuiEsCdz6TsE03jCBUsC2QJhb6MVnjXSSjqm+lpK0OfOpaRS
	 P3C+HTxFmWGwuIQ2ZT0qNbEa8MiP0DLboi9BYhcK7GPcqdmmAAjxlsIYM2wyahjcqW
	 Xq1X8ghYmuYAw==
Date: Fri, 30 Oct 2026 14:34:27 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Chan Lee <chanlee031012@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man3/strncpy.3: Document lack of terminating null
 byte
Message-ID: <auSb0eBwb1W8sDX2@devuan>
References: <20261030025927.37758-1-chanlee031012@gmail.com>
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
	protocol="application/pgp-signature"; boundary="35tv6mlpffc4fuhh"
Content-Disposition: inline
In-Reply-To: <20261030025927.37758-1-chanlee031012@gmail.com>


--35tv6mlpffc4fuhh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Chan Lee <chanlee031012@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man3/strncpy.3: Document lack of terminating null
 byte
Message-ID: <auSb0eBwb1W8sDX2@devuan>
References: <20261030025927.37758-1-chanlee031012@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261030025927.37758-1-chanlee031012@gmail.com>

Hi Chan,

> Date: 2026-10-29 22:59:27-0400
> From: Chan Lee <chanlee031012@gmail.com>
>
> The lack of a terminating null byte is already shown by the examples in
> CAVEATS, but DESCRIPTION does not explain the condition under which it
> happens.  A reader who only reads DESCRIPTION may miss this behavior.
>=20
> This patch makes this behavior easier to discover by stating explicitly
> that no terminating null byte is written when the source has dsize or
> more non-null bytes.
>=20
> Signed-off-by: Chan Lee <chanlee031012@gmail.com>
> ---
>  man/man3/strncpy.3 | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/man/man3/strncpy.3 b/man/man3/strncpy.3
> index 9c476acb4..89da260fe 100644
> --- a/man/man3/strncpy.3
> +++ b/man/man3/strncpy.3
> @@ -26,6 +26,10 @@ into the array pointed to by
>  .IR dst .
>  If the source has too few non-null bytes to fill the destination,
>  it pads the destination with trailing null bytes.
> +If the source has
> +.I dsize
> +or more non-null bytes,
> +no terminating null byte is written to the destination.

Actually, this function never writes a *terminating* null byte.

It writes padding null bytes in some cases, but those should not be used
for terminating a string.

The wording of the page is written so that users are discouraged from
using this as a function for handling strings at all.

	NAME
	     strncpy - nonstring copy

	...

	DESCRIPTION
	     This  function  copies non=E2=80=90null characters from the string
	     pointed to by src into the array pointed to  by  dst.   If
	     the source has too few non=E2=80=90null bytes to fill the destina=E2=
=80=90
	     tion,  it  pads  the destination with trailing null bytes.

	...

	CAVEATS
	     The name of this function  is  confusing.   This  function
	     produces  a  null=E2=80=90padded  character sequence, not a string
	     (see string_copying(7)).  For example:


The lack of a terminating null byte is implicit in the fact that the
page never says it produces a string, and it says it copies non-null
bytes (plus optional padding).  The CAVEATS even explicitly say it
doesn't produce a string.

I think the proposed patch would be negative, in that it would confuse
readers to believe this function is appropriate for producing strings
under some conditions, while it is never appropriate for that.


Have a lovely day!
Alex

>  If the destination buffer,
>  limited by its size,
>  isn't large enough to hold the copy,
> --=20
> 2.50.1 (Apple Git-155)
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--35tv6mlpffc4fuhh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrknN4ACgkQ64mZXMKQ
wqlgkA//RJArMokBTS+e4G1bqpEuhLpzUQuDDd5I0THhAy3rUfLNnz3QgIF1v6/r
u+aoRZAzNaSIgZRYbQ3hwggzE742oqXH95GIguWWfOcbUhLQKWfehCOouU63OqIU
vf90/fd/fl2qUgv9kEKO3g/C6ReIqYLbRr+CCNYQoDJ9+QXj0iRgt5ikolICsQol
EJ+jLxEiTWrVoA1aToZJRmAoahYozG5pFO1sBKb2JDKbCp/al1BDDzzXCeB+zotx
zq0b3tWETq7Iz/n7CKw9m/ol1611oU0jp1ZOJHy1OABgDLCogVcC6n1SUsH1Z5/N
pu1HAnbShgVAOt8qesiqmABA/lJlf+eIb9Q9ehg6t88vXLmsH/2zEi3YsM4HgMaA
XPYWu1bPvoE8VzDsAs8MMfFE9rBgoKQciigt47dwcYznZEciNJrKSs6t0M67MwrW
oiX+DeSTKsCD7acXPN6HwwZmDP5CFjlxyCgPA76QjF2LGmFMroYNkZDYhOoV89fK
h2jS5PzWu6V2gBe1xmX2jLco4Zel/GnvbmcTyU5Pa0LAAj+Lc7ARa2Doj0YH4yUp
8/8MBbmbsp7m4O6+H4s4/2RDfiXaOVvmFe3Bcn6mH9tO8VHWzBbFldStDyawvbRG
pRsvT3/OFkwomeVw4p/wtn3/c+XcWLHQZ0PN6nRGC7ZqnN7WPSU=
=SAFG
-----END PGP SIGNATURE-----

--35tv6mlpffc4fuhh--
