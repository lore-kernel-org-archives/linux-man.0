Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32EA46EF9B
	for <linux-man@vger.kernel.org>; Tue,  4 Aug 2026 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785858596; cv=none; b=QzGV8xkOucORgBw6KHkBDn59E/k4Odqx38UJjoSvYAc0MhnATZ0G9cOxjDfad/Sz7tuvuYQ9ZPWnOTZ+7g5a2S1nmAlTJn0YIOgGa+i8EYevpnYawomMc6/to6mSD7T8iKlArBIE5atyJOttaRjdZeOZUANi1Q5elQA6LBBgMro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785858596; c=relaxed/simple;
	bh=LnR2wveJMOyHgHM7twf8lJ0WJ0oeZy3x2nbofsheCdg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Dav175iminLlh8UehBB/MvmgLNe/Wd1oJBcyAOmW4Moh6v/IjNW4yTATJRVZz0AHchJiwu6eUoWgC0FT+HMFagPs/JxbcRyXfWMIBzIhIBCx10YgrHbq6nPHpCQDFK2MmhCd5oMy9OCIUpJjNLqtkX1pS1RplpI4pduUWM3o1XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aarsen.me; spf=pass smtp.mailfrom=aarsen.me; dkim=pass (2048-bit key) header.d=aarsen.me header.i=@aarsen.me header.b=o/ORKckr; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aarsen.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aarsen.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aarsen.me header.i=@aarsen.me header.b="o/ORKckr"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hDyfQ3xZJzMlBf;
	Tue, 04 Aug 2026 17:49:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aarsen.me; s=MBO0001;
	t=1785858590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r+WNlIivZ53NnAxhYokZKNqW2cRRIrBVVqHMFWhTG4I=;
	b=o/ORKckryA3odpHbWy8OS/3YXzIgaJi0pzWKctNdy4rRkHN5hA+nN2YYu7rkE0KQ3eotrW
	aklmkd0bC0qGvVM5SYXm/JM22pS4ziEPMsSUJP3q3x8WKzAQlpj2doErU+Ah8uEPMwkrii
	UrZxqJpFpHUsnVkFqko6cIptD+meUsfLpRbne/0qE7eCR3teSRtBz+Jsmz3K3TUFb3PHG4
	G6T+m34iX5SlDs4itnOUFiIy2RAzvRHTzZ8rXxnD5Qu3HEHcjM2vakrt8g+zYJYiWDq/B6
	l7a1gJGycn4+gvesR5eNwKlzS8kPbQe1/+3Qj3aBh+ZZ5G1i7RNA7ev8Q9aB/A==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of arsen@aarsen.me designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=arsen@aarsen.me
From: =?utf-8?Q?Arsen_Arsenovi=C4=87?= <arsen@aarsen.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: Collin Funk <collin.funk1@gmail.com>,  Sam James <sam@gentoo.org>,  "G.
 Branden Robinson" <g.branden.robinson@gmail.com>,  "Maciej W. Rozycki"
 <macro@orcam.me.uk>,  Paul Eggert <eggert@cs.ucla.edu>,
  linux-man@vger.kernel.org,  bug-gnulib@gnu.org,
  libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
In-Reply-To: <anHVx-xWLmL7SPyM@devuan>
References: <87cxw1s58a.fsf@gmail.com> <am6X32HkGdm2xTd7@devuan>
	<alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
	<am-2d02e1qq78Asv@devuan> <87ik5sunm7.fsf@aarsen.me>
	<20260802231058.o7gud4bd7co2nbhv@illithid> <875x1sp0h2.fsf@gmail.com>
	<am_TTjDLlAI68zkp@devuan> <87h5lb9u8d.fsf@gentoo.org>
	<8733wusj68.fsf@gmail.com> <anHVx-xWLmL7SPyM@devuan>
Date: Tue, 04 Aug 2026 17:49:43 +0200
Message-ID: <8633wtnaw8.fsf@aarsen.me>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-Rspamd-Queue-Id: 4hDyfQ3xZJzMlBf

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alejandro Colomar <alx@kernel.org> writes:

> I've thought a bit more about it, and had an idea that might be
> a reasonable compromise.
>
> Here's a sample:
>
> 	 SYNOPSIS
> 	-     #include <memory.h>  // See STANDARDS
> 	+     #include <string.h>  // or <memory.h>; see memory.h(3head)
>=20=09=20
> 	      void *memccpy(size_t n;
> 			    void dest[restrict n], const void src[restrict n],
> 	@@ -34,8 +34,6 @@ ATTRIBUTES
> 	 STANDARDS
> 	      POSIX.1=E2=80=902008.
>=20=09=20
> 	-     ISO C and POSIX declare this function in <string.h>; see memory.h(=
3head).
> 	-
>
> Here's the commit message, which explains why I believe this is
> a reasonable compromise:
>
>     man/man3/: Put first <string.h> in SYNOPSIS, then comment about <memo=
ry.h>
>=20=20=20=20=20
>     This is a compromise between the fact that <string.h> is the standard
>     header and (only slightly) most portable header file for these
>     functions, while hinting at the fact that it might be more appropriate
>     to use <memory.h> where possible.
>=20=20=20=20=20
>     Remove the STANDARDS and NOTES about this, since now the SYNOPSIS
>     contains all the necessary information.  The extra info is in
>     memory.h(3head), which is linked to in the SYNOPSIS.
>
> What do you think?

Why, though?

I think that, in the thread, it was already demonstrated (by Bionic
having an empty memory.h for a time) that nobody includes <memory.h> on
its own and expects to see these functions.  (not that Bionic is that
widely-used; a better test would be checking something like Debian
codesearch)

As I've noted before, what header provides what declaration is also
largely inconsequential.

So, the only effect of this can be to create new cases where <memory.h>
is included, for no gain.

It doesn't really matter that memory.h is only slightly less portable,
IMO.  It is unused, to the point where Autoconf recommends not using it,
and no longer bothers checking whether 'mem*' functions are also present
in string.h.

Is suddenly reviving a dead header to copy a few declarations of
functions well known to be part of string.h into it not just unneeded
churn?  Especially as program code would (nearly?) always need to do:

  #include <string.h>
  #ifdef HAVE_MEMORY_H
  # include <memory.h>
  #endif
=2D-=20
Arsen Arsenovi=C4=87

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQECBAEWCgCqFiEE/uKz0RP8AKMWLWBhUsKUMB6ixJMFAmpyChcbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25z
Lm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRGRUUyQjNEMTEzRkMwMEEzMTYyRDYw
NjE1MkMyOTQzMDFFQTJDNDkzEBxhcnNlbkBhYXJzZW4ubWUACgkQUsKUMB6ixJME
gQEA01D2PwmgvvI2f9uj57h42CNEzXxFD7a/B1L49MjpPVUA/2ZTeaYM0mPU0Lc2
pH7Oj/h23B32KzDuoEOrMsDs374E
=X27n
-----END PGP SIGNATURE-----
--=-=-=--
