Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7932981ACD
	for <linux-man@vger.kernel.org>; Thu, 16 Jul 2026 15:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784214116; cv=none; b=uccKhy2OGafxMiEOYxPoZcc0dY58G+/HUYy0GG+5e8MGLrIZkvV1Z71bMb/N4m2Redm/b1INSLtUnn72DiungjxokccoNpF377WT9kBHW4mw+uiVEOWp3ZugcXlqOmEG0Uzj82DOdiWUhLP1uD2fTUaBEikS+YaeQd7M6FaVE2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784214116; c=relaxed/simple;
	bh=UyYhk2FXNPBkr/xZaO0SI3vzUC0FjkdaPXFKxC+Q6EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJwlyCEO1OazvcDKWzBkHwYUJUW/XOHsjGu9KrdLJF3a6BPty21+53EaN3qdxKE8R9knQDfvyxnJqL3HKY6fhcBastu2VqKTiA2zaO4gUQvhKhLZoxsD+28/SgX9d9N8RT+dh4uJvPVj+gbA6qpJd0MgXsUut/hBhULxPSklznQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTTEzziv; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTTEzziv"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6611669cd16so3537852d50.0
        for <linux-man@vger.kernel.org>; Thu, 16 Jul 2026 08:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784214114; x=1784818914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=86tYMspT+pIRI44XuQ6TpJULQCml51JXKW3utqQ2qug=;
        b=mTTEzzivcUto79U3e101GY3lRNpYxU4FaSdIjEGlHj1PJffsqg4ZAk7VAqpjIIQQeb
         Ps7bF1s925vfesMm/hKuN5DTQXEjbozLCoPkbbph2lPlq8nItbW76fsTrEtbqeteoO1a
         FWpunGert8ofLQEkhnU6w+diTGkGM1/WEILmVq7dgcicSQLUZV7DPB6DNqFPGj8vb6yO
         nM+A3Dy9or22HA+niU+26/erxtgNhxO7ALeQ55hGQYTxZVbHsbrwdFULp+k/sg/8d76i
         xLRtVZl8elbdsOJlO1oVxvUGAfTFavVDqVpZxoEURfHuMklkXcyXkIXG3VpmH/2Yp/j4
         Ka3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784214114; x=1784818914;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=86tYMspT+pIRI44XuQ6TpJULQCml51JXKW3utqQ2qug=;
        b=B4iIfx6G54L4jp6i62ECEyHNIlV0ofR1585yCLVVzWNULSysQnWZnAX/79LHIxX6LN
         PkAlXR/bQW06B0FymvDNaPDv9mqFA1aDSHAxF9lt58snGDHkq1WA2t23Bnrc6R8QbS+/
         UR0VKQeeSRGVnpGC3xGDjPpwIUig9X/yw0uixRjozvf8wRFyp2mOxpIS3GRlNkGfTXU0
         fbMgOHIiP63h9/3YXQ/QO/uFXWtYzxTI3DO00CBbYBAaly9noCXwQJQXmH2FKPpqmbDv
         Li3AfE+gIw9DKdOUydtaGOMUf7ATN2Abhuq1NUkF8QsDudaVakxGWTkG16PqAVcmhGnp
         GRnQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1qiX+iGRe8+w+FmbvNqF6ggMg4n7PrTxJIHo8B8CPZIfjPyyNtFoqCXF7MT1Rn/DO9xfJQuF0a/g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg5ZhujdmimGTUEGJb4U9kLW1pUha9PD+yXomvsx0eFfUhAVPE
	8moZtsp2DO0JoAbRVCYaSAY7c52wRNrCyU7rj7xzkojlztkIdsKBxTyF2KcoQA==
X-Gm-Gg: AfdE7cmQ6BK5expo2vvROtD8dKuqN6KZ3rR2h9ySb1bVh+jct2aTrNoTv7oL7O1ZqrE
	4XDINJ4OcIuhiBkfnpNI9ZRzmeC92J3BcN771ByPhUsNWhOhtppYh/VoWFBfQ3d8OoWYEkk+/q6
	2x6Vqz402oyWZVyAoNPRz/8OqReAO+ndyMt3rNqbAGqorhTXgjZp7ncg+DBDLBAgeVH3slv/a08
	si8pRVIzLmiAIDKBedL9+5ICec8fKRaV/7c0fiCmt93zA7Urn8Dl5zJHE13xU6r4mcu3Arf2Wff
	bZKb0FO8t+PjSXPedzxRpJBS/qw+5Q+Tgaq6R10vqZAuFnVPPalAuCZnMwbkSWmUVhM0T504Qfy
	nTe2B1S6GPkLTNpASxbWkF21F2RQjvzz3v1OFjyJY/5QxlnSA7ShEGazgmH8NQGNbC4A=
X-Received: by 2002:a53:a089:0:b0:667:c9d0:e95c with SMTP id 956f58d0204a3-667d7c56652mr11799226d50.84.1784214114147;
        Thu, 16 Jul 2026 08:01:54 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6681fde51c9sm3576224d50.11.2026.07.16.08.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 08:01:52 -0700 (PDT)
Date: Thu, 16 Jul 2026 10:01:49 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: DJ Delorie <dj@redhat.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 1/4] man/man5/ld.so.conf.5: document include syntax
Message-ID: <20260716150149.7pw3jeux3nztfxfc@illithid>
References: <cover.1784084289.git.dj@redhat.com>
 <ad382eef274a64bfa0724a31f09846948a84142b.1784084289.git.dj@redhat.com>
 <aljDaT3eIOC8KxD6@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dpbdnmcjec24gmq4"
Content-Disposition: inline
In-Reply-To: <aljDaT3eIOC8KxD6@devuan>


--dpbdnmcjec24gmq4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/4] man/man5/ld.so.conf.5: document include syntax
MIME-Version: 1.0

Hi Alex,

At 2026-07-16T13:51:01+0200, Alejandro Colomar wrote:
> > +is parsed by
> > +.B \%ldconfig
>=20
> 	.B \%ldconfig (8)

	.BR \%ldconfig (8)

;-)

Regards,
Branden

--dpbdnmcjec24gmq4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmpY8lQACgkQ0Z6cfXEm
bc6Urg//TWHdOCeB7gtcUg0pSoyISvQ/jF8I6isjBTgYNrRziKCUh9tsZUGcBv1c
Nwg2NbgH8tN2tT+XaN8bUn7DcK3Z10cYZgviyZmOVRf5/NbLofgAGvlxApZWlGzZ
QvBUJ3KSO7Soj7jJKdCVCkcDNGL4g8OMCfMp+dH1KnN763VCO9ExAtZQ2fotcDlj
bOVwFEccGJb8CbtrKi4U6nJLQCulK9Zt9QkWYrmW7CtDXRdFYGzoQrfIVrPiDOi9
Bd22oj5uMVFN9t1VX2yfw+OMyW2sbpye6hT0OwthAo16642JviH6xx7ePmEaxmMM
32jPtohzGgkB5gtTj/1UMCYVVYio6TZd+SvDyhfCoE4trapEW/eS5ksTfYjDoGKp
arloSQnuQB9VpKQ7n8954rLlSTdYxxTKXzxcKUzsDItwBShZ0T0ab7Z+KjQKQpm7
vBis27eVT3Kv4ukeUlDEYWKcH/m62fcH0k8cDq7aRSXrhg9JOkW6Vvx/wNb+PsCM
JzNMM3dBWU/J7u2WGGFsnVHE06z6Kbzng+2IiruQPFu3rWb44gSCrPW09yQTPXkN
PS27f6946DdXzDn60AE+Q2m0EbVBBA3rYiBycA01FACvPRWCHDXNm0mYNqn4gh7y
s8cB3uCDunWfdn1hlDFVos4N5bhMFlm3YdCiTV+u5GcEsiaMui4=
=0K0k
-----END PGP SIGNATURE-----

--dpbdnmcjec24gmq4--
