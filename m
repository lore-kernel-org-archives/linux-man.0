Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA88C33C183
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 16:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773877; cv=none; b=XjvumErRbfrtW1E0JzXiSvnZJ+X49YnJpAC6khBatfQvuCoI1j0N2OV+Ac1h4thESGIQS+LX2BwqA2gduxyft2Li/vvlugAeD4ZB1Vp14C00WrP2HR53dwYcoMXwWR2D/pXaArjFJkie31BfcyJxbJw/iDtJph6rF3APzUWPTAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773877; c=relaxed/simple;
	bh=O2xZfQr31OgRR4Kw2t4bsEiCBrtjQWMDfT1tZUvPM3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jSgnyGg0UG9Yao6gH4GQXZO1R81AcGQxCOFrIY9Buz1iTV601SscRjXlS+WAdNueZRXHL+L0G7lnRtQ6Hh8DrOEGPd4BGQtx0ptpNPhL3vXVl3PA8s+nZIttto8tRqBMJXGuQysEri2f46Y2kFiIppSJsju8vx/P69LfBDQqppI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPgIoiOo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BPgIoiOo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B74A1F00A3F;
	Mon,  3 Aug 2026 16:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785773868;
	bh=UCEaqq97UI0U9vxWxyChYsNC1EtePGLw9G+KTrWkoaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BPgIoiOo5dKn3xA+7f56Ozxy89UWdeqwDDOvHwByIcbfgO31gUCLL07BEEqa8od2W
	 vNw1jZ8rE4+ZPmr1QJaX7BOTL0RJRIQBK32ElnY/S/SclNhErEBFjV1dCq2SFLTF/W
	 ofQt0g+LAJMNfJDHC4f+Cj8E7qesTlzofiFbN01ZmDGwE/UmmgQhr9oYbizdFeq1er
	 seifG9EWrfQxt4Kso6X9vgTpjfVsPl2d/glBUaW1PHOE18RT4L2PR4vdnn7pK2Fre8
	 P4a4knIdueld/apUJZ6E0qmVpZjv37NBag19S9fVg7NXdQuIjsDDn4FHoOzYkGTrSw
	 4sMaaI1wJ5sJA==
Date: Mon, 3 Aug 2026 18:17:44 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Jeffrey Walton <noloader@gmail.com>
Cc: libc-alpha@sourceware.org, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Collin Funk <collin.funk1@gmail.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <anC-iciC6ZgIkTdT@devuan>
References: <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <CAH8yC8mqbYSdnSPSUReFn5uq9beORx9r8qKUz--AD1KZ+oRQKA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4p6hejoek3tde5mu"
Content-Disposition: inline
In-Reply-To: <CAH8yC8mqbYSdnSPSUReFn5uq9beORx9r8qKUz--AD1KZ+oRQKA@mail.gmail.com>


--4p6hejoek3tde5mu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Jeffrey Walton <noloader@gmail.com>
Cc: libc-alpha@sourceware.org, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Collin Funk <collin.funk1@gmail.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <anC-iciC6ZgIkTdT@devuan>
References: <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <CAH8yC8mqbYSdnSPSUReFn5uq9beORx9r8qKUz--AD1KZ+oRQKA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH8yC8mqbYSdnSPSUReFn5uq9beORx9r8qKUz--AD1KZ+oRQKA@mail.gmail.com>

Hi Jeff,

> Date: 2026-08-03 12:07:41-0400
> From: Jeffrey Walton <noloader@gmail.com>
>
> On Sun, Aug 2, 2026 at 5:35=E2=80=AFPM Alejandro Colomar <alx@kernel.org>=
 wrote:
> >
> > [...]
> >
> > Most programmers can live in the safe bubble of <string.h>: those
> > functions always require a string as input, and always provide a string
> > as output.  Plain and simple.  It's difficult to write bugs when using
> > those.
>=20
> I don't think it is simple to write safe (secure?) code using the
> interfaces currently provided by libc.* Proof by counterexample:
> CVE-2026-5358,
> <https://sourceware.org/bugzilla/show_bug.cgi?id=3D34067>.  If the libc
> maintainers can't write secure code using the existing interfaces,
> then there's little hope for the rest of us.

Agreed; I didn't mean that limiting oneself to the currently provided
libc string APIs is safe.  I meant that limiting oneself to APIs that
strictly handle strings (including some APIs that are not currently
provided by glibc, such as streq(3) and strscpy(9)) is safe (compared
to using the non-string APIs.

> [*] libc could provide safer interfaces, but it declined to provide
> them.  Confer, the lack of support for Annex K and the safer string
> functions.  (I'm aware of the politics and the past decisions by folks
> like Ulrich Drepper).

I don't think Annex K is safe at all.  But certainly, some additions
would be beneficial.


Have a lovely day!
Alex

>=20
> Jeff

--=20
<https://www.alejandro-colomar.es>

--4p6hejoek3tde5mu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpwvygACgkQ64mZXMKQ
wqnucw/+NT1WYUqukfi2OIvjgdDIEBc3rRY7KEn/0oEEZkg7rrM9Wu+Dy9e2pbav
Oe/76L+s8Ro1+ibD50MrQl3D3FFo/SPWx/uNIFolECVyPuiuaqpZZg1mh7S1QXrn
CPKCIseeo5ijUOfzZx5OnQ4sQK3x73aUQoXztakChQyEaW71O3oiX2p4AkEtvurQ
6UpsL8wQv8GprXnjk5FVQBOiaC2dqypwtSuKU+e4A7mEiAlwHadeYtBUF5/V9g5X
5N4V9LYzzUjhv1TR+usNCs9I+VjG3GTVzW4SJKqopDQOmfITANt8tVxdqOrm1zkj
jKtsBkSXG/hfDGIfEOsWTOkKoX7A+pEQvPcYxaje4G6ldS6jaPUQyEwTiKG7q35s
OIbj5chzKC4bTyNZSHGmFFg9nyZcq3bu3ponIABskIk5bcL9nFScAwWkM4nIUuaA
Yf+B29Ud5RwC6e0fOTgGcwbw7N8EGLIHmZNBuaTXbynMUbfVBIKDgJ/sZFqZiGfw
Smha8sCbgpgpuUSLkBsYI+eHq0HZleuU9buGvuIcAHwGZI2ufEp9m/LcbnsngY+C
uYbqc+qdWyHmMMIYhq6Hx7AqPZ0KIwg6lR7oGPq5t3XxhGuJpuJ73twnwOoBoByS
pisBQ+V+KR5ZBBrf93vIiFaOb0i4izohSF/S2xMOJR5WcHNxM1k=
=NkrA
-----END PGP SIGNATURE-----

--4p6hejoek3tde5mu--
