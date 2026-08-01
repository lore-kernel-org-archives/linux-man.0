Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1202C2360
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 20:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785615535; cv=none; b=OLrg6UqTs4iV3I9wH6hA9dXjbDf3ppakf21AqTsxHnybYcyyjcvkiNHsda9LedffYnQHW1wBHAT3CcalaqhvyS14I6EldmXl5xguH7zJhLGdzxh/x51YuR4I2zRtJwDQ/VsyulNdDQA/snSvPMLjEllNyZUaqDvnJoYZWsXTo4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785615535; c=relaxed/simple;
	bh=Fk6eJfaDhra/V4AyF/3n4qY4Xgwma12xCohIH9R4t8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHc+iwhsoHnTMxcEzOwkZD+2qCxwnRTQOA1Xt8a0Zs+U76G/nc3ZkyHphGTc+/jn7SF17zovajYDZ5ydu4T2UFjTK6oFzjBm3f+UASQdiRCK9RSz/Srn+d1+fQ2sG2ca8IgsGNmmB+/2kZqX9QV24NI3+WNzcXmRKtOxGkYVal0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOmXov2R; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOmXov2R"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-80cebd41372so32083487b3.3
        for <linux-man@vger.kernel.org>; Sat, 01 Aug 2026 13:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785615533; x=1786220333; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zpkrnfIKZMc96hn8EyFkmvd1iYA/fc/GAiutoCpF5FM=;
        b=KOmXov2Rt6zicgK9fue8lvad/BzfpgWtaHtiafq6mXSYtlyifyAdCb1Dkin/6juzJ0
         0GbmMTt1bdiQJsSUkQCMMFxV+yzUN2kxWj5uqpgd0KtKWULfY8+uI5SbQ94VODa1r6+X
         wDAmUXRSoF342Ed0iksG6ldFLR6Imx0oG/FeSq/hGEd/nN8P0JNQseThXHX6YjHINgEF
         TV5pcFfqM3uDqtF9emTGV0X+NcTD/NaYKqQi/pyBUUc4IbuplZNNe3BGOhxJGFBOuoYD
         v87I5uo7olf772/fCWsUMwINsiR9ZHlDevDXFljkD+db053K8Y/EofDifjXDfjOs0uXx
         2rew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785615533; x=1786220333;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zpkrnfIKZMc96hn8EyFkmvd1iYA/fc/GAiutoCpF5FM=;
        b=Lxar6cvEQV2HCoNqilIH6obzBeEzsm6vhTAi4d8sqwl2gQLDwL+YwGhUWL1onAp0nt
         4ut5sdx8P8MBjbCBXt9Bz3l6mSs4ukwIMdv08OEomCdwy8urgBFbk5cKhPSEf9Mqv0k+
         aP/Q6Xo4krw81SchUeltVTcc9xVgP64AkmKflJoITQ6b6P413LoCnQZprOS225xC86Fl
         JX2gRnqVNgaGC49vaVql6qV2UbqF00mCuwWQgpT+bGnN8pD1vRu0AH+k3JKWsqautyLU
         N8CDbYdLFUUi9AwqMNc/MNVnSGFUMquEqRgCfpeOR4xJdiTEfD4nO5fWUISohGq7h363
         /eew==
X-Forwarded-Encrypted: i=1; AHgh+RqPVEDRxmygvulLI8p+FfnCIvPSn7hG0XFQeMs9oPyUu0ZlYzhAlhN7O8y3LZtZoISHZeUxvQCiN3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqPmJPpELqSXAzIENh/IcnQdXNLlSNxds4EeHYyHdVZgCcWp1z
	of+nz/nxRYHLkXj8ollKj9/wRkXjd1rJi0PEIgUePfQ7+i3/piYbaueR
X-Gm-Gg: AR+sD10VYdnCUWJPvkP93XvlMqL7egi05GMEhZZkDz4uiKUUpcagbQ2M4571fhqmhi3
	ioUoaISRnvOuAXbfyY4lUAeIt+HmEszenlCzClFtXjrha9/R2MujXXO+pW93Aw7MA/LqmpiLJ4q
	8rG0p42oWmFevXQftUG5hXK5zudmkWMvwuFvNT1kR9I87S66Wmn4dw6tNUdod/sX1xeHf868dVG
	elQY1yrhZQrYNhfhs8Lg9ercEGcto7p3l7sEWBnLoyaFZ+VDlmrVa04GEA0nAzycd7fLriP29Wo
	GChFS8aF+reNvCQXuyBV/55B7KO39a0QuZTjB9zPUgKMUl+VSFJzywaw8rXQTyLbgEySHL3pdlt
	sR1sEsojYJI1gQ6yiPg//BRpZo1RwmJ3iXW4oZpK/WIHpewpvX1+BCmEQjAEOl1oSRF9RYor4AW
	RG6KNNmQwwnG4gL4ZHYde+lVqEPBm56f3F6oXZEWHuXMvU5HxvmTxGlO6v8tz+aA==
X-Received: by 2002:a05:690c:4b0f:b0:80c:16ad:2f10 with SMTP id 00721157ae682-81fd4c7ddb6mr67019247b3.33.1785615532608;
        Sat, 01 Aug 2026 13:18:52 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd1240d6sm28627627b3.40.2026.08.01.13.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 13:18:51 -0700 (PDT)
Date: Sat, 1 Aug 2026 15:18:49 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Sam James <sam@gentoo.org>
Cc: Alejandro Colomar <alx@kernel.org>, Joseph Myers <josmyers@redhat.com>,
	linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>,
	Mark Harris <mark.hsj@gmail.com>,
	Nevin Liber <nevin@cplusplusguy.com>,
	JeanHeyd Meneide <phdofthehouse@gmail.com>,
	Christopher Bazley <chris.bazley.wg14@gmail.com>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Iker Pedrosa <ipedrosa@redhat.com>,
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>,
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org,
	libc-alpha@sourceware.org,
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <20260801201849.hzg6ufqxmwi2efzz@illithid>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cwsoivffveyepjnz"
Content-Disposition: inline
In-Reply-To: <87y0epdhxp.fsf@gentoo.org>


--cwsoivffveyepjnz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: on the irresponsibility of pursuing C language reform
MIME-Version: 1.0

Hi Sam & Alex,

Just a quick note on conflicts on interest since I'm the one who dragged
that label into the conversation--though the concept was implicitly
present already.

At 2026-08-01T15:38:42+0100, Sam James wrote:
> Alejandro Colomar <alx@kernel.org> writes:
> > FWIW, regarding the possible conflict of interest that was mentioned
> > yesterday, I'll say that I don't get paid for my contributions to
> > ISO C as a member of WG14.  There's no benefit to me other than
> > public recognition.  I'll also disclose the exact quantity that I've
> > been paid for maintaining the Linux man-pages project:
>=20
> You can have a conflict of interest in responsibliity without money
> being involved. In fact, I have never believed you were influenced by
> money,

Sam makes a good point, and Alex, I think you overlooked one.

Disclosure of the quantity of your compensation as Linux man-pages
maintainer is of less importance than _who_ sponsored your work.

When we're speaking of currency, yes, quantity eventually has a quality
all its own.  But knowing who's been signing the checks is almost always
the more valuable information because it tells us who is in a position
to expect favorable treatment.  Sometimes that's because the parties
negotiate a quid pro quo, but more often sponsors can count on
"self-regulation" by their beneficiaries.  Money men understand that
people's minds and uncritical loyalties can often be bought cheaply.

Free your mind and something else will follow, I think someone said.

Here's a backgrounder that's less antiseptic than a corporate ethics
slide deck training module on conflicts of interest.

https://www.propublica.org/article/clarence-thomas-money-complaints-sparked=
-resignation-fears-scotus

Regards,
Branden

--cwsoivffveyepjnz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmpuVKEACgkQ0Z6cfXEm
bc4nmw//cNfWFD1AQhuts9bYkz5o4Oem5vvqEY+Ms+yj7CmUOa/+kR9kb7j03EF8
jRiW7mFXnEl+/Z/TJFzKaYdURi3xbTAGLRQG1Bc1jnx4IiLvnJ43oLwnW9rKqhdV
QHgYOALEMb6vWiPN0kq9Jcy4UEiAkuSkIpDVPjeW0UNIuleZPlb/J8hhD39PCp+Z
92csg6SI/0iv6wjOq0eBsbh6fuuIOaclfKbtX/BN18UirHaM8p8RgGT9thwLF72W
XXqo7NISKArDt5ZqL98O579uaEk7F6eimFLiGEasxuvFKLSw20R/PR03d+vDKgQI
Gz8eh7xwQB7gIThDU2IuvnKWK2+TXqRB6Y8zewMVG9i4BBKIwUv61CRhtwit729r
5/+1jo3Z4cmTMH/Q+R45HSQ4PAhq8uDxRTxdUPZPG09/V7W0CZHbQf1w8imc905t
Y1xHGJXQmlMPyU8y6RVROJ+ViOSaynX2NXFKDsu9GQCgnS9B+2j469Ml9OOUoHrC
9wUbmfqBhep2c+d2W/kk0miz0GAzq2/JAmeZbju4iFauccK7DI1ITUJbGwGIrOfT
Mdei1ACdz++R8Jn39DqisciFgSazuDP4P8SQ5lSkF0LEbW8Fvn12AZE7uzI6dfhF
O9Xa97VN0iRHjdZsdGqa7G30nt5ynDVY1vplw1Tsd3RxNJRzwiA=
=K7I7
-----END PGP SIGNATURE-----

--cwsoivffveyepjnz--
