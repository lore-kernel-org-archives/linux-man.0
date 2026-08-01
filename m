Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E007B345ED1
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 01:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785547001; cv=none; b=pA3vhu1NxQdeF/ydta/v6VEj6VtzRjZ2ouffVZyLDnfnDjW3JzEqDTC21yW6fe9+c7lzTxcsW1usd/2efqVSAiS3TClzD/MmtWYsHTey0H43/w/cShrGCawwLQfTGYoFaYbx433CX5IwXbfDyjGIgPDtCuGxlstCgDyy0IFwUO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785547001; c=relaxed/simple;
	bh=pckWky3fE0roPXuBTVxjvd1pIemiNvtM8awrE4nhiys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DeZH9WepnvZH6UvS6dyYS4rECpXPtG1nylJoPUjggNp1GPGAUKCH3jYkim1Ga8AhtOUSZwojtW3pVbUW/RNA1zNJ6KW/3ujD1Ae0il+UtHQDMKq2bGLVkn56wD9fBHNiX8FvDdr9H5w1u234SEOrrFlr1tuu0BiFgoBqhbq1Nws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTJ/XGcE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTJ/XGcE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07401F00AC4;
	Sat,  1 Aug 2026 01:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785547000;
	bh=qMJofAV6DHVmNo8g9Yr5zd4F+bMuvEnb9rVZEcc5/T4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZTJ/XGcEq5WAXGTTgZ9BDbul06ERuqXhenukBi2WtMIbB93/50wEdgtdG4uVuaZUH
	 2CALdMVX1PLVoIOoyZGWSOAuWvv4nLUit1e/X/a+UFmURHdUq6JbHgvcEtWJpG0aBv
	 lrsug7QHDlXCO7cCT43UHKK+HCB0bEf6CJADxW6pajvybuN0PnfqKrCOkM2hJWzUzF
	 /eo1/NJUhCbEExH9Ph1UKnc47/wVI1D01wnYlGMiiaa672gDP3r7+vjsUpYtd4JPRZ
	 x8/PLwIKZtwXeYpGwZ7/qG8b/cUc0UMIr9C7+/pgWMGH51Jc15ZjvcgcrbcAL2HhwE
	 v4WHZruwBbX9w==
Date: Sat, 1 Aug 2026 03:16:37 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v3 4/4] man/man8/ldconfig.8: Add tunables options
Message-ID: <am1I1p9pIUe_19gt@devuan>
References: <cover.1785522144.git.dj@redhat.com>
 <ae9c2cc67047902f68f64d05ca454da0e6d008b3.1785522144.git.dj@redhat.com>
 <4e0cadac19fdaa29081a226cbd6f98a0b5b6a02b.1785522144.git.dj@redhat.com>
 <bcaddcd0fb8f60276973ae28f091c158332e20c6.1785522144.git.dj@redhat.com>
 <d85795998b72ab686a683f13d08f24d98d8c1a51.1785522144.git.dj@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="txrisakxjiqrtt2f"
Content-Disposition: inline
In-Reply-To: <d85795998b72ab686a683f13d08f24d98d8c1a51.1785522144.git.dj@redhat.com>


--txrisakxjiqrtt2f
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v3 4/4] man/man8/ldconfig.8: Add tunables options
Message-ID: <am1I1p9pIUe_19gt@devuan>
References: <cover.1785522144.git.dj@redhat.com>
 <ae9c2cc67047902f68f64d05ca454da0e6d008b3.1785522144.git.dj@redhat.com>
 <4e0cadac19fdaa29081a226cbd6f98a0b5b6a02b.1785522144.git.dj@redhat.com>
 <bcaddcd0fb8f60276973ae28f091c158332e20c6.1785522144.git.dj@redhat.com>
 <d85795998b72ab686a683f13d08f24d98d8c1a51.1785522144.git.dj@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d85795998b72ab686a683f13d08f24d98d8c1a51.1785522144.git.dj@redhat.com>

Hi DJ,

> Date: 2026-07-31 14:22:24-0400
> From: DJ Delorie <dj@redhat.com>
>
> ---

Thanks!  I've applied the patch, with a minor amendment:

	diff --git i/man/man8/ldconfig.8 w/man/man8/ldconfig.8
	index e575fdec65a2..c2347049b800 100644
	--- i/man/man8/ldconfig.8
	+++ w/man/man8/ldconfig.8
	@@ -92,8 +92,9 @@ .SH DESCRIPTION
	 .I /etc/tunables.conf
	 exists,
	 it contains tunables to be applied to all processes.
	-These tunables are stored
	-in the cache and applied to every process at its startup.
	+These tunables
	+are stored in the cache
	+and applied to every process at its startup.
	 .SH OPTIONS
	 .TP
	 .BI \-\-format=3D fmt


Cheers,
Alex

>  man/man8/ldconfig.8 | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>=20
> diff --git a/man/man8/ldconfig.8 b/man/man8/ldconfig.8
> index cb7d62ccc..e575fdec6 100644
> --- a/man/man8/ldconfig.8
> +++ b/man/man8/ldconfig.8
> @@ -17,6 +17,8 @@ .SH SYNOPSIS
>  .IR conf ]
>  .RB [ \-r\~\c
>  .IR root ]
> +.RB [ \-t\~\c
> +.IR tunconf ]
>  .IR directory \~.\|.\|.
>  .YS
>  .SY /sbin/ldconfig
> @@ -85,6 +87,13 @@ .SH DESCRIPTION
>  .P
>  Failure to follow this pattern may result in compatibility issues
>  after an upgrade.
> +.P
> +If the file
> +.I /etc/tunables.conf
> +exists,
> +it contains tunables to be applied to all processes.
> +These tunables are stored
> +in the cache and applied to every process at its startup.
>  .SH OPTIONS
>  .TP
>  .BI \-\-format=3D fmt
> @@ -157,6 +166,12 @@ .SH OPTIONS
>  .I root
>  as the root directory.
>  .TP
> +.BI \-t\~ tunconf
> +Use
> +.I tunconf
> +instead of
> +.IR /etc/tunables.conf .
> +.TP
>  .B \-\-verbose
>  .TQ
>  .B \-v
> @@ -188,11 +203,17 @@ .SH FILES
>  See
>  .BR ld.so.conf (5).
>  .TP
> +.I /etc/tunables.conf
> +See
> +.BR tunables.conf (5).
> +.TP
>  .I /etc/ld.so.cache
>  contains an ordered list of libraries found in the directories
>  specified in
>  .IR /etc/ld.so.conf ,
> -as well as those found in the trusted directories.
> +as well as those found in the trusted directories,
> +and any tunables listed in
> +.IR /etc/tunables.conf .
>  .PD
>  .SH SEE ALSO
>  .BR ldd (1),
> --=20
> 2.47.3
>=20

--=20
<https://www.alejandro-colomar.es>

--txrisakxjiqrtt2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmptSPUACgkQ64mZXMKQ
wqnBkQ/+NU2f6gcPZkJZRF/2wg4TM4Ie+yDwXWifsWW8g9z9VlrjnRu6VpPSb3d1
JDT1OYYnjO+41gQNxef6Zz3jvbpR1sboL8pWUQGmwOvE5esEjyAQ7bllcD+rG1g8
ZR0LAURaL+yxCe93J2uKtw6n5GWAUGyy5R0h7Gs95y1bGmI4RiU6azsnPAM33m8V
7e+qsRuwA53D26WsYAUFUrVmToDOU7DYjUQ8R+BbjEqAkrDsBP5b+xWXNJt9PBGD
Lmff8XW5MWIWyFWF7gUttBhOVbPij1ELP8RK8Py5bVVWmg5FE0pmEmas8bttKdSY
k9T/anlXIoJK3q2nVebv4X0S3a2JOuwNzuP5tXSwXHlbCVs7BgCc5+91ACxOCk+S
sKMC2YXyLSnFv78K4A4PbQvf7lOheICrhxbYMOsmHMoytNcqavIg/T+Fc9beZtYQ
L8MDpkYbOUKs9tNlH+y2or4eeu/owv685MenXrC/KkmcZZy7Rak6MJUPTa8JnSVz
uDpvtgCYj53nO49C+usxd8kQTTCGFIQcGLf5e4FXwwnJ6mbU0DQHPjqvjeS9pR0j
w+KBC1YitjjxWPiaRm6DfOckRbnyaHaNXb5R3BbY+LgrdoVVjP5YPlyIJpl7SURv
pA7piVctujse6PQtJ9VTZFQmHcHiV5hA0XxbmbJZEH2cZWua64Y=
=UtFM
-----END PGP SIGNATURE-----

--txrisakxjiqrtt2f--
