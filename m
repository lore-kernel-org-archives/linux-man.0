Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E3344781A
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 23:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785540779; cv=none; b=dKX+cysP3LswCuy2TBSqIZF9kZqZbPtclr9fLhKrRYfCq3mg/92kZ+fbUt7/GiwaRR0Il1s7/m1Tq9HIwdbjqACEduRraFMNAKPTRcaBxGIK4k4+QAzpARVX2fVUAUhu/gCn73LeXG1HxLXvOlcRGlfCbNWuhVWZxMYhSKps9Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785540779; c=relaxed/simple;
	bh=FNcZYfVXePnZktXW7p9nseCIT3UqUcb1albZt+B9iaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LK0xGiYs/v7goQKVCuc7XVuYgGubpg87cY+xth+nhmTXvAwF/N0TBMKwO0aAZXFAxAumxiWJ6hHmyf2At8Hwmm9m0qQu4g5jaaFkLmRU4v4S8HBrgAz/RLYvhYz+hk2uTPnDI1N1rgWSS1Tki8//7lEngjAZIk5aOvztzC+SeEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIwdnjcU; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIwdnjcU"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-80cebd41372so22987827b3.3
        for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 16:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785540777; x=1786145577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FTRasT0sz0fONAG+GZ4/CJ+mZFiL2DN6FJ8V50EUgEY=;
        b=DIwdnjcUanZAaZdrx7eBDPN04PqHzEEKwCPnvx6YnFxIJC5wCMbXMG/js4C6Fhq75p
         hCUW+WY/VLZYGjynCAmLjm1hw/cLk+Yt05OZduh7i689AFtqscxCDJDxOl+JBYubBloC
         8wjipzm4a+QtO3YrP1zjCMR/LuW8cVawMAFDjs6ce4DucolV9zhgRuDZ5j7ZfO0wegjH
         tAsBoOxFld99BUiIgBPqINdA1ERu28fbsg9WnKp4AzPogkOAZTewAJOKCOQLCEy0klAv
         2pLXzHwnug7sdt3arIm/FYow2AH8p0k8Z8Ci2+spoYOn72fVetijeGaqW/psJqao36Gh
         N4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785540777; x=1786145577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTRasT0sz0fONAG+GZ4/CJ+mZFiL2DN6FJ8V50EUgEY=;
        b=D8x5ev6YLLEkAXJbsLe/G/Rtl6kYGWizk6xUab1xLcyQG+fxzqQ4Apx7sflCU1p6uB
         F1g03XThNLqKvYrN/QXM7KzPm2hAOBbgLb83b/R+mscKV3pKiC0QFeJqeOEZDjB+wSGE
         9PuOeWN8lZXQuKVfDT9517OjatVdXuv3vjfw3X3Ivs2Z3OOdPsPk6L1H1WzriOqjWNkV
         DNX/fVrzpzlYAls4y2LphZR0hmk425kEzfaIIvCURybzd5B6EQT/yj/JNn3Tb7SoGirC
         NumbxbXI8ygMuaIdk/9AvgQIWb0N3EMqsjZhjGq4734efGcOJ/cYxDAPubMwLvLlTLLk
         6pgg==
X-Forwarded-Encrypted: i=1; AHgh+Rrw3L67iEKaFUYPiXK8LPZlm3QFZ6P54UxKo964p+clyui6+pcT3n7Ts60/XnNozzPhxm6QNw3tRz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKpdO9UmsMBmntSTa5j9ZWGd+sl+uYw7Q+Gli/RhT5gwsHldJc
	rtaTxFjAFffDuo2cA/2XtuBII2MsIy+AOKGjlEsxuAK4390qXTV3HPDh
X-Gm-Gg: AR+sD10AWQJihhd4Wp9i+etc9U5pva/XxY2dKtYERHAPadYjIDQ+jwRNKgO5vPYJbRC
	MoWbcJDbNKJWlQH/AylyxfHH/Plky3ef1Ki8NNO6zFV5SM7zoaqbfAyZj54zDV7K6zuM6/Z0o5c
	6I/mD4gpf6l77KxPA7MMGxIcBSNMGyCr6WTbZeVU7+pqBRTAmN5KgSkuXjm4xxGcWcuX7emhImT
	0OvfPlcjjpiJUS9j7ZvOD/+6viv59Gu0SET5Qv1pHyxEAjLRLXfALCVEp+ZehFKIPWMzC5EjQ4S
	tlb3YHIeWJQFTi+lBfeATHr8o4lImHNKSFTnPoRg83an2QFcbc6VU4DTelOxKbu1sjkeDxJYeus
	XZU2QTkMNMOmUdslTo5233mucG9YfLZsfdFcBFCXq3Ws3scFkXJrhVZZ375yG1y2i1Xmb44o80s
	LOhRFPQUFKDclFYCHNtbFAFcI0d50gnI/cLYtJD4HNVQvGuTNSxQ==
X-Received: by 2002:a05:690c:2502:b0:81e:6cd1:5313 with SMTP id 00721157ae682-81fd4bcd64emr24904227b3.20.1785540776847;
        Fri, 31 Jul 2026 16:32:56 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fda626e53sm998457b3.11.2026.07.31.16.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 16:32:56 -0700 (PDT)
Date: Fri, 31 Jul 2026 18:32:53 -0500
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
 Document these as provided by <memory.h>)
Message-ID: <20260731233253.7uwgq7m7vndqf2o2@illithid>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
 <am0fnb4BMRrTajqx@devuan>
 <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com>
 <am0lAEb1wuCJPDk7@devuan>
 <9223d084-7de4-914f-9b53-8862510542d8@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rea33jecakkmfr4z"
Content-Disposition: inline
In-Reply-To: <9223d084-7de4-914f-9b53-8862510542d8@redhat.com>


--rea33jecakkmfr4z
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>)
MIME-Version: 1.0

At 2026-07-31T23:11:56+0000, Joseph Myers wrote:
> On Sat, 1 Aug 2026, Alejandro Colomar wrote:
> > > In other words, they were in that header for 6 years, and it's
> > > been implicitly obsolescent by virtue of the standard choice for
> > > the 37 years since then.
> > Yes.  And I'm trying to revert the implicit obsolescence.
> > Obsolescence isn't a one-way process.  Sometimes, evidence shows up,
> > and the obsolete feature must come back for $reasons.
>=20
> When it's been obsolescent for 37 years, bringing back a header with
> the same name is just going to confuse people with 37 years of past
> information saying it's obsolescent (normally if one source says "use
> X" and another says "X is obsolescent", you can reliably assume that
> "X is obsolescent" is the more recent information, even without 37
> years of history involved).

Okay, well, <memory.h>'s out due to the above, and <mem.h> collides with
old, non-standard Borland and Watcom compilers (which live on still in
environments like FreeDOS[1]).

So how about <stdmem.h> or <stdmemory.h> for the standard mem*
functions?

> Any reasonable change there would involve a new header, say
> <strnpad.h> for strncpy and strncat, rather than resurrecting a very
> old one.

I agree with that.  As my previous email noted, I think C programmers
apply the mem* functions differently than they do str{n,}*.  I think
it's a good idea to erect a cordon sanitaire around the ever-troublesome
latter functions.

> > The solution of moving both mem*() and strn*() to <memory.h> and
> > leaving just str*() in <string.h> is a consistent one, because
> > <string.h> then remains strictly for string APIs, and <memory.h> is
> > for the rest of byte handling.
>=20
> It's inconsistent with how people have understood C ever since it was=20
> standardized.

This claim is a bit hand-wavy.  C has spent its entire lifetime being
notoriously poorly understood.  But especially in early days, the
compiler would spit out something anyway.  Hackers confused the
production of a linked object file with understanding the language.

C has single-handedly elevated "undefined behavior" into a field of
academic study.

> > It wouldn't be reasonable to move strn*() to <memory.h>, and then
> > leave mem*() in <string.h>, of course.
> >=20
> > Similarly, it wouldn't be reasonable to [move] strncpy/cat() to
> > <memory.h> and leave the rest of strn*() and all of mem*() in
> > <string.h>.
>=20
> On the contrary, it's only the functions for null-padded fixed-width
> buffers that are niche functions causing confusion, compared to all
> the rest of the functions in <string.h> for which it's a very
> well-established and well-understood location.  Some others like
> memccpy are *obscure*, but not confusing in the same way.

I agree with you here, but the base+bounds nature of the mem* functions
versus the null-terminated nature of the str[^n]* functions, warrants
separation.

37 years ago the C Committee seemed to feel it needed to economize on
standard header file names, so many unrelated interfaces got piled
together into .h files that consequently lacked coherence (in the
Yourdon/Constantine sense).

WG14 has been moving away from that notion for decades now.  A recent
example is <stdbit.h>.  Why not continue in that laudable direction?

I think

stdmem.h
string.h
stdstrn.h

would sharply separate concerns and promote clearer reasoning among
application developers.

Regards,
Branden

[1] https://www.freedos.org/books/cprogramming/part8/

--rea33jecakkmfr4z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmptMJ0ACgkQ0Z6cfXEm
bc7ZCA/8DGmLo0gOr5GcFe6iRRqXRFwKBb6ZHN1vvIfmJ7DW/ZArV0zog2Fk2Kd/
rfMwbFLNdBptXDUX6O0TkKMvCmGwrUwL1riGqSVsREf/s0r3IYWsy88z7/Mo78KR
oHNhaTNfodUKA18D49ZS0pv98GwPfg0XK5RMOFyfhyyUwrwCFWGl1AGrX3sgYCm5
v92g1Ms0VZeIajq42qOlxSyAep2Fmo1cPBddgzdR9diU731piBHop7I5/8j+E+xM
siM8mPLvKBCeP8+d38g5N2rOKIut/KMg+Mxhpux0irM+Z8Yhtgdegyrai3VOCTlI
P1bPJ+8UGn2anyxoxkm6u24S9yt7XvtzYnDh3J1XfpxP17YYMQKb+TzWReMEt4oD
Y0mZ50YfjUGvC/PVqSK8GzcGv9vwmS5jgYNPRUrRU6PMWm5dg/FrgRM+k6eKB48k
DaL0QHFfK2+m4ipjqjpCFDpswQKWfAWhOA1kLfhXmYWYs1uBbFDNvhsF9pWdGocl
sYXLDu7ntFR4ecqcO3P6WqwY4lMgTclViTUCBIXX3r+bGm1fPIKRVmYupwpvCJc8
dJQV989+haxAYptR/VATcxqo/Q0c0F6iilAAC5T4EfahB7tYxrcZtxDap0/VOjsx
3lfYa+mr2CA/W1enhoyDEIThG1K02iZ8+qye37vdu8tP1YaJa58=
=6k72
-----END PGP SIGNATURE-----

--rea33jecakkmfr4z--
