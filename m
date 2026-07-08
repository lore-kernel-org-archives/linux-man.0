Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CED943934A
	for <linux-man@vger.kernel.org>; Wed,  8 Jul 2026 15:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523358; cv=none; b=Gck2asML9ssiVl1c8iTF1yELRdJsfHYj+ywRAXlse8hEQpA+XEjQRlfCOgjZ+zWFaz9aMWNT3Q+waiRogf8k/TM/FeO/m38FYyV1ombFs3Lhy5GV9AtlreWI9VoS/rMYpUOOxlpYgBxv5LwoFqWoqz5Ltfo4n3g+WPdRXNQWORo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523358; c=relaxed/simple;
	bh=xyH5adqvhjHbkDRJc9F70vlYU/EdP+MzEkP2IGVnTGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YySqocEFWEuoJU5wwnaNh5dMSYlPkyYJ2H2zUQlU7Ak4akcvsPzNpJTdF+SR02ar0pOGuF+2qLuNLPhaIuOrzJShSDfqrHfeO2ul0tHqqAo5TBP47zpAX6abLXuxuEk/vVnl04tehWUyWEx+D8DNJc5BiND19mm2d+qmt82b49A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTU8Il+6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTU8Il+6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA5C1F00A3D;
	Wed,  8 Jul 2026 15:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783523356;
	bh=caeWG+sw+zKNv1u4qXs2c29Gmrr2UDAZcZp1IeD0peE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bTU8Il+6AKTm2Zm6dUFC9wt/tABDTpmNSTaUC1OhBxlmHVc5Rx4D25FuXhTS62Dfg
	 n2ufyBFHN5bul969USew/ptr3OQPhqwHYkygf6jpLXBxR92I9Ubfz2kumSWs71vrOv
	 aSYx1eDPDTR9l3G5BRIEGTDfDiohNkR5tRA21FFRLKwC0YTt9zuMiDThb2IStz2gmz
	 ckIdUEVbcGD+F2mwVAC6lvPpYn5iHB6XLppe4+6xjZTe+JdE6gnBWVG1vp0NxdR4ef
	 2PBHzZtbcARmKdekeTgxHal6+SWbQm+m/SCPCbPaRak20oen/bppqfjPW/WL1B6ELn
	 Z6bgTENYgkPuQ==
Date: Wed, 8 Jul 2026 17:09:13 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Alejandro Colomar <alx@kernel.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Mark Harris <mark.hsj@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: [PATCH v2 2/4] man/man3/strpbrk.3: BUGS: Clarify the NAME
Message-ID: <a7508ac0f477f102582f2ac20b3c30ab25c1f7f7.1783523064.git.alx@kernel.org>
X-Mailer: git-send-email 2.53.0
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1783523064.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hbcy2ap7oswhdbfz"
Content-Disposition: inline
In-Reply-To: <cover.1783523064.git.alx@kernel.org>


--hbcy2ap7oswhdbfz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Alejandro Colomar <alx@kernel.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Mark Harris <mark.hsj@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: [PATCH v2 2/4] man/man3/strpbrk.3: BUGS: Clarify the NAME
Message-ID: <a7508ac0f477f102582f2ac20b3c30ab25c1f7f7.1783523064.git.alx@kernel.org>
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1783523064.git.alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1783523064.git.alx@kernel.org>

Cc: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Mark Harris <mark.hsj@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Signed-off-by: Alejandro Colomar <alx@kernel.org>
---
 man/man3/strfry.3  | 2 +-
 man/man3/strpbrk.3 | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/man/man3/strfry.3 b/man/man3/strfry.3
index 54ea313ea262..a65603af918a 100644
--- a/man/man3/strfry.3
+++ b/man/man3/strfry.3
@@ -6,7 +6,7 @@
 .\"
 .TH strfry 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strfry \- string fry
+strfry \- string fry (obfuscate)
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strpbrk.3 b/man/man3/strpbrk.3
index 6e5b79a48bbe..ee7a84f1a944 100644
--- a/man/man3/strpbrk.3
+++ b/man/man3/strpbrk.3
@@ -51,6 +51,10 @@ .SH STANDARDS
 C11, POSIX.1-2008.
 .SH HISTORY
 POSIX.1-2001, C89, SVr4, 4.3BSD.
+.SH BUGS
+The name of this function is bad.
+It should have been named strchrs().
+The NAME section above reflects this.
 .SH SEE ALSO
 .BR memchr (3),
 .BR strchr (3),
--=20
2.53.0


--hbcy2ap7oswhdbfz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpOaBkACgkQ64mZXMKQ
wqk7WA//UzfT6ThC5mIXZN5PhUk1AAi7rRBlCgNXnt6YoMwLNRGTzGvVRIIK0Do6
n3j3SUDL1lxPCfvecRoLWoa6ud8TaxGeDV4s3z82dzXXRn62Qf3x5lpeiwFjvXTP
CdAhWRl3oMsRzc5fNUnhkcqRA41onSi+yrK/Nt0eJzgEqQpVln0+0UvYJSShMMrN
Kjui4Zj4Tv7oI+guMczMMcuT5vmnuImAEoKZiAUv9JB1Afxmw/KISFtbCLSsdMO3
OFv9+9CpCO+j7paTN6FkI0J0zDEhUoTMc01igTdYkEhXFbtHESlgPUXfMEJymmFd
h6LXIAZ4TAJ+7fe2cJE+2Llfl3IMKkXY0OIFp+sJ0KS5icAgZ3mvPDxQBPUmOx40
RMetq/E/D69EGEyJwnpAAvIUAEJt1MedVgsbb187su+jd+Cb7SPdcO1w33QCXthU
Tq0tXnjXhgvZEuVq3NZq71BI4tllCnVdIle2Xd3RwEZS6YCxIgaEIzYKLOzh2q24
UQrPkLuN92LviejTzWi7THULL5e8atkguAkYsumK5vAy08uEMXBwgudXI7jxUD/g
/BiDfNSVN/0QKM3Jp4IrFF92txNxeo+jWU3W3uBhdWHg7TWCsvEEZDHgesU4OILx
SuOA5hOl9S8DqyElAK/rkCuEGtRhHonbWUayUT9Q2BcVvPww2x8=
=7YmR
-----END PGP SIGNATURE-----

--hbcy2ap7oswhdbfz--
