Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4044932E6BC
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 21:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785533318; cv=none; b=PbFZ0GnqFhrxIcHJzw56nCEKptRVNnlss//q9pfkwIH2aO0h/ESB2N65jNmhuNbnI4yAbETSIMvdTJZTqo9lz8AEDkeMvjBmdVAB5oaK6xbIMlrwSQk0QqAWHF2qE537uKz50XGOKqu5ttPnTAnIxkz/0ADlzspyLtH03zx+1OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785533318; c=relaxed/simple;
	bh=wx0+8J5v5zekzUh5SWo29P3s+5jEXes/LswxXs6cAGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YefIxmjS1cyByROcqblgHI7v2aivNbibJ0BSLnOeUPpF5qd0V4MH+CEXNFR+FRar2hHscIT8qR0swS/sMgpQPPzCt6u5lw7rSLamGOYoCAB/Lh86lvqG/p7HOP8J/2MYU6fZhQNCuM79b1bucxWw2g5dFB60+1klK01H+I5Kf6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3YMNP+C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3YMNP+C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EC61F00AC4;
	Fri, 31 Jul 2026 21:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785533316;
	bh=u1U3aFZAIS+3bUK1xujKbzO0Gg7K2O+X2CmL+vYl/pI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R3YMNP+C8hniIExZwA/43+Qir0fgHtCNI/ADWnsltxwjqapKSIbNy+RGblpKSGC4O
	 uhiu4LuG6I58AKr63ziOdU38UY+7g1WCwAg7SQ/JxCXdc8VkIpDuGpMYpOSCNMOYmj
	 WLz1SMV6svPa5yX6y1y6A/mduXhYP2HPMk1IzRsjKzwaQa+CsRtM5lHZWJ7y7jdrsV
	 PHzL93B8vUh+n8mD+VFFJMtGASXcD2eK+SOsi8/97+oi5a3HVP1CN9hvPYBP1VcarC
	 6TJ0+l2At8hYsnqMsnLIzjNS4B2QgOpJ3ww/jm2VEM6n0tS7YvmjMp3Er/eWvGamfV
	 lbuhpcbUO5oRA==
Date: Fri, 31 Jul 2026 23:28:31 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
Message-ID: <am0TUn55P7uNtTTh@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jkhbxhrkrgt2fgp3"
Content-Disposition: inline
In-Reply-To: <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>


--jkhbxhrkrgt2fgp3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
Message-ID: <am0TUn55P7uNtTTh@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>

Hi Joseph,

> Date: 2026-07-31 21:23:35+0000
> From: Joseph Myers <josmyers@redhat.com>
>
> I think it's irresponsible to use the man-pages project to promote=20
> personal idiosyncratic ideas like this in preference to what's been the=
=20
> standard location of functions since 1989.
>=20
> I'd rather we add a mandatory deprecation warning to memory.h in glibc.

I hope you don't; it'd be a gratuitous breaking change.


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--jkhbxhrkrgt2fgp3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmptE34ACgkQ64mZXMKQ
wqmsfA//QOJJv0fBlThgoDFDu2UMCmRYk2oj6K/xTEBQFFnkpUOAOKdqxs+QLIGP
HnVoCy6hpo8KozawdtyobQQIk7g76qeQZgZDMj3Wuvg8H3L/7TY684fAvE4wfttp
ZyEaF1F4yVd2sKkDFQGM+9zUDhbsFcv0t6S8wMOaqLXmV0kZF/Q3pMFVbTN8JuUi
PsMm3rcBdC/U0IdZlDsUVE6GwAZxWT5GRugK/7Q7/I36jISlBfYkRUHMZPda2lhe
lxoTtJ10vpw2LlNa+m80RXHDVQVfnYGaxfvqWQMzPsv/+hY2VzPOzI1nLNeMaCXg
JwC2bbBvmJCVS8TsXlf/D649PVTvDcQUkRljZyOhzv/DGQ+OHbOuoTRXoZ+2PJqH
errfe/HPYmspHspPgbQEp9c8jw2bMIVnNf0C2WRGsrggeiui4bUmDiPhkHdi9DTZ
vY27rAr/L07ez34kGh9oibzqCqCRzAuyi+wmFsXQlZ+mwa7pmayVJzKtlKJ09SLi
rG9np9K7cMnmDi14mePCr5i903LN1zCilOmzx2Us6JrEWPvyIMlgkZzQY/xbl/1j
Ulb+9DxTc5N/oNm8LT5si2kqC3Wwzj5caPg86LV09P08juoMTlNhBu6Ras+ARFkM
Chm+w6vMQLg0AiMqrGYpOg7FmDzZ3/pdt9OkugWYrC5TIC1ijm4=
=T1o1
-----END PGP SIGNATURE-----

--jkhbxhrkrgt2fgp3--
