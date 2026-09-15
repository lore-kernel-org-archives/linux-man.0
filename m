Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D8C463B96
	for <linux-man@vger.kernel.org>; Tue, 15 Sep 2026 09:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462928; cv=none; b=MmCvPMwau/5v91HQMxh4o0OLwMmIES93o1lniF20AAN8XEZjYCsRRZk6lGaFRqw5wEi+Y3Qj/BGmP6jFsFFYo775L9GN2JgXwq32Juj1pdgvavbr3tIxNfnMd1MKJlidpfX9RDPukV11m146n8S/Jw2j5+LG6B63q5yHqR2LoT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462928; c=relaxed/simple;
	bh=i3p9NBwmHqXLHGD6a/Lx1FKcS7QeJpLEbXjSCFwgjw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dcoZv7QmUjZKFGa4fNU82AuhPoatktGhAN0YCKenzopHdzp4l9WxsAdvjHn6hMp9rE+oPQivH7h/3oL5GUV6g9LfJmpUmgdwxTW4DlKH0h3dQhGCyLi9esrPQkjbLdLNlGfYzPTXi3emtzpBNnXDGAEpzqnsuYJKPFvZ91n75iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wtlc/uCJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wtlc/uCJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545021F00893;
	Tue, 15 Sep 2026 09:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789462926;
	bh=ZuE3y/jRqs/K9F3kkNJRGCgNdx290ktIeokrLPpbQ98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wtlc/uCJ3OAM6oAaDswDd8eDpcmrRDY+SAD/BfXk0zcIStyQnCpNQwQAPlLotvslt
	 kPBTVmhPnhDVtYAfNK8cq1NNMoILUdU0b2bGclyAETwqZ8YpOtZ4hQVUdvfAcprHVS
	 6GsTHRxTP5z+Cd93CKqCpHuHMZUSaSpe8i2wQLuFEzKT898P4SfihecEp7Mj0Ln9p7
	 /oka+OQT7J9jlJpstVnd0qG6P0NXQmmD2Lzwfdut6veHOv/JA+WKll/ze0d/DYwT1M
	 dy/BIXKOrIPTB1EKmmFkj75oz2Mj/tah2DHPzJueUxYplGeAoIyFsRA5rFaQEbXDFk
	 0Zzl3C06lTWQg==
Date: Tue, 15 Sep 2026 11:02:00 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: Mark Harris <mark.hsj@gmail.com>, Petr Vorel <pvorel@suse.cz>, 
	linux-man@vger.kernel.org, Yeoul Na <yeoul_na@apple.com>, John McCall <rjmccall@apple.com>
Subject: Re: [PATCH 1/1] man/man2/request_key.2: Add missing GNU size
 forward-declarations
Message-ID: <aqkDizAvyqOLJw-g@devuan>
References: <20260914111511.1610878-1-pvorel@suse.cz>
 <aqfd1_Xa_TbzE1ML@devuan>
 <20260914122442.GA1591402@pevik>
 <aqf1jJ1qxsTdw6kE@devuan>
 <CAMdZqKFVE-1-LkBR+ei77rd4dwXXS2AG_nySx5ACi61whtxG1g@mail.gmail.com>
 <aqg0173m_lx_UB4G@devuan>
 <4ec579cb8963a7221ee833dda507d062a787fd47.camel@tugraz.at>
 <aqhfPJo4BBnXn2I-@devuan>
 <1f86348ce948d9e8899b8abaffb8eac0e86b244f.camel@tugraz.at>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ogmeykhc62xnuyxg"
Content-Disposition: inline
In-Reply-To: <1f86348ce948d9e8899b8abaffb8eac0e86b244f.camel@tugraz.at>


--ogmeykhc62xnuyxg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: Mark Harris <mark.hsj@gmail.com>, Petr Vorel <pvorel@suse.cz>, 
	linux-man@vger.kernel.org, Yeoul Na <yeoul_na@apple.com>, John McCall <rjmccall@apple.com>
Subject: Re: [PATCH 1/1] man/man2/request_key.2: Add missing GNU size
 forward-declarations
Message-ID: <aqkDizAvyqOLJw-g@devuan>
References: <20260914111511.1610878-1-pvorel@suse.cz>
 <aqfd1_Xa_TbzE1ML@devuan>
 <20260914122442.GA1591402@pevik>
 <aqf1jJ1qxsTdw6kE@devuan>
 <CAMdZqKFVE-1-LkBR+ei77rd4dwXXS2AG_nySx5ACi61whtxG1g@mail.gmail.com>
 <aqg0173m_lx_UB4G@devuan>
 <4ec579cb8963a7221ee833dda507d062a787fd47.camel@tugraz.at>
 <aqhfPJo4BBnXn2I-@devuan>
 <1f86348ce948d9e8899b8abaffb8eac0e86b244f.camel@tugraz.at>
MIME-Version: 1.0
In-Reply-To: <1f86348ce948d9e8899b8abaffb8eac0e86b244f.camel@tugraz.at>

Hi Martin,

> Date: 2026-09-15 08:08:24+0200
> From: Martin Uecker <uecker@tugraz.at>
>
> Am Montag, dem 14.09.2026 um 23:03 +0200 schrieb Alejandro Colomar:
> > Hi Martin,
> >=20
> > > Date: 2026-09-14 20:34:07+0200
> > > From: Martin Uecker <uecker@tugraz.at>
> > >=20
> > > Am Montag, dem 14.09.2026 um 20:12 +0200 schrieb Alejandro Colomar:
> > > > Hi Mark,
>=20
> ..
>=20
> > > >=20
> > > > The actual poll results are 15 in favour, 7 against, and 4 abstenti=
ons.
> > > > I wouldn't have called that "strong direction to proceed".  I know
> > > > that's what the minutes say, but I don't agree with how polls are t=
aken
> > > > as strong direction.  7 votes against is quite vocal opposition.
> > > >=20
> > > > Here's a summary of the room feelings:
> > > > The committee was more or less (including myself) saying "as a user=
, I'd
> > > > like it, but as an implementor, it'd probably be a nightmare; as lo=
ng as
> > > > implementors are okay with it, we're fine".  There was a comment fr=
om
> > > > one implementor of a small C compiler which essentially said it was
> > > > un-implementable for them, which raised some concerns.  From the
> > > > minutes:
> > > >=20
> > > > 	Uecker:	The SlimCC developer and another compiler developer
> > > > 		wrote in a discussion about general features that they
> > > > 		are worried about parameters for active declaration
> > > > 		scoping.  It is difficult for them to implement this.
> > > > 		They would rather implement template C++ functions.
> > > >=20
> > > > I suggested a way forward: first, write a proposal prohibiting the =
use
> > > > of parameter names in array length expressions that clash with vari=
ables
> > > > declared at an outer scope.  The wording would look like this (taken
> > > > from n3923 itself):
> > > >=20
> > > >     6.7.7.4  Function declarators
> > > > 	@@ p4+1
> > > > 	+Within a parameter declaration list,
> > > > 	+if an identifier used in a parameter=E2=80=99s array bound expres=
sion
> > > > 	+refers to a name declared later in the same list,
> > > > 	+no declaration of an identifier with the same name
> > > > 	+shall be visible from an enclosing scope.
> > > >=20
> > > > This would require that the following code results in a diagnostic:
> > > >=20
> > > > 	int n;
> > > > 	void foo(int a[n], int n);
> > >=20
> > > The - rather serious in my opinion - issue with having a constraint
> > > is that you can not always control what identifiers are in
> > > scope, or will come into scope ten years later when some library
> > > you happen to use adds a new symbol and then now breaks your code.
> > >=20
> > > Yes, for "n" this will not happen, for other symbols it might.
> > > The whole point of having scopes is that they shield the nested
> > > scopes from the outside.
> >=20
> > I remember your concern.  But when I re-read the constraint today, I was
> > less concerned.  The thing is that the constraint is not triggered for
> > any clashes.  It's only triggered if all of the following happen:
> >=20
> > 	-  The identifier must be used in an array length expression.
> > 	-  The identifier must be declared after the use in the array.
> >=20
> > So, unless you're using retroactive declarations (which necessarily
> > needs this constraint, anyway), you shouldn't worry about the
> > constraint.  This code is fine:
> >=20
> > 	int n;
> > 	void bar(int n, int a[n]);
>=20
> I don't see why you need the constraint.  You can just change
> scoping rules so that the inner "n" shadows the outside, making
> the code work as intended.
>=20
> > > This becomes even more serious once you allow any kind of nested
> > > functions or lambdas, because then the collision surface becomes
> > > much larger.  If you insert lambdas via macros because people
> > > start to use them as a replacement for statement expressions, then
> > > you suddenly have macro that randomly fail to compile in
> > > specific contexts.
> >=20
> > Still, as long as you don't use retroactive declarations in local
> > functions or function literals, you shouldn't worry.
>=20
> I don't see how you come to this conclusion, I think it is
> an issue even at file scope.=20

Let's quote the text of the constraint, and I'll numerate the lines:

    6.7.7.4  Function declarators
	@@ p4+1
1	+Within a parameter declaration list,
2	+if an identifier used in a parameter=E2=80=99s array bound expression
3	+refers to a name declared later in the same list,
4	+no declaration of an identifier with the same name
5	+shall be visible from an enclosing scope.

Let's write a translation unit:

	// foo.c

	int n;  // global 'n'

	void f(int n);  // fine, doesn't trigger line 2; it shadows

	void g(int n, int a[n]);  // fine, doesn't trigger line 3; it shadows

	void h(int a[n]);  // fine, doesn't trigger line 3; uses global 'n'

	void i(int a[n], int n);  // Constraint violation

	void j(int n; int a[n], int n);  // Constraint violation, but see below

Does it make sense now?

I would relax the constraint for case j(), since it's clearly okay.
Since forward declarations are non-standard, we can't have the standard
wording say something about forward declarations, but as QoI, I'd not
trigger the diagnostic for j().

> > > Maybe we should have both, forward declarations and some limited
> > > form of retroactive scoping.  Then one could fix collisions with
> > > a forward declaration that hides the outer symbol and harden
> > > macros.
> >=20
> > Because of the above, I don't think this is needed.
> >=20
> > I think forward declarations will still be useful in GCC, for example in
> > case you need --for some reason-- to specify a local function or a
> > function literal with an array declared before its length.  But this is
> > such a weird case that I think the standard could live without it.
>=20
> Is your argument that people simply will not use retrospective scoping
> for new code anyway, so it is not a practical problem?=20

My arguments is that currently, the following code has a meaning:

	int n;

	void i(int a[n], int n);

If we add retroactive scoping, the semantics of that code would change.
(Add 'static' if you care about ISO C not respecting [n].)
Thus, functions using retroactive scoping need to prohibit this code,
to avoid silent changes.

As long as the constraint affects only functions using retroactive
scoping and functions that we agree are currently bad (because they look
like retroactive scoping, but they aren't), the constraint seems
positive.

> I am not sure about this, I have seen WG14 add new functions with
> the size later because people insisted it is more ideomatic (despite
> the charter saying this should not be done).

And I still do it for new str*() and mem*() functions, because, indeed,
it is more idiomatic/consistent with related APIs.

But that's a conscious decision.  If you add such a function, then you
either use GNU C's forward declarations to avoid the constraint, or you
use a parameter name that you know won't be used elsewhere.

libc has it easy: a name reserved in the global namespace (__n) would
work.  It only needs to be self consistent, and not declare __n
globally.  Other libraries will have to prefix the parameters with the
library prefix, I guess.

If you add a local/literal function, then you need to be more careful
with the parameter name.  Or just don't use retroactive scoping.  It's
a conscious decision.  In GNU C, we have the tools available.

I would love to see forward declarations standardized so that everyone
can use them to avoid this constraint in the simplest way.  They are
compatible with retroactive scoping, so we could see both standardized.
But that's orthogonal.


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--ogmeykhc62xnuyxg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqpCYIACgkQ64mZXMKQ
wqm7fxAAkutFJtxN1Lq9IfePs/OoOUagbNkFVAaJa4ZTDD2WPyDe5oojCeSaGWt8
HBdZD8foKe0vWQRiO2bsyBs4hfSq7TbdIuMtGfji3iUaZoQ83PEDZ2IeMEvtzbJW
2mJdJ+JB+F6g2MxQ5KsyeT6Y2Wn3sWop1HBZU4H1lOFAP6UoWZ94zULMzlUUBLgJ
m1SsDQCF+ljCj//qAu51J4m91xi7u5EPw/eekal16d7gWVNOjjzvnQXubwLjaNIL
Me8hQc9AElg3t+RW4cuMzEX2s1gpZOWPe3idjV991w0JXXX0WXNU7rLssGPnh76C
peVMSMyh8vMQVsoONvY5TRtZXM0hbz53O2DBKJvmtyTEclw+Bjn8JgrRkS4LL//O
nvTltuGm9qR8PCAQj5d6c7A9ABHsCH4amzfC6p2O/AlSTb6i/n0W1LnG0P0eu8nh
krJvWL5JLtVEGqHfI3ncRGtbw+uqNERm7fX3hF+2+ocLHhZUkNPDEvFjq2rakLQx
vQsZPGTPV7mTYqeeKMFV15zEXMGBCXIJ8yE0D8tYbcPPbtUSGomCSa9bopbnozAT
mkUC5QX4VqEirDOfaZ2tMQZWhsCnSo0OG9ATv3d6NZRV+URLlAzGBT3AeKvCZdLV
Iru7Wk1XASA38t/HYiesbUVA8pEWF2ngvVoPgofkbJ0yU6b99GI=
=4w8D
-----END PGP SIGNATURE-----

--ogmeykhc62xnuyxg--
