Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079BD2F3C10
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 19:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786625; cv=none; b=MJdcLGfueWl5HofY1kTwPVmQGxkEjXhrt9aIbMuCTdYLX32dcCbqTdFKS0CUI+W9DzeE4gmCCES6CaTF3OtSnsw8C3Yg7F821Q4dUyRLdbnPehoe6lHV0RnGlfw2J8XPwCKfQXQnC8u1jfiZdVrxBcsfvOkQYm96IT4BbM6rElI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786625; c=relaxed/simple;
	bh=Rh0b2ol26/WysOdQKCGRtdPXtIrNJfrBhVwupGqRhig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VVemsymSJJuBd+21LLgVUCwPJk0Rlrtm0+tdEf7F45pyiizRtZVST94tgx4bFdwdoQgMGN00gWBabetx9rXOPrUPZ8oa5abfKzCtlZl2NuZEW7SDjMmtb29yTaeAYbLqXHT9DK/R/PKCxRUvcgcgiH7zV6mobWgKoPGC0eTf/Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/WJjCJ1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/WJjCJ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09B91F000E9;
	Mon,  3 Aug 2026 19:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785786623;
	bh=wcj17sbS/iBSInXkxBFabeSumoTvIkKFylgwmwNAA1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f/WJjCJ1pfRSnKYAqLKh1CEgTNdkTRpPysX2MbhT1832wJkXPQPqysrIPJA4AGh1E
	 QtaVlnm86FYbWPd5pkNJTuoKSg+9sdIVaKibuA7IZ7ujUsv90WZDE51w+rTLLz7VQk
	 dSejbBgs72lflE0MYuYLZplUc8Fnq3dvmVtIzHyEHQxPZOqfWyZfoO4Aa8WvTBO4UY
	 sN6kJcU52GbZFJjz39ajYDiHzzoJJgtq6tiXeq+VtFJcTFCaEUdtiou6yDHWoOPclX
	 sXa49NUJGcLwBc/u+hdTJd5qHyndG+Mj4hVC3FiaXrampg2qrsjzNyKYnvZsDXZ7RU
	 gSG05qWmfshVQ==
Date: Mon, 3 Aug 2026 21:50:19 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: Bruno Haible <bruno@clisp.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Collin Funk <collin.funk1@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <anDwkFks_n8_nxvT@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <4636165.RUnXabflUD@cagnes>
 <anCO9tDqJH2PLD0w@devuan>
 <16f3f33a-85a5-5165-7d99-a3f85d857e50@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wh3mlblnuxojmoft"
Content-Disposition: inline
In-Reply-To: <16f3f33a-85a5-5165-7d99-a3f85d857e50@redhat.com>


--wh3mlblnuxojmoft
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: Bruno Haible <bruno@clisp.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Collin Funk <collin.funk1@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <anDwkFks_n8_nxvT@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <4636165.RUnXabflUD@cagnes>
 <anCO9tDqJH2PLD0w@devuan>
 <16f3f33a-85a5-5165-7d99-a3f85d857e50@redhat.com>
MIME-Version: 1.0
In-Reply-To: <16f3f33a-85a5-5165-7d99-a3f85d857e50@redhat.com>

Hi Joseph,

> Date: 2026-08-03 19:45:06+0000
> From: Joseph Myers <josmyers@redhat.com>
>
> On Mon, 3 Aug 2026, Alejandro Colomar wrote:
>=20
> > > That's basically how it went with 'gets': The community realized it i=
s a bad
> > > function, then the implementors started to withdraw it.
> >=20
> > Here's an interesting story about gets(3), which I learnt recently:
> > The C Committee didn't remove it from ISO C.  It was the Austin Group
> > that triggered some unusual process within ISO for overriding the
> > C Committee, and removed it in a secret meeting.
>=20
> That sounds like a myth.  You can easily read the October 2009 minutes=20
> (N1475), item 4.27 "On The Removal of gets() (N1420) (Stoughton)".  You=
=20
> can also see C99 issue 0332 that resulted in the obsolescence in C99 TC3=
=20
> that was followed by the removal in C11.

It could very well be a myth.  For the outsiders, it was the WG14
convenor who told us this story some days ago.


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--wh3mlblnuxojmoft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpw8PsACgkQ64mZXMKQ
wqn/TxAApaXtdvHEwTQCJuZj+pA7nScTJYK+Ebi0LBDruXJvrdiDDNU7H7gtd1Iz
kdTHiUTaTTIIM1fBuWjc20k9qOqFm/n/roLXmeGmatdWBHpwlJv5Wi68zZJCmN/w
v6uNj4QsGNi3B0esjia/JZRMJV9PxBZKxWe6nfQM/dD0pApHpN89y4tc6dBUzo1u
4jqijYFLnK59OaDTPYkj9LooikRRo98D5eb4PQg3G7jMZ/PYYdW1pHhLrqxL16MC
GkM9PVlNfNYkeVmPGIoIWx2C7swj/bWxY/4HzcV4UbxIPiONBfpdR/+ccHL2ieuO
BcI0cw48gkT6ZEXh1jX5m5P70y4yZKuLbzzVOAqGPUEyR28YSg6g0Hk4RXvIQdR0
68L+XNkjKN5nYFTpfjZMcqIX2qgY/1Rkt6h+WZOJZmzT5GIeqnOK2u687CVZ8Xyq
JoTo3D9Y1bmGljgF0V8GKMCTM+9c89Y57t10jcmfYLcOMEj/obfmqKBsicBxQ/1g
ThprYDpjh9byBZXTzVY4/9a9yqcH0hzWRsJflzUg1mOJ4khUf7qflWa/W6HQg6JB
xNEA01MbT93svIBvdeclRLZaPnSlpA2YaPiph3wGQXsNwGPPx3pOCAfnHAOQo3t0
ykqwuTZcPfKBvJSQuIDGk96r9WA+JzTlIhO8plt2RqHQCDds5gI=
=Xiuq
-----END PGP SIGNATURE-----

--wh3mlblnuxojmoft--
