Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E09534EF06;
	Wed, 11 Feb 2026 19:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770838442; cv=none; b=LUs9dR0hDIpsLmuKFAgawpQfEj6Hw4A6QjGPa5FopTOYm9LB7mpK2GlvXuJKviSuy+PRjOQ2PeKNE4XUM3reKwxaqEVeKNH+twh++MWoElMDu4Oc1M84pI006nQABm0BA0PooU2JD7WBDVxh+DU5AHMKHdeEkKtGn6/leOQtN8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770838442; c=relaxed/simple;
	bh=+Zvwpn7Oc4a3EdAIaADj9uEtz2X4JmVkeZT7sD4YSQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eh+2ipV9eXGC74c4Kq/lf6BssiSu5fz+9E0rSdLljUVE9MwjasSBfISxmH9UzU5IIILaG9EWddZLl0LBHKk2F1JPY7W4Xk6QpZ6GZH8ddfDUP463Fy0yAvmudg0DbLC3U1bDy4J9pPlLaUzdMCTSk2r8mEc6hKEX1zyEx7O90EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mGsoy99e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mGsoy99e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91ED6C4CEF7;
	Wed, 11 Feb 2026 19:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770838441;
	bh=+Zvwpn7Oc4a3EdAIaADj9uEtz2X4JmVkeZT7sD4YSQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mGsoy99e4scRbsm16r6KffUk/XF62Gu175UhbREUJJDpvODATvU5eKJtKTPKe9wYa
	 SgqZybtNab7HnEeq3qZnnrnIKZwRDoxXQu8T8ixVt9dwpw4b1fFD4n6n46oYXcO7fW
	 eSewvSgXfL9WN+gXhuR5n9kYzH7an6Mx2wvI2tKVzvh3WHOx7JuBrQPG0y0djUUI8e
	 QXpA4z9GY4toClROzMsaRly7BIxUJdMVgMZqWvqu93JaAA9cxbyfAyG66+BkO7UnBP
	 G+VWvPd9itNn87cTASeamyvyl9TKpuUHk2gY+gksjzY+cHnhGUCzMt9WnzPWEsQUhF
	 L/cblTjcWOTsw==
Date: Wed, 11 Feb 2026 20:33:44 +0100
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, libc-alpha@sourceware.org
Subject: Re: man-pages-6.17 released
Message-ID: <aYzXZwCGZINWZBVQ@devuan>
References: <aYy41v6tYda2Qc_1@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dnea6n2xbz5ltrwz"
Content-Disposition: inline
In-Reply-To: <aYy41v6tYda2Qc_1@devuan>


--dnea6n2xbz5ltrwz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, libc-alpha@sourceware.org
Subject: Re: man-pages-6.17 released
Message-ID: <aYzXZwCGZINWZBVQ@devuan>
References: <aYy41v6tYda2Qc_1@devuan>
MIME-Version: 1.0
In-Reply-To: <aYy41v6tYda2Qc_1@devuan>

Hi,

On 2026-02-11T18:57:19+0100, Alejandro Colomar wrote:
[...]
> Global changes
> --------------
>=20
> -  CONSTRIBUTING.d/
>    -  Add guidelines banning AI for contributing.

Oh, and possibly overlooked in the release announcement: no AI.

We have a strong policy regarding use of AI in the project.
See <CONTRIBUTING.d/ai> for more details, but in short: no AI.

>    -  Document guidelines about In-Reply-To: header field.
>    -  Document guidelines about Fixes: trailed field.

And this is also interesting to other projects.  We "standardized"
a unambiguous machine-parseable format for 'Fixes:' trailer fields that
is resistant to collisions.  See <CONTRIBUTING.d/patches/trailer> and
<CONTRIBUTING.d/git>, and also the commit
a8aa0eaf6bad (2026-02-08; "CONTRIBUTING.d/: Document format of 'Fixes:' tra=
iler fields"),
which address the concerns from <https://lwn.net/Articles/1003797/>.


Cheers,
Alex

> -  README.d/
>    -  Document dependencies of the project.
> -  share/mk/
>    -  Add help-list-* targets.
> -  man/
>    -  HISTORY, STANDARDS
>       -  Document new and old standards with precision.
> -  src/bin/
>    -  grepc, grepc_c, grepc_mk
>       Add new scripts to inspect C source code.
> -  */
>    -  Restore some old copyright notices.
>=20
>=20
> Changes to individual files
> ---------------------------
>=20
> The manual pages and other files in the repository have been improved
> beyond what this changelog covers.  To learn more about changes applied
> to individual pages, or the authors of changes, use git(1).
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--dnea6n2xbz5ltrwz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmmM2ZEACgkQ64mZXMKQ
wql3Dw/+I9xc+f0ndnO71J1JS12YWGX44uOZvJTMM3fhCpQyOTgcGHePjRQWRBCN
UVd4bDYJxs0dssTmz69tSRliXWJBEieFVaMPojPLAnm/RIRos/VNEo7yVXX5yjvk
TUy9IajWbSFRrAaGjdKTARuruBHU+tqfbmaWPNJB5rFenPCI6mMOM5V/VbI1Pb7S
u/dJOhaKrflaHTFmk+sR+azOTC5GfVQUBpLI2RVvJlwmHsfMjHQ2vVayLOlw53Zn
J/IXnlPlMxn7TiU1HMPH8aps1fb5p2zGtyMNegjWfoAsYOyVdYUnjFmG+WDXX3DH
jm5RR96cr85mErFte+RsAU+ptz18pAYbfPCH1Q7P7BZZLXlT6Rr875og8ztkFVKw
hkq0MfCwNyuBkuvCTCmIKgQmvY5tHqWGa6hfisPfJcIkCIdheVPZ770CpEly4y/G
UmbGn9B8V2pvxFqsTyF5pNu3fuPs+rTgvU9dSE/RzAv4IEVbZMJt7+MgV5pmO2Ug
cHVw7gvJiD/Q1jYPMfqaH+klooSqfuCjjaz28Lg+QZjkvdiquKLMPvW+MRb/sYq1
MI5RydSkze1+f9IiNOpVBqjhYh/xCnqIPohz4A3NnuDJka5E3ssspD6hvK6cEFdY
vaYIc7KAdKTB4L60fwHazJQhfB97zmQd2oDQLxzIEQH4jXc7VnQ=
=DSPw
-----END PGP SIGNATURE-----

--dnea6n2xbz5ltrwz--
