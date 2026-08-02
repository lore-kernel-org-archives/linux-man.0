Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA79489888
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 12:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785672261; cv=none; b=hFBcQzMg6eYC6ASPF+scILWdvyDeUA4IuFVAvejdN50qpEyaISeZ5mfeGmz9Yv1aBLLVKczmXwP6vYb9O8mshmri3BxttRUaMLaCFB/H9lz3oIvodaCDvHvSRAKoX0SDMI5jjyRBGSICo3c/ZveJlSxGk19mc1f0lsppFPmHlZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785672261; c=relaxed/simple;
	bh=Nqeom75eSOfhN1HB6KygvhKkgHDCsaf3tlEHORqGpLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSTfY0qx4yVopfPxETfze+9MTcfpRoXS+0jNutt6awu4K6x1LSbVJ5YMpX5b6lfb8/onZVLFSbLPF/X3xw7i24v0SAsKSH0LPD0ozdoyo4G9jxQ1SzuDM/sbexRRqnzQ45lqIRL965S353BTT46qU0IhBHySfQg9kuMHKwzZfY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QFhHA6FJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QFhHA6FJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47261F000E9;
	Sun,  2 Aug 2026 12:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672260;
	bh=xoSnWBcm4mt8j8A1+62kInXCNeimH1HBryVPlDfszoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QFhHA6FJijYYcDnQYFBbxgsZ5sg7BK4q2Or7xSwZm0WlGDKMhtgaZsnUfp26lDRDf
	 HmVD5mwT+61epK6iavgeaiOtG49NMFwIadFsOTf8UiN6RjB7+8kouwa9N+qjAH3wIz
	 VcxoGLZU0ELwF7kpC5wRcbWE0lekGlccvi3/uklDpR6Uv9D17umLu6qSvWwfzkYiEx
	 HcB8TwUgbeqsCgVfMgFyk1OQXZArYIQ80L0G9RDWxm2BxkoMvsFiPclt3Jx3CPHln4
	 5YHf8HiFxqYrGZFrs+ZsAh49+sqgCDVE4vwwGLWzFnWL4WEHc8Fcr1JKI2ZJLWKZ+X
	 ntbLGpCHHp8zQ==
Date: Sun, 2 Aug 2026 14:04:16 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <am8wtqKpytXE6iBr@devuan>
References: <3556566.BddDVKsqQX@cagnes>
 <am50AM0bdufHa9W3@devuan>
 <15288158.RDIVbhacDa@cagnes>
 <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="buhtcezjdrknhxqs"
Content-Disposition: inline
In-Reply-To: <am6X32HkGdm2xTd7@devuan>


--buhtcezjdrknhxqs
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <am8wtqKpytXE6iBr@devuan>
References: <3556566.BddDVKsqQX@cagnes>
 <am50AM0bdufHa9W3@devuan>
 <15288158.RDIVbhacDa@cagnes>
 <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
MIME-Version: 1.0
In-Reply-To: <am6X32HkGdm2xTd7@devuan>

> Date: 2026-08-02 03:15:43+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> > Date: 2026-08-01 18:04:05-0700
> > From: Collin Funk <collin.funk1@gmail.com>
> >
> > Alejandro Colomar <alx@kernel.org> writes:
> >=20
[...]
> >=20
> > I don't think anyone is arguing whether or not man-pages is an
> > educational tool. The argument is whether it should educate based on
> > current standards, or the maintainers preferences.
>=20
> I'm not innovating if I say that the standards are mostly ignored.
> Actually, I am more in the side of following the standards as much as
> possible and appropriate (but not more) on average.
>=20
> This is just a case where educating on the current standards is done by
> 1) documenting at the bottom of the manual what the standard says, and
> 2) recommending to ignore it because it's bad.  When the standards are
> bad, this is appropriate course.
>=20
> The manual pages should certainly educate about reality, and standards
> are only secondary to that.
>=20
> This reminds me of realloc(3).  That's a perfect example of educating
> based on current (and withdrawn) standards.  And the education might
> very well consist of saying "don't listen to the standards in this case;
> they're bad for you".

And let me expand on this.  realloc(p,0) is not just example and
precedent of how documentation *must* go against the standards when
appropriate.  It's also an example of how the manual pages must and will
go against the partial specification of glibc's official manual.

We would do programmers a disservice if the manual pages limited to
mirror what glibc's manual says.

Where the glibc documentation doesn't document its own perils, we must
deviate from that, and document them clearly.


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--buhtcezjdrknhxqs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpvMj8ACgkQ64mZXMKQ
wqmXeQ//TKDvwJieYgWstabZ+yGmM93UNKTzdpkK4hGirz+EASwcH+1Y1F37N/QG
Viwu2XnmWnpKICqen+11Yu4Id1tyWA8i6JkHXb0PCIIL8ofwRN2FamgODqBZrFGt
IisH0QVFRz1mCF3MylEFSFRV/N9/XWiO22JBXGi9J5CqswVkrVo0KJWUy1lBoVh/
hd4S1rI3HBiFMxd49z3t66WVAgDuaTdOeo8K6VJgTz0vwAKQ6ZRzhyX1ByCygS63
vVZoUuXSQLFXbbsuXQ59K8qfK3OLVsSSTOxpVCzWnMTrgJHN84M6//JxGR4tVOG6
+ab5GsLa46TwPxPr8/SEXEajkpE1sIhSw+UvMyo/Kzj2de5vvgsgI7+DGj6hwHFj
Dy6p4isuOrf+vvERazsgxwhC/YvfcetO1L2GgM8jX2Nmq+PGR5VpmkGb1k7eDOIy
rEmB8Eb6cyOUNElMvfxuOXB6vJv43OJ8TTqGPHMidf977MEV0N3x3M366v4YZOMR
T1BybW7l1j+rkJW2OPaCLDfN03xqGOUvrEjcrwDe2SPuQxrR/f7xlGMWiypAo2XX
FGNZeJT1V3cVyaOhKbXvF+7F2PIAeWHzRSAWz9rbohEIMGSf1EA0Dqw1CzYkQGl3
35ZPwA+v21O/G0DBMxdoiCiOU/6zrsL/K60WUuLUwCt3zytkoBs=
=cCbA
-----END PGP SIGNATURE-----

--buhtcezjdrknhxqs--
