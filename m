Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144CC2E22B5
	for <linux-man@vger.kernel.org>; Sat, 25 Jul 2026 22:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785017462; cv=none; b=YNRn8mbQ52AbQiCS15QU951MlQSYsblJSUQaP1zPl99BlQpBX6lqT7kzV4j0VBG/lLhARHpRwbq/yBeIkin4dkbetrq9cxA49MobE5pkTXBWTrL5AWLgcKIIkHYSUFCdn94hv6k4fDxokFCr/pn3+W5chGVeD2avhf+Yo1p3Tws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785017462; c=relaxed/simple;
	bh=gNvApuqHb49/NMJs1WlBFI6oV8R7+CvnTCi9InVhKt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfRrV563HJ+RVeLJjdgL0/BqPaZkH6k6ZCiR4MfzOJXk+rkriXkKeqwRibtUv3ZTthkIuDJmDCoF8gxDLLMF5FIwOVKwRejjO8lYGJ/yNcQpw4XoMowKo92bxW2OXNNy1jolJw1FbiuhYW0iFFEEbZSGieDq7AbLvKZAZtLGi/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ilOmdQdx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ilOmdQdx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF291F000E9;
	Sat, 25 Jul 2026 22:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785017460;
	bh=t1fxSjOPl8GXJA7ymw3rq9Y0UrqIB1xsgYg1sCmNBfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ilOmdQdxwrAG1ToOqsndDVfq80+FEiw00i3xU/c79xX6w9mPiJvxZIU+KLRkyTNc0
	 b4rrttIOoDw+08j1ISsBlnTgrjP7kkR2jCqQ/JACDhlTvB55pKF1K3AlhEdq+rirOv
	 yQc/oMTs4N5Kfb8Ei4Jvl48B64zHndTK/ArSTVJadzMmCODMnt7Kmv6vhyqs8sXapf
	 EN+O0W4o6acIbOQGlr9U0/kPo/KogdXCc54ZA9hZGFj3LsSDvOtFAeA26o0db5kKWG
	 I0pJmiw1A3nfbZjB8I8nKtuaZ5V5VRBiEChZAaiOPV+fCx2T543ZNjlw8nBrT29Qzs
	 QkDOvnrqiIcUw==
Date: Sun, 26 Jul 2026 00:10:57 +0200
From: Alejandro Colomar <alx@kernel.org>
To: sergeh@kernel.org
Cc: linux-man@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>, 
	Mark Harris <mark.hsj@gmail.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: [PATCH v2 2/4] man/man3/strpbrk.3: BUGS: Clarify the NAME
Message-ID: <amU0Uy6f0HLE3mo-@devuan>
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1783523064.git.alx@kernel.org>
 <a7508ac0f477f102582f2ac20b3c30ab25c1f7f7.1783523064.git.alx@kernel.org>
 <amO0kDE-r6ZFIr3t@AUS2MQ6190Y76.amd.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uwy54fi4lhmrcgwe"
Content-Disposition: inline
In-Reply-To: <amO0kDE-r6ZFIr3t@AUS2MQ6190Y76.amd.com>


--uwy54fi4lhmrcgwe
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: sergeh@kernel.org
Cc: linux-man@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>, 
	Mark Harris <mark.hsj@gmail.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: [PATCH v2 2/4] man/man3/strpbrk.3: BUGS: Clarify the NAME
Message-ID: <amU0Uy6f0HLE3mo-@devuan>
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1783523064.git.alx@kernel.org>
 <a7508ac0f477f102582f2ac20b3c30ab25c1f7f7.1783523064.git.alx@kernel.org>
 <amO0kDE-r6ZFIr3t@AUS2MQ6190Y76.amd.com>
MIME-Version: 1.0
In-Reply-To: <amO0kDE-r6ZFIr3t@AUS2MQ6190Y76.amd.com>

Hi Serge,

On 2026-07-24T13:53:04-0500, sergeh@kernel.org wrote:
> On Wed, Jul 08, 2026 at 05:09:13PM +0200, Alejandro Colomar wrote:
> > Cc: "Serge E. Hallyn" <serge@hallyn.com>
> > Cc: Mark Harris <mark.hsj@gmail.com>
> > Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>
> > Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
> > Signed-off-by: Alejandro Colomar <alx@kernel.org>
>=20
> D'oh, i should have read this one before the comment to patch 1 :)

Heh!  :)

> Acked-by: Serge Hallyn <sergeh@kernel.org>

Thanks!


Cheers,
Alex

>=20
> thanks
>=20
> > ---
> >  man/man3/strfry.3  | 2 +-
> >  man/man3/strpbrk.3 | 4 ++++
> >  2 files changed, 5 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/man/man3/strfry.3 b/man/man3/strfry.3
> > index 54ea313ea262..a65603af918a 100644
> > --- a/man/man3/strfry.3
> > +++ b/man/man3/strfry.3
> > @@ -6,7 +6,7 @@
> >  .\"
> >  .TH strfry 3 (date) "Linux man-pages (unreleased)"
> >  .SH NAME
> > -strfry \- string fry
> > +strfry \- string fry (obfuscate)
> >  .SH LIBRARY
> >  Standard C library
> >  .RI ( libc ,\~ \-lc )
> > diff --git a/man/man3/strpbrk.3 b/man/man3/strpbrk.3
> > index 6e5b79a48bbe..ee7a84f1a944 100644
> > --- a/man/man3/strpbrk.3
> > +++ b/man/man3/strpbrk.3
> > @@ -51,6 +51,10 @@ .SH STANDARDS
> >  C11, POSIX.1-2008.
> >  .SH HISTORY
> >  POSIX.1-2001, C89, SVr4, 4.3BSD.
> > +.SH BUGS
> > +The name of this function is bad.
> > +It should have been named strchrs().
> > +The NAME section above reflects this.
> >  .SH SEE ALSO
> >  .BR memchr (3),
> >  .BR strchr (3),
> > --=20
> > 2.53.0
> >=20
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--uwy54fi4lhmrcgwe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmplNHAACgkQ64mZXMKQ
wqkeyg/+P1KEvQU2Wu48So9wbRiJVBojC4JBcpr8sItBXg88uDXDvmAvA3n2DX4b
gKGQt1KLZWlF8klz3Tw0uxWGLQURTCqG8k3oVwIrVfx+gHpvki6FXqSSphD9kU2a
rjt+bXSMQlOtyqguBvgMGMECQ/YHIMb2oPjBtHu/jZJ2vmKWVL7VZuSpXogh7ObM
4usUSvdZlOLFS0je+x9+oJCr26WY64GOgKkD6+D3Zzt/OExEaBn5Lq9n9NdhhPbi
i/N4mqI61VSn1Ozxd7+l1AHCh66sQfZ3oMPlMl8hrYW+DoejgQDUKlH/YOSRZ1lP
ksWjEs5ymMyOa1WZ0fSOuIDbl2J9hY4RM69CtXKNN0VV60UduTlk+IKkISY4WQhG
pnK3HhfAY4dQ3jhRfqo0oiiLGrTKfN89GuJPQ3rz9Ij6Z1aBRFSRzqdT4JtszMmj
rMFENrioxIbT9sOLU5tm7TQr9VCDVcnX1UEpJ76y+4/KPn2ip4TieHbHluD8CgaL
/HAf2V5FOdrHX0F+WRJsO5A2MHdJeVofabshvyAVsCRvwegLEXmbnKJyfF//1TqB
0u9H2eT5c0Rzew1bdmmuN22cjNzWNFZGJJb2SzFfToIgAJXqywUNn/cwBRde6Fwj
RC5ccNIXLELVUZRiLKd7cpUu0ldlRHSYy6mHwLhDJ75l8PRYq1U=
=ge59
-----END PGP SIGNATURE-----

--uwy54fi4lhmrcgwe--
