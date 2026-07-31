Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D710735EDBD
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 22:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785536663; cv=none; b=dLTm+k2YiiAu8A/TdA3aaO6CycvBoiGszZ6HCXVCEx3Vk+NemUcJUAeEg3Kyc9Fv+fo+HgBvXTTfjO7XjeSVd52ChZ6f709fxrMmP2pgiIj13VHTd9bZAQrgSiBHnIqy0ILqIM7k7YxeRT9ZdgzycnqYROyPQOiSL86ubNXpnZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785536663; c=relaxed/simple;
	bh=okV+mh5I2C6/OAc2utXJ/fYZByne48I+D0skse8e7G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9lFa0BpsLpEqACZY7xGQxKYpLVfO025yZM04MZsSqd9Z67EZd8/xAQoEzzwOacSRbWvHpqJnCKmIQzzrDABC88cvdZk6M2xkoQ5DTQdWxa7sVS8PZUmagFj/phnKDgN7TXsutXUM0B/SOUB3hl4OowKz46/3Yb8A5KgR5F9oao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDrJ3Wv8; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDrJ3Wv8"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66896892b6cso1897963d50.0
        for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 15:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785536661; x=1786141461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cCoxUGn6qqGmplsGcxTUcm47iJENRfY4ymxBQPXzae8=;
        b=bDrJ3Wv8z5sTWcBo1Y8TevoV/KECuc9wFwk/OLcDQ5B7vqcN2Na829jqEtIh7jMb4m
         2xlIn9bIVI1Lrr5QRHNs7nWxHmLpccr1svjpkj3Ai0IUBWdOOBwtLhGm5XADZLq0mgSd
         e1YEqOvXejnALCCmoh/n7iPIj7qBIWg0z520ESLX9f1JEVvfc2wgaKl/Gd4M8SvURF/y
         nTO1NKunuu0z67U6C7gHt81DK5QObFO8XAy8ZXe+L7Qdsjc70OI0pWYW36WI5tgOJp/d
         DpmMiCkPezDOE3VYye8dd8hu9n+4mtXUk4Ifgf+HbfyLg5Iag8T8Ypk2PhFkCAJcDqKa
         eFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785536661; x=1786141461;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cCoxUGn6qqGmplsGcxTUcm47iJENRfY4ymxBQPXzae8=;
        b=qM5G5Bd3AUa8XSfoTC6zC/p1j37Dyf4m3Y9p/9aFIbG8bXWAet2CP/azCY8r31WPjY
         a6UVgXcadOHUlNH/bkI2dAN9uTcKJtbskt4mEDEDyqk/Pe+HGaZ3i98fWf9rqWvLLrhl
         wN0FJaR331eRvGhy+ODI7XyR7OWZRwSgB875QP+AQazSCpHIgCkrpQd8EJDsb5QkSpmG
         vZ/p3OCffdjRCqYrCzi2WDK5ysQDvt4ywsF40UAwvt4YAimLYipmJ5vca+8Wlglw3KBn
         DS87EONVgBXCVSu8cNFl2iQ9QcEJ83+GbiL5F0J8TRd34XKZxhXEHFgTBkPgl6O5Plld
         PJhg==
X-Forwarded-Encrypted: i=1; AHgh+RoIjHu4FUZpUYikt/WZXoyVok+kXyH5AH7d3fs9nx1QcbDuA39blzduergkFfkBizVSIxGdBsEG7Cw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyIv3bMZ32+ZN/eg0F20JKHouZmcTuOohfz+z5QCM5g2hdfK04
	uUTrY/9mnVsavBc2mzrsBd0e3JLMyXGv3luvF7VTMtVqs/GYIOITApWg
X-Gm-Gg: AR+sD12/Uepp9wdc5OHC3A8UahPLAb3Bx2A/ekGkgwHhnMSwHCdpQ+VVpBCY0Ft/yT0
	Nag/ybarU03tPFc15FpyJdYuSN3uIFy1DuLWIGyGyvi/mbWY8kA21FQYOSuybsgokI3xhWBkAHm
	EbReGV5nhNXCvIRbDQeDPiEx2lD+Gb3C00NpcCXZsHdbttu2d7705azep77eCcMmbiSVMXsVjHx
	J7Dp6USM4S0WYsYoWYzd2tOR6wMFwqBFyv5nyO2xUoaoNlXhtY7a9ctFUP1Dqvm1JRMuBAlL9II
	zrXThVLJTgqu9gij9e7YiX1/lT67c1URyujcBFZX9xAknFtA4nhhJ68Yf3T2h4GHfc4OVuYN2bO
	9VprvuGjFB4AX2w/N0LrJMixAemMqXK6q50HuyLNP7gf2J6vUmYMiPaZHM6uTLddPhEL623TG8d
	O3ftffTZSq2OanTrgcdHogNpiY8pEHpAJOyOCRixPYvp5sGQUkTQ==
X-Received: by 2002:a05:690c:6985:b0:80d:964f:890c with SMTP id 00721157ae682-81fd4b37c09mr22436267b3.19.1785536660665;
        Fri, 31 Jul 2026 15:24:20 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf841e1sm15387797b3.18.2026.07.31.15.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 15:24:19 -0700 (PDT)
Date: Fri, 31 Jul 2026 17:24:17 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Sam James <sam@gentoo.org>
Cc: Joseph Myers <josmyers@redhat.com>, Alejandro Colomar <alx@kernel.org>,
	linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>,
	Mark Harris <mark.hsj@gmail.com>,
	Nevin Liber <nevin@cplusplusguy.com>,
	JeanHeyd Meneide <phdofthehouse@gmail.com>,
	Christopher Bazley <chris.bazley.wg14@gmail.com>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Iker Pedrosa <ipedrosa@redhat.com>,
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>,
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org,
	libc-alpha@sourceware.org
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <20260731222417.4fo36is3iawyc7d4@illithid>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g5qzno6uqqjg6ksb"
Content-Disposition: inline
In-Reply-To: <87a4r6es6k.fsf@gentoo.org>


--g5qzno6uqqjg6ksb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: on the irresponsibility of pursuing C language reform
MIME-Version: 1.0

Hi Sam,

At 2026-07-31T22:59:47+0100, Sam James wrote:
> "G. Branden Robinson" <g.branden.robinson@gmail.com> writes:
> > At 2026-07-31T21:23:35+0000, Joseph Myers wrote:
> >> I think it's irresponsible to use the man-pages project to promote
> >> personal idiosyncratic ideas like this in preference to what's been
> >> the standard location of functions since 1989.
> >
> > I'm sure I don't need to bring to your attention what a mine field
> > string/`char` sequence/memory buffer handling has been in C since the
> > language's inception.
> >
> > More to the point: what's a better forum for pursuing this attempt at
> > reform that will both (a) reach a significant population of stakeholders
> > who can variously red-team it and/or endorse it; and (b) has sufficient
> > visibility that it can't easily be ignored by people who oppose reform
> > in this area for whatever reason?
>=20
> I think the man page already tries to discourage use in its CAVEATS
> section.

Yes, but that's not a language reform, which is what Alex is pursuing
with "alx-0097r1".  In at least one earlier iteration he's expressed his
intention to submit an N document to WG14.

> > I hope you do not wish to imply that a closed session of some
> > committee, or unofficial backroom politicking would be preferable,
> > nor that WG14 should close its doors to members of its user
> > community who have not been vetted for a disinclination to
> > boat-rocking.
>=20
> I am confused as to where that implication could have possibly come
> from.

=46rom familiarity with Alex's stated objective and rationale, which we
can acquire from the recent list traffic Joseph characterized as
irresponsible.

AC> The C Committee is discussing standardization of <memory.h>, so
AC> let's give it a bump.

AC> I'll send you a copy of a paper I'm writing for the C Committee.

AC> It is at the bottom of this email.  I will publish it as an N
AC> document in August.

https://lore.kernel.org/linux-man/784288e704183a4297aeaa3d13af8edab18bc1ea.=
1785532392.git.alx@kernel.org/
https://lore.kernel.org/linux-man/amaTpQxd52iYjlor@devuan/

> Joseph is opposing the change in the form of a patch that is
> likely to be applied (*) to man-pages.git which has the effect of
> advocacy.

Yes, and he said so categorically.  More constructive advice might have
taken the form of recommending a sequencing for staged changes.  Here's
a crude sketch.

1.  Expand "CAVEATS" sections in relevant Linux man-pages documents.
2.  Pursue N-document work with WG14.
3.  When WG14 has disposed of that N-document (and any descendants
    thereof), update Linux man-pages documents as appropriate.

Joseph's almost certainly better placed than I to add a "step 1.5"
such that Alex might pursue some course that would better prepare the
ground for his step 2.  I haven't attempted revision of the C language
standard myself, so I can't offer specific advice regarding how best to
pursue such an objective.  I possess only notions of elemental
principles regarding how democratic, consultative bodies of technical
experts _should_ serve the public.

That _is_ what we're here for, right?

> I don't think it has anything to do with WG14 membership or anything
> of the like? What am I missing?

See above regarding Alex's publicly circulated drafts and expressed
plans.

> (*) Alex has a history of making opinonated changes like this to
>     man-pages, such as removing references to older standards, and
>     using a somewhat novel (to many) syntax for prototypes.

I concur with that assessment.  However, a person having a history of
making opinionated changes is not sound grounds for evaluation of a
technical proposal, especially if it's topically unrelated.

Preoccupying oneself with irrelevancies distracts from the conscientious
execution of standards committee participation.

Regards,
Branden

--g5qzno6uqqjg6ksb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmptIIkACgkQ0Z6cfXEm
bc5KxA//Yk8GGPB9kweApb3ZjBP+WDJUl6dWcA1VUjrIC+e8WwK6O3xbmJMtKVxc
nO2+dIsO17R9jAh9y2tZXQqahg93cS6WujTi2V45qEJVukWoDX3DQChx6E5wy6v1
Sq2y4GrbNOga07GEoFRpmadpMfaxlvndypzFRNPE4aiPUMwMbgXl6a4TMHYZstN+
t8dNGMjsrMSvPG+ySwXqqh6I0qPXIQJNiaQ5D0eDZl2tEsBYkxKyJLvfRp6D8l+L
MrYv0qqAXq/BwV0veCIl/SrLOat37So+G/WjiYDlHEZAzroBBqWFdSdtq+iIPzjl
W3xiMrxgmot+Ll4ERFmyMAgNCs+FOeCJb2lbxNM9nSZv7dQ0mmIpfT/xIf8JvFRf
jczCFQn2GL11nz28LOWgl/TiVlXVJWBCnPlKhaNCF5jo/p6fLFd8KOOeRHG/RU8R
si9XW/b6mJabacr14lJhT/S/fvTEJ7Oq1Z7RSYWHMx+FnAko3zZtmEuFm/ZREq50
VXxW4NR7yPcoplYDxWrBbroB5X9hJrwtdbl0o9GQqeztZd2bvKXA9gmybIn/0Fis
TdJaZNFgDqGTSHyDF/BBzy6J8hMME5mKfFmiKrP3gdON3hk1m/d7/4yRFvFJGjUX
3TWCIOFRC+1LM8wECx6/A6RCkmt+5dXC/2dwlbjaZV6aGrrPRWk=
=c+al
-----END PGP SIGNATURE-----

--g5qzno6uqqjg6ksb--
