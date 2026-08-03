Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525D126D4C3
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 14:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765943; cv=none; b=H2tjPlStoSinDasppEetiZVpzY6h4mCfzJVHsuhm/9bF19zeP1PaCxcItExmxCjDDQdySxl7xS1JTXKOqCaJRk0yWZFb7uPKM3KyjKMjUzP/W2nrE0tmjlBTu14BjtAM2nGJZ+s3m1Ww1eozVAtI1IxoKhzFww+7QmYNS8DMgGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765943; c=relaxed/simple;
	bh=jEpwntmhkpUjUAAXzjMCIW+dQV/y+kMMpN2s+gHT/5I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QYPoavXas0LnCB2uWmhUkZ5muYRQkDwMOM6jgfwFK/Y5jV6LrfL1PB/QXLwhq191rb+hLl4RxVdkmtEn0g7P460Lu8d52dPF/aCUCUIxnIHk1k+F3TXxMeZvz945/SbOqAgPyU7WtJyU0BMSerujRz+QdlGSGanmSQA30McvvJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (c.1.a.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::a1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 47780340D06;
	Mon, 03 Aug 2026 14:05:40 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>,  Collin Funk
 <collin.funk1@gmail.com>,  Arsen =?utf-8?Q?Arsenovi=C4=87?=
 <arsen@aarsen.me>,  "Maciej W.
 Rozycki" <macro@orcam.me.uk>,  Paul Eggert <eggert@cs.ucla.edu>,
  linux-man@vger.kernel.org,  bug-gnulib@gnu.org,
  libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
In-Reply-To: <anCAeQ5YNwXwSTWA@devuan>
Organization: Gentoo
References: <am6X32HkGdm2xTd7@devuan>
	<alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
	<am-2d02e1qq78Asv@devuan> <87ik5sunm7.fsf@aarsen.me>
	<20260802231058.o7gud4bd7co2nbhv@illithid> <875x1sp0h2.fsf@gmail.com>
	<am_TTjDLlAI68zkp@devuan> <am_VUE1SzxqRkTAo@devuan>
	<am_V3bvOiH9TaJQW@devuan> <20260803020908.efqt5ilkcjq4z3yz@illithid>
	<anCAeQ5YNwXwSTWA@devuan>
User-Agent: mu4e 1.14.2; emacs 31.0.91
Date: Mon, 03 Aug 2026 15:05:36 +0100
Message-ID: <878q6n9u4v.fsf@gentoo.org>
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

> Hi Branden,
>
>> Date: 2026-08-02 21:09:08-0500
>> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>>
>> At 2026-08-03T01:42:57+0200, Alejandro Colomar wrote:
>> > > > > Date: 2026-08-02 16:27:21-0700
>> > > > > From: Collin Funk <collin.funk1@gmail.com>
>> > > > > I can't help but wonder of what happens in WG 14 rejects this
>> > > > > controversial, as obvious by this thread, change. Will the
>> > > > > man-pages changes be reverted?
>> > >=20
>> > > > > Or will we slowly watch them document personal
>> > > > > preferences instead of existing standards?
>> > >=20
>> > > BTW, as I showed in another subthread, strncpy(3) did contain
>> > > opinionated comments well before I was involved.  If you're really
>> > > going to accuse me of that, better make sure you get the history
>> > > right.
>> >=20
>> > Oh, and while at it, please also read my review of glibc's own
>> > opinionated and bogus documentation about string truncation.
>>=20
>> I don't think this rhetorical tactic is a sound one.  You are implying
>> that because Collin (and perhaps others) are not on record as having
>> already consistently opposed editorializing in the glibc manual, or in
>> the Linux man-pages prior to your stewardship, that they are hypocrites.
>>=20
>> First, that's not necessarily true.  Who's read every word of either
>> work?  Who had already done so 5, 10, or 20 years ago?
>
> He doesn't need to have read every word of the glibc manual, but this
> precise text he could have read it, because it was mentioned by Paul in
> this thread (different subthread) prior (19:28 UTC) to his message, and
> reviewed by me also prior (20:31 UTC) to his message (23:27 UTC).

I often reply as I go rather than reading all other emails around that
time. I don't think you should assume he read those emails and
deliberately neglected their contents.

>
> 	Date: Sun, 2 Aug 2026 14:28:33 -0500
> 	From: Paul Eggert <eggert@cs.ucla.edu>
> 	Message-ID: <8715af47-867c-417a-8ef5-7b4b7ceb2c31@cs.ucla.edu>
>
> 	Date: Sun, 2 Aug 2026 22:31:59 +0200
> 	From: Alejandro Colomar <alx@kernel.org>
> 	Message-ID: <am-eAGL6OWqP9Yah@devuan>
>
> 	Date: Sun, 02 Aug 2026 16:27:21 -0700
> 	From: Collin Funk <collin.funk1@gmail.com>
> 	Message-ID: <875x1sp0h2.fsf@gmail.com>
>
> Also relevant is the fact that he accused me of "slowly" documenting
> "personal preferences".  His wording implies that it wasn't there
> before.  Maybe I misunderstood, though.  I'd be happy to rectify if I
> was wrong.

I think he meant in general?

>
> While he didn't need to know whether it was there before, it would be
> good to make some effort to learn whether that was the case, before
> making such a serious accusation.

I took it to be that you (as you've said yourself) have a different
style from Michael and this does involve a more opinionated (you may not
call it that) approach. He's commenting on that being unfavourable to
him. I didn't think that was contentious, more that you see it as your
duty wrt education.

>
> ...

> sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEBBAEWCgCpFiEEJaa7iN2bdkxrVUHCc4QJ9SDfkZAFAmpwoDEbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25z
Lm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQyNUE2QkI4OEREOUI3NjRDNkI1NTQx
QzI3Mzg0MDlGNTIwREY5MTkwDxxzYW1AZ2VudG9vLm9yZwAKCRBzhAn1IN+RkPAx
AP0cuunv7zpgyGlXPXinG+wYZ50RYb4sKnpsa9LodnPt2gEAkBYQhzyQM5mGCR3f
G3j5Hz/g+l9RB7dsz8F/KtlX+QY=
=Q9Ev
-----END PGP SIGNATURE-----
--=-=-=--
