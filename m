Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A386442AF9B
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 13:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765094; cv=none; b=L2LxsEA3gD7k/pw7hnsu+t4Qex391U/Wzl5h+ZuFEzxFj2Gh9k9Oxs5q/9ESRh7RobXO5z8Yad7aqegQjvyOqaTUHmTzk/v2gckXvVWe9B+ZOOKyzNbRGSeP1qfmjqeybaqySX1Ps6eXOgqgYMX94Jh5AchGgZ/Cf9iWKOAVRiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765094; c=relaxed/simple;
	bh=/dL7SKgw3ShqmPD16KTCtfwOcnJI1lp21vqBqtzevVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuZB/wxkzzUtMU5p1qzIz4cE283BK6kZN2bunzZ05vTxZBgTnj72qeiCE49q2zyfPYhuX54GPkzStHUL1m1tkG7Ks2x+hr/JztZz7Ae47ateNvC6yp6zSp5w5i5snRk4ZplNpQ5sTcQz0gbBTt1UugFzFIa3zNyIRM2HHSbAQdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjzu55xN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjzu55xN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF58A1F000E9;
	Mon,  3 Aug 2026 13:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785765093;
	bh=9JOjxgQFM3PoAsPp+KpTvkFQ7WuouTTQ6rcgFR+TRas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hjzu55xNfv4gBWDz3q9ogftK1c+r/nYa3ZePf9h3SAITyoO171ADJxBlDnvPCN16S
	 gYxVcSwUWYnH8gkPFVQ91nayJq9fziP6ZFwrD6kGasJHWHCSsJj30uep/gQ+oKJEMb
	 Tp87unCMKGC+4Zn7eI5T9BSiMtAOsB8HuXFp8MGs+gChR7L6s6oqlESSTi3Yrv6Ng7
	 cbTsj8ss3PbNeAOH90EVVjjd/DAZrBaDYAtf2KmZ66yoLG4JmlkHu3NfuleCHGp4+n
	 LHHWdlmhcQxQ2ZA0Q5wX0vH9+YNX+7xguFBqMpJ63fT7RSBbRGOCIIGxepCG2tgM65
	 ZUmstTQeEN6/A==
Date: Mon, 3 Aug 2026 15:51:29 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Collin Funk <collin.funk1@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, 
	bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: When and why realloc(,0) was broken in glibc in 1999
Message-ID: <anCXCl5QbkDjsGzl@devuan>
References: <am50AM0bdufHa9W3@devuan>
 <15288158.RDIVbhacDa@cagnes>
 <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6uoa3fi5m5ljhc74"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>


--6uoa3fi5m5ljhc74
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Collin Funk <collin.funk1@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, 
	bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: When and why realloc(,0) was broken in glibc in 1999
Message-ID: <anCXCl5QbkDjsGzl@devuan>
References: <am50AM0bdufHa9W3@devuan>
 <15288158.RDIVbhacDa@cagnes>
 <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>

Hi Maciej,

> Date: 2026-08-02 22:23:36+0100
> From: "Maciej W. Rozycki" <macro@orcam.me.uk>
>
> On Sun, 2 Aug 2026, Alejandro Colomar wrote:
>=20
> >      The  original implementation in glibc would have been con=E2=80=90
> >      forming to C99.  However, and ironically, trying to comply
> >      with C99 before the standard was released,  glibc  changed
> >      its  behavior  in glibc 2.1.1 into something that ended up
> >      not conforming to the final C99 specification (but this is
> >      debated, as the wording of the standard seems self=E2=80=90contra=
=E2=80=90
> >      dicting).
>=20
>  Well, this was a period when glibc was driven by personal preferences of=
=20
> one particular maintainer, so I don't think it is a good example in this=
=20
> discussion.

Just to clarify something about this, to which I didn't reply before:
we can't blame Drepper for this bug.

In this case, there was a discussion in the mailing list, and there was
no discrepancy against this change.
<https://sourceware.org/pipermail/libc-alpha/1999-April/000956.html>

It's just a case of a discussion that happened with incomplete
information, and which favoured standards conformance over common sense.

In fact, I was surprised when I learnt about this case, because I would
have expected Drepper to ignore the standard for being bogus.

Jonathan Larmour correctly noted in that discussion that glibc was not
conforming to C89.
<https://sourceware.org/pipermail/libc-alpha/1999-April/002394.html>

This finding from Jonathan should have triggered some more research, but
they didn't.

Roland McGrath pointed out his understanding of the (ambiguous) C89
specification, and claimed that it was a bug in glibc (and thus he seems
to have been in favour of the "fix" too).
<https://sourceware.org/pipermail/libc-alpha/1999-April/000958.html>
Interestingly, he claimed that it was a recently introduced bug, but as
far as I know, the glibc behavior had been unchanged before that.

It seems it was Roland McGrath who pushed for the idea that consistency
wasn't paramound, and that standards conformance was.
<https://sourceware.org/pipermail/libc-alpha/1999-April/002398.html>

Then Drepper did that change, and in his head it was consistent.
<https://sourceware.org/pipermail/libc-alpha/1999-April/000963.html>
It clearly isn't consistent, but it's understandable that he didn't see
it back then.

Wolfram Gloger seemed to be convinced that Drepper's change was
consistent (even if it isn't).
<https://sourceware.org/pipermail/libc-alpha/1999-April/002401.html>

For some reason, nobody in that group analyzed this carefully enough.
I guess it was inertia.  We can't blame Drepper (alone) for this bug.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--6uoa3fi5m5ljhc74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpwnNsACgkQ64mZXMKQ
wqllshAAvNk+TAf3R0Pjnx5C/B+e4tui2g1gEZ/yEriA7wkji3CDk4wCTcKXt4Mk
bTwoLqyEc270ZRlZYxKBWi1Mjns2uNpwMcYcHjYLMnt6tzJz7Oj3COfQKrmY0p3T
9Ki4+I6UxXkLMWCyBjm6+AJjLnHl1gNmNmSHIhcaX/FlqffQ7Nq3ruFWwLGrxhYj
CtDhWE/saBq90mLpF3Mut355h/NSCbol3WMPB+A8KKQviN107KlF1D43o07/5K5k
ApTOYtdN8ME9d9HFM77ZHocqO+jj4UxVIkEptA6ykX5pA2hZ4MHxme85XH9GvNSC
AUXWCstgAS4jqOvwJXLIUbJUL+C6fTZdInQZav/XJWLvxbFG1kB6wfsVkjzDOmqW
1kk8PefB9Chc6h1EQdkaUzE6BPf6LNzkTYExauDjbpUVeaTcis6v1ZYzx9Vhj+lO
vpu5kdhwR+LydWRJwDH13KWvG2tDId+ulJIJk07LOYAgFF+kEKx2Wo8G2GMeP/xo
kLaPZ5JxKa5pjzh8FIJ3IbLFkLhdUv93iBSe4FZ/Hn2BWtzuv9aQo3RRwiGlgR/T
AOfGgZa62PgenCwdaxrcw1L1Xt+kE90J7NfAoPj16dLFlwv4zQkeV4OdcNhNAW+f
AoqBbAbDeJ4L09AVZtnxyv+RDnqxUkZTZeyhpGXYDfYiOpQ4D7M=
=Y8o7
-----END PGP SIGNATURE-----

--6uoa3fi5m5ljhc74--
