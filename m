Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CEF207A20
	for <linux-man@vger.kernel.org>; Sat, 18 Jul 2026 12:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784376534; cv=none; b=uC50hKovIcgCfeMo0NBAiONheJ88IXQum+ppU2tHQpwnVDL9faUqpC6mRsq6y3YDyzyaLsVJLT6NoA2dFiRlgE6J3XKaU7JQ1IQwq11xppDIpqO7M37IhDDGOOkKb5N9oU5ISlPNxw9/sIUpAv3WBPS9WkqXDczd+fXVWzV6AFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784376534; c=relaxed/simple;
	bh=HpnrPDJzb6/rGiJBY9RQMIdEhTzuvJBIGbCh4BZCqeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EC8wt+v5FcbwHtHQrzMEK2dd2G5OizQ/t53JjxcRVkfjJaizAJaFFX0WR2x/cJ2HDYLZyOol2jFHgonkLrSvBlXCAYisbxuAvtyUQK1DeeUeOAsZzxLVX4EzVSA343V/RsLE+t4amjE6hfANX4d6SS150mR2QhaqFpelgVzuz5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gv/rWvA6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gv/rWvA6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9431F000E9;
	Sat, 18 Jul 2026 12:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784376533;
	bh=bNoFC+w9ov+zNH7/+jg1kc9rlmuMIdRSPKSSVJS9Mno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gv/rWvA6A8Aald3ckTXMBeKIvKv/glt30SZW0Vvad9G++9s3t2CcZA1MvluLpGoNG
	 zCOfVlEAhUz2cpRSj/T4bxlTEm5b6xnRyDiMZChw67ehhK5pRRJrE4qu9JUUy7h2Ln
	 nsEVVzmfjmv5tF0EF5R4z6qQ1juNVnoj1ktoTMiKQlBZ2EiKYl4T+ExZm1V+wQw20a
	 FnGmnJ+BNNb7dTyd4SQi1I1B9f1O/6zBRHpApNslkuNKFG1jTSOiY8jkxW9j4a8oW4
	 I58JEaXQbAq9NXa+Ze/pAmj4yPnZCzCkF6y0kY66ExWsTJliZNSKZNqFH4rF/W77ca
	 IP8yiHyKjJoAA==
Date: Sat, 18 Jul 2026 14:08:50 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?B?xaB0xJtww6FuIE7Em21lYw==?= <stepnem@smrk.net>
Cc: linux-man@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH] man/man2/memfd_secret.2: tfix
Message-ID: <altstsU94cjelV5C@devuan>
References: <20260709153422.210312-1-stepnem@smrk.net>
 <alEfVXgJBmtlCtH0@devuan>
 <20260713121111.372487-1-stepnem@smrk.net>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="55p2o2kzxygnveq4"
Content-Disposition: inline
In-Reply-To: <20260713121111.372487-1-stepnem@smrk.net>


--55p2o2kzxygnveq4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?B?xaB0xJtww6FuIE7Em21lYw==?= <stepnem@smrk.net>
Cc: linux-man@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH] man/man2/memfd_secret.2: tfix
Message-ID: <altstsU94cjelV5C@devuan>
References: <20260709153422.210312-1-stepnem@smrk.net>
 <alEfVXgJBmtlCtH0@devuan>
 <20260713121111.372487-1-stepnem@smrk.net>
MIME-Version: 1.0
In-Reply-To: <20260713121111.372487-1-stepnem@smrk.net>

Hi =C5=A0t=C4=9Bp=C3=A1n,

On 2026-07-13T14:11:11+0200, =C5=A0t=C4=9Bp=C3=A1n N=C4=9Bmec wrote:
> Fixes: ac5edfeb1dd6 (2021-08-27; "memfd_secret.2: New page describing mem=
fd_secret() system call")
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> Signed-off-by: =C5=A0t=C4=9Bp=C3=A1n N=C4=9Bmec <stepnem@smrk.net>
> ---
> On Fri, 10 Jul 2026 18:44:19 +0200
> Alejandro Colomar wrote:
>=20
> > I think I'd fix this typo in a separate commit, since it's a meaningful
> > typo (both EMFILE and ENFILE exist, and they have a slightly different
> > meaning).
> >
> > In the fix, please include the following tags:
> >
> > 	Fixes: ac5edfeb1dd6 (2021-08-27; "memfd_secret.2: New page describing =
memfd_secret() system call")
> > 	Cc: Mike Rapoport <rppt@linux.ibm.com>
>=20
> Fair enough.
>=20
> FWIW, out of abundance of caution (admittedly verging on paranoia), I
> did verify that unprivileged memfd_secret distinguished EMFILE and
> ENFILE as expected (brought about by setrlimit for the former and
> limiting fs.file-max for the latter in a VM running a recent alpine-edge
> image) before sending the original patch, but the hypothesis that this
> was anything other than a typo or a copy-paste error seemed too
> far-fetched to mention that.

Thanks!  I've applied the patch.


Have a lovely day!
Alex

>=20
>  man/man2/memfd_secret.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man/man2/memfd_secret.2 b/man/man2/memfd_secret.2
> index 0ea4b8e93c37..4033adc75772 100644
> --- a/man/man2/memfd_secret.2
> +++ b/man/man2/memfd_secret.2
> @@ -119,7 +119,7 @@ .SH ERRORS
>  .B EMFILE
>  The per-process limit on the number of open file descriptors has been re=
ached.
>  .TP
> -.B EMFILE
> +.B ENFILE
>  The system-wide limit on the total number of open files has been reached.
>  .TP
>  .B ENOMEM
>=20
> --=20
> 2.55.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--55p2o2kzxygnveq4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpbbNEACgkQ64mZXMKQ
wqmlJA//ddU9G2q6F71RpsqonnROvaTnqXkW3VIrT8C8AcPlFVpCnRWg3iNL5NjV
YxrAu9komQ/7+YFhz6TZC4cD0ydfEJb1SduS2Rq/jYL2lfdkcWu01SLV0lUWKazw
g72kB3saintRPH1gAa2gPO8TT9eDHy/VoSHsG+HSd12mtcQgFEhZItsxo8q/HEri
L+SjlP9lAJzPVW33BcJ6jg65awyDg2Hk/RdUlWxgIg81Rm+55PvEcFpiGfnUpqGh
6wD1aPN+dYg4+w3mKKN6KfkOJrMw1ZNzBFUw1IVbjmQTbQwTkePxw6bY+hkXwWGR
VSgUd6cL2XLATQJWJ4GtRZxyU8rYJtajRJqRgBnqQ444lVy+XjqamnLC7Vs7/PHZ
ukANL70Obr+VSxLqY/DSBOUNL8TCWDMO6e3nuRmJUgYn28utf0eE18lWsbRcEwew
0bIz+Veeab1gptpqYZitvUkXOA1SBLP1ltTfd52QLCK4arLgzNU1eTqglf3UX6I1
pyArDCqzpkSh7gg4ePhsmoQ1z+18lk/nMJQHqPdwPwHtuOH9P6obkDaTawItbtfL
SQEOw+GzfznP8SK0MIfgb1Bn5a3goO/ccIgjlWwI3NHaUAl0ZTn3F/jHyEzU/d8A
aMzaDHiJckNMvNeBBSgES3OAu3Wa34wqQdLjoXu/o877wkSa+Vo=
=ApXo
-----END PGP SIGNATURE-----

--55p2o2kzxygnveq4--
