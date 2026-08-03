Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600D6415F15
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 14:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765824; cv=none; b=e1yANc0oH0JNBw1Vg8FMlcuE3umnA0BEP8F1ReG/FgvNTnzwZ5WSBi/BsLUy4Emx+eJWsgTCWGT/v3viMJfN+MRqeCtP5xU1F7z6f7jUAOABRmIHpap5QhXGVUbkxB6Px1TAg64rJYYjk3ywKVus9UXXKsr2XTmQiBepiVcIaSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765824; c=relaxed/simple;
	bh=HOdxVsGuZWzxyOT1YKZGmyfP/FBRrhzRPB3PW7uOhxA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CnMNn94xscKOaPe0IFWBxTr7l+PQGbThdjsNXhGqv0dsniGl3s0YslA2dLhzl5jepZ6tyDcUxGaCbhVY674L9n2abzkQxNEulnNBbFWRlEqE5vlJl3dJjI7zcK3WA0EmIGJUSeS9CdA0VNYdQcgp1ILYkHG3gT0YicKnI7Mqu8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (c.1.a.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::a1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id EC0CE3415F9;
	Mon, 03 Aug 2026 14:03:39 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: Collin Funk <collin.funk1@gmail.com>,  "G. Branden Robinson"
 <g.branden.robinson@gmail.com>,  Arsen =?utf-8?Q?Arsenovi=C4=87?=
 <arsen@aarsen.me>,
  "Maciej W. Rozycki" <macro@orcam.me.uk>,  Paul Eggert
 <eggert@cs.ucla.edu>,  linux-man@vger.kernel.org,  bug-gnulib@gnu.org,
  libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
In-Reply-To: <am_TTjDLlAI68zkp@devuan>
Organization: Gentoo
References: <am6CnOddgaM10pry@devuan>
	<20260802000833.zpu27l7ibvrbouna@illithid> <am6PkypxYg-Fq4Iz@devuan>
	<87cxw1s58a.fsf@gmail.com> <am6X32HkGdm2xTd7@devuan>
	<alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
	<am-2d02e1qq78Asv@devuan> <87ik5sunm7.fsf@aarsen.me>
	<20260802231058.o7gud4bd7co2nbhv@illithid> <875x1sp0h2.fsf@gmail.com>
	<am_TTjDLlAI68zkp@devuan>
User-Agent: mu4e 1.14.2; emacs 31.0.91
Date: Mon, 03 Aug 2026 15:03:30 +0100
Message-ID: <87h5lb9u8d.fsf@gentoo.org>
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

> Hi Collin,
>
>> Date: 2026-08-02 16:27:21-0700
>> From: Collin Funk <collin.funk1@gmail.com>
>>
> [...]
>>=20
>> I can't help but wonder of what happens in WG 14 rejects this
>> controversial, as obvious by this thread, change. Will the man-pages
>> changes be reverted? Or will we slowly watch them document personal
>> preferences instead of existing standards?
>
> This patch set is quite independent of the standard.  It documents a
> header file that has been provided since forever in glibc and most other
> POSIX-ish systems, so changes to the standard are unlikely to have any
> effects.  I've clarified this extensively.  If you want to discourage me
> from applying the change, you should rather bring up technical reasons.
>
> This passive-aggressive message is not something that will have the
> desired effects you could possibly reach with technical arguments.

I didn't read it as passive-aggressive, but I will say that I think
you've gone a bit hard in the responses to Collin in this subthread, and
I think the fact you sent several followup emails to yourself indicates
perhaps things got heated in the moment.

I think Collin was making the same conflict of interest point as
was raised earlier, just in a different way. You may or may not agree
with how he phrased it, and you're free to challenge that, but my
reading of your replies is that it went a bit far.

>
>
> Have a lovely night, please!
> Alex
>
>> After seeing weekly threads
>> about the prototype changes, I don't think it is an unreasonable
>> concern.
>>=20
>> Collin
>>=20

sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEBBAEWCgCpFiEEJaa7iN2bdkxrVUHCc4QJ9SDfkZAFAmpwn7IbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25z
Lm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQyNUE2QkI4OEREOUI3NjRDNkI1NTQx
QzI3Mzg0MDlGNTIwREY5MTkwDxxzYW1AZ2VudG9vLm9yZwAKCRBzhAn1IN+RkIVF
AQD0N9CqGCkocyAUl9MAGLhJW85bPRpUQNtMdEuyfsRH7wD/bTaMUA1NoyesD63D
EjgXDEyZkZnX359eYzkM2x7LWwc=
=EHug
-----END PGP SIGNATURE-----
--=-=-=--
