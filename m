Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792917002;
	b=ruub3PzAr8ZYCg9ALqYae5w980U3kHrqgTmVhXvcOrR/oVid/800LCzzMkl8vRp6xSoh
	 pOak4mXGo3nAU88hmthQTfRL7BJsYE+CmGOOS5pHlYTr3N9RN3bQIhyJzJ3F6nvHAX3H7
	 Jr4tw89HbY+3GJM+kugrYnxsSY/MiogaFEdfuQPAypk2QsF18yFJ5sfwF9e7KM2R0A/nC
	 L+rZ//GMJ/RZi+Kb1MbeJbFHgtW3DYTlECs+HFPfqw7HYy1j8SIX3wpsphh5ADpjXOlgB
	 yDo0+p+DNWpR0ie9Bs1E2mNInaeIFWcDcApHat9jxyRsrWkP4GxlPj8/ct34Nh1BWgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792917002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Zb4zcOZCTvIzYl4FQiBIcaQVspUZs52zP3u+ctPq5sQ=;
	b=FF32afjRMMhhZXiXIcCW2NMSbcriYjGzjNZiBSholGdle85rLlsJeZsDzg1DftZpIo52
	 kB4g7CKEMlcOpQ8uY5qpzUbAA1ah/XaKprSJilLKDswQea18I2G6JGi99EWJcZuAPyAWI
	 BLaIcz+PSj9rryR0rTrsXvt/6/WHvsuPumrcppEoWB8eXJJIY6O4vLJMyXP58KJlYvPOS
	 f9f5wZYYkhqTHDbJRo4zvv7wTep73s1aSOmMFlih434QjdkeGidVUWOLgBkJPzVeRhPzF
	 BWKMYRtOSOKiYQortHLB00jdvj5g9yHFdyHhniXWlFsD/JYZ0qqNEmxxI6Jk13QkAXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lf3QEWVV;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B56606A325
	for <linux-man@vger.kernel.org>; Sun, 25 Oct 2026 08:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5B56606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lf3QEWVV
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8a83d2706fdso16972757b3.0
        for <linux-man@vger.kernel.org>; Sun, 25 Oct 2026 01:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792917001; x=1793521801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zb4zcOZCTvIzYl4FQiBIcaQVspUZs52zP3u+ctPq5sQ=;
        b=Lf3QEWVVJvKr+t4lo2E0HFbzPaxSy9gIARGDnr2Kbhfsq4T1kTMk4UgJ/rrxEamo8e
         fs1Vcj1DnA2GLIUU5f+Akehsy5VZKqJd+O7MUdfuqH/zkDQkQoVGfguIz/zyEb9Zzug6
         cCYzEmWEbpVEoo0s75RTGptYgygmvBQGjhAdf/Ik8pmh2/kHpnmV5u8xrBz5Bwbviixx
         21jZHpv1VC0t4cLaACRBNRFxikBaDag999D1FMbuZDGY9vSTjy1LP4BR3dkU+EfUF6RV
         UHtvrS0nsuvJ65FMavKtD+iF21DOqXCbuxNL0cW2W8L9vYrOTZVyJvA5iDfnRktHZcxl
         9FFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792917001; x=1793521801;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zb4zcOZCTvIzYl4FQiBIcaQVspUZs52zP3u+ctPq5sQ=;
        b=fGZcZClDUA+jYVxx4JKWRCoT9AAjZl1uvHeRoUM9hzq49yxZ2BgugHuNX0WlpnFW4h
         YYLdHVO8M0e+OCv/3vx84A5+5fKJGcWecs3ts3uIskIFqMxixschoVtT2DL8UmhAgJTQ
         OTvIL1emT1S8uAWaWBdOnJa1b6eBKrVU+aR4KXy6vqvH6xNuPqQCzJxQF+xfF2fhQYym
         tHsGWRPgUAj5rOviTRLA6Bhq5tnLgaxgFpcdoBVD7JdClBAsPoP+DUradvQeX/+wSBM6
         PGsnZAqX5E+VWRlerAxjOjSNv8UG3F1sqkR7vxCHn3MNz43uevkrqtBgTY+KAL2TBVpy
         IE1A==
X-Forwarded-Encrypted: i=1; AKwUvBwcHUMwQH79f6PtkYFa+V7zRp9pwXBS9HczpOoWMWChdEGQj862b5fjHQR4CAgOFFGqE+iAD2q9AWQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+HVttzaWaN3FVwaawK2SCWZzv42128KnufZPZQhKvqO+G9MI7
	edV++7xQ55a2tF4Jy2olsQwxO14iubGWEahDpCNHAvNnARrv0nwPvXr1
X-Gm-Gg: AYBFou1QxlzrLOuCs1lbIX44IEvSL05mMrqsvfAiCzN6JwQY4GHS/mkYmWfT0AypbtY
	o2a1FlyMqMmZbWpkaFmtHY0ZVtNUcHOgFrbY1GUbIiLp7nXyuARTajWP2S7JEUTTtBOnXytwKeN
	WFGJgSdUngZZw/ALrCHWa90weODKmMYtkFl0sfh4Oh3Opp4+nPIukGfnUJgiR+n7G31IsFxSZUj
	EGnhr/zGNiOFKpAoS+YexMS5LpARO1hSu5KAzpyDHIxrebGC2ZRGI1xdgysMQG/Lma0xBW7IBX8
	wKZ4rcNQZ0XvY9wO5G4KYLN0dItq+J6q/E2jW+HiIkU9DlaXCl6lcRVqVxpP6FeUwSatxQTUKLc
	tGLzNKjR50fZ+eOKdcZcetjKhgf8hHCqNckpA5pxWpN/GFXQxi6Ao+f26l4LBlMdxpWgsD3niYX
	jiYvXq1OL6MZW20J1d4vjfwjWQtXyVrujL2wltiJNJPycxJ34rD678HOcBvILxXsTWiv2ENhDGQ
	mMr2mAW19uVWKN9ImwfU2REEp3gVfzXM8H+IA2OoYlC
X-Received: by 2002:a05:690c:c50d:b0:87e:2404:45fc with SMTP id 00721157ae682-8b166c1311cmr22513117b3.53.1792917000756;
        Sun, 25 Oct 2026 01:30:00 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166eb16d0sm17518767b3.39.2026.10.25.01.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 01:29:59 -0700 (PDT)
Date: Sun, 25 Oct 2026 03:29:57 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Martin Uecker <uecker@tugraz.at>,
	Christopher Bazley <chris.bazley.wg14@gmail.com>,
	"Michael Kerrisk (man7.org)" <mtk@man7.org>,
	linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>,
	Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>,
	"Joseph S. Myers" <josmyers@redhat.com>, corbet@lwn.net
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <20261025082957.axwjg4bfxy5zdg5z@illithid>
References: <CAFs=pgZZeOg7vmkyTjwZdnafYFxn+Yogd9usEzX9Bmv87Z-P4A@mail.gmail.com>
 <CAEHU8x-Zs8E=e5qoJYRB2ecunpcZWoazsj9Pnxq5bn6bS4ndMQ@mail.gmail.com>
 <CAFs=pga6UWmH6FJZcf0wRi2S3PdbrJWNFeVbkQVVmncB3Ni=-g@mail.gmail.com>
 <atyxz7Uj4rue8HjP@debian>
 <CAEHU8x9P3PLFAMpJ7wfYapvJkEt4b09KR9sypjUuONRniAQT3w@mail.gmail.com>
 <atzcMTC3Hl4GPD39@debian>
 <fbd4d03cbaf3e0b3a978ca3ff3902103ed954a87.camel@tugraz.at>
 <at2l_NpU28j3n6L0@debian>
 <dd9ca27e6b4c227c08cd707aab9b0b5d495c203c.camel@tugraz.at>
 <at2vv1isjbPZ6-34@debian>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kayrjg7zynaithwq"
Content-Disposition: inline
In-Reply-To: <at2vv1isjbPZ6-34@debian>


--kayrjg7zynaithwq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
MIME-Version: 1.0

At 2026-10-25T08:38:55+0100, Alejandro Colomar wrote:
> > Date: 2026-10-25 08:22:23+0100
> > From: Martin Uecker <uecker@tugraz.at>
> > I would assume it came from cray and they had real world
> > use case for this at that time.
>=20
> What is 'cray'?

Seymour Cray, founder of Cray Research, commonly known as "the father of
supercomputing".

The Wikipedia articles on him and/or the company will get you up to
speed.

Like John Nash, he might have lived longer but for careless drivers.

Regards,
Branden

--kayrjg7zynaithwq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmrdveoACgkQ0Z6cfXEm
bc7j6A//Yg3enjNfnpeItVsRX8I7u9OqllP5MeZwWls//ZWKOBg5zabwMrEHKF1Z
fCiaFImtInam0flVL9Bq/M84WuHdMptaI4d2qG+bUAY/IIIoxK+V6mL4LvvYko00
ZFl8cpz2Gs8VyZNBf8WOJkF1BpqGOxl7AHdeuNlTjRC83LyM6yeg9mJiKL1jKX55
V4+A+n2oOUlpSbwI0/vigvhWKOl/bEdMrIOSDrpXOX9VNnnUVWyjIhvq711FA+uH
Se4/WnD10PRv4aG8pVy72Ugfxhb0r0K+9f2m3A+2uM68qBmEoSokAgl+MWCPUCbw
gn7NUg3gA2mWA0cRZY8mUebPsZirRnl8m/JOEyaDrtRFpuzEntqyB8zKEELSKGrd
3DIoIPGwvMfxRlPzgt61tr16m5PZgkY5o+7VdjvKw5JIt3gTeNpVWzE2LT9kuyIx
GvsjXfWHtPbn431BaVmjsaKBuOrnQwyroX9TUxALm88eCWwPuStHUg2bD7cBxZX1
klpHMikIkcw9qF4Xbz2cNmQM/gObyGTcLO/ulZ7UK3R2ChDrWsrx7sARX0O86xeX
HU8iO8QIwyxh3pAFmpbGpdmHKt++ukVzBbLaXGctJTR7pTuGlib7Iwu8cieKlJdA
59eiqsqcyc2F36UI4Sry/9dxpw4tb3hJ+GE/JU2LgdO+uKwtJm0=
=q/vF
-----END PGP SIGNATURE-----

--kayrjg7zynaithwq--
