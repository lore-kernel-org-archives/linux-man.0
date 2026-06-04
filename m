Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792D63DC86E
	for <linux-man@vger.kernel.org>; Thu,  4 Jun 2026 11:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780570987; cv=none; b=Pc02wBfv4x9apl6HiE182tK3TKwFwu9ghdoAprfqVa++lp5D0n0c9MEXntwPYK3FbFimqWboWIFE4S1x9NfxLYDraaYpuMZqDS+O3JG3HwtBmirieqdHsXlfYhrfpJijN9pS5EWwZ6DeuFq6Cr+JOm1JqAzVuwpB079F6BrvzrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780570987; c=relaxed/simple;
	bh=zkpsJuAEQnrz3eRAnzhIaTEuIeFfLa0I3b10hPrUeak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNRgzwlBE1sGVzzt+iQ4NTF+MTGo0HUoVEm7+FUFL79SbBgxMrQ1/oYemIDNo/hy+A+is+Dglw+v9xmBl7apHxqDeITMCTHbRg0knuhzDulgtMG7nbiaiXGZzE+8QPjsMONz1ZQ0RJ8rU1SPoXMFTnMPFw7firMVz/SsyAFSTbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cWkaXVE1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cWkaXVE1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C9B1F00898;
	Thu,  4 Jun 2026 11:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780570986;
	bh=IyS+3Tl1pAkUejnyuHbA6jo+cruMpuGL4QsCZmwHBq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cWkaXVE16BgITXGEDN5O+S0q/EghFan7pGNTkv4QGCE9mIo+3ukI9IbBN40Ux2ed3
	 4noR+TnO/qjaufOmUo17S18HX5ThxbGas6YIIU3YLeO5bgIDdQH8v+XIt2//vMg83g
	 kkpNlMQkZwOwrYKiZHbelRfIEjhhyn0fqQfvdOVjNxlf7pnpjgJqmw+YAlik2FlrB3
	 vff06u6ZoobejrNK5a4Iqx3ZXNUELEBRK63rm4vU4jTI2mXyFHXUskDQIKP0GGjb0+
	 WWPG4CzPoykhprKLIk8ezQvozyORuaR7hNHldlZRemV+YV+ml5/6tZnX5bY0k+Xjoq
	 toVLjI9Kkkhbw==
Date: Thu, 4 Jun 2026 13:03:03 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Siegfried Ehlert <SiegEhl@netscape.net>
Cc: linux-man@vger.kernel.org
Subject: Re: Error in manual page memcpy(3)
Message-ID: <aiFagMMoVEGdlJop@devuan>
References: <e53068f4-2541-4220-8571-47e3283bb01f.ref@netscape.net>
 <e53068f4-2541-4220-8571-47e3283bb01f@netscape.net>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mnihsgftzaa2wwue"
Content-Disposition: inline
In-Reply-To: <e53068f4-2541-4220-8571-47e3283bb01f@netscape.net>


--mnihsgftzaa2wwue
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Siegfried Ehlert <SiegEhl@netscape.net>
Cc: linux-man@vger.kernel.org
Subject: Re: Error in manual page memcpy(3)
Message-ID: <aiFagMMoVEGdlJop@devuan>
References: <e53068f4-2541-4220-8571-47e3283bb01f.ref@netscape.net>
 <e53068f4-2541-4220-8571-47e3283bb01f@netscape.net>
MIME-Version: 1.0
In-Reply-To: <e53068f4-2541-4220-8571-47e3283bb01f@netscape.net>

Hi Siegfried,

On 2026-06-04T12:14:08+0200, Siegfried Ehlert wrote:
> An error has crept into the synopsis of the *memcpy(3)* manual page.
> Immediately after the opening bracket of the function name, the third
> argument is listed as "size_t n;". The same applies to the strncpy(3) and
> stpncpy(3) manual pages; there, too, the third argument appears immediate=
ly
> after the opening bracket.
>=20
> *Example:
> *
>=20
>=20
>    SYNOPSIS
>=20
> *#include <string.h>* *void *memcpy(*size_t n; *void */dest/*[restrict
> */n/*], const void */src/*[restrict */n/*],* *size_t */n/*);*

That's correct.

     void *memcpy(size_t n;
                  void dest[restrict n], const void src[restrict n], size_t=
 n);

What you're seeing is a forward declaration of the third parameter.
This is necessary so that it can be used in the array length expressions
in the declarators of the first and second parameters, since the third
parameter hasn't been declared yet.  This is an old GNU extension, and
is documented at the bottom of this page of the GCC manual:
<https://gcc.gnu.org/onlinedocs/gcc/Variable-Length.html>


Have a lovely day!
Alex

>=20
> Kind regards
> Siegfried

--=20
<https://www.alejandro-colomar.es>

--mnihsgftzaa2wwue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmohW2YACgkQ64mZXMKQ
wqnM5g//fhrzZbBCWRzKDgImGntzJcgu7on1Ttmpf+JvA9xwuz9a0r+g4HqMFuCf
S0Ad2z0DRRM+AJFn9gUDGet+kYvWW0sob/4Rt/VGd5y4sERTTd/G+G6ve9+QJzlY
397qCHJqKDmU9zAnD+k3+uAWF/cZQKLC5yIYh4Ml7oFxavamVXEVO8qh8XeTfI3o
UT51DOKv7JirKH61R7znaAQ3q0xEpzReEOkAf9pAHFRsQo97TwHpAd7XjN1nQKx5
6lMNKCCSrQjHOOAR7ZoItXOvmloliW1VF0d2e3oI3S8Ab0571zBRsjH/b7AVk6HX
FNvj8+UJ2tULfWDH9EgoEdAQ0gBpyoueM1tuHwbG9cGkxy6bFuuf75Dv+K/waK8N
x6ZKbvKjg10HLHdVuxtmTSfSQegsK++Scl0RZF1/6LOpZaJZZRDHapdcmNpyo1v9
H1H0+vKDHBjvXUK4nPJKwzGtqKiJbQUMHObCi5JxFU7/0TkQaCpBVHDx4sriKf2T
qR/qBPHRh4PspW+zjbGn2InhwaUFKp8rlkdlBhUzOnzM+/4nPaYaSFr3r9Ws+typ
XPVtEyfkkwQ86k2bYrp32yNmL0QHw06976POecDvBeTNG+JCtRXOXEMzhV+qb5W+
UDr2Vuws6pxbZ3mz1HCMsVgxz0W/AfegLE8wsgeTBxRUf4ADMbo=
=QcZb
-----END PGP SIGNATURE-----

--mnihsgftzaa2wwue--
