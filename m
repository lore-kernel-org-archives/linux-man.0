Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19B7469831
	for <linux-man@vger.kernel.org>; Fri,  9 Oct 2026 19:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791574031; cv=none; b=Y9G2XYOongHJqz6EBswjLi9i1qLsYCl0+1VecEUmagI/PoogP1nlGxdXTSrUjrk6pYE6fUHtL1l01oREYETEKVYAbZWWJ0rDf8fvX86msKTxy1JOwPPEIVrN4NJj4nTDOjJALyn2Ov2ZH3rDGpYN23AS9JZCWH3wTVgb2AbXQxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791574031; c=relaxed/simple;
	bh=jNuh7mXP0TAXeQaOVGoGjIQ8CYmjrN3KO1bhwoIFW0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHv/u2JhnCRdC6HZAR07TeCDY4UB+E9vBphzX84+kllbHw3201jiObMzCd7mf4HAJF2NQxsED35A2ITAiM/bSp6SHr7PHJmlM+F71uIeaV7PzTqIn3jzgbBMgGAp5vudcL98aUWb/edTJtKiYB4lr8cSYNr3gc4vBAfGJfwAgsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AnJHeTn3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AnJHeTn3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80EB81F000FF;
	Fri,  9 Oct 2026 19:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791574024;
	bh=1WBPuzBiiSPTykI9UhhDz9dfHheD+4ES079Q5Iv4RpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AnJHeTn3YBePk62nlIs0o7VEHm9o68mPD9nw2Nk7vm0FG6qwIl4hJJd9hYCA12bq2
	 TGlmL9L9sVsU3qx3oPpUzFQS/6qWeWOAQnnm9E6bQyK4U13I5woLWn0KrUHJGBGvwz
	 72DFl9irT6LynTATgO3GyEIJYBtXGwsvMVcPEPoaLn9NpXpZd1i77VtdOZW54LA7Aw
	 5rpjyD3ZYpk+nbVfbBFbxcAaFQ8jqqh2OT33f0To2ty5emWpyiZkHlRXgKS21SHCgW
	 YnNZ6Ve8CE7e7zzS1uxKg4RjYDCHIjjR8d50cr2ZOB/25xhZes7TwNL8jyZrUkm/0m
	 ehATygaf9dpiA==
Date: Fri, 9 Oct 2026 21:27:00 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man2/rename.2: Remove CAP_MKNOD remark about
 whiteout creation
Message-ID: <ask-80Zlt0ygw0pk@debian>
References: <20261009143656.4884-1-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mzdpbg7zwgaahrsp"
Content-Disposition: inline
In-Reply-To: <20261009143656.4884-1-gnoack3000@gmail.com>


--mzdpbg7zwgaahrsp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man2/rename.2: Remove CAP_MKNOD remark about
 whiteout creation
Message-ID: <ask-80Zlt0ygw0pk@debian>
References: <20261009143656.4884-1-gnoack3000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261009143656.4884-1-gnoack3000@gmail.com>

Hi G=C3=BCnther,

> Date: 2026-10-09 16:36:56+0200
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> Whiteout objects do not count as device files and do not require
> CAP_MKNOD since linux.git a3c751a50fe6 (2020-05-14; "vfs: allow
> unprivileged whiteout creation").

Thanks!  I checked the referenced commit, and it seems correct.

Reviewed-by: Alejandro Colomar <alx@kernel.org>

(I'm not taking the patch yet, in case Miklos wants to comment, but
 I will take it eventually.)

> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>

You forgot to CC the list.  :)


Have a lovely night!
Alex


> ---
>  man/man2/rename.2 | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/man/man2/rename.2 b/man/man2/rename.2
> index 14be6b20d3c9..7e5c02797230 100644
> --- a/man/man2/rename.2
> +++ b/man/man2/rename.2
> @@ -250,11 +250,6 @@ is ignored by the kernel's whiteout support code,
>  as of Linux 4.19, at least.)
>  .IP
>  .B RENAME_WHITEOUT
> -requires the same privileges as creating a device node (i.e., the
> -.B CAP_MKNOD
> -capability).
> -.IP
> -.B RENAME_WHITEOUT
>  can't be employed together with
>  .BR RENAME_EXCHANGE .
>  .IP
> --=20
> 2.56.0
>=20

--=20
<https://www.alejandro-colomar.es>

--mzdpbg7zwgaahrsp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrJP/0ACgkQ64mZXMKQ
wqmS/g/8C4TzjrGXAsW2DcGx6H9BjsJHyJQLSXLKd0jRgT6TqpP9JPwxpr7WiVvW
xMgRwRzHzrQRyTajgDYoj+f7sLFHzbe0oPYYxYnP2tvscM4jYF5Yv97fUrGq/eQC
mBgd2xqpwu8WdImAIYc9lx5+bUEBwv2llOdi7drjqPprZpSnSGDwi/4yo06pRLHr
Zhc3kRTrAxKPc4qIUtv1xKG2tvfcgWaFPNwaHk/mkby69Vd6PnvmlcEnjra4HHDN
0yKjZS86Y7pHHcbYsAGE0159/RBpgqdVXwewgocFbknoqqu3lx0xdz8PFU4NUtVY
9Zuv8SDP0YXP1LrT9LFO+ez8f0JK5IqqSI9cu/64QhAP0uqsrk97YPnRjA7xSPLI
bwANmk1Ncv746+ChqL9GddEFnGJV2H1Zf3fPl+hPgV6dsplpGIv8BQtlSMCd6KZO
8DNKRB7ugyfOGnwVXrj1pwV3U+GmPSuENkczc5X5KOvQ8eCLPd9AoB2PakwQFEiO
eY3YneDHBxVdbaohpk8zKsZ88ZjAfsNK7td8HwmDzZuE5A3xAHoZD6d11LvMXgo/
pQU0zayHkfAOPcl3USDfmExrgVPLRke2P2MsS5NfPHT+oRjRJwCMVJKxJeOmtjCU
MXbo1RUICRgBVabhqax0PZq9vLbk2+wkp/mx8GKfABxKsCAfwNQ=
=ZnXX
-----END PGP SIGNATURE-----

--mzdpbg7zwgaahrsp--
