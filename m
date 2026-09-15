Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D365E395240
	for <linux-man@vger.kernel.org>; Tue, 15 Sep 2026 09:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466398; cv=none; b=SuXtEiCx3yNLs4khmYZXVYsK5C/3OKFzIGazbFkx+VTCPMGdBGS7K5ZdA2Kk6gwv6l8/DXkAOsTYVyVmVQFs4w1+wqfkWWOjSAlmlPLyTprR6N3GfmgQuw1EoKcgvpRlPRe3LNz2NtOqO7tcVeItNibhabvq+tk+fyGb8qNiM4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466398; c=relaxed/simple;
	bh=w8qEt9e/yLgOEmuLkcuL9YRICwqlo99LQXMnz8qNdrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGwpLj6sckVk4d5EESEpI3oqShLYmFcAxFL9RifxoIJhi2AJmGF+/emdSjsDW8JLIzP4IPxr022gSkf/9puisBFDpNehIL3aIl+clNRrW/hS1AYUHcb7x8o+21r7EmjXg83TI+Oxh+eHGTsCIBJc+nmFX74Luay7l15gQ1xq/T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWDVpDoo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWDVpDoo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACFC1F000FF;
	Tue, 15 Sep 2026 09:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789466396;
	bh=LaeZD/04SYgMSsxK5Z1Hs+TuAVdHeh9oDpzw0s4vDx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AWDVpDooxtl8INJN873bcPU0r411ffUMQKWmQPnTziPdyVVQaVFUZep4xpJj5BF72
	 RljeX2S9gJipvIo5DKQ28vbJVcYK04Z6uPGBzUSz9FCpgki7I+hPtMA3XLlUyWF+Yt
	 xb8LjdavpxNEuE7BqoWgsPigQR5juF0VbMtkRJMR0aehKMJ8AoZd4poXFM+DxJgVA+
	 Lf6XX08w9rESkIstbb0DjJ6x4V1dQi38E6R+khD94LIzOr48HJzMmPi5ww0NacYMW9
	 Y0Y5NVyWeeAwwFa3bkvQwNzHh7lvZw7wZo0viUBGA7m5+6uYaU47OCfggP9yMGjiEO
	 aqa27BVrjpdeg==
Date: Tue, 15 Sep 2026 11:59:52 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: Mark Harris <mark.hsj@gmail.com>, Petr Vorel <pvorel@suse.cz>, 
	linux-man@vger.kernel.org, Yeoul Na <yeoul_na@apple.com>, John McCall <rjmccall@apple.com>
Subject: Re: [PATCH 1/1] man/man2/request_key.2: Add missing GNU size
 forward-declarations
Message-ID: <aqkVrTjkEDcSHK7h@devuan>
References: <aqfd1_Xa_TbzE1ML@devuan>
 <20260914122442.GA1591402@pevik>
 <aqf1jJ1qxsTdw6kE@devuan>
 <CAMdZqKFVE-1-LkBR+ei77rd4dwXXS2AG_nySx5ACi61whtxG1g@mail.gmail.com>
 <aqg0173m_lx_UB4G@devuan>
 <4ec579cb8963a7221ee833dda507d062a787fd47.camel@tugraz.at>
 <aqhfPJo4BBnXn2I-@devuan>
 <1f86348ce948d9e8899b8abaffb8eac0e86b244f.camel@tugraz.at>
 <aqkDizAvyqOLJw-g@devuan>
 <856e88cd5491195531ad21d6b338620a29d18af6.camel@tugraz.at>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fqne5kjhk3jn7gxc"
Content-Disposition: inline
In-Reply-To: <856e88cd5491195531ad21d6b338620a29d18af6.camel@tugraz.at>


--fqne5kjhk3jn7gxc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: Mark Harris <mark.hsj@gmail.com>, Petr Vorel <pvorel@suse.cz>, 
	linux-man@vger.kernel.org, Yeoul Na <yeoul_na@apple.com>, John McCall <rjmccall@apple.com>
Subject: Re: [PATCH 1/1] man/man2/request_key.2: Add missing GNU size
 forward-declarations
Message-ID: <aqkVrTjkEDcSHK7h@devuan>
References: <aqfd1_Xa_TbzE1ML@devuan>
 <20260914122442.GA1591402@pevik>
 <aqf1jJ1qxsTdw6kE@devuan>
 <CAMdZqKFVE-1-LkBR+ei77rd4dwXXS2AG_nySx5ACi61whtxG1g@mail.gmail.com>
 <aqg0173m_lx_UB4G@devuan>
 <4ec579cb8963a7221ee833dda507d062a787fd47.camel@tugraz.at>
 <aqhfPJo4BBnXn2I-@devuan>
 <1f86348ce948d9e8899b8abaffb8eac0e86b244f.camel@tugraz.at>
 <aqkDizAvyqOLJw-g@devuan>
 <856e88cd5491195531ad21d6b338620a29d18af6.camel@tugraz.at>
MIME-Version: 1.0
In-Reply-To: <856e88cd5491195531ad21d6b338620a29d18af6.camel@tugraz.at>

Hi Martin,

> Date: 2026-09-15 11:45:31+0200
> From: Martin Uecker <uecker@tugraz.at>
>
[...]
> > Let's quote the text of the constraint, and I'll numerate the lines:
> >=20
> >     6.7.7.4  Function declarators
> > 	@@ p4+1
> > 1	+Within a parameter declaration list,
> > 2	+if an identifier used in a parameter=E2=80=99s array bound expression
> > 3	+refers to a name declared later in the same list,
> > 4	+no declaration of an identifier with the same name
> > 5	+shall be visible from an enclosing scope.
> >=20
> > Let's write a translation unit:
> >=20
> > 	// foo.c
> >=20
> > 	int n;  // global 'n'
> >=20
> > 	void f(int n);  // fine, doesn't trigger line 2; it shadows
> >=20
> > 	void g(int n, int a[n]);  // fine, doesn't trigger line 3; it shadows
> >=20
> > 	void h(int a[n]);  // fine, doesn't trigger line 3; uses global 'n'
> >=20
> > 	void i(int a[n], int n);  // Constraint violation
> >=20
> > 	void j(int n; int a[n], int n);  // Constraint violation, but see below
> >=20
> > Does it make sense now?
>=20
> I already understand that. I do not want
>=20
> int n;
> void i(int a[n], int n);
>=20
> to be a constraint violation, because if I write
>=20
> void i(int a[n], int n);
>=20
> and any header that later puts an "n" into file scope somewhere, even
> in a library maintained by somebody else, perhaps a decade after the
> original code was written, this then may cause a surprising
> compilation errors.  It is an action at a distance issue nobody
> needs.
>=20
>=20
> And the only reason why this may seem unlikely in this toy example
> is that nobody would use a single letter "n" as a global variable, but
> in real code not all parameters have such short names.
>=20
> >=20
> > I would relax the constraint for case j(), since it's clearly okay.
> > Since forward declarations are non-standard, we can't have the standard
> > wording say something about forward declarations, but as QoI, I'd not
> > trigger the diagnostic for j().
> >=20
[...]
> > My arguments is that currently, the following code has a meaning:
> >=20
> > 	int n;
> >=20
> > 	void i(int a[n], int n);
> >=20
> > If we add retroactive scoping, the semantics of that code would change.
> > (Add 'static' if you care about ISO C not respecting [n].)
> > Thus, functions using retroactive scoping need to prohibit this code,
> > to avoid silent changes.
>=20
> On a theoretical level I can understand your argument.  But in
> reality this is a purely theoretical issue as nobody writes such=C2=A0
> code.  Even using a global variable as length is already extremely
> rare, but then using the same name as parameter while intending
> to use the original global variable would seem to make such code
> so unlikely that I do not think it exists.
>=20
> What is more common is to use a constant, e.g. a macro or
> enumeration value.
>=20
> void i(int a[MAX_DIMS], int n);
>=20
> But then again, it seems very unlikely that writes
>=20
> enum { MAX_DIMS =3D 100 };
>=20
> void i(int a[MAX_DIMS], int MAX_DIMS);
>=20
> with the intention that the first MAX_DIMS actually
> refers to the global variable and not to the parameter.
> If such code exits, it is=C2=A0 almost certainly already an
> unintentional error.

And you would not diagnose such an unintentional error?

I think this seems to trigger again the discussion about whether we want
constraints for things that should be diagnostics, but where the user
should be allowed to continue translation.

I guess I can live without the constraint, because QoI will result in
compilers diagnosing this anyway.  I expect GCC would add a new value
-Wshadow=3Dretroactive-parameter or something like that to warn
specifically about this situation.

> > As long as the constraint affects only functions using retroactive
> > scoping and functions that we agree are currently bad (because they look
> > like retroactive scoping, but they aren't), the constraint seems
> > positive.
>=20
> It would be positive (although largely irrelevant), if not for=C2=A0
> the action-at-a-distance issue above (which I do not think is
> irrelevant).
>=20
> > > I am not sure about this, I have seen WG14 add new functions with
> > > the size later because people insisted it is more ideomatic (despite
> > > the charter saying this should not be done).
> >=20
> > And I still do it for new str*() and mem*() functions, because, indeed,
> > it is more idiomatic/consistent with related APIs.
> >=20
> > But that's a conscious decision.  If you add such a function, then you
> > either use GNU C's forward declarations to avoid the constraint, or you
> > use a parameter name that you know won't be used elsewhere.
>=20
> Forward declaration are not standardized, so people avoid them.
>=20
> But the issue of name collision in local contexts is much more
> serious.  This is exactly the reason people come up with sophisticated
> macro contraptions to create unique names for temporaries in
> macros, and why people ask for lambdas to have clean alternative
> instead that does not have such fundamental problems.  Introducing
> lambdas, but then breaking this in a way that it has the same issue
> would be really a terrible idea.=20
>=20
> But, yes, this was my point: If we added that constraint,=C2=A0
> something like forward declarations could be used to avoid writing
> fragile macros.
>=20
> >=20
> > libc has it easy: a name reserved in the global namespace (__n) would
> > work.  It only needs to be self consistent, and not declare __n
> > globally.  Other libraries will have to prefix the parameters with the
> > library prefix, I guess.
>=20
> I do not think that breaking fundamental language features such as scopin=
g,
> and requiring everybody to prefix all their names to prevent collisions
> is a viable.  Also a single prefix is not enough in nested macros, you
> would need a unique identifier in each nested instance.
>=20
[...]
>=20
> Simple not having the constraint would also be ok with me.

Agreed.


Cheers,
Alex

>=20
> Martin
>=20

--=20
<https://www.alejandro-colomar.es>

--fqne5kjhk3jn7gxc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqpFxIACgkQ64mZXMKQ
wqkuuBAApA9bg+Ov5obHcAbKBUJ7TMpp/3RHLTrni2BH0j8K/0c4Q/CgKygpDkVh
v3qS6ucnoLZ4SJP5THfvH7m6FdEmOBXeYJH90UulHde9p/lXH8WYP6IgITiTtTvV
7ud/rygLZOh55N0hftI9g0VWVDGdtW9WVYgmPIX57BNe6zDu/RbhSlQBk//aKGp2
ryCfPbUqAVb8Hof/8eIkYKj+6L25i/HSNJ5EIvv/JFNTIQbJJ9YeYlBjRfdeALCb
wWo4nqZ8HYma6RMdAYBH8VeRb+vJl/LZbuc5eshb144qjRJv7lj6trLoKtgqbufK
EkVeIQkwPSdhpH9BqqChhLYIRCJSSqEh7zBi0DMPD5r+3RafWUNcG7zCnh8VRtVr
iS4bR+1IVhjMoFcUsw7V1ZJu8vYPHLgjTCM6yBsjaXH8DnDIwEtUFQx4ebZcIad3
8iFHOOCHdgWXYHg5TbhUJc5zefNWBIOovs4WMk5qQpUC2rJo7TbFy0X5qjlxQ4MM
MlscpWWvYvRF42m288DJ6hP1/iabnjkiItK8xJ2uUNq5bkI2oxt76uiXVZ574SSw
b4h5CbtE460ng6UmU34QJfds42vQm3Uka5tZ535iG503JOX3eVvzced/Alhs+Bky
houoguwXvkboYTqYrTxOO2zeP8DCymnSgma/S6hKudHTwU4iJVc=
=yI7c
-----END PGP SIGNATURE-----

--fqne5kjhk3jn7gxc--
