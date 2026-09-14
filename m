Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BAD382F03
	for <linux-man@vger.kernel.org>; Mon, 14 Sep 2026 18:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789409542; cv=none; b=m17DcDXhmPBbilco2/9MS3TJOYJkQ4z+xO+8g6XWgc13mqXWF7yhh2eJypLGQD0dk0XxkZsyYnRNHL8eXSHg4YjSZN3nglA5KwUOUwGFgVBGiFjGFha3BnZypfbSfpa4gXsUwXFhC8UBM8LPm8Yb2W9NfRkTBBY6tRSW4JRi1mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789409542; c=relaxed/simple;
	bh=Qk36hfj1ek1mZf41zMGFz802pMpFuRaloWXY4Ulf7rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1/S0/SiSn0XU7IVJnj8gJWSCpIsslfA9tQzxcdGkEbqP8MHbnFVGuAFWq63NApmWmsZajWvHa+NOd59SlgTiRxN9Xr1PRh9s/HgZRN6il6e/EIchxl4pLtOdW1C5MnYE8dQlMcQtkY5jWXzaZzJvO9L0+HY/vAchhsWfMy/0OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWItbIrT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWItbIrT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1D51F000FF;
	Mon, 14 Sep 2026 18:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789409540;
	bh=sSDD7c4Jk4h6z29AEnVlTAJxulzFaWnP7L6Z7Rf6ybw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UWItbIrTW7Wmc0bLURfBzR4p2BX15w8bS/fUJRimzqDQ5iFTVHNDm0PeIuqeyfAlC
	 Bp73ZzE0hgjyjRMMoJPlKpCb4Ie1pBMY0Hg0mrjxGagdkvKZCwaMy2sKaEkpgMUUlt
	 ZeHfVzcaZWvhhgYK1pAOUvTFCh86jgzIQDjHSaK+tquBDSwspq1g3na3NgwGn0Jmjt
	 AyziIF9WO5qO7P8myz8dmwd1G8CbI7KzS2X9ptz/E6hj8Bo4aoQvMDNOPkcQGvZ7jh
	 wY70EdI0rMYVLuOPpaXb523wFcI9Dw/N6o2oW1AIQIfzbhuBzx6+lc/4nGzDheCnGZ
	 FgOyZq40vzMBw==
Date: Mon, 14 Sep 2026 20:12:17 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: Petr Vorel <pvorel@suse.cz>, linux-man@vger.kernel.org, 
	Martin Uecker <uecker@tugraz.at>, Yeoul Na <yeoul_na@apple.com>, John McCall <rjmccall@apple.com>
Subject: Re: [PATCH 1/1] man/man2/request_key.2: Add missing GNU size
 forward-declarations
Message-ID: <aqg0173m_lx_UB4G@devuan>
References: <20260914111511.1610878-1-pvorel@suse.cz>
 <aqfd1_Xa_TbzE1ML@devuan>
 <20260914122442.GA1591402@pevik>
 <aqf1jJ1qxsTdw6kE@devuan>
 <CAMdZqKFVE-1-LkBR+ei77rd4dwXXS2AG_nySx5ACi61whtxG1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uez43eqmdey5u6ek"
Content-Disposition: inline
In-Reply-To: <CAMdZqKFVE-1-LkBR+ei77rd4dwXXS2AG_nySx5ACi61whtxG1g@mail.gmail.com>


--uez43eqmdey5u6ek
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: Petr Vorel <pvorel@suse.cz>, linux-man@vger.kernel.org, 
	Martin Uecker <uecker@tugraz.at>, Yeoul Na <yeoul_na@apple.com>, John McCall <rjmccall@apple.com>
Subject: Re: [PATCH 1/1] man/man2/request_key.2: Add missing GNU size
 forward-declarations
Message-ID: <aqg0173m_lx_UB4G@devuan>
References: <20260914111511.1610878-1-pvorel@suse.cz>
 <aqfd1_Xa_TbzE1ML@devuan>
 <20260914122442.GA1591402@pevik>
 <aqf1jJ1qxsTdw6kE@devuan>
 <CAMdZqKFVE-1-LkBR+ei77rd4dwXXS2AG_nySx5ACi61whtxG1g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMdZqKFVE-1-LkBR+ei77rd4dwXXS2AG_nySx5ACi61whtxG1g@mail.gmail.com>

Hi Mark,

> Date: 2026-09-14 10:19:13-0700
> From: Mark Harris <mark.hsj@gmail.com>
>
> Alejandro Colomar wrote:
> > > Anyway N3207 (spec mentioned in d2c2db883) is something I'll need to =
get used to :).
> >
> > There's a more recent paper with a slightly better spec (also compatible
> > with GCC): N3681.
> > <https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3681.pdf>
>=20
> There is an even more recent paper addressing this subject, N3923
> <https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3923.pdf>,

Indeed, there's that newer proposal.  It's a different one, though.

> and the
> outcome from the last WG14 meeting was strong direction to proceed
> along these lines.

The actual poll results are 15 in favour, 7 against, and 4 abstentions.
I wouldn't have called that "strong direction to proceed".  I know
that's what the minutes say, but I don't agree with how polls are taken
as strong direction.  7 votes against is quite vocal opposition.

Here's a summary of the room feelings:
The committee was more or less (including myself) saying "as a user, I'd
like it, but as an implementor, it'd probably be a nightmare; as long as
implementors are okay with it, we're fine".  There was a comment from
one implementor of a small C compiler which essentially said it was
un-implementable for them, which raised some concerns.  From the
minutes:

	Uecker:	The SlimCC developer and another compiler developer
		wrote in a discussion about general features that they
		are worried about parameters for active declaration
		scoping.  It is difficult for them to implement this.
		They would rather implement template C++ functions.

I suggested a way forward: first, write a proposal prohibiting the use
of parameter names in array length expressions that clash with variables
declared at an outer scope.  The wording would look like this (taken
=66rom n3923 itself):

    6.7.7.4  Function declarators
	@@ p4+1
	+Within a parameter declaration list,
	+if an identifier used in a parameter=E2=80=99s array bound expression
	+refers to a name declared later in the same list,
	+no declaration of an identifier with the same name
	+shall be visible from an enclosing scope.

This would require that the following code results in a diagnostic:

	int n;
	void foo(int a[n], int n);

But it would allow the following code without diagnostics:

	int n;
	void bar(int n, int a[n]);
	void baz(int a[n]);

This is obviously a good constraint, since it disallows code that is
most likely already broken, and doesn't affect code that works fine.

Once that constraint is in place, we could add --as a second proposal--
retroactive declaration of parameters being optional (so that small
compilers can say they don't support it), but we'll be sure that code
will not misbehave on such compilers.

>  Hopefully this much more human-readable approach
> will prevail and we can do away with these confusing forward
> declarations in parameter lists.

Agree.


Have a lovely day!
Alex

>=20
>  - Mark

--=20
<https://www.alejandro-colomar.es>

--uez43eqmdey5u6ek
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqoOPsACgkQ64mZXMKQ
wqnzng/7B2MKtrkdlWHD5CZsmidRj/IOBFyfjN3UZesDD45blOpWr+E0S5KZXIi+
M/9Fca79dHlKvL3512MDg3Cc5OxdYB3eI/fVrr93rdNHn2kV2S0ZblfO0DVgEesK
a5Ex9LxgC7pu5gxUcA3NlEAdYymiDPH1C8R+VAAa6lk65E2WA+uHeWzopuHudzQi
GVOOL1xiLEtXjkPNHMPz4V7cSj/xMaBmonTNSmW6VBSp2vljv3cNYCSwqnpW1FJp
oDVFi6YAdDeHrgLDKNUHgVR6aQ6T0VlBphseVmP7gOu50coE7pLnncgqC/NNoVct
W4tDGF8eLUBZZcEpNqNWve7uSht1grZkLolKRaVTRE8TfNR8Xls98zcSF2vU1ko2
E4qrln1RYyhS9w81ciZxYivcHEbpJ3u+lU2TDR5L7hBXB2ios3ik/AOLJ5R77hJq
5UpI7eMZtRbPiY5nI93WOaqUlYLaKT7LLz6DoGg2Ei7E4BRdhAW7Hen0N4WVnEhd
eicoN6XMPJYfCsTh2YZQiKC9LDc3CE+gqMwlQ9rvhE/oqDCy0u3HEG62m5y1yovE
HXCfhmTu7QjjfR2CFTdwngh40w50rKFzZIERXI3rlVrScOnsvibxumdcEHnRokmU
+xbT0Q/B9OX9L6JxU0vS1BL6kBjFRRi1yjYNGRjmutl3Wj3u9Ms=
=TNlZ
-----END PGP SIGNATURE-----

--uez43eqmdey5u6ek--
