Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C5133E367
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 23:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785713852; cv=none; b=oyTypHLDMhXwKExOlgrO5lwXWNYMPNar6EEwTyjMOhrpsYbTc2KtuTi0UcVWc0v7dKDNMrTeewZ7neLO+62swSvXUfYuuTrEG0Qr7QQFVJFWcxIhdeJEtQV4/AvCDip3k/OcSFTKyUB4/JTEFtpnhGQha0mSFczqPnM0HH7Uwag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785713852; c=relaxed/simple;
	bh=zrZoVl39K33wCfpcVQpbFBvVc3XDZ2lxKSc/xXj2+0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVlwfWvAnpaN9/l4J7cZbnDXdnjCR6dVX9EZB3c3umDKw8nHEkAJDRPz+VFMrpTAi7mKm8L6oDsp9jTkAE87pZsQQYACLWQMNDi6NU3ULxwIA1xvXRKYtzKEkypzNOAX63QUvur4PuveJ9CBgsh3aMPkSUFmJhwVOfcMBQXgB3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHKPOJRE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHKPOJRE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1B01F000E9;
	Sun,  2 Aug 2026 23:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785713850;
	bh=0NXDJxLumBjIchRkNJPrRtt867dKKheIgz8DKqobHKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jHKPOJREv1S86ynmUbHKxJAh9z/VSSEtxMzHKPnMxk7CR2wmxOyLajgAH3anuxftH
	 qM4bCpToXVT9UAXvyoIW8ENokJFCQBCxJkyVV7vOQL3FXPkpbGi568iT0A5knx8Bvr
	 VOcOjh7g4BfF9Yi1eB864l1rqd8u0Q3RJcu798UgXI5S6bkNrwR2zT9V6DwEt+MIdh
	 dJiq71K94muPJyMTJqlnjvpxv3N4fluMu1lboXC056uFgek+woxIKES5lTZDgIqsyK
	 rBCu+9eN+lXfxDi1iF6cAt1is/Kr4r8JCevzrdY0J7jw5UKgPXUurf+V8v0oqbQgnJ
	 9CJB3XuS3F/+g==
Date: Mon, 3 Aug 2026 01:37:26 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <am_TTjDLlAI68zkp@devuan>
References: <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lf5jzqybfnd5sfs2"
Content-Disposition: inline
In-Reply-To: <875x1sp0h2.fsf@gmail.com>


--lf5jzqybfnd5sfs2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <am_TTjDLlAI68zkp@devuan>
References: <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <875x1sp0h2.fsf@gmail.com>

Hi Collin,

> Date: 2026-08-02 16:27:21-0700
> From: Collin Funk <collin.funk1@gmail.com>
>
[...]
>=20
> I can't help but wonder of what happens in WG 14 rejects this
> controversial, as obvious by this thread, change. Will the man-pages
> changes be reverted? Or will we slowly watch them document personal
> preferences instead of existing standards?

This patch set is quite independent of the standard.  It documents a
header file that has been provided since forever in glibc and most other
POSIX-ish systems, so changes to the standard are unlikely to have any
effects.  I've clarified this extensively.  If you want to discourage me
=66rom applying the change, you should rather bring up technical reasons.

This passive-aggressive message is not something that will have the
desired effects you could possibly reach with technical arguments.


Have a lovely night, please!
Alex

> After seeing weekly threads
> about the prototype changes, I don't think it is an unreasonable
> concern.
>=20
> Collin
>=20

--=20
<https://www.alejandro-colomar.es>

--lf5jzqybfnd5sfs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpv1LUACgkQ64mZXMKQ
wqlAMg//UK/e6PVTwvPHlzhiW+/t3rcqy1HlXEFG0bXjbdRsUbWe0/SKTS/rataQ
ssI1hQXxIJ/Vq9+Fj1zTEo73vK1KPuOJKQS31dLPGp/T+AfnTB2Gior7uv8/cnE+
b3wYrMAobvnUpIjeVEee3jJ1rTrJhvjfz6a1WeofIm8wXRg5P7gBA6TeaVusFcqb
Nb3cnxo4M3lv3LToXFK8j4uvHUghYWtv753cZgJz2qlXqOUkDFnAmJSlUGShWlGJ
V6fobdn5h0jez9L5frojr5bwG9uFh/NS9PgmBwc71p7nIh/RBuQyK4uiPKtVw6J5
v4N1M/dquYmfsPRTT/vS5gWhtWekBbvrZrP2CzF7O5MWbHuJk1+tcUR07YMZ9oO/
mWJWYObOUssaWj7hMkeCq8HNGoZkQNyczJgULYBZ2/otL/m520WysQNBW9hp1dzl
lJ7q8P401z3KD1UGo0ZnVeHj7mLt0GIemPd7F4trWmidQqqPNBwuHI7jU7RByYH1
dJ5cI8EWLI1J4ho8Xg1Zajn6jZe22GyYjxwxQC9DlKWO9lgGsDzT6ldf7JMJfib2
xMdWC1tPnXurwxfJLHbnmkj/yXCqjrAmR9aPnMCMqQvi5oYHPQt4vBEx6NBPWXvg
i1sSWxax/nnj4o5c5C3JFcpl2SXFcxM4wyaE743+mQTffpUImcU=
=OA0Z
-----END PGP SIGNATURE-----

--lf5jzqybfnd5sfs2--
