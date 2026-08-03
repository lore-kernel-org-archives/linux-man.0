Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA81C30C167
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 14:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767310; cv=none; b=KrkfRVVh7+tkl1eKLudZSqsgBex549EkSt1YqvRJ/2r93yLGup0/fRgF0y/WW/YSIEmsybSGLLa2nMHR2oibavh5ajPXfrx7ZuF0RaE72NuHjv+WSD+kRL60tF7JcIkoVav2OUSM6YrJ8a4rlHJRXRKR1LpUr7DElHH2f6PKSpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767310; c=relaxed/simple;
	bh=Oeu3xmOhinPndE7gbU/RZMW6pSCYyftmGm6sqQd8BTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=puLdiD7wU7dqua1hbUzhEZpYmAJ/oKLqGqnNcXdWhARfM0WnK1AUmmaot66IRdyaTyf7ma9jLSTB5jvYlaHBFrxExdKG+mtkEbPBYdsfNZe80fLKgPK9oyFZby2Iy4RkyS3dsasLPsTZUKjd5XauOG/fyZCymiVj4B7lyvtXtI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZ3E7uik; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZ3E7uik"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB5D1F000E9;
	Mon,  3 Aug 2026 14:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785767308;
	bh=vIl/Dwjqez5vbT2WVXX9mAQg9OT+CPQZnRGK2jnCKHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CZ3E7uik9RWq5dIDbbO0WyV9VhlA2rGZ+CBPy7IADJ8z56GndNRUr07MbPyvCvzsI
	 I5/tpmENUtuF5eTlqef11aEMbE0fCNeaFm3GiYAxhJ233GocLggdKR2C+shRByYcq5
	 81bFR9f40vsmKOizvP3KOA34H2Kf5djsN1dpiIPmTAk5L8KAxsDVlWrL40g3GZlxlr
	 X9kuCqEfQtvfyyNIo7SxNpCTiCRx9HPQD8RQS/P8YwkoOj+/judC14mFhknLD5S5d3
	 WaRI0aBiCImyO8TtCP68XLJIx4m7TaB9hcMczePl835hGvpV/7RLLk5Bwvg9vo02fQ
	 2Q/8L7pCFcoCQ==
Date: Mon, 3 Aug 2026 16:28:24 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Sam James <sam@gentoo.org>
Cc: Collin Funk <collin.funk1@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, 
	bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <anCkj3joPP5feROr@devuan>
References: <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <87h5lb9u8d.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fkr6augduvdo2yb5"
Content-Disposition: inline
In-Reply-To: <87h5lb9u8d.fsf@gentoo.org>


--fkr6augduvdo2yb5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Sam James <sam@gentoo.org>
Cc: Collin Funk <collin.funk1@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, 
	bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <anCkj3joPP5feROr@devuan>
References: <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <87h5lb9u8d.fsf@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <87h5lb9u8d.fsf@gentoo.org>

Hi Sam,

> Date: 2026-08-03 15:03:30+0100
> From: Sam James <sam@gentoo.org>
>
> Alejandro Colomar <alx@kernel.org> writes:
>=20
> >> Date: 2026-08-02 16:27:21-0700
> >> From: Collin Funk <collin.funk1@gmail.com>
> >>
> > [...]
> >>=20
> >> I can't help but wonder of what happens in WG 14 rejects this
> >> controversial, as obvious by this thread, change. Will the man-pages
> >> changes be reverted? Or will we slowly watch them document personal
> >> preferences instead of existing standards?
> >
> > This patch set is quite independent of the standard.  It documents a
> > header file that has been provided since forever in glibc and most other
> > POSIX-ish systems, so changes to the standard are unlikely to have any
> > effects.  I've clarified this extensively.  If you want to discourage me
> > from applying the change, you should rather bring up technical reasons.
> >
> > This passive-aggressive message is not something that will have the
> > desired effects you could possibly reach with technical arguments.
>=20
> I didn't read it as passive-aggressive,

I did, and still do.

> but I will say that I think
> you've gone a bit hard in the responses to Collin in this subthread, and
> I think the fact you sent several followup emails to yourself indicates
> perhaps things got heated in the moment.

Yes, they have.  And it was good that a night has happened after that.
It had calmed down.

> I think Collin was making the same conflict of interest point as
> was raised earlier, just in a different way. You may or may not agree
> with how he phrased it, and you're free to challenge that, but my
> reading of your replies is that it went a bit far.

Collin went too far.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--fkr6augduvdo2yb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpwpYcACgkQ64mZXMKQ
wqnh6w/+KeKGkdgBcJqwPgcZUue/4/cNbWkftohINwOSn07/1s+POFRPRYpWn7l4
BAeBplbu7KuwwVf0iFanCmxQJeLtOSFZTnqxHJ/TF7zJ7MWlcU+/WqNGaG0kmF09
dkHmjr8zj4OBvAW1yH5FbpHE5Y89zgIctfYCtaoXNb8P0mDTfNRMjeRcQQIgrYsT
gEHBQsgh8vmCAW0kHXwytb96TsGAS4Gn3JGCaDOqp2pyVQqUAodweS2fBxe0e/7P
Dz5l3VrYdP7aB9ahGM5+xI6P30K7nzb4zDQfrMsXp+PhMZcKO1j1l+07JendApUD
DE1i8rR1PBmVSDD6CunbmwQWh31Bu4kJeA2ipbNUrhvqMvNxE9pWHmla9L74PrXn
Pr9zTq+YSaVN5Z3U0+LOTlrwc+HMw+33XGa61B0jaLalWvLGaPpw7hxtIYfun8/K
MX47f/EZ7B+P56Dk/Az5QO5wFPwu2c8/O5/lnRFabOvpT5fomxQoAMESSUSCbmLW
0ezGFqGGoBNQCj4CjLgy2Uj/dXnEu9CIkoTiBlshXG7VUxISv7F3S6URfPmLQ7/x
bpNYqNfMnMm4QMyYll3wuOj3ytLeTjuySOyDYiBC3ocDV9RkPSkwfl/fCV00OKkb
81+BE6f2aDV27WLamVvurlFLJQtH6CcALpYRyMhVmrHZsd/M2qE=
=PSuC
-----END PGP SIGNATURE-----

--fkr6augduvdo2yb5--
