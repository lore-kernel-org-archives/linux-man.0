Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795734123;
	b=SKEQTIMlxuHLGbs8EXOHO2j1VmHSFI15pYsval0AvzpMRZKOhFjvcxM3O4RrhRW4fIhh
	 N0glpXHl0XvXstwg1gcAiSCAdn/IumSVOSMwnkQFzSrZXqs5X+8VLBXmPAT58qM2PN/EE
	 u66h/GntKy1xo9Z0rW+QMVfxgMF3DDwUcLVe6VhFSX6XiuMr1YvZRL7iBk5zOlpdXnKuF
	 ARp/sT7IUf+yi094aQ96aekWZWgnsPqAQ3hNMxLiFURqnnFoxwdOgfMqJ7nvWtHXHlqAK
	 wpprmyMSSYlEU2J3fJmk4icIdcd5jwv8qnunpI2DuCe5nMiELQ8Ck5pOmp81m3/wY+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795734123;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yjZGs2vGo3Pk9CqSxk1MPs31pyMmJVkDGj3lCeu5kUc=;
	b=Pr7VHHuH6VBBaWTWAMIFAhAIPR3vhyy9U4XZzzcqt73bEjfbRbrhVXm5kfKPlrH9C+oY
	 kr8rTWk1xTUZ9PeHFntkD5e8PTNwO/8xvd0rKZI/6WH9D6JpOsB9CqnJiD8ZEDtBl/UV/
	 i6+5McDOhmLXkzp3N2aNh60Ojq3aqjJH5/pwFfzZ4SD5k16R7S3XiU0zKgwUXE0oYMFar
	 0crSlsb6hnKYSZQgcEV/12WMWGxpfG+LrkWlyllLzXu/hj14h5hnG4n3yBehUEoIgW+zb
	 2cZGNJ1lP3SHvQCH1qK82D4lxSjYHpNffx1vGW/xlnPZUFQlwBoT+nYOtvVv8sCVAdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifQwduiA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8613606A321
	for <linux-man@vger.kernel.org>; Thu, 26 Nov 2026 23:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifQwduiA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B9C1F00893;
	Thu, 26 Nov 2026 23:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795734123;
	bh=yjZGs2vGo3Pk9CqSxk1MPs31pyMmJVkDGj3lCeu5kUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ifQwduiAtFDBAmI8itPqlTlJF/qeo/7zCFr8UsMKBFKqI+GARXgtC/0sw8xrUO3ZA
	 c71GTINYqQzxFWUCn3qnGDV7I62cW8MEdGUqoMKLYLgl2p/AZFoxG0ZmorqdWcxOoT
	 9IwrkYq97/zFXeJHqmi+CB72Wr8ipSMYIhIHipncHadgaR47xQzW7ddaTfVzcbwyXC
	 hluO7067Jr7NbLlWy7RhuOdQc00630ic5Yri93Z7Qnj6HKeP49iRu391dZNPSKQMZI
	 N6gaDRpqGEVDmy1z/+2SRVnlSrEIgEmUzIpiYf7dLKIgY2Y7hdxKyNJmKg83e2X5gQ
	 MM5EoV3he84EA==
Date: Fri, 27 Nov 2026 00:02:00 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Cesar Eduardo Barros <cesarb@cesarb.eti.br>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v1 1/1] man/man2const/PR_SET_PTRACER.2const: Document
 EINVAL when Yama is not configured
Message-ID: <awi6VZZAlX-lOROa@devuan>
References: <au8GKjxzoGpp4MqU@debian>
 <cover.1795289695.git.cesarb@cesarb.eti.br>
 <cfc899195f8d66e3846133e0488d713d6eaf975c.1795289695.git.cesarb@cesarb.eti.br>
 <awi38FFdYc0xnWEG@devuan>
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
	protocol="application/pgp-signature"; boundary="2qmvewlqllec4j3y"
Content-Disposition: inline
In-Reply-To: <awi38FFdYc0xnWEG@devuan>


--2qmvewlqllec4j3y
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Cesar Eduardo Barros <cesarb@cesarb.eti.br>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v1 1/1] man/man2const/PR_SET_PTRACER.2const: Document
 EINVAL when Yama is not configured
Message-ID: <awi6VZZAlX-lOROa@devuan>
References: <au8GKjxzoGpp4MqU@debian>
 <cover.1795289695.git.cesarb@cesarb.eti.br>
 <cfc899195f8d66e3846133e0488d713d6eaf975c.1795289695.git.cesarb@cesarb.eti.br>
 <awi38FFdYc0xnWEG@devuan>
MIME-Version: 1.0
In-Reply-To: <awi38FFdYc0xnWEG@devuan>

> Date: 2026-11-26 23:52:29+0100
> From: Alejandro Colomar <alx+linux-man@kernel.org>
>
> Hi Cesar,
>=20
> > Date: 2026-11-21 16:48:07-0300
> > From: Cesar Eduardo Barros <cesarb@cesarb.eti.br>
> >
> > The man page for PR_SET_PTRACER mentions three cases in which
> > prctl(PR_SET_PTRACER, ...) can fail with EINVAL, but there's a fourth
> > case: when CONFIG_SECURITY_YAMA=3Dn
> >=20
> > The code which deals with the three currently documented cases is at
> > security/yama/yama_lsm.c which is only compiled when "Yama support" is
> > configured.  When it isn't, it falls through to the default case at
> > kernel/sys.c which returns EINVAL.
> >=20
> > Fixes: 6f86bef66936 (2013-01-11; "prctl.2: Document EINVAL error for PR=
_SET_PTRACER")
> > Signed-off-by: Cesar Eduardo Barros <cesarb@cesarb.eti.br>
>=20
> Thanks for the patch!  I've reworded it to be consistent with similar
> pages, such as unshare(2).  Here's what I applied:
>=20
> 	commit 5a70354bca4d025720565e1e506c8adab62a01bd (HEAD -> contrib)
> 	Author: Cesar Eduardo Barros <cesarb@cesarb.eti.br>
> 	Date:   2026-11-21 16:48:07 -0300
>=20
> 	    man/man2const/PR_SET_PTRACER.2const: Document EINVAL when Yama is no=
t configured
> 	   =20
> 	    The man page for PR_SET_PTRACER mentions three cases in which
> 	    prctl(PR_SET_PTRACER, ...) can fail with EINVAL, but there's a fourth
> 	    case: when 'CONFIG_SECURITY_YAMA=3Dn'.
> 	   =20
> 	    The code which deals with the three currently documented cases is at
> 	    "security/yama/yama_lsm.c" which is only compiled when "Yama support=
" is
> 	    configured.  When it isn't, it falls through to the default case at
> 	    "kernel/sys.c" which returns EINVAL.
> 	   =20
> 	    Fixes: 6f86bef66936 (2013-01-11; "prctl.2: Document EINVAL error for=
 PR_SET_PTRACER")
> 	    Signed-off-by: Cesar Eduardo Barros <cesarb@cesarb.eti.br>
> 	    Message-ID: <cfc899195f8d66e3846133e0488d713d6eaf975c.1795289695.git=
=2Ecesarb@cesarb.eti.br>
> 	    [alx: reword]
> 	    Signed-off-by: Alejandro Colomar <alx@kernel.org>
>=20
> 	diff --git a/man/man2const/PR_SET_PTRACER.2const b/man/man2const/PR_SET_=
PTRACER.2const
> 	index 48bd8f04e104..b07ee5ae4d2d 100644
> 	--- a/man/man2const/PR_SET_PTRACER.2const
> 	+++ b/man/man2const/PR_SET_PTRACER.2const
> 	@@ -57,6 +57,9 @@ .SH ERRORS
> 	 is not 0,
> 	 .BR PR_SET_PTRACER_ANY ,
> 	 nor the PID of an existing process.
> 	+.TP
> 	+.B EINVAL
> 	+Yama support is not built into the running kernel.
> 	 .SH STANDARDS
> 	 Linux.
> 	 .SH HISTORY

Ouch!  I meant to send this:

	commit 0f4df33a87d3b1fbb92d948ca546736eef2dbcb9
	Author: Cesar Eduardo Barros <cesarb@cesarb.eti.br>
	Date:   2026-11-21 16:48:07 -0300

	    man/man2const/PR_SET_PTRACER.2const: Document EINVAL when Yama is not =
configured
	   =20
	    The man page for PR_SET_PTRACER mentions three cases in which
	    prctl(PR_SET_PTRACER, ...) can fail with EINVAL, but there's a fourth
	    case: when 'CONFIG_SECURITY_YAMA=3Dn'.
	   =20
	    The code which deals with the three currently documented cases is at
	    "security/yama/yama_lsm.c" which is only compiled when "Yama support" =
is
	    configured.  When it isn't, it falls through to the default case at
	    "kernel/sys.c" which returns EINVAL.
	   =20
	    Fixes: 6f86bef66936 (2013-01-11; "prctl.2: Document EINVAL error for P=
R_SET_PTRACER")
	    Signed-off-by: Cesar Eduardo Barros <cesarb@cesarb.eti.br>
	    Message-ID: <cfc899195f8d66e3846133e0488d713d6eaf975c.1795289695.git.c=
esarb@cesarb.eti.br>
	    [alx: reword]
	    Signed-off-by: Alejandro Colomar <alx@kernel.org>

	diff --git a/man/man2const/PR_SET_PTRACER.2const b/man/man2const/PR_SET_PT=
RACER.2const
	index 48bd8f04e104..233495249eee 100644
	--- a/man/man2const/PR_SET_PTRACER.2const
	+++ b/man/man2const/PR_SET_PTRACER.2const
	@@ -57,6 +57,11 @@ .SH ERRORS
	 is not 0,
	 .BR PR_SET_PTRACER_ANY ,
	 nor the PID of an existing process.
	+.TP
	+.B EINVAL
	+The kernel was not configured with the
	+.B CONFIG_SECURITY_YAMA
	+option.
	 .SH STANDARDS
	 Linux.
	 .SH HISTORY

Cheers,
Alex

>=20
>=20
> Have a lovely night!
> Alex
>=20
> > ---
> >  man/man2const/PR_SET_PTRACER.2const | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/man/man2const/PR_SET_PTRACER.2const b/man/man2const/PR_SET=
_PTRACER.2const
> > index 48bd8f04e104..b07ee5ae4d2d 100644
> > --- a/man/man2const/PR_SET_PTRACER.2const
> > +++ b/man/man2const/PR_SET_PTRACER.2const
> > @@ -57,6 +57,9 @@ .SH ERRORS
> >  is not 0,
> >  .BR PR_SET_PTRACER_ANY ,
> >  nor the PID of an existing process.
> > +.TP
> > +.B EINVAL
> > +Yama support is not built into the running kernel.
> >  .SH STANDARDS
> >  Linux.
> >  .SH HISTORY
> > --=20
> > 2.56.1
> >=20
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--2qmvewlqllec4j3y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmsIumgACgkQ64mZXMKQ
wqkTeA/9GUw6gvq6tZ7D+gRHxMDFHlmBDrxWtRr4g8OnIgNzY5gblw1w3tRcCJnW
Leq1X5WFGgEgIDjrs1873tsUUudExKABiKQ1Xdj5rP0akYYjuAagbOFDZEBvQEmn
OYWnH7VQkUdWoc187w1/TC6zCdk6cgi3rwGk4gx9fJbhrPo+Qu+xsCLWDuZolxRN
hS8gKPD0kIANmcKkIg95bZ2+MpRkfeyED49qAt18kErWwtOqg9CYwnmGSjRxHS7t
CIAMVUfga1RCxfUMq+oIRmn8SBZUq8mi88G85WTgSy6zl98uHVaiN1RtLaVH9esz
NueWMqFNngs3HL5EBBLl+6a0YO3Fgirw7F2/kXrn1zZC3tOnt2x4Q4HrM9/Jn/o4
1q+wgVwnbZeX52fsZl8/hNTp9wA5VyAel622iPqnzssxyI/4QINSvcWcI75BY3XL
FG7bwdivC0zDjJXIs15QpxUvqtwu/Ej5O/oq2E740Dq37tiqbOs0FWWSSiB2ZF1J
euQfdw7pRUvmvjmIqsyeFYKer4XufbM8p+OPfKSGiF5FZZhNgWBGoiNueb66Nlh4
cj8Gx08FSKChf+J7PFabh9uWGlQHq/QjJbenTgmW/QTdbay+CdPFkZVT6MYuUe9e
xSjGWubWhGSrHFcL/z3GvSwWGqiECxqiyfFtyPWtAeCgz2IZu20=
=jRMB
-----END PGP SIGNATURE-----

--2qmvewlqllec4j3y--
