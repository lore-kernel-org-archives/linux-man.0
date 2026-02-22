Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47B179CD
	for <linux-man@vger.kernel.org>; Sun, 22 Feb 2026 21:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771795699; cv=none; b=u5tDCk6pI57F7oVDbr7puxwVb8uUshzgdiopDedJrJOK4RXOGyodH9vGC5xnSrg7gOpvJ0ZbaCW4zKZk5SG4JpgFPu4b+f6j0I86JeEVg9MbMIYXYXZuQ9w5uddzCgtgdhAhG/WyY6Jq5F6NBm9do4ejSQyY+hFHAAy6wXAZOBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771795699; c=relaxed/simple;
	bh=nxpvK8XkiJ+MwT8VstwFAbWzUtuZnbLhzmaeJrnqMe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UssXvUKmYfu3vPjHlCCe2ubp29kaj6QcDbNhWwYNPx+V1QsRXu/77MzG0ikX2jQq4vGJXt226gYsbvtV39ubJZOLSoY1itAupy8AXRK7WmdLs+6Tf2uF1RnYqwLoxnB1w/biVr56Tf/h53MRI8TAbhld0eAcBIAK3hG7R1FKUP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T2xI+ycB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T2xI+ycB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C59C116D0;
	Sun, 22 Feb 2026 21:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771795699;
	bh=nxpvK8XkiJ+MwT8VstwFAbWzUtuZnbLhzmaeJrnqMe4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T2xI+ycBMbVKTn3eUAnZuIwI5jvC+Izirk6UxhXbmoq08dncBxI1Vj2AAJAHz5sx1
	 7hcrOYZ6GoAM+p0RKhryX4/nPk9xVm/Rr+4PWXBmvBcow/dRs04wmSvJc4egZ7JGRW
	 9aLhmairMznhGrmeJtsrQhLY/a738zM1lSWv0utP2YzEFfh2ozgmdOqUMVCo2nTmRm
	 Yr/TW2SVthtAQy1Ps6eukf+Da7beACn2iI2aAmHrlPlu9qxdPz1EqjltArPbgjqtuh
	 /qpJ7lXNt56hMwk+VwoA6DWleT7npV8Kyp6Zm8uNhNX2i6Yl2FXaUc+AJ2FYRqpPJH
	 uMoIeAnhM+1Ow==
Date: Sun, 22 Feb 2026 22:28:16 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Seth McDonald <dev@sethm.id.au>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 4/5] man/man2/readv.2: HISTORY: ffix
Message-ID: <aZt0yjophKW3Jltt@devuan>
References: <cover.1771750388.git.dev@sethm.id.au>
 <f336517a9084b23f49da379a4d2a73f7a86c2e32.1771750388.git.dev@sethm.id.au>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rdwm7zl2fsc2mrys"
Content-Disposition: inline
In-Reply-To: <f336517a9084b23f49da379a4d2a73f7a86c2e32.1771750388.git.dev@sethm.id.au>


--rdwm7zl2fsc2mrys
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Seth McDonald <dev@sethm.id.au>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 4/5] man/man2/readv.2: HISTORY: ffix
Message-ID: <aZt0yjophKW3Jltt@devuan>
References: <cover.1771750388.git.dev@sethm.id.au>
 <f336517a9084b23f49da379a4d2a73f7a86c2e32.1771750388.git.dev@sethm.id.au>
MIME-Version: 1.0
In-Reply-To: <f336517a9084b23f49da379a4d2a73f7a86c2e32.1771750388.git.dev@sethm.id.au>

On 2026-02-22T20:12:14+1000, Seth McDonald wrote:
> Signed-off-by: Seth McDonald <dev@sethm.id.au>
> ---
>  man/man2/readv.2 | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/man/man2/readv.2 b/man/man2/readv.2
> index 765d487b9ff1..51549cf8214a 100644
> --- a/man/man2/readv.2
> +++ b/man/man2/readv.2
> @@ -462,13 +462,17 @@ .SH HISTORY
>  .\" The readv/writev system calls were buggy before Linux 1.3.40.
>  .\" (Says release.libc.)
>  .P
> -.BR preadv (),
> -.BR pwritev ():
> +.TP
> +.BR preadv ()
> +.TQ
> +.BR pwritev ()
>  Linux 2.6.30,
>  glibc 2.10.
>  .P
> -.BR preadv2 (),
> -.BR pwritev2 ():
> +.TP
> +.BR preadv2 ()
> +.TQ
> +.BR pwritev2 ()
>  Linux 4.6,
>  glibc 2.26.
>  .SS Historical C library/kernel differences

This patch had issues:

	remote: mandoc: .tmp/man/man2/readv.2:464:2: WARNING: skipping paragraph m=
acro: PP empty
	remote: mandoc: .tmp/man/man2/readv.2:471:2: WARNING: skipping paragraph m=
acro: PP empty
	remote: make: *** [/home/alx/src/linux/man-pages/man-pages/contrib/share/m=
k/lint/man/mandoc.mk:31: .tmp/man/man2/readv.2.lint-man.mandoc.touch] Error=
 1

So I amended it:

	diff --git i/man/man2/readv.2 w/man/man2/readv.2
	index 51549cf8214a..cbfc1e0ffa83 100644
	--- i/man/man2/readv.2
	+++ w/man/man2/readv.2
	@@ -461,14 +461,12 @@ .SH HISTORY
	 .\" as the return type.
	 .\" The readv/writev system calls were buggy before Linux 1.3.40.
	 .\" (Says release.libc.)
	-.P
	 .TP
	 .BR preadv ()
	 .TQ
	 .BR pwritev ()
	 Linux 2.6.30,
	 glibc 2.10.
	-.P
	 .TP
	 .BR preadv2 ()
	 .TQ

> --=20
> 2.53.0.1



--=20
<https://www.alejandro-colomar.es>

--rdwm7zl2fsc2mrys
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmmbdPAACgkQ64mZXMKQ
wqlOLg//R71NeUYxmAlNc6kZLZO5m/AlcrjagVnXLOPM7BC8whsZnxhMKZayJ1vE
ROKQ24wXZ5VmNqoCkulIxxeTH0opG1x1pOr9kwcSdSPt10R0mBrfBnjq7dvXAHTY
shNWidLX6D2VEI11z6kwLxeJ2JlxVDZtMhDj8GOeZQ8Ept60wIl2LHKID490y1JA
qhSXaxg7wxgqFcnLcz2cmGme4onBR28nZDVuoeUtQ2ttjXfW85mcqlcKCcLftCJm
tO2M1eq+wju2AvG3UN2KOTVTfSRK37NssPlvkKlS3f4eul4C8Y91omsKSkOc1awt
HUO99weWTQJb+PDFSxktotzszfuoF15JqSyX2Orzw/aol4theQ/L+hi49NppS5Dd
EF3g2U8AQrM8cuRv1pSwIoC2L42Eyl3J7bpg3Btqx1fL1R/zMbINmA5FUCMG7Wkb
eWgiiuOQw3yxzIFlUVT+JKhx6BF7WVmV+vUpi7pnWO8sJBoC0dy7RXKzIllt+ehA
6KyF5kV/bb7oomliZex11TdwQlBdqk2hiIpmYjm06A3eTN20o7D4QfoJF11PUY+p
hyGPkklA5tmuXr2HNhZv6Lbv9Abg8FWK9yjyYrFD3Mh46VWo7bd32olrkYaizLtl
IkSZk9f5dzsLZBpqdU8EZK3FgAmqXZp2L+0PGu75BZJygh3zktI=
=TGBc
-----END PGP SIGNATURE-----

--rdwm7zl2fsc2mrys--
