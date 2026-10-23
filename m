Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778296;
	b=Gtf3yLksJ691yMTb/nrbvmKBKbPUzuIsYlNMVLUr6Th83srGftRT/abO50UayKj71x2P
	 IK0J5Yj287FLcQUXEvel880fXvMs/OllN0ZstjNfhKw6NyOeDrNOQqHuDWRU+3nVCYBvp
	 OWDrsdDSGX451MbPnRn8W3LuzV+8z9cCOe9cFp/S2JaYvYYeH3BZlQxna4Avgsjxigk1h
	 triiHv3M4UHMLqLHy6XQsv99E92RLALAy4BZsBxwMhkT1gVU4Tfd1RDACUjDscVf0rMY3
	 /u5TCn44JgYoScAHBgPOgprtN+awCUZWE4N2vKxLJAJXDbsl+u2Fk9yqExTn4OObUng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778296;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=aaRu/xRSEKXEo00KqfWUyR2g6KT0ybLN+e0PUCUN0OQ=;
	b=JaQ7cF60n+/w+kmDdWFzxDC+LW2tCaXzjrnnpL3x3RIlJyj7nIPNoOEUPwFXHGUYiFZ+
	 RCtxKFLtkgm4UYhkIiOfsVeVOQDTnSg5Pw8Erb98gUjxQYVRy0BC4U5S324KkIISeBwe3
	 WjaYtc8hGezXAHnF6+nwLZP6iKLBrl7SKnj7bcw1mealER55emrn+KoIv/uMqoP9uk02l
	 PvLnzFVOoi40Cbs54uh7zsrSCY/ojdo6Vi3iLM4hcVcUbgHfoDfqZMXAxCASMMjyb7rlI
	 VFoWlsF6n188qSIys4u2GspRutFN+tzDF98mqxn31AHrCJM0zetcvDZ5QkZC6nGvYCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="a/pGS3i6";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015D3606A31A
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 17:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a/pGS3i6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C96E1F01825;
	Fri, 23 Oct 2026 17:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792778295;
	bh=aaRu/xRSEKXEo00KqfWUyR2g6KT0ybLN+e0PUCUN0OQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a/pGS3i6JO81P2c1fdsu5w9emhI2A0bbUVx4KiswXBsucbVvDat9Oo1RcmUJQmQx7
	 8A4skQ8pX7kooz8rfV2vw/r9Ayrb/hD4tU14bHfhi7XUl7XazNg9mKz70BgyebSGbl
	 BbWwwkOZWk1UpM1TgBulsG6a+0L2Oo2I3BkOPiT+IyVYodeymgQ7WQt6G7lVtlHxg4
	 x0geIpc57BP5gt4Ecxy2/xksfnix1hF1onX0HXmlZWHziz7Qcy5XACKZryaAdDJvyK
	 R844tXpZyj+eYYx+69nPsHOceaNnHImzdIrmaJP4+nQXs7WhedUn5TCDlZQobicryq
	 VJxNGnZjLKMjg==
Date: Fri, 23 Oct 2026 19:58:09 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Grayson Tinker <graysontinker@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man5/tmpfs.5: Specify that noswap may not be used
 within unprivileged user namespaces
Message-ID: <atugHtuGg_6gLck_@debian>
References: <20261020015112.127389-1-graysontinker@gmail.com>
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
	protocol="application/pgp-signature"; boundary="xicy4aosbyx24ybt"
Content-Disposition: inline
In-Reply-To: <20261020015112.127389-1-graysontinker@gmail.com>


--xicy4aosbyx24ybt
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Grayson Tinker <graysontinker@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man5/tmpfs.5: Specify that noswap may not be used
 within unprivileged user namespaces
Message-ID: <atugHtuGg_6gLck_@debian>
References: <20261020015112.127389-1-graysontinker@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261020015112.127389-1-graysontinker@gmail.com>

Hi Grayson,

> Date: 2026-10-19 19:51:12-0600
> From: Grayson Tinker <graysontinker@gmail.com>
>
> Since the tmpfs noswap option was added, the kernel has disallowed its us=
e while
> within an unprivileged user namespace for security reasons. Document this=
 restriction
> so users do not believe noswap to be available in every situation.
>=20
> ref. linux.git 01106e140835ff94fdef79d66f166b87b0c89824 ("shmem: restrict=
 noswap option to initial user namespace")
>=20
> Signed-off-by: Grayson Tinker <graysontinker@gmail.com>

Thanks!  I've applied the patch.


Have a lovely night!
Alex

> ---
>  man/man5/tmpfs.5 | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/man/man5/tmpfs.5 b/man/man5/tmpfs.5
> index 10acbdcfa..a904db2c8 100644
> --- a/man/man5/tmpfs.5
> +++ b/man/man5/tmpfs.5
> @@ -109,6 +109,10 @@ but not a % suffix.
>  Disables swap.
>  Remounts must respect the original settings.
>  By default swap is enabled.
> +.IP
> +.\" commit 01106e140835ff94fdef79d66f166b87b0c89824
> +.B noswap
> +is not available while within an unprivileged user namespace.
>  .TP
>  .BR mode =3D\f[I]mode\f[]
>  Set initial permissions of the root directory.
>=20
> Range-diff:
> -:  --------- > 1:  b3b2becca man/man5/tmpfs.5: Specify that noswap may n=
ot be used within unprivileged user namespaces
> --=20
> 2.55.0
>=20

--=20
<https://www.alejandro-colomar.es>

--xicy4aosbyx24ybt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrboDEACgkQ64mZXMKQ
wqmoFw/7BwznVvdNti1gKVIuk0KHF9p79qiOc6ys5vZy+JfdtmAeMVWTaamMR2Z9
nFaGDwFJbM7Buykhn/QUwAdt623MABrW61/D8VkWf1knZ8HgwhYUirGuLhDt/BRX
s7+T7IG966EpdIvpg4+ZmiqgVfpPm2dCa5S+bsBu8fzze8Zw+dS7jTZuwLQAOwIW
+9E36DeQvgP2c93CwJ8yIe6CwLTI2NprliVrfAWfqSyQEM3xruDgjTwdCPaydxeD
jsSZKtEsldGZthZozwOzNNf4GuUVj9vyjdYywjnpWnFHrrp/lj8QzIA+7QjTWOMA
JGI9jbdJlbWVe78HIPgrrjnzISIJcb1Pqh5hLCsic4Bmca7/cJOsAwDKsRCs0o/W
Ht4Tz6wgbTslLQbanJZD+FSgrvQb5OS8AgcSrPmEDnEfOWMBREY2h7Q0qeaFRTlF
VbZQIg3WssfWwjc9BdFQ6i7SCbzFQZU3kjDzVi/JaGCLZPVNeR+5ID7Y5RSIjEX1
TBXJA5sy7Ozbo5NP5C4uqoDzbMR6aaE9nCTW9mIRt2eXHshWtf7ElGlAW3HVSRjT
1zf67j82i9gK6hTfYTjPzYqifq/nzkQ2rSmcrPMP2eTnSFP8lXRqTRTijW9kWeK9
CseK0+3ABEzn8wNskZQsDGnPG6sF/or8PUBjlLxvUetEMsOT9rk=
=fM67
-----END PGP SIGNATURE-----

--xicy4aosbyx24ybt--
