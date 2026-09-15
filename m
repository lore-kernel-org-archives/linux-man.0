Received: from mailrelay.tugraz.at (mailrelay.tugraz.at [129.27.2.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D8543E9F9
	for <linux-man@vger.kernel.org>; Tue, 15 Sep 2026 09:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.27.2.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465554; cv=none; b=K845HHqgQuHW8+6+Eio1H2O909LubaYH7C+V6Gpv9tdDQoxU7+jwIytyPl4kwWrdWRqsfhpz2o2+L1LYD3edCl0pY1/Rp0N4wS79SE6FaLO+Tq6x6p3Xc2To1XL48IgUGQ6fDxIAJamoJ6Va/52hJuUzHEAbFeuWXZ+7mTacxFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465554; c=relaxed/simple;
	bh=f5QP7q7sVhFdowXiUtfHGTTZUbFlZlJ8l+HkS71vVUY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cEZv/Pbi/3yNmD36SorBKz1oeWWDBAH2mavquXmHICpB68Zwx7/h9TRGn8oytDMPJk44MsV22lRvci0iKeBcmZO/87+xnY3O6Gt1Q4cS9mM+bSK+UWLeP/gmM+OumYq8ZmHPPu0KMlyh1T/Mh7rFSs9ClXlG/VscjhKX4mrpbik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tugraz.at; spf=pass smtp.mailfrom=tugraz.at; dkim=pass (1024-bit key) header.d=tugraz.at header.i=@tugraz.at header.b=hASNjXGD; arc=none smtp.client-ip=129.27.2.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tugraz.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tugraz.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tugraz.at header.i=@tugraz.at header.b="hASNjXGD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tugraz.at;
	s=mailrelay; t=1789465531;
	bh=n+AecaBiEGDhIdcqA6xNkHiX3egr7MC4PCZfw6357+g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hASNjXGDCiTfJaclTFgigFHf/n2qzD2JZfefgYLi8+c3s5W26ki9oQhZjy8QHj4WQ
	 JOil5VkQ1apGcugb1PzVr60MjXr5sVZR4KORdBWUJva/+ohVohFLatDohHITUzUSF0
	 KyFEypHa9RYZSRfgOOw9cABLXLgSGfn3AhuZ8JT4=
Received: from fbmtpc21.tugraz.at (fbmtpc21.tugraz.at [129.27.144.40])
	by mailrelay.tugraz.at (Postfix) with ESMTPSA id 4hkcZg4Lm6z2xNs;
	Tue, 15 Sep 2026 11:45:31 +0200 (CEST)
Message-ID: <856e88cd5491195531ad21d6b338620a29d18af6.camel@tugraz.at>
Subject: Re: [PATCH 1/1] man/man2/request_key.2: Add missing GNU size
 forward-declarations
From: Martin Uecker <uecker@tugraz.at>
To: Alejandro Colomar <alx@kernel.org>
Cc: Mark Harris <mark.hsj@gmail.com>, Petr Vorel <pvorel@suse.cz>, 
	linux-man@vger.kernel.org, Yeoul Na <yeoul_na@apple.com>, John McCall
	 <rjmccall@apple.com>
Date: Tue, 15 Sep 2026 11:45:31 +0200
In-Reply-To: <aqkDizAvyqOLJw-g@devuan>
References: <20260914111511.1610878-1-pvorel@suse.cz>
	 <aqfd1_Xa_TbzE1ML@devuan> <20260914122442.GA1591402@pevik>
	 <aqf1jJ1qxsTdw6kE@devuan>
	 <CAMdZqKFVE-1-LkBR+ei77rd4dwXXS2AG_nySx5ACi61whtxG1g@mail.gmail.com>
	 <aqg0173m_lx_UB4G@devuan>
	 <4ec579cb8963a7221ee833dda507d062a787fd47.camel@tugraz.at>
	 <aqhfPJo4BBnXn2I-@devuan>
	 <1f86348ce948d9e8899b8abaffb8eac0e86b244f.camel@tugraz.at>
	 <aqkDizAvyqOLJw-g@devuan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-TUG-Backscatter-control: G/VXY7/6zeyuAY/PU2/0qw
X-Spam-Scanner: SpamAssassin 3.003001 
X-Spam-Score-relay: 0.0
X-Scanned-By: MIMEDefang 2.74 on 129.27.10.116

Am Dienstag, dem 15.09.2026 um 11:02 +0200 schrieb Alejandro Colomar:
> Hi Martin,
>=20
> > Date: 2026-09-15 08:08:24+0200
> > From: Martin Uecker <uecker@tugraz.at>
> >=20
> > Am Montag, dem 14.09.2026 um 23:03 +0200 schrieb Alejandro Colomar:
> > > Hi Martin,
> > >=20
> > > > Date: 2026-09-14 20:34:07+0200
> > > > From: Martin Uecker <uecker@tugraz.at>
> > > >=20
> > > > Am Montag, dem 14.09.2026 um 20:12 +0200 schrieb Alejandro Colomar:
> > > > > Hi Mark,
> >=20
> > ..
> >=20
> > > > >=20
> > > > > The actual poll results are 15 in favour, 7 against, and 4 absten=
tions.
> > > > > I wouldn't have called that "strong direction to proceed".  I kno=
w
> > > > > that's what the minutes say, but I don't agree with how polls are=
 taken
> > > > > as strong direction.  7 votes against is quite vocal opposition.
> > > > >=20
> > > > > Here's a summary of the room feelings:
> > > > > The committee was more or less (including myself) saying "as a us=
er, I'd
> > > > > like it, but as an implementor, it'd probably be a nightmare; as =
long as
> > > > > implementors are okay with it, we're fine".  There was a comment =
from
> > > > > one implementor of a small C compiler which essentially said it w=
as
> > > > > un-implementable for them, which raised some concerns.  From the
> > > > > minutes:
> > > > >=20
> > > > > 	Uecker:	The SlimCC developer and another compiler developer
> > > > > 		wrote in a discussion about general features that they
> > > > > 		are worried about parameters for active declaration
> > > > > 		scoping.  It is difficult for them to implement this.
> > > > > 		They would rather implement template C++ functions.
> > > > >=20
> > > > > I suggested a way forward: first, write a proposal prohibiting th=
e use
> > > > > of parameter names in array length expressions that clash with va=
riables
> > > > > declared at an outer scope.  The wording would look like this (ta=
ken
> > > > > from n3923 itself):
> > > > >=20
> > > > >     6.7.7.4  Function declarators
> > > > > 	@@ p4+1
> > > > > 	+Within a parameter declaration list,
> > > > > 	+if an identifier used in a parameter=E2=80=99s array bound expr=
ession
> > > > > 	+refers to a name declared later in the same list,
> > > > > 	+no declaration of an identifier with the same name
> > > > > 	+shall be visible from an enclosing scope.
> > > > >=20
> > > > > This would require that the following code results in a diagnosti=
c:
> > > > >=20
> > > > > 	int n;
> > > > > 	void foo(int a[n], int n);
> > > >=20
> > > > The - rather serious in my opinion - issue with having a constraint
> > > > is that you can not always control what identifiers are in
> > > > scope, or will come into scope ten years later when some library
> > > > you happen to use adds a new symbol and then now breaks your code.
> > > >=20
> > > > Yes, for "n" this will not happen, for other symbols it might.
> > > > The whole point of having scopes is that they shield the nested
> > > > scopes from the outside.
> > >=20
> > > I remember your concern.  But when I re-read the constraint today, I =
was
> > > less concerned.  The thing is that the constraint is not triggered fo=
r
> > > any clashes.  It's only triggered if all of the following happen:
> > >=20
> > > 	-  The identifier must be used in an array length expression.
> > > 	-  The identifier must be declared after the use in the array.
> > >=20
> > > So, unless you're using retroactive declarations (which necessarily
> > > needs this constraint, anyway), you shouldn't worry about the
> > > constraint.  This code is fine:
> > >=20
> > > 	int n;
> > > 	void bar(int n, int a[n]);
> >=20
> > I don't see why you need the constraint.  You can just change
> > scoping rules so that the inner "n" shadows the outside, making
> > the code work as intended.
> >=20
> > > > This becomes even more serious once you allow any kind of nested
> > > > functions or lambdas, because then the collision surface becomes
> > > > much larger.  If you insert lambdas via macros because people
> > > > start to use them as a replacement for statement expressions, then
> > > > you suddenly have macro that randomly fail to compile in
> > > > specific contexts.
> > >=20
> > > Still, as long as you don't use retroactive declarations in local
> > > functions or function literals, you shouldn't worry.
> >=20
> > I don't see how you come to this conclusion, I think it is
> > an issue even at file scope.=20
>=20
> Let's quote the text of the constraint, and I'll numerate the lines:
>=20
>     6.7.7.4  Function declarators
> 	@@ p4+1
> 1	+Within a parameter declaration list,
> 2	+if an identifier used in a parameter=E2=80=99s array bound expression
> 3	+refers to a name declared later in the same list,
> 4	+no declaration of an identifier with the same name
> 5	+shall be visible from an enclosing scope.
>=20
> Let's write a translation unit:
>=20
> 	// foo.c
>=20
> 	int n;  // global 'n'
>=20
> 	void f(int n);  // fine, doesn't trigger line 2; it shadows
>=20
> 	void g(int n, int a[n]);  // fine, doesn't trigger line 3; it shadows
>=20
> 	void h(int a[n]);  // fine, doesn't trigger line 3; uses global 'n'
>=20
> 	void i(int a[n], int n);  // Constraint violation
>=20
> 	void j(int n; int a[n], int n);  // Constraint violation, but see below
>=20
> Does it make sense now?

I already understand that. I do not want

int n;
void i(int a[n], int n);

to be a constraint violation, because if I write

void i(int a[n], int n);

and any header that later puts an "n" into file scope somewhere, even
in a library maintained by somebody else, perhaps a decade after the
original code was written, this then may cause a surprising
compilation errors.  It is an action at a distance issue nobody
needs.


And the only reason why this may seem unlikely in this toy example
is that nobody would use a single letter "n" as a global variable, but
in real code not all parameters have such short names.

>=20
> I would relax the constraint for case j(), since it's clearly okay.
> Since forward declarations are non-standard, we can't have the standard
> wording say something about forward declarations, but as QoI, I'd not
> trigger the diagnostic for j().
>=20
> > > > Maybe we should have both, forward declarations and some limited
> > > > form of retroactive scoping.  Then one could fix collisions with
> > > > a forward declaration that hides the outer symbol and harden
> > > > macros.
> > >=20
> > > Because of the above, I don't think this is needed.
> > >=20
> > > I think forward declarations will still be useful in GCC, for example=
 in
> > > case you need --for some reason-- to specify a local function or a
> > > function literal with an array declared before its length.  But this =
is
> > > such a weird case that I think the standard could live without it.
> >=20
> > Is your argument that people simply will not use retrospective scoping
> > for new code anyway, so it is not a practical problem?=20
>=20
> My arguments is that currently, the following code has a meaning:
>=20
> 	int n;
>=20
> 	void i(int a[n], int n);
>=20
> If we add retroactive scoping, the semantics of that code would change.
> (Add 'static' if you care about ISO C not respecting [n].)
> Thus, functions using retroactive scoping need to prohibit this code,
> to avoid silent changes.

On a theoretical level I can understand your argument.  But in
reality this is a purely theoretical issue as nobody writes such=C2=A0
code.  Even using a global variable as length is already extremely
rare, but then using the same name as parameter while intending
to use the original global variable would seem to make such code
so unlikely that I do not think it exists.

What is more common is to use a constant, e.g. a macro or
enumeration value.

void i(int a[MAX_DIMS], int n);

But then again, it seems very unlikely that writes

enum { MAX_DIMS =3D 100 };

void i(int a[MAX_DIMS], int MAX_DIMS);

with the intention that the first MAX_DIMS actually
refers to the global variable and not to the parameter.
If such code exits, it is=C2=A0 almost certainly already an
unintentional error.


>=20
> As long as the constraint affects only functions using retroactive
> scoping and functions that we agree are currently bad (because they look
> like retroactive scoping, but they aren't), the constraint seems
> positive.

It would be positive (although largely irrelevant), if not for=C2=A0
the action-at-a-distance issue above (which I do not think is
irrelevant).

>=20
> > I am not sure about this, I have seen WG14 add new functions with
> > the size later because people insisted it is more ideomatic (despite
> > the charter saying this should not be done).
>=20
> And I still do it for new str*() and mem*() functions, because, indeed,
> it is more idiomatic/consistent with related APIs.
>=20
> But that's a conscious decision.  If you add such a function, then you
> either use GNU C's forward declarations to avoid the constraint, or you
> use a parameter name that you know won't be used elsewhere.

Forward declaration are not standardized, so people avoid them.

But the issue of name collision in local contexts is much more
serious.  This is exactly the reason people come up with sophisticated
macro contraptions to create unique names for temporaries in
macros, and why people ask for lambdas to have clean alternative
instead that does not have such fundamental problems.  Introducing
lambdas, but then breaking this in a way that it has the same issue
would be really a terrible idea.=20

But, yes, this was my point: If we added that constraint,=C2=A0
something like forward declarations could be used to avoid writing
fragile macros.

>=20
> libc has it easy: a name reserved in the global namespace (__n) would
> work.  It only needs to be self consistent, and not declare __n
> globally.  Other libraries will have to prefix the parameters with the
> library prefix, I guess.

I do not think that breaking fundamental language features such as scoping,
and requiring everybody to prefix all their names to prevent collisions
is a viable.  Also a single prefix is not enough in nested macros, you
would need a unique identifier in each nested instance.

>=20
> If you add a local/literal function, then you need to be more careful
> with the parameter name.  Or just don't use retroactive scoping.  It's
> a conscious decision.  In GNU C, we have the tools available.
>=20
> I would love to see forward declarations standardized so that everyone
> can use them to avoid this constraint in the simplest way.  They are
> compatible with retroactive scoping, so we could see both standardized.
> But that's orthogonal.

Simple not having the constraint would also be ok with me.

Martin

