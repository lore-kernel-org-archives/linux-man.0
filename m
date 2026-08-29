Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F0141D23A
	for <linux-man@vger.kernel.org>; Sat, 29 Aug 2026 21:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788039803; cv=none; b=HSEb6bCG/SsNg0003HquQW3KBngSxZ33ips+AW8n91nhMsULHMsxCmQZ0x93qerzWaxLBWXNGSiQEfLkJ1kqPC7sHe5OjIhDDyamakpV018cCOJnN5JUktpba51IdJi5z8E6UDet/ehakGs83g5bhwjLYXP5ToBRdyfty+L0GPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788039803; c=relaxed/simple;
	bh=kYMekXSeYsRgyLMu1Xw5OjX9JJVPyDz92N5J7hiDEPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7MgiVAhATpzmMeqM8uhVEpZC2J63RJX/Q4dmgFx+GWXZ4m6Q5BtLIS62b4YvopKFgHH7UR0SpXk/7DW4vRwpfEhgJr21+PVpAxrmtsyFg22QtKYcf1wyXKJwqKb0rHh5djcpW/m/n3kbB1lMxL/Q7EaOYQOWRjWU6zs1r1kYMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d66OOFry; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d66OOFry"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF36B1F000E9;
	Sat, 29 Aug 2026 21:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788039801;
	bh=H9+U1EOrBpgp/dS+4kF/9CqsuJk5HwL6Jw/ztQDM+i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d66OOFryKx547sruZnFypb1fJBea/HyR5LdZObG0eN8VaUablxAVXhRiJ9hPUjK2+
	 ppfvDAs7g5qGWtoFxWET6i04TFesmgmNEpQJEdT4QnzOMeYrr5SVmehsooUbLxRE14
	 O/T/n77kI4TvfbGWi52i2UUsPv+PWDQ0JdJpXpjlePm+8EK5Sgs6y7ciNWqMnicxwC
	 GNAbDoarpmW2ASUUcrQrRTi0AlBeknanq3VBEbVA9z9DYGwyw3jXI3VKnqpqg/ebAi
	 HjxrhfU9x1uzCKFBJTXFCDcV6QJhZEyaDDFN1Leg7Em/YQKkhUEZIvAQqqfp7PiGIT
	 y8mpftFtxpKuw==
Date: Sat, 29 Aug 2026 23:43:18 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Ingo Schwarze <schwarze@usta.de>, linux-man@vger.kernel.org, 
	groff@gnu.org
Subject: Re: Using LS/LE
Message-ID: <apNRtf5j8TZj83Bm@devuan>
References: <apLD35LsoOqX6fK1@isnote.usta.de>
 <apLSc6uhVjBNhtyy@devuan>
 <20260829191639.p43vvljsfy2vnxo5@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cbn74gutkvxdwhvl"
Content-Disposition: inline
In-Reply-To: <20260829191639.p43vvljsfy2vnxo5@illithid>


--cbn74gutkvxdwhvl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Ingo Schwarze <schwarze@usta.de>, linux-man@vger.kernel.org, 
	groff@gnu.org
Subject: Re: Using LS/LE
Message-ID: <apNRtf5j8TZj83Bm@devuan>
References: <apLD35LsoOqX6fK1@isnote.usta.de>
 <apLSc6uhVjBNhtyy@devuan>
 <20260829191639.p43vvljsfy2vnxo5@illithid>
MIME-Version: 1.0
In-Reply-To: <20260829191639.p43vvljsfy2vnxo5@illithid>

Hi Branden,

> Date: 2026-08-29 14:16:39-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
[...]
> > > The mandoc(1) -T man output mode uses
> > > [...]
> >=20
> > Oh, there's a -Tman mode!  That's interesting!  Some years ago,
> > I wondered whether groff(1) could have a -Troff mode, which would
> > evaluate the man(7) (or any other -m macros, FWIW) macros without
> > formatting the document.
>=20
> I know of no troff that permits this.  In interpretation mode (that is,
> "not copy mode"), interpolation and transformation of tokens to nodes
> are both operations that occur at the earliest possible opportunity
> while interpreting the input stream.
>=20
> In the past year or so I have revised groff's Texinfo manual to give the
> formatter's internals better coverage.
>=20
> ---snip---
[...]
> ---end snip----
>=20
> GNU troff's ability to recursively dump string/macro/diversion,
> user-defined character, and pending output line contents as a forest of
> JSON nodes was a major new feature of groff 1.24.
>=20
> It's not the same thing by any means as a "wholly macro expanded
> document", but given how dynamic a language *roff is, I'm not sure the
> goal you had in mind is possible.  A language theorist might be able to
> help me devise a proof one way or the other.
>=20
> Nevertheless, the recursive node dumping feature, as with other new
> debugging requests in groff 1.24, forces the formatter to disclose the
> truth about its internal state to a degree unprecedented in *roff.
>=20
> (I'll just be shampooing out the pomade and taking this plaid blazer off
> now, thanks.)

I'll keep poking you about it from time to time, hoping some day you'll
have the internal tools to implement this.  :)

[...]
> Description
>      The Blertch language supports the following operators.
>=20
>      a + b
>      a - b
>      a * b
>      a / b
>      a % b
>=20
>      It also supports the unary plus and minus operators.
>=20
>      +a
>      -a
>=20
>      Operator overloading is not implemented.
>=20
> Blertch language reference     2026=E2=80=9008=E2=80=9029                =
     blertch(7)
>=20
> I can imagine a counterargument.
>=20
> "But why support interrupting the list that way?  It's _really_ two
> lists, so the document author should have to close off the first list
> with `LE`, do their 'interrupting' paragraph, then start a new list with
> `LS`."

Indeed, I believe this is two lists.

> I say no.
>=20
> The purpose of the macro package is to serve the technical writer and
> aid them to communicate.  It is not to serve the HTML/XML weenie who
> wants all their tags nested in some canonical fashion.  Sometimes,
> technological constraints will propagate backward to our language
> designs.  But that's a phenomenon to be regretted, not leaned into.

Hmmmm, I'm not convinced we should support this, but I don't care too
much about it either.


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--cbn74gutkvxdwhvl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqTUnAACgkQ64mZXMKQ
wqn8Ag//e/j2DB4CXp50ikUym07/xzcnjuZZG+DOGxi8++naVwdYLbT50ar6MF6J
eNNqOSUbIiuRe/UYF7e95lT2qpDIM1lHyyyXGhx3qvoUmluxbECHQN9EnZqCidym
W6OrBb1lDUbcy/7SuYekq+Lnhc1X8tyn3zamiTsrj7gpyYQXx/LwaIIppkAdTcqj
dCCgad3b2KLdK6Bs79Slsl9Pil7Xs2iGzrxL+3BM474NrelYAGPhRlxEJDi7AQAB
N9stxjgiAbk7a+w2eznU9eh5FsCVo5jj0PZxp8a9SfpOe10Y0N9VlMeu3CKQvua1
kstv8NeTE/GgwrA77OhuabXpesRa4tXxjXA75WJOTucLOcUh1VSRqEjbyo/f+Pe/
KpHmbdexQvn745bq06IZOrrTokP42+mRjEgUZ14+5TBrXEwE42+9LL50MWrcT30w
AQin5j+BUDrrw0w3SNmecmXa4mr/Ztxs5ePBfV5Lh2j/PTyM4iyPVhMHzgIbWavC
12X3h15fvVdenHWrvbwo1J6vOYB010Y5wmSYxa4D7GnqN1NXTVpeFZVTeWBUj5CT
PeYqLwRNdMsPfIvHXdZZQeoABSbnTxdDjGHAPLDCKX56c6btIWnjMW0feIYOMY+J
HlswwquNKNWHX/eiRf22ZaJ6qPcGYsAcjrkUY4CkGs0uive9IWA=
=jSIn
-----END PGP SIGNATURE-----

--cbn74gutkvxdwhvl--
