Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2EC21883E
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 23:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785800197; cv=none; b=ZDofMdbJHIBjbJYYDH9bi7QvjR8bGGyQGzdvTQbiIDPhhlrwTW+orDRL3/b4jN9lJrsbKXDQlvLZpF4wk1LRyysYtVZE/vjeJOEysUo8DtIPYKxm27ACDG+iloktjC4R3RnwyXRGAVD8bOjI2QK/C8gl2bU+CriAobGVSAQJBsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785800197; c=relaxed/simple;
	bh=7N7em8gyXEWH6AC0TBxWI9CPpwvWZej8B6+LvbTp8vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EySdLqdx3e4jaMeFnSMFh0ZdfKhFyLKgAZch2OKLJ54wE2tvbxRpoIFz8S4KgJgoFPxOdQ+BjewVEnD9OgvzrPO0GaHLfek/BY5IiUEfgJEl8zkYogdcIkc5oihvCgXKAdADmcHyVsloH+rFaT6p66RoQEoKLJXCC0rAHLO9s/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K7XOUB4G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K7XOUB4G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4AE71F000E9;
	Mon,  3 Aug 2026 23:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785800195;
	bh=B9s7u6MIhP8HKomoyk3kZ7ESFXeUhi2H2BKUMAsXAzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K7XOUB4GYa3FRwPVS/9zlLRHWvTudc53iOv/9/pssGzmgNiNhReiDgfbqf1jyTp+W
	 CbPlc14CZJj8i7skPmJiwwAcnnZg2Vg8Kx/ZgbEMfxZoGp9dYWXgweafMb9Q9cQgPq
	 vbziKosraKKffCAfRtFlQgL7krqYcDg5+4OyPD82CTy/pN9NS2jcpkYF8nEgXDoSbE
	 1OFl/jHKAxyUOhG99EXjOKY2ZoX2I2I7cQx4JPM6+qB9xFUWEeK9BboZ+K9elRtxF2
	 btQ5tfKp5rIhYs5pQTgTJfrAMmvc9HiiSHZOSKPAeRiyjoTZnDFOEwNTYIJ8mHIxA1
	 u5cSWq2+qv0HA==
Date: Tue, 4 Aug 2026 01:36:32 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Keith Bostic <keith@bostic.com>, linux-man@vger.kernel.org
Subject: Re: proposed revision to memory.h(3head)
Message-ID: <anEjBKn5ZzeUF8g2@devuan>
References: <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
 <am5_uA4MSujYCS9X@devuan>
 <20260801235332.vc443gozbqkqdqm5@illithid>
 <am6HTtAMkEEkWjfl@devuan>
 <am_jYJL6uAapMGXN@devuan>
 <CAMdZqKGRJuR_Jyt7TapMQFQ-6wz=OF5DROFhXkZLQNAn2vyimQ@mail.gmail.com>
 <anDgpLT-FlRrJKC2@devuan>
 <CAMdZqKH1=20mAxRR0-F+Pf4EXv57Nchr1TSwe_5CsEaEKp00rQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zv6ypo43kilwe4b7"
Content-Disposition: inline
In-Reply-To: <CAMdZqKH1=20mAxRR0-F+Pf4EXv57Nchr1TSwe_5CsEaEKp00rQ@mail.gmail.com>


--zv6ypo43kilwe4b7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Keith Bostic <keith@bostic.com>, linux-man@vger.kernel.org
Subject: Re: proposed revision to memory.h(3head)
Message-ID: <anEjBKn5ZzeUF8g2@devuan>
References: <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
 <am5_uA4MSujYCS9X@devuan>
 <20260801235332.vc443gozbqkqdqm5@illithid>
 <am6HTtAMkEEkWjfl@devuan>
 <am_jYJL6uAapMGXN@devuan>
 <CAMdZqKGRJuR_Jyt7TapMQFQ-6wz=OF5DROFhXkZLQNAn2vyimQ@mail.gmail.com>
 <anDgpLT-FlRrJKC2@devuan>
 <CAMdZqKH1=20mAxRR0-F+Pf4EXv57Nchr1TSwe_5CsEaEKp00rQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMdZqKH1=20mAxRR0-F+Pf4EXv57Nchr1TSwe_5CsEaEKp00rQ@mail.gmail.com>

Hi Mark,

> Date: 2026-08-03 13:14:35-0700
> From: Mark Harris <mark.hsj@gmail.com>
>
> Alejandro Colomar wrote:
> >         SYNOPSIS
> >              #include <memory.h>  // See STANDARDS
>=20
> intro(3) implies that the SYNOPSIS section intends to reflect the
> function's API; i.e., the interface that it has agreed to provide to
> applications.  Do you disagree?
>=20
> If strndup(3)'s SYNOPSIS stated "int" instead of "size_t" for the
> second argument, it may work fine in many cases but that is not the
> API that it has agreed to provide so it is inaccurate.  Similarly if
> it states "memory.h" instead of "string.h", even if it happens to work
> on some systems, that is not the API it has agreed to provide so it is
> inaccurate.  If memory.h ceases to provide a usable declaration for
> strndup(), that is the problem of the person that relied on the
> inaccurate information because there was never any agreement to
> provide a usable declaration of strndup() in memory.h; they should
> have used a reliable source to determine the API that is actually
> supported.  I am having trouble figuring out where you disagree with
> this seemingly-straightforward logic.

There are already pages where we can't even consider a unified
interface.  Let's consider the case of ttyslot(3), once part of SUSv1,
then obsoleted in SUSv2, and then removed in POSIX.1-2001, but still
provided by the usual systems.

The SYNOPSIS says:

	SYNOPSIS
	     #include <unistd.h>       /* See NOTES */

	     int ttyslot(void);

	 Feature Test Macro Requirements for glibc (see feature_test_macros(7)):
		...

But then, of course, the actual #include is a real mess.

Funnily, there's no NOTES section, because I moved their contents to
more specific sections some years ago (we were never happy about the
NOTES section being so generic, and so I eventually put some order
there, but of course, some parts weren't perfectly moved).

Okay, let's ignore the fact that there's no NOTES, and assume the
comment meant to say 'See HISTORY'.  Here's what HISTORY has to say
about the #include's for this function:

	     The glibc2 implementation of this function reads the  file
	     _PATH_TTYS,  defined in <ttyent.h> as "/etc/ttys".  It re=E2=80=90
	     turns 0 on error.  Since Linux systems do not usually have
	     "/etc/ttys", it will always return 0.

	     On BSD=E2=80=90like systems and Linux, the  declaration  of  ttys=E2=
=80=90
	     lot()  is  provided  by <unistd.h>.  On System V=E2=80=90like sys=E2=
=80=90
	     tems, the declaration is provided  by  <stdlib.h>.   Since
	     glibc  2.24, <stdlib.h> also provides the declaration with
	     the following feature test macro definitions:

		 (_XOPEN_SOURCE >=3D 500 ||
			 (_XOPEN_SOURCE && _XOPEN_SOURCE_EXTENDED))
		     && ! (_POSIX_C_SOURCE >=3D 200112L || _XOPEN_SOURCE >=3D 600)

SYNOPSIS is kind of a TL;DR.  In some cases, what it says is all there
is.  In other cases, there's a lot of details.  When there are details,
tradition is that the SYNOPSIS at least hints that the user should
continue reading somewhere.

In the more than thousand pages we have, you can find counter-examples
for almost everything you could expect from a manual page.


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--zv6ypo43kilwe4b7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpxJfoACgkQ64mZXMKQ
wqmckRAAoO6QCZ4qBufkIKw09SP4QG/SLR2Il2lNyB63uWf43yVgUK8tGv+6DNOv
YiQJdG0Qhe4+BEjkMIuCx03c89qifr6iMYdf2979n5z5iwC1hIHa+qTwFEQvL9tk
8UNC6D2zYPsC2pZgkCcspUJYiC/PFhX/WhYsVnYhKhQzQ4Kmgtqs8iwqGcgGYAWh
Cxu/Eu1demumN4XcgXKVUCEYdbJ5AhQjubBVLXz4tsKIPBNAKCITgrMvCZ1wPzBW
opMy+bb8+TokKzVscwbuezQ3Jb5B/044SkrwjKdRtVJe57fpSmbzF/SvkrRB8KAH
V6ZMepBRCYRW9o59PfpsloSWYUOuXPkMiNzxWsF90PwWiYZ6uADWeA5p2okDicAP
pciVGCGP/T+aYuIFgigcXxEJgptLypNsnswH9J+i53zwSWOodaZbo4p7m1uJbjNp
DBUY8iJSwWDqim39XMEd07rtCLG7V1vhc9XD/8+M0f50tFWI/zRlD8QaBK32sq9L
IAvGOCpnu91gcwERYIVLI/O1Q0fh1DEU1LlLIl98YmmTkEE5fqg1GzchJMaYBzR9
Hp9++wwHGwpZO52ItyVMRZsTgO5ny5VNVjjNXP1BYF9E/F5oscIUX0UQu87TjZmX
BDhjRihVbzpfBFB+YmnKDChHXPv0YwrGTyWlDFdcIApLC1w9GtE=
=jy2K
-----END PGP SIGNATURE-----

--zv6ypo43kilwe4b7--
