Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DE1217F33
	for <linux-man@vger.kernel.org>; Thu, 16 Jul 2026 11:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784202665; cv=none; b=nxjokfCOp93n7DVXr6s7AJydi5oeykP/DyB3NDZEDqNXuZulkwXG3bzb9tEQVr4UnBeiy2VrXQ+c94VySFBzuTCG87wLYm+dJuWtoK4csBd2vnGUDSm9mzXfPYIp8OrjYzxKZa4l5ShZy6bsmk82O0DzO0P6pEtGiVvUG8O28Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784202665; c=relaxed/simple;
	bh=g3bL7xAJhmry45qnBfjUfk8FYimwD4ycC7ibKDZjE6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lhp5dbKLsww6ymFP+3lMAYLj91amEcEqaMpGlzkA7XfZzeBI0TKULAWfCcn02LvRf99Z2GJiym9cQ03sVn0loabh3jZQSZ+3Fpw5aaj4rKU04Rv6byjlbxd2nKqdTIrmJVc+A90hZz4kq4rlRwRyRYqnTtCPtRxiZAAdZIRxNuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNeDGmkQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNeDGmkQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A85B1F000E9;
	Thu, 16 Jul 2026 11:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784202664;
	bh=/2uIcBbkkfGNRjTrwiNa/jXMj4i7Gfl3SBDCpWNPHNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HNeDGmkQ/xWVslmN5ISfnA4aFFTKvJQL2kUPQ/AfIMbhA/CZ5f6qOuq0VAeG8qTpu
	 WLij2d+DcX7ZQkp+gTrXt4cd3ahHPMG4zxmBSuLdh6vybImHWIiHD9hrqLrtfrghJf
	 XDVfqwCCA+soj+3jgaiDlYCu1aKKB0wrxwTz930w7HvNkT5PcOgAFiCIosF3GtFAWg
	 DZW+nJ77vTNowTR79lxqkXMkRnIDE7G21JobRXibHcax+y+yuoX1yDIypdUFBbFEgG
	 6XToTZQ8MVd6uw/g21GV57wxrKj1nlNzrZ4LqP+n4ix8y98nBthwbtKP5T9uycIkEB
	 t78VLV2DTTXJQ==
Date: Thu, 16 Jul 2026 13:51:01 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v2 1/4] man/man5/ld.so.conf.5: document include syntax
Message-ID: <aljDaT3eIOC8KxD6@devuan>
References: <cover.1784084289.git.dj@redhat.com>
 <ad382eef274a64bfa0724a31f09846948a84142b.1784084289.git.dj@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mk2snahd5gf4zcdd"
Content-Disposition: inline
In-Reply-To: <ad382eef274a64bfa0724a31f09846948a84142b.1784084289.git.dj@redhat.com>


--mk2snahd5gf4zcdd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v2 1/4] man/man5/ld.so.conf.5: document include syntax
Message-ID: <aljDaT3eIOC8KxD6@devuan>
References: <cover.1784084289.git.dj@redhat.com>
 <ad382eef274a64bfa0724a31f09846948a84142b.1784084289.git.dj@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ad382eef274a64bfa0724a31f09846948a84142b.1784084289.git.dj@redhat.com>

Hi DJ,

> In-Reply-To: <ad382eef274a64bfa0724a31f09846948a84142b.1784084289.git.dj@=
redhat.com>

I suggest using the following git-config(1) configuration for
git-format-patch(1), so that patches are in reply to the cover letter,
instead of in reply to the preceding patch.

	[format]
		thread =3D true

Alternatively, --thread=3Dshallow in the command line will have the same
effects.


On 2026-07-14T22:58:09-0400, DJ Delorie wrote:
> ---
>  man/man5/ld.so.conf.5 | 28 ++++++++++++++++++++++++++++
>  man/man8/ldconfig.8   |  2 --
>  2 files changed, 28 insertions(+), 2 deletions(-)
>=20
> diff --git a/man/man5/ld.so.conf.5 b/man/man5/ld.so.conf.5
> index 481cf9152..25f9adf90 100644
> --- a/man/man5/ld.so.conf.5
> +++ b/man/man5/ld.so.conf.5
> @@ -9,6 +9,34 @@ .SH DESCRIPTION
>  This file contains a list of directories,
>  one per line,
>  in which to search for libraries.
> +.P
> +The file
> +(and any other files included by it)

Since the contents are specified as being processed as if being included
in the main configuration file, this is already implied.  I'd remove the
parenthetical.

> +is parsed by
> +.B \%ldconfig

	.B \%ldconfig (8)

> +and the results stored in
> +.IR /etc/ld.so.cache .
> +.P
> +The syntax allows lines to start with the word

s/word/keyword/

> +.I include
> +followed by a path wildcard,

	followed by a
	.BR glob (7)
	pattern,

> +and will include any files matching that wildcard.

I'd remove this line entirely.  It's redundant with the text below.

> +The wildcard is a path specification in the
> +.BR \%glob (7)
> +format.

Also remove this sentence.  By saying 'a glob(7) pattern' above, this is
already specified.

> +Files matching that wildcard will be processed

s/wildcard/pattern/

> +as if their contents were included in the main config file.

I have concerns about talking about the *main* file.  I'd say they are
processed as if their contents were included at the point of the include
directive.  (I suspect nested includes are allowed, right?)

> +.P
> +Example config file:
> +.IP
> +.in +4n
> +.EX
> +/lib
> +/usr/lib
> +/usr/local/lib
> +include /etc/ld.so.conf.d/*.conf
> +.EE
> +.in

This should be moved to EXAMPLES, right after FILES.

	.SH EXAMPLES
	Example config file:
	.P
	.in +4n
	.EX
	/lib
	/usr/lib
	/usr/local/lib
	include /etc/ld.so.conf.d/*.conf
	.EE
	.in


Have a lovely day!
Alex

>  .SH FILES
>  .I /etc/ld.so.conf
>  .SH SEE ALSO
> diff --git a/man/man8/ldconfig.8 b/man/man8/ldconfig.8
> index 9ac146b44..cb7d62ccc 100644
> --- a/man/man8/ldconfig.8
> +++ b/man/man8/ldconfig.8
> @@ -178,8 +178,6 @@ .SH OPTIONS
>  is also specified,
>  the cache is still rebuilt.
>  .SH FILES
> -.\" FIXME Since glibc-2.3.4, "include" directives are supported in ld.so=
=2Econf
> -.\"
>  .\" FIXME Since glibc-2.4, "hwcap" directives are supported in ld.so.conf
>  .PD 0
>  .TP
> --=20
> 2.47.3
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--mk2snahd5gf4zcdd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpYxZ8ACgkQ64mZXMKQ
wql8sA/+NrQ2kM2BV/FhOa/NrD/0vw5WHpRQ96GUz3s4MEtUB6q3g/f5SVX1t4Om
2eBJifBQxdiiyxjM+8T9BBmx78OjNe/9vJEg6n1dw3WhOffKXfR4PE4djDGGVK6q
oIgforNOOQa3KQIWgtjTUChXuFrvpBfWhzfEZHL+MR0obe80zxrXRGoF5ZB/wYpQ
IkWxeMP9SLuzLYdpnebCNvWFVQFirfEUNB/JWGNRkJIaMiesoJknipaZIH+NmBPR
J0gFqzBFAgVymtHwOmwu5ahcEhq5ESwwSk9lJ237l+zZjt2ezk/jtfp2bBZEbAV3
VrPBDlaThyL9mNgRWUI/Klb/n3kF1Gh0a98WgztyGqduKcMwGn2uhfOs3GrjwQoa
3s3HTEK12qqXMj4oukky1zLiVcX+WEPzfFuhnPq/ctTOrbp4zKPZiSK5aaFxpN7N
UDoRd9Tox4lddNc+eJL58ImaAVU8hlFqSz5pd6B6g+t9wh+k081tLb58ifzvao64
Amow5yODLuIBAR3kpLIwwgM2+0yyODMisDYhqqlsUJI2/q9oPuAP2gYF0uKYuN13
WXTdz41eUMKqEUKwbqdF0Gc9obsfytazaD4bjzh/co7anu50n8cYFH8Oyd3JiUCu
UKkh7KtxzWo7nqbE56FvFmxwuhVmMHKsjQYu6rVX4HZG24H8q/s=
=F1Tk
-----END PGP SIGNATURE-----

--mk2snahd5gf4zcdd--
