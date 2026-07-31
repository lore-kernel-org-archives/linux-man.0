Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95E73B8BA5
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 23:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785539333; cv=none; b=QyWP6LBaa00EF3ngSvUCgUkN54yve+oa7OdC5KA4kdYsWTcENcksx4dYXOuLk5LLNDBU2PyrxRxCGVuIUwUCXQBJyzMho7mavQCWzi6wLHE36VB/HpEAEN9IO8Aht8T7El//4ZYuIqzf9ZMuMr92qgKhQtVVPhUqIg02QRVIPmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785539333; c=relaxed/simple;
	bh=Efd4ExzyA+gSBUtB5aC3WLNgg5yFZHlPqCIXG4dCzRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2tRWoMEOc2gM5nEYwvZy5mxJcp4Q2Ylyf69F/yCACn10/3Qd1/mxyl+TP00GOCrxjwXFMqJVpkJRJt19pH83/sCmLip2l8wn/K4rYJYLjQxgSTMC4wh6jpjTKQf2yb2MalCPzY3KlxvfUoD8Sz7mgjiJvKV2/J2v9z6OKLeZPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlwUnROg; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlwUnROg"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-81e69a2db34so22659337b3.0
        for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 16:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785539330; x=1786144130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dJ1IIcHTj/qOIKml7dlaH4XAtSdJBnD35N+IePiFWuc=;
        b=IlwUnROg8Wdzt0RbIPalWHpW0smG/5kgXCEbht0C0aRGbtaOU37Vb5XoaX2sTXqkzm
         HLP0ue6SUiPzFuqHfvKk+5TA2sQI0RRqWwq4mUh95zJSKqSip+LeVWrRu4iyDnh7/SWK
         KBtew4RuXLUMA/EyTL67erv0TLYh5je+bzLKc7zpLaAePtbyGD5I+vioyQfdHEXumBO1
         qw3iCaP6WthFpXW9hkoqVmyIC1oKMD2K/vhKdU5WJSuAWlYFs4dUbeTxxSzC0Dpxn/4v
         tAglKzvSPduw1kxd/IpRaU1e8bvSyjFsMw/QaFmNBmKcRoSls9fgZLAV/SDcMkumuq8Y
         arPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785539330; x=1786144130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dJ1IIcHTj/qOIKml7dlaH4XAtSdJBnD35N+IePiFWuc=;
        b=LCtVtjtulu8OvuRmMpbcB/Aw//p8viz6OL3tl0JTSYHkUHVyRs5huj6kSIA7Wl8rDN
         hazk2KixFcBOgrw47yXFhRnGhLSc1ZrNl3DSZuahvZcMX7FXqul0zbPJPkXD65s1YmHe
         7BQlGRhsX91sGodZre45U9m7JdAado3lK5ttmMsfxskYvyvSRvHrotiIL0CxI6aQzTuT
         XTjQWt+jrZ1kAy/naESlSXNFx9gFHCM72nb5VOHsDAkxY3rfERJS4cpFRl6Zs7Qg0P8Z
         6l0Fmd7fl2tFD+SKfZkVhZPSIZxM78eKSS+ZcfFuKkcXOeNO42+hX8Q81AXWVw/wU7Dm
         fJMw==
X-Forwarded-Encrypted: i=1; AHgh+RrzFODd9x6WwFOEb7RXSTkG2G8WKKg/8caWKajv3cetiTrV63p71RlJAWf6y3jU361llHq7amkdDOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXqZVMqqXwOJfvApuaNYdkL/XBttVoxQlkr1sgD4P8l6B2Eo76
	SNxyT7J7YfyjO6/Ztp7grSnoo3K4XGT6h4J5nDOtNt8xI2/B9ZX35WSo
X-Gm-Gg: AR+sD13atWa+I7qAYTuXck5SzYWYehmRaKjWClhR90z9HCyrVnHme5sqc/vZWnbQlDI
	OFYOvz+MWi3rPeQ2ipUHI6XfPHwq1T263fVvIvEbyeXQ4EmmjjQsSBZ4cDg2RyuS8kkBj8m+DYa
	Ln6GU7JDqDskXbldwYRBvHRuqGnOy9GvoRSh19zHdgnpI+wh5GSigPsjlnFNQ+/AuDBvzYhi2J7
	O/hLFkT/w0hqy4gBVksotoyC2+OmJt2oj22o0jA6UpdG48v5URre0jIhymAUbvYqh0MSHzXegps
	mzrTfxH406+omgv+q/+hjSKnoScUOXrvFzFY3ScPvXpldoHt0x++UkH7NzPeheC5hsZ4APUEPvm
	KQRoEZN1fGl80vkqNoRTMI/Rj4IoWwM/T6tVSaElnUSPinA8KA7AuoiiTDWAgElwyaRaK/L2WmG
	HGf0yPVmmjEiAPouSIUfqUNOwqkkuZGBSf8YTKQVtnJlh8aDbniw==
X-Received: by 2002:a05:690c:670e:b0:81c:c77b:3546 with SMTP id 00721157ae682-81fd4b5a1fcmr24745957b3.21.1785539330542;
        Fri, 31 Jul 2026 16:08:50 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd10c991sm16207557b3.36.2026.07.31.16.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 16:08:49 -0700 (PDT)
Date: Fri, 31 Jul 2026 18:08:47 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Joseph Myers <josmyers@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
	Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>,
	Nevin Liber <nevin@cplusplusguy.com>,
	JeanHeyd Meneide <phdofthehouse@gmail.com>,
	Christopher Bazley <chris.bazley.wg14@gmail.com>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Iker Pedrosa <ipedrosa@redhat.com>,
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>,
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org,
	libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
Message-ID: <20260731230847.prx4gay3ejvqdy6q@illithid>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
 <am0fnb4BMRrTajqx@devuan>
 <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="owvoh3xzakurq64c"
Content-Disposition: inline
In-Reply-To: <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com>


--owvoh3xzakurq64c
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
MIME-Version: 1.0

Hi Joseph,

At 2026-07-31T22:42:00+0000, Joseph Myers wrote:
> Standards involve accepting agreed compromises that might not have
> been your first choice, rather than endlessly relitigating past
> disputes without new evidence or changed circumstances.  In this case,
> the choice of where to put the functions in C89 was an agreed
> compromise that implicitly obsoleted the previous location, and should
> have put an end to any arguments that <string.h> was a bad location
> for those functions in the absence of clear new evidence.  We have
> plenty of clear evidence for confusion about strn*; we don't about
> mem*.

What are some good ways to gather evidence that:

* ...C programmers since 1989 have gotten better at recognizing when
  they're dealing with "memory buffers" versus "strings"?
* ...that the header file's name has aided or frustrated that
  recognition process?
* ...that consequences of whatever confusion persists are more severe
  than the C Committee measured in 1989?

You can tell by my phrasing which way I _suspect_ the evidence points,
but I'll openly admit I don't have quantiative data.

But I think bringing such information to bear makes a stronger case than
a simple appeal to 37 years of precedent.

Occasionally, matters get relitigated because they had been wrongly
decided.  I appreciate the trend since 2000 or so of Stroustrup (with
respect to C++) and the Austin Group (with respect to POSIX) becoming
more open about where the bodies are buried, and how certain
standardization decisions have been reversed (through deprecation,
withdrawal, and similar) because a powerful vendor took its leave and
was no longer around to filibuster constructive development until its
demands were met.

I seem to recall Stroustrup calling out Sun Microsystems by name in the
4th edition of his main C++ book.  (Something to do with the exception
propagation mechanism, I think.)

I suggest to WG14 that a good way to reduce relitigation is to
candidly disclose in informative sections of the standard corresponding
to applicable topics, where the committee as constituted at the time of
issue has reached exhaustion with a matter.  (Though I wonder if ISO
would insist that such language be ripped out.)

I followed the C23 standarization process closely, and it looks as if
the National Bodies (NB) very nearly fought WG14 to exhaustion regarding
trigraphs.  I was greatly relieved that you guys won that one.

Back to the topic at hand, in data processing we tend to strongly
distinguish three forms of storage management:

1.  base and bounds (mem*)
2.  delimited (if with null bytes, str[^n]*)
3.  fixed-field (strn*, but not very consistently)

=46rom one perspective, 1 and 3 are really the same, but from another
they're not, because, as some thousands of CVEs have shown, programmers
thinking of case 3 tend to assume that the field will be populated with
elements that are "well-behaved" in some way, whereas in case 1 they
tend even more strongly to be conscious that the storage could be
populated with arbitrary or even malicious garbage.

Do your impressions match mine in this area?

Regards,
Branden

--owvoh3xzakurq64c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmptKvgACgkQ0Z6cfXEm
bc5Dag/+Od6oW0Jvhu2kr10hy7oQYdfUpsyXWUBNKiRH+umAoaZDyr8zMMlEk5aK
Le74Du6WV2IBz4R6EZeuIfCAXMge2/JoSoJq6kFQ7pz5EVC0UqZV+nq0ovCEQQXE
Asjz1qYblVtExtb2tYvFp17NSHl1D26FwRedfLeNb+V57fMXRQWyZbJQcxDM+1ZK
Ikv+ChNIjAYAiUILDI4w8vlgXUbrF8oMcviy2HjxFxyuGVlWnqbfQRMV1XVtDFJn
s7hxzuz8q0qtu9pVo6ZDd0i8ycDYAOZ8StQbC5xUwbZ7ndNFKA0OY2duH3FnCTYZ
1/v/2o0Yn1F8ekRf2ehRVWSoNlhSD/Oo6yUb9DiRBMd7TAzXmrlwzNkQzjLa5rzA
BQ3el6k8AO3rBKxkQMbcJ9NzC7fUyy6hibrxBdfw8dvJvNAz1vAfuRtCMtW4r5xE
5z1AYWJw2PjMrDq4DjLPj4RFB3nH6uhSH4CXRbx7urOIHpiwySFwLK4M3bpCJ+pc
4FZVz71zi9jLElx7a2krHAZjhH457qqVtF7ezPYC4QxEcK10tlkLrdlrihvfBiDq
MHXlnsDMBUxKNr9VfHrtwNEtyDHEHZrpCv15IbO9p8Q227Qtmpr+B6o9uUGdilK9
v0yANMvyj6GKcm7vhiTWxKmP9UnMDrDZ7X8CeGdZBvVi2xeRcTU=
=05+0
-----END PGP SIGNATURE-----

--owvoh3xzakurq64c--
