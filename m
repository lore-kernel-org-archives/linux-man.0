Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E07D23BD03
	for <linux-man@vger.kernel.org>; Mon, 14 Sep 2026 21:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419812; cv=none; b=f9aq+00DzR3M+NqMvj9FOTfuWKLURE5a1Pzg4p2s/U976odwun0jcYQz+MPHVMRZkEJWEsYIiVMgir2p+w9kmo1LAglbwGnzm31jWnV9IJKlDMcTMLDaZF31WhHtSLE0eR9TBYOcVrH4HDiQM1qEpByKiPUTqgmXIFuFxv0DD+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419812; c=relaxed/simple;
	bh=YM5cCwpqWh0rYP0U5dJhx169EJp7rHP7qWSM7ms7Zys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jTHVRrjjqQcEoLm1APS28MmNxgWlXOBKPkyy4r5FzQysTcNLQu8dS7sRocZC9RekBwUPkxchbgHpqlPTue3/lnAq66Z20zHdECXAsYrztsVNHD1MX32gg8t39b8IKGaxG64CvAQUJkiLDs1wbZ8yfRrakyLIwgr/3orkBrT54Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LA0jxT9I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LA0jxT9I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFF71F000FF;
	Mon, 14 Sep 2026 21:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789419811;
	bh=vsWC3aSRhyC9we9fFDcahLlxGysiumCOn6m42rhzvf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LA0jxT9IQ1kMoJNScNjhH6iGOGNljXHNX48hDBw4t1XouMEV/RwqfYKCucdbIRpXK
	 L5eS6tgLooB+YlP9H4VukbncrsLBN44q5Hz5E0AnVgZafdI+oInhoQ2LYwWoF9zTkd
	 f/UnKZ9j8/8O5B5Z9mMA+dY4D3jSZbIv5yc6qs+CCmgv/XQ4ExCqnqGkdArde1/BgU
	 ZKTKxgagopF3JZOo7OuWQ+G/DOWHtRa5EB8TBFAi7xpGBxLgxGVYHFsPRCPcosszJg
	 YQVxa7qqkgm/IfViJfFn8F4b9sulJmr36mhbiqfF78YLVZ4Y2q7A6oQLh8DBVpogT6
	 9pVeC7zeaYKwg==
Date: Mon, 14 Sep 2026 23:03:27 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: Mark Harris <mark.hsj@gmail.com>, Petr Vorel <pvorel@suse.cz>, 
	linux-man@vger.kernel.org, Yeoul Na <yeoul_na@apple.com>, John McCall <rjmccall@apple.com>
Subject: Re: [PATCH 1/1] man/man2/request_key.2: Add missing GNU size
 forward-declarations
Message-ID: <aqhfPJo4BBnXn2I-@devuan>
References: <20260914111511.1610878-1-pvorel@suse.cz>
 <aqfd1_Xa_TbzE1ML@devuan>
 <20260914122442.GA1591402@pevik>
 <aqf1jJ1qxsTdw6kE@devuan>
 <CAMdZqKFVE-1-LkBR+ei77rd4dwXXS2AG_nySx5ACi61whtxG1g@mail.gmail.com>
 <aqg0173m_lx_UB4G@devuan>
 <4ec579cb8963a7221ee833dda507d062a787fd47.camel@tugraz.at>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gex7fp5i5imtfmbu"
Content-Disposition: inline
In-Reply-To: <4ec579cb8963a7221ee833dda507d062a787fd47.camel@tugraz.at>


--gex7fp5i5imtfmbu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: Mark Harris <mark.hsj@gmail.com>, Petr Vorel <pvorel@suse.cz>, 
	linux-man@vger.kernel.org, Yeoul Na <yeoul_na@apple.com>, John McCall <rjmccall@apple.com>
Subject: Re: [PATCH 1/1] man/man2/request_key.2: Add missing GNU size
 forward-declarations
Message-ID: <aqhfPJo4BBnXn2I-@devuan>
References: <20260914111511.1610878-1-pvorel@suse.cz>
 <aqfd1_Xa_TbzE1ML@devuan>
 <20260914122442.GA1591402@pevik>
 <aqf1jJ1qxsTdw6kE@devuan>
 <CAMdZqKFVE-1-LkBR+ei77rd4dwXXS2AG_nySx5ACi61whtxG1g@mail.gmail.com>
 <aqg0173m_lx_UB4G@devuan>
 <4ec579cb8963a7221ee833dda507d062a787fd47.camel@tugraz.at>
MIME-Version: 1.0
In-Reply-To: <4ec579cb8963a7221ee833dda507d062a787fd47.camel@tugraz.at>

Hi Martin,

> Date: 2026-09-14 20:34:07+0200
> From: Martin Uecker <uecker@tugraz.at>
>
> Am Montag, dem 14.09.2026 um 20:12 +0200 schrieb Alejandro Colomar:
> > Hi Mark,
> >=20
> > > Date: 2026-09-14 10:19:13-0700
> > > From: Mark Harris <mark.hsj@gmail.com>
> > >=20
> > > Alejandro Colomar wrote:
> > > > > Anyway N3207 (spec mentioned in d2c2db883) is something I'll need=
 to get used to :).
> > > >=20
> > > > There's a more recent paper with a slightly better spec (also compa=
tible
> > > > with GCC): N3681.
> > > > <https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3681.pdf>
> > >=20
> > > There is an even more recent paper addressing this subject, N3923
> > > <https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3923.pdf>,
> >=20
> > Indeed, there's that newer proposal.  It's a different one, though.
> >=20
> > > and the
> > > outcome from the last WG14 meeting was strong direction to proceed
> > > along these lines.
> >=20
> > The actual poll results are 15 in favour, 7 against, and 4 abstentions.
> > I wouldn't have called that "strong direction to proceed".  I know
> > that's what the minutes say, but I don't agree with how polls are taken
> > as strong direction.  7 votes against is quite vocal opposition.
> >=20
> > Here's a summary of the room feelings:
> > The committee was more or less (including myself) saying "as a user, I'd
> > like it, but as an implementor, it'd probably be a nightmare; as long as
> > implementors are okay with it, we're fine".  There was a comment from
> > one implementor of a small C compiler which essentially said it was
> > un-implementable for them, which raised some concerns.  From the
> > minutes:
> >=20
> > 	Uecker:	The SlimCC developer and another compiler developer
> > 		wrote in a discussion about general features that they
> > 		are worried about parameters for active declaration
> > 		scoping.  It is difficult for them to implement this.
> > 		They would rather implement template C++ functions.
> >=20
> > I suggested a way forward: first, write a proposal prohibiting the use
> > of parameter names in array length expressions that clash with variables
> > declared at an outer scope.  The wording would look like this (taken
> > from n3923 itself):
> >=20
> >     6.7.7.4  Function declarators
> > 	@@ p4+1
> > 	+Within a parameter declaration list,
> > 	+if an identifier used in a parameter=E2=80=99s array bound expression
> > 	+refers to a name declared later in the same list,
> > 	+no declaration of an identifier with the same name
> > 	+shall be visible from an enclosing scope.
> >=20
> > This would require that the following code results in a diagnostic:
> >=20
> > 	int n;
> > 	void foo(int a[n], int n);
>=20
> The - rather serious in my opinion - issue with having a constraint
> is that you can not always control what identifiers are in
> scope, or will come into scope ten years later when some library
> you happen to use adds a new symbol and then now breaks your code.
>=20
> Yes, for "n" this will not happen, for other symbols it might.
> The whole point of having scopes is that they shield the nested
> scopes from the outside.

I remember your concern.  But when I re-read the constraint today, I was
less concerned.  The thing is that the constraint is not triggered for
any clashes.  It's only triggered if all of the following happen:

	-  The identifier must be used in an array length expression.
	-  The identifier must be declared after the use in the array.

So, unless you're using retroactive declarations (which necessarily
needs this constraint, anyway), you shouldn't worry about the
constraint.  This code is fine:

	int n;
	void bar(int n, int a[n]);

> This becomes even more serious once you allow any kind of nested
> functions or lambdas, because then the collision surface becomes
> much larger.  If you insert lambdas via macros because people
> start to use them as a replacement for statement expressions, then
> you suddenly have macro that randomly fail to compile in
> specific contexts.

Still, as long as you don't use retroactive declarations in local
functions or function literals, you shouldn't worry.

> Maybe we should have both, forward declarations and some limited
> form of retroactive scoping.  Then one could fix collisions with
> a forward declaration that hides the outer symbol and harden
> macros.

Because of the above, I don't think this is needed.

I think forward declarations will still be useful in GCC, for example in
case you need --for some reason-- to specify a local function or a
function literal with an array declared before its length.  But this is
such a weird case that I think the standard could live without it.

> The issue that it would be a major pain to implement full
> retrospective scoping even in GCC remains.

Agree.  As a user, it seems great (given the constraints that make it
safe); as an implementor, it's a nightmare.

> I think the only
> realistic fix for this is to really narrow it down to a very
> limited set of expressions.
>=20
> Martin


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--gex7fp5i5imtfmbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqoYRkACgkQ64mZXMKQ
wqnL4g//QesgEkt0KjHPfXXaEXDn0Pt0YOmoPzp/qgF1dsvg6Cfu+QKxbln7PRiY
TBgNMlCZvHoNZyQmXSaG2SQG6G1fHTzEAET15rIxVOWwKO95ZwPNc1UQmwjJWGjo
JsH2P7L8qqlu0iMAXq020RC+0tFhXCpmYGX5YM/Hz8/3Q839Svc6nlSe6p0Mjs/g
8Zk4UxdR2VtYCsNXuznBIsni58PyjyBaP3c9dVT4lGp1tWg8RgV37P4/8bMcuRRY
n2gH/LjM3zpghXu6vFhtjJSw3AAWTmR+Jd+9KY9wDktmEEilkGiVG7N+eEpJe08Z
8vaGQ/0a4ojJeS5IijJXdlEDWCd5wScR1KxeLRt/JHUkqTEpXxQWiKBC3+rPwXFN
p0bHKCcWqCgDdlaCsqXt+641Ps5nAUL1rCFq1UzV3msR1CS8Mx4PI9uushWR2UL6
QlReaZKS7lOeWJ8xWrDM8fxTbg9krgGpBrbv5/AQQS2J+9poGVOTivjpe9cIU2xr
3Xiwu70DeSxFc0whc33rjos6Azx7H41CWRAQsGERLm3XaDIwlT9Jy9/GbLrcP743
DAK9KE+l6HLjPQfODpVp9VEAUrX+Pj1lkNir3Ua+xtW9k8RjWQ7hZZj5PjOmL88O
6UkXpVbqqiFzq5bSmE+sRBato9y2cUvxJZbXKxFu5IUlF8pxJW0=
=U9Ac
-----END PGP SIGNATURE-----

--gex7fp5i5imtfmbu--
