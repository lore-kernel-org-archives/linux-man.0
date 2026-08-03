Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013502931DF
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 16:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773772; cv=none; b=DkX2lx92BZiQ2f/gLnsQF9/do8FMKmFaH6fV3gvdS+uzBAYOtjThWl3V0w/QfQsyzQyeRYyAm7g7ZFl+fI5sVLJi0jBObLmrrTyrZ9zeqjdf0oWtSMIre2lNURQICSz37jpjOOe4tRUSzWBix1z+Gk32fjIgmzmrlIitlomrjgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773772; c=relaxed/simple;
	bh=WQr1/z/6SuB0n7qXO4pAiSsBPudT/L/LfcNKgj39IgM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ExamwewD130lyjxJFJAsofRQk986rLGMVjpb/mHl6cLEibNZLdEd+ss8KPXIvM3tMjU2un60D82xG+LdtsafEHnEQVeuq/zIBTUAxSTzE8CYr7XS7ekKV2tlTJHNCxLacCnuGJ9dmW6Yj8VuhtRTC4VcA6e3Q4uoib0LIR7eqBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (c.1.a.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::a1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id D5F9A340CD8;
	Mon, 03 Aug 2026 16:16:07 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>,  Collin Funk
 <collin.funk1@gmail.com>,  Arsen =?utf-8?Q?Arsenovi=C4=87?=
 <arsen@aarsen.me>,  "Maciej W.
 Rozycki" <macro@orcam.me.uk>,  Paul Eggert <eggert@cs.ucla.edu>,
  linux-man@vger.kernel.org,  bug-gnulib@gnu.org,
  libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
In-Reply-To: <anCmfRDpkhSErjkS@devuan>
Organization: Gentoo
References: <am-2d02e1qq78Asv@devuan> <87ik5sunm7.fsf@aarsen.me>
	<20260802231058.o7gud4bd7co2nbhv@illithid> <875x1sp0h2.fsf@gmail.com>
	<am_TTjDLlAI68zkp@devuan> <am_VUE1SzxqRkTAo@devuan>
	<am_V3bvOiH9TaJQW@devuan> <20260803020908.efqt5ilkcjq4z3yz@illithid>
	<anCAeQ5YNwXwSTWA@devuan> <878q6n9u4v.fsf@gentoo.org>
	<anCmfRDpkhSErjkS@devuan>
User-Agent: mu4e 1.14.2; emacs 31.0.91
Date: Mon, 03 Aug 2026 17:15:59 +0100
Message-ID: <87tspb89j4.fsf@gentoo.org>
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

> Hi Sam,
>
>> Date: 2026-08-03 15:05:36+0100
>> From: Sam James <sam@gentoo.org>
>>
>> Alejandro Colomar <alx@kernel.org> writes:
>>=20
> [...]
>> > He doesn't need to have read every word of the glibc manual, but this
>> > precise text he could have read it, because it was mentioned by Paul in
>> > this thread (different subthread) prior (19:28 UTC) to his message, and
>> > reviewed by me also prior (20:31 UTC) to his message (23:27 UTC).
>>=20
>> I often reply as I go rather than reading all other emails around that
>> time. I don't think you should assume he read those emails and
>> deliberately neglected their contents.
>
> Me too.  But eventually I respond to those other emails, and rectify
> when that new information conflicts with something I said with
> incomplete information.  So far, Collin didn't rectify.

Well, give him a chance.

>
>> >
>> > 	Date: Sun, 2 Aug 2026 14:28:33 -0500
>> > 	From: Paul Eggert <eggert@cs.ucla.edu>
>> > 	Message-ID: <8715af47-867c-417a-8ef5-7b4b7ceb2c31@cs.ucla.edu>
>> >
>> > 	Date: Sun, 2 Aug 2026 22:31:59 +0200
>> > 	From: Alejandro Colomar <alx@kernel.org>
>> > 	Message-ID: <am-eAGL6OWqP9Yah@devuan>
>> >
>> > 	Date: Sun, 02 Aug 2026 16:27:21 -0700
>> > 	From: Collin Funk <collin.funk1@gmail.com>
>> > 	Message-ID: <875x1sp0h2.fsf@gmail.com>
>> >
>> > Also relevant is the fact that he accused me of "slowly" documenting
>> > "personal preferences".  His wording implies that it wasn't there
>> > before.  Maybe I misunderstood, though.  I'd be happy to rectify if I
>> > was wrong.
>>=20
>> I think he meant in general?
>
> I don't interpret that.  I guess he can defend himself and clarify.

Right.

>
>> > While he didn't need to know whether it was there before, it would be
>> > good to make some effort to learn whether that was the case, before
>> > making such a serious accusation.
>>=20
>> I took it to be that you (as you've said yourself) have a different
>> style from Michael and this does involve a more opinionated (you may not
>> call it that) approach.  He's commenting on that being unfavourable to
>> him.  I didn't think that was contentious, more that you see it as your
>> duty wrt education.
>
> I only see my style slightly different than Michael's, but not
> necessarily in the sense of involving a more opinionated approach.  See
> the other messages where I've shown how Michael had done the exact same
> thing with strlcpy(3) a long time ago.
>
> On reconsideration, and after researching what Michael really did,
> I think I was wrong saying we have a different style at all.  I believe
> we've had the same style.  We just had different topics of expertise.
>
> Michael has had his own share of opinionated comments in manual pages.

Yes, seeing the quotes you posted in another reply, I didn't realise
he'd written those!

>
>
> Have a lovely day!
> Alex

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEBBAEWCgCpFiEEJaa7iN2bdkxrVUHCc4QJ9SDfkZAFAmpwvsAbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25z
Lm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQyNUE2QkI4OEREOUI3NjRDNkI1NTQx
QzI3Mzg0MDlGNTIwREY5MTkwDxxzYW1AZ2VudG9vLm9yZwAKCRBzhAn1IN+RkCUw
AP9aoxTytM3iC7qRaLXOF+1KjVF2MejYU3QHyPnZ02HepQEA5icELv/P4dDLljL6
2mLYko7UxSRqNRW6HaBxJNwhHg0=
=wCaM
-----END PGP SIGNATURE-----
--=-=-=--
