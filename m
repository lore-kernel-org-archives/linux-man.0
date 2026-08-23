Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C80C2BDC1C
	for <linux-man@vger.kernel.org>; Sun, 23 Aug 2026 13:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787491678; cv=none; b=Ztk+La0mPhYv5hm0M2iXytxd4rgSiKdoKyXAH7srVO7s/0q7gMuMEvQAJpOnX4zki4h8CfHpR/c57VC9bMCC/B/avvRJ/5iRj7YSdbY2v08WDHbDV9NIdp2HfgQrUm72Zi0OAcyl88jMJnOUl5i/MMCBZcJHqQXSjtVj6Y3fyDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787491678; c=relaxed/simple;
	bh=1ciliYv0vot96PoppYf/lfaGciJr/tdCgBSTUuwRknw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e+zzslTAbxQh9GTMGKATOxZYcQYXjsbYSbwFbXOU5fLebKFzY9yEgfmEwQ3y/h+6NOY5WYSXvu6oUMzuELH9mo+9pGsYK34F0Nnthb21UkRmi64L31N4S1/YGaVZmFDmcNPFHA/ZneGaTrPvJHF7ZaVpvmN4KdoCLQ3GpVZYncQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzYP455g; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzYP455g"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8111c0c7561so40443397b3.3
        for <linux-man@vger.kernel.org>; Sun, 23 Aug 2026 06:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787491674; x=1788096474; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u4OhgR4YUFPAftSxKj/z9fbF+ti8yRxMbKMhlWRLEZA=;
        b=OzYP455gplf+qbpsy3RVOaslGPdTl/7i0BdftUwxMfws8cOykzOli4kyeW/fC620EV
         rJql9nJYvQFXuR9nPyfAmLl4AW61Tq+nFzDMPmkRlA1ZK7wGXFW77Kqe7h6oRZl8nE0J
         xgPsubLrdldRUg0/LXReQUiJ4sFAJ5werGOQ4K/hhLRWRd/1lr8fQrGruzMcFcnMqtFW
         ITPkWFoi3e2m8tEsrFLBa1jEPi5qOgsfFMi3M+JwL65AFuv3yvOEtgThc0fBONozkFwE
         5bzk5MFi4ITzAirOmjOIOPyEIy7OOSVzeYA4aaBK+Kb95QyZUt419vHhgRNcABbTPdIv
         7RDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787491674; x=1788096474;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u4OhgR4YUFPAftSxKj/z9fbF+ti8yRxMbKMhlWRLEZA=;
        b=iAmuOkWMru08jSdBryeEB+ETQZchJekBxaMI41hTsJzbe1uJH8QNN9B5d4b4qW9fz7
         dNRIuATkJ78/gIBOi4ruJnBKU+f7an6igzmlfl14F+C+hgUZKS2UOLd57et1d4xB5u6k
         djuDowJAtMsBkAqZsPUDOVjCghrZL0Oj2mwszn8JjFW0PmatTLU1Ksi/w9igfrMme/+k
         HB1KV9AoCAgN5f74EpFUMcqGguWSsNroGNfU/6n6cgIznoYPEZ8aEpkNyFF7CssVpk8T
         J3bJdJMzEanVECwmeC9zS7v+yQ73JGHuaUfDDLlCwsCHZMEa43hpJw3k51iYRu8FoT+0
         fd4w==
X-Gm-Message-State: AFuF++k7Rtm8VkiVjU5w5qG4s7e1OCH7PHPHtg9IkHLr7wJbqor8dMEI
	PyocgEn1hh1IMdfWtCw+gUKd0aj4vto1mkzqDWy3k9IHuFmmC4r8mIamtW0Iiw==
X-Gm-Gg: AR+sD12UbT+zbhGE8bdxMz4giKutCoupXj2m+5XXn0cAaMzNFiJMUQvMPobosxO5ZTx
	PDi5+zR6XIYNyQxI3qQtcwRyQrI2GZqOMHPrb2w1I+kRz8Z/vcP66AVemWQ07siBfcOfdjqFJ1r
	qaNCB6OJLvVnSX0Qysp2s22Ez2KynDgcJpa6sqPOcMO37B4JrX9E9rZIDv4axo7vNiOMX+DqNtW
	Uf18bfMUg4T6EzTr1lv+0e29y/CHx8T0V5TFEo1x5kjiDlSTmlfMpklkA9wGrv4VJOEY3GU15F9
	R2MWM5gTOCYhGQIKk5efHBvlBdAmMH4nnF4ofPmoBAi9XX03LlKcfI1e6xzXsLUxp23txYxftyA
	Cy/aqprkZ4dzUsDhgw6N88Yp+CnzEx3ioXbqS/cRHcu0CLK0RIPnY7Y1JRJYgtwRxnq+BzlJWr6
	JgyJxtIx/90GzIHMGlFSQxxjM0wFU2jhhICaaXX5ZmjiAUqZg01BM=
X-Received: by 2002:a05:690c:c15:b0:81d:75b4:925f with SMTP id 00721157ae682-849f4c6ffd3mr79638507b3.19.1787491674077;
        Sun, 23 Aug 2026 06:27:54 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84ca5c2c861sm21102447b3.12.2026.08.23.06.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 06:27:52 -0700 (PDT)
Date: Sun, 23 Aug 2026 08:27:49 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <20260823132749.pgypzsqv32n67wor@illithid>
References: <anTugcvjragzGpSK@devuan>
 <xn33wr3rr8.fsf@greed.delorie.com>
 <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fp6ljrck6ajvrj7x"
Content-Disposition: inline
In-Reply-To: <aorlBv8YTu4JlZcy@devuan>


--fp6ljrck6ajvrj7x
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
MIME-Version: 1.0

Hi Alex,

At 2026-08-23T14:29:54+0200, Alejandro Colomar wrote:
> > From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
> > At 2026-08-06T16:42:35-0400, DJ Delorie wrote:
> > > Alejandro Colomar <alx@kernel.org> writes:
> > > > (I haven't tested; I've written it in the mail editor directly)
> > >=20
> > > The placement of the .PD's is important ;-)
> > >=20
> > > I'll send a v5 with these, you can decide if you like them or not.
> >=20
> > Managing `PD` placement to achieve "compact lists" is indeed tedious.
> >=20
> > If you like, you guys can pilot groff 1.25.0's new `LS` and `LE`
> > macros for man(7).  I expect to release 1.25.0 in the next week and
> > a half.
>=20
> Oops, I forgot about this before pushing.  I can still patch the page
> to do that.  I was planning to release tomorrow, so it'd be
> interesting to have one page with that.

Yes, definitely--I'm excited to see it "in the wild" outside of groff's
own pages!

> BTW, I haven't heard of Mr. Sed for some long time.  It'd be nice to
> meet him again.  ;-)

I'll knock on his coffin and feed him some synthetic blood to rouse him
once I've released groff 1.25 final.

> I've tried building groff from git HEAD now, and have some issues.
> Bootstrap succeeds, configure succeeds, and then make(1) eventually
> fails:
>=20
> 	$ make=20
> 	  GEN      doc/groff.html
> 	Cannot find a locale compatible with document strings translations
> 	doc/groff.texi:12253: warning: @image file `line-layout' (for HTML) not =
found, using `line-layout.png'
> 	doc/groff.texi:26767: warning: @image file `gnu' (for HTML) not found, u=
sing `gnu.png'
> 	cp: cannot stat './doc/gnu.png': No such file or directory
> 	cp: cannot stat './doc/line-layout.png': No such file or directory
> 	make: *** [Makefile:20047: doc/groff.html] Error 1
>=20
> Do you know what's wrong?

More or less. It turns out to be damned hard to balance the requirements
of (1) Automake maintainer mode; (2) building from Git repository
checkouts; and (3) building from distribution archives.  Bruno Haible
has been helpful in finding scenarios that don't work.

https://lists.gnu.org/archive/html/groff/2026-08/msg00039.html

In the meantime, building from the most recent release candidate archive
_should_ work.

https://alpha.gnu.org/gnu/groff/groff-1.25.0.rc2.tar.gz
https://alpha.gnu.org/gnu/groff/groff-1.25.0.rc2.tar.gz.sig

=2E..at any rate, it just did for me.

2026-08-23 08:22:22-0500 mkdir /tmp/rando
2026-08-23 08:22:24-0500 cd /tmp/rando
2026-08-23 08:22:28-0500 wget 'https://alpha.gnu.org/gnu/groff/groff-1.25.0=
=2Erc2.tar.gz'
2026-08-23 08:22:33-0500 wget 'https://alpha.gnu.org/gnu/groff/groff-1.25.0=
=2Erc2.tar.gz.sig'
2026-08-23 08:23:29-0500 gpg --verify groff-1.25.0.rc2.tar.gz{.sig,}
2026-08-23 08:23:36-0500 tar xf groff-1.25.0.rc2.tar.gz
2026-08-23 08:23:38-0500 cd groff-1.25.0.rc2/
2026-08-23 08:23:55-0500 ./configure --prefix=3D$HOME && make -j

Build finished successfully for me in about 60 seconds.

Regards,
Branden

--fp6ljrck6ajvrj7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmqK9U0ACgkQ0Z6cfXEm
bc4RBQ/8CuuokQ54t/vt4up5a2B0cwTy1phof+uP4KN7Y0z/BeQrb2domtj8pvns
gp38pNaMrCVvhO6MD9jpQ0fS+06Vqw4570MzodDWGeG5Y9tCN3+fYcdxMlX9iCAs
aV3TthejlBUiSef9vREf4Jb67NhiZVujywN8ghAucEvNkCtAL4T75kHuyAXAA7ug
OceGdaC3MaNzF2X7+jmJhgpQWe64ETppuT3k1xweFuP0DxbYew1TrOc3XgRtBGP7
w+v7cHlG0xVZbKFtpCzVypRmVzGU/KxXvwZRCUU/tvQGTIQfvY8bPmq2OP+AbHbG
w+jijEU8peuI1DDH7iWSqOYYz3FTTYL337HR8Xa8p/Rf730RDtWUJbvYoYBvc3Ed
7VhgHHaAfhyjI85sWPrfWKDiOD3yZUxwoMYFbXLv87rzh7KUe2gGDLPF4Bay6g7A
FCWeuqIYVAp1B/LN3sd1fSh5kR9EOKYDsHV0NUH/63eLSQWdHzipJVBcbPAg4uRI
wvaEws8bxJkQwFwQH1IyoNX4day0lVszVLHTEPjjsjPf8oZ+ffymPgjq9guJTbqw
vGZiS4mHF1Wtpv1L56oc7XeHtnTrugWcktCskOBL/ijw5IcmJBVxi0qw2qIy2dFs
NzN4OI0tNOTHmnjgWDtoA4eOo+hTlbnBW/ZbeT4dFXkFQu9svgA=
=KLrq
-----END PGP SIGNATURE-----

--fp6ljrck6ajvrj7x--
