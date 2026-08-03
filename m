Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC1C40B6FC
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 13:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762426; cv=none; b=tbPO87PPahKAc0Hw4d9zFbKxnH6KO7dRXUBqtxzITSzgGG0cgnYDxJBMIwieHsi9K441VBTKegnJyhVOPffx9bTU2WZUsrhUDBamAYLScXg9ojJ5rX2JrjKkOrBJyh1s7euGkTtuaeNfjOkfyeiFv/kMMOhW7Inux4FKbqRx5ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762426; c=relaxed/simple;
	bh=gEIkPQLHiKI5SzO0Z00Ci4KbOe1aHT44i1cDTp/pAUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JbYXeohcLJ7cj/jlgZUgnFh6PeGol2/0h0HC/iOOVWYIRjWfznZRzmkrNqMzL3fxdyUGUwfoF5ya7O+q/5brMiS4/Ca5u0FyPu9Ih9DiKOYm5pbDIy+sQIsYXzP8mKL2dl2rvNmSkipuiCrLOraCb01fr5LLkAiuQHFDw561xSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFk5WRS1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFk5WRS1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CC91F000E9;
	Mon,  3 Aug 2026 13:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785762423;
	bh=M3/lAVBaivB3X4ONczgzC8EKhliGqPxMfCl+lG0xPnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eFk5WRS1kTu/yptPWokoOZ6WamyCGeL81J5Vx7KYl0wniDDMkCo+eFVffi+EHMQgq
	 +GcivvAhCtO3i1/4n4iNrR5+uORhdgymfJgcSQFLG8D/3TbkA7XdWCUe2TojWP0h8D
	 y2rdsx1Pg8UZRehxyfH2czcBUEfCB43AFyJjGnIMbY1smjEmEWT2B/Hxjfjb9DL8VK
	 edAXCi9LA5mDHvbrZn0dBn9rD5r9LyVfUhFTw2BdA8QHiN9Gz+hII/0nRWRyykwwNN
	 FiW7MsvYzoXDv5qy7FJphts890SShW+VD6Ze2yKP5WtLbG39Hakoy86vv4fyD1Rato
	 XJJPv0zhuvPYA==
Date: Mon, 3 Aug 2026 15:07:00 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Bruno Haible <bruno@clisp.org>
Cc: bug-gnulib@gnu.org, libc-alpha@sourceware.org, 
	Collin Funk <collin.funk1@gmail.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <anCO9tDqJH2PLD0w@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <4636165.RUnXabflUD@cagnes>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="njol4fd35gtem72c"
Content-Disposition: inline
In-Reply-To: <4636165.RUnXabflUD@cagnes>


--njol4fd35gtem72c
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Bruno Haible <bruno@clisp.org>
Cc: bug-gnulib@gnu.org, libc-alpha@sourceware.org, 
	Collin Funk <collin.funk1@gmail.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <anCO9tDqJH2PLD0w@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <4636165.RUnXabflUD@cagnes>
MIME-Version: 1.0
In-Reply-To: <4636165.RUnXabflUD@cagnes>

Hi Bruno,

> Date: 2026-08-03 14:35:06+0200
> From: Bruno Haible <bruno@clisp.org>
>
> Alejandro Colomar wrote:
> > This is just a case where educating on the current standards is done by
> > 1) documenting at the bottom of the manual what the standard says, and
>=20
> The standard-compliant #include statement should be documented in the SYN=
OPSIS,
> not at the bottom of the man page.

That's an opinion, which I respect, but at the moment, and given the
thorough research I've carried out, I disagree with it it.

If you want to know what the standards say, you have available at your
disposition the STANDARDS section, and the standards themselves.

The Linux manual pages are not the ISO C manual pages.

> > 2) recommending to ignore it because it's bad.  When the standards are
> > bad, this is appropriate course.
>=20
> Which functions are "bad"?

I didn't say any functions are bad (other than gets(3)).  I did say the
standards are bad.  The standard specification of realloc(,0) is bad,
for example.  The standard #include's and organization of strn*()
functions is also bad.

Where did you get the idea that I've claimed that any functions are bad?

> It's not up to you (single person) to decide this.

I've done enough research and heard enough parties to conclude this.

> Rather, poll among the libc implementors, and if a majority says a functi=
on
> is "bad", then mark it as bad.

I've polled libc implementors for their technical reasons, I've heard
those arguments carefully, analyzed them, and concluded based on that.

I've also heard subjective opinions alongside those technical arguments,
and I've also carefully analyzed them, although they carry significantly
less weight than the technical arguments, and in some cases, they carry
negative weight, as they show that the person that emitted them is not
experienced enough about this topic.

With all that information, I've taken a decision.

I haven't marked any functions as bad (contrary to some opinions from
libc maintainers), FWIW.

> That's basically how it went with 'gets': The community realized it is a =
bad
> function, then the implementors started to withdraw it.

Here's an interesting story about gets(3), which I learnt recently:
The C Committee didn't remove it from ISO C.  It was the Austin Group
that triggered some unusual process within ISO for overriding the
C Committee, and removed it in a secret meeting.

The removal probably wouldn't have been accepted by the C Committee if
it had gone through the usual process.

> And even there, look at several implementors, not only at a single one. F=
or
> instance, NetBSD considers uselocale() to be "bad" and therefore does not
> implement it. That's a single-implementor opinion, not a majority.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--njol4fd35gtem72c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpwkm0ACgkQ64mZXMKQ
wqkNEw/8DQu6XugmxlNmaDYTRPs2kMJa8VMaB2Ukt5SDpp9EZvll1B2AH59Olyup
HOb20WkFKIqlKNVTJ6GyR7RmvEu4LsXv/RjB4WDXSc+yPYKUej+8PWXZ+Z5PX8N6
aETS3kQ9LI/82imfX5tgessnlIC39YhmXDqAV09j7ebSukEZoaPAbNBxsU7owli9
Zgr/2iBcZBEwvBUsiEc/uUOa+bzUoXqAxlWRfkwnep9EwpjpJ1kZntAsTKcJ4pJA
c4PgK84gjhbUPJPf2MUZXKJjwRK9gf/uEuPynRHRUYuM5ACy1cIi1fMRlgifvWAq
Baa6MMN/TvzaTXtk6438PAiogF639xAY8rWLhz6o+KSxFcdNN7p5rd5umvqXovAL
szwrc9ZQ9pBroo1ErOXNTAJ4HAUKarnKRpqZMwZJAN66YqQIJbEJEgS4cX+Elkdn
ikzASsDkPkIvbXRNmD91LlG2b5wQTY442wFQjN/DvfXihSS3kkRuy+eHQSkuVIoe
5gKAtHeRGe6PQ0yVB/1Vnf0P6t3XU1j5E65cz1kJcthr+ecVbzby9B4H8qiirSEI
08i3n2sizNlRKKF+VqKYc9SRk01zRvwRoDR87SBaFL38f4Sp7a7AJCW/pySliXkq
Jcr0NKA98v+1U14iijYZeTFrnRnxkGdbdjuQPWlmKlK99DPlZXg=
=l2A0
-----END PGP SIGNATURE-----

--njol4fd35gtem72c--
