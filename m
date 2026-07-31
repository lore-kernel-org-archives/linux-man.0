Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DC4334C3D
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 21:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785534878; cv=none; b=Kphc7Vj0DRAd6dynt78uOOuQOxzEPaQMOaPkCTWulKlkV8wAYlJ4suEtrHZMNC7+Mmb22ijrP7pTyExymAAA7iwi8lkB3WVjZxsnu3yuoAM33f5zP5m6Y5Jfzs2Rar5s1rquucflk6ZeolNZqYxE2ynExbR/MxvgMDokCqxqzC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785534878; c=relaxed/simple;
	bh=NS6hWSjaMcAISp527efxmHFio/1DZL05AeuCxsGpQlQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HV159RyVWC4tKBMugEg3QLlQEPY7jZpRS/IPScAm4m68webbizSfyJJXycamqqk4N1G4CJM309N/B3N4hPT+KbIytgINglwrJdEdZmc2LTcxY1kwHdMyt+5YzJowQ3gQJmBMm6pGJawpFAAB8hI7hmTexl27eJrRf/YnYpJyLrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (c.1.a.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::a1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 5B1BD341994;
	Fri, 31 Jul 2026 21:54:33 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: Joseph Myers <josmyers@redhat.com>,  linux-man@vger.kernel.org,  Keith
 Bostic <keith@bostic.com>,  Mark Harris <mark.hsj@gmail.com>,  Nevin Liber
 <nevin@cplusplusguy.com>,  JeanHeyd Meneide <phdofthehouse@gmail.com>,
  Christopher Bazley <chris.bazley.wg14@gmail.com>,  "Serge E. Hallyn"
 <serge@hallyn.com>,  Iker Pedrosa <ipedrosa@redhat.com>,  "Evgeny Grin
 (Karlson2k)" <k2k@drgrin.dev>,  Kees Cook <keescook@chromium.org>,
  bug-gnulib@gnu.org,  libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
In-Reply-To: <am0TUn55P7uNtTTh@devuan>
Organization: Gentoo
References: <cover.1785532392.git.alx@kernel.org>
	<784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
	<e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
	<am0TUn55P7uNtTTh@devuan>
User-Agent: mu4e 1.14.2; emacs 31.0.91
Date: Fri, 31 Jul 2026 22:54:27 +0100
Message-ID: <87ik5uesfg.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Alejandro Colomar <alx@kernel.org> writes:

> Hi Joseph,
>
>> Date: 2026-07-31 21:23:35+0000
>> From: Joseph Myers <josmyers@redhat.com>
>>
>> I think it's irresponsible to use the man-pages project to promote=20
>> personal idiosyncratic ideas like this in preference to what's been the=
=20
>> standard location of functions since 1989.
>>=20
>> I'd rather we add a mandatory deprecation warning to memory.h in glibc.
>
> I hope you don't; it'd be a gratuitous breaking change.
>

Yet this change has the same effect, just people will see it themselves
rather than the compiler telling them, and go around sending patches to
change it.

The man pages should reflect what the standard currently says, not what
you'd like it to say. We had the same problem with e.g. stripping "C89"
everywhere. People want it to reflect what the standard says.

>
> Have a lovely night!
> Alex

sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEBBAEWCgCpFiEEJaa7iN2bdkxrVUHCc4QJ9SDfkZAFAmptGZMbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25z
Lm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQyNUE2QkI4OEREOUI3NjRDNkI1NTQx
QzI3Mzg0MDlGNTIwREY5MTkwDxxzYW1AZ2VudG9vLm9yZwAKCRBzhAn1IN+RkCBO
AP907KktjZAggcAjqdS02bwVJu4BTR5CfaKJFrX1YdlMvwEAqpoMUYuitHL7XqHf
OllON6W7tElUaknSKfZpE2rNBwI=
=S7WW
-----END PGP SIGNATURE-----
--=-=-=--
