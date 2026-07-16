Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F4E30FF20
	for <linux-man@vger.kernel.org>; Thu, 16 Jul 2026 16:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218558; cv=none; b=laUxCAdeQkrV7dU02Sh2fXP8Q6l5fegtIzgk5XoZbTXDi/ObYaXpzmbkB05tya612mOl19WcoJ+P3G3oj+3p3RpLGSt8amZtnCa6i4w66Z89qBCdxYQuPij442uNWmDB09hrprIjFTREj9PQdMLCfUizzgED7uZUUzaZ1xojhJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218558; c=relaxed/simple;
	bh=/PPvjKW36rYv+L2UIlg3/9ERfjuYZYZXdHEATaJXjmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FyGKoIXDUjCwC5J1iYhDKIVYhgr4HlnOkwia5GOEkQVKt/vMAGpuWXHDAl2Yzf2lx+bvhBycYG8aTIx8dU0H7K/siN00GPGyfwqr4SzDCd9QkCJDPSFF+1xvtdT+gAkteMC4hxQw6pFhx6b4YE9tI/1Cm1ADJ49zYKa0xVX5nbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+TwPSp7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+TwPSp7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685211F000E9;
	Thu, 16 Jul 2026 16:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784218553;
	bh=NKZT68r4hDR3jZNecq/GRtP52ifn9TsMc+2cDfD4KCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H+TwPSp7lLsI4eHs+ZIRmfu/EWDyjX6mnaYgHodxkl16t7N2wHrUN3nFzote2XEbh
	 NMNkWxQH1jEJuniCXdz+GlIHWX8VLQ6eIvWDg0YAq9DQhx4Y1VDe/7jJFgb7W8Ek2R
	 C/AGTWTB89GrFbRJSX5lAGYBR5P3oAFt9ovvJtsvOHBAs2RgQ398PepWL5H9kLY0Fb
	 zGa/sxgluj0Y3RUkv1bypcJniwhFZuqYT5t7bllnOm6IC+aVDQUzsW+O/xQXoz3nly
	 7IfgLdrOJHAv8Vb+pylU5Mkd5vZycHsSr++f/nJ2nPLkdod6MlCN4K2DGXg5g4FQQ5
	 fb8F4t0J+jhyQ==
Date: Thu, 16 Jul 2026 18:15:48 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: DJ Delorie <dj@redhat.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 1/4] man/man5/ld.so.conf.5: document include syntax
Message-ID: <alkDoostgPo7Hls1@devuan>
References: <cover.1784084289.git.dj@redhat.com>
 <ad382eef274a64bfa0724a31f09846948a84142b.1784084289.git.dj@redhat.com>
 <aljDaT3eIOC8KxD6@devuan>
 <20260716150149.7pw3jeux3nztfxfc@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ctz2hultupimtuip"
Content-Disposition: inline
In-Reply-To: <20260716150149.7pw3jeux3nztfxfc@illithid>


--ctz2hultupimtuip
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: DJ Delorie <dj@redhat.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 1/4] man/man5/ld.so.conf.5: document include syntax
Message-ID: <alkDoostgPo7Hls1@devuan>
References: <cover.1784084289.git.dj@redhat.com>
 <ad382eef274a64bfa0724a31f09846948a84142b.1784084289.git.dj@redhat.com>
 <aljDaT3eIOC8KxD6@devuan>
 <20260716150149.7pw3jeux3nztfxfc@illithid>
MIME-Version: 1.0
In-Reply-To: <20260716150149.7pw3jeux3nztfxfc@illithid>

On 2026-07-16T10:01:49-0500, G. Branden Robinson wrote:
> Hi Alex,
>=20
> At 2026-07-16T13:51:01+0200, Alejandro Colomar wrote:
> > > +is parsed by
> > > +.B \%ldconfig
> >=20
> > 	.B \%ldconfig (8)
>=20
> 	.BR \%ldconfig (8)
>=20
> ;-)

Oops!  yup.  :-)

>=20
> Regards,
> Branden



--=20
<https://www.alejandro-colomar.es>

--ctz2hultupimtuip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpZA64ACgkQ64mZXMKQ
wqnZhQ/+MuDD05aTnGB7yzEbfAInvTMt/y6iw+d8YdMeHcF/TLW5pqpgDqQPrzdD
gGIK9LzYVIPeBdS5+XTb6q65E6RioZdDBwuFr4gupSvxB90wJJ3vnFDG/Lw/Pedj
wigHgDEWm9B9xo2JpLrZ0BUoLnzkN7rbgEMRpgBu0Ag+B0mKAzJUVZ3KY8Q2+sF7
DlzxfzPHb9B4hOCklp13L+E7jN+Qd9rD64botBFPBGTS7cyB0RXmiYzzkjMdaCPG
Uo9NI3PD1/o90qllbgXrmf6QKbCbhGW0oaH6unB8/sKYgguImDH9TgnokYWVfqUr
a/F8QTSl3yjEZ2cerzTxHrkS6eTr7v9TtW8SGl/1LMaGYNzUNAtABI8coeKQdE3E
LDykCNKY4/tc/DG2P/kyD3917s3AUp8npdKr/S1HlCEd7qu7nB56ggQ7GdngVf9j
MVp3C2IfIeWI0BMl+TtjeHZz1IzJtPFtxUHEjV1gPAVi7Zwlnz1/q8mJGU6rG5dM
xjxcp0cY4XswRC6xPw4Ae5qyNN7i4cQCPiQfhurlze4Dr+BPecH8Tj4eTUl7iQTA
Z8nZha/mk0HmW3ju0Y3fqfMNxzm24JofxLiMj3OgAfO0/uuBHYTe1ucLlCINAXuV
mWj0+D7nIi+rJWSIGxDl6j5EHqVkAC6FwTPyXdabJqVr9C9ojRw=
=HOpg
-----END PGP SIGNATURE-----

--ctz2hultupimtuip--
