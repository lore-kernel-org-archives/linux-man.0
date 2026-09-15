Received: from mailrelay.tugraz.at (mailrelay.tugraz.at [129.27.2.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5BB372B57
	for <linux-man@vger.kernel.org>; Tue, 15 Sep 2026 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.27.2.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468123; cv=none; b=RTRduxSPrGVEFRz1VjQ+Zy8LYms/KqHPFr+2Iw7JmaKvGGKnETqT/4KDpDY5HmA3ZIOqUbIaB/qq/QXhIrW4LnrL1i6vO8jpBy+27wirzUW7yw/NTYdwJtStSv3qe+IQmqH5f2nmhK/+ujnuJ5JyZ+tq6DHvIlh2z3pbgAxOjJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468123; c=relaxed/simple;
	bh=TWs763yMQU4kBbcoZrsPnU8VD6HL+U0Cvb3RZNaniXA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dvpf/Xgx/JPSJXntkUh7o53FIbqnnQen8F4cSElcS83Pic1q82RcO7RawhaktL+V5JXgG5zfjrLEYKXgKy9EBs76gF3knlkq5v+9I86YMS0wIAXnqQFrZkfiRj5GfuuNrh9thj7JCG5nbVpqq0yqjAi3QC3hLsTtz+ppQN97dnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tugraz.at; spf=pass smtp.mailfrom=tugraz.at; dkim=pass (1024-bit key) header.d=tugraz.at header.i=@tugraz.at header.b=GL5gKkBG; arc=none smtp.client-ip=129.27.2.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tugraz.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tugraz.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tugraz.at header.i=@tugraz.at header.b="GL5gKkBG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tugraz.at;
	s=mailrelay; t=1789468111;
	bh=xhQyLHwybdktwE92LxzYqes6/HuJ6KLsBlFRkYQyGY8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GL5gKkBGmBTgmZeVX0igFVkar2P7zRGSpaTp8VTifzFRBvgOtEzUl+rAowNHqaCse
	 4fI4xFW2yobeN56JBsEIxm1IK9/YheBfD1h5O7dh7sjJn7OeD2coCVJj6Y4MC0q2au
	 wgUc5vx9ewOZ0F7+qNMq5lkz1vxbUPn76UoIrsNg=
Received: from fbmtpc21.tugraz.at (fbmtpc21.tugraz.at [129.27.144.40])
	by mailrelay.tugraz.at (Postfix) with ESMTPSA id 4hkdXH3rRMz2xHj;
	Tue, 15 Sep 2026 12:28:31 +0200 (CEST)
Message-ID: <1bb001e8c067ac5f91ff7765979289f1bb8f8628.camel@tugraz.at>
Subject: Re: [PATCH 1/1] man/man2/request_key.2: Add missing GNU size
 forward-declarations
From: Martin Uecker <uecker@tugraz.at>
To: Alejandro Colomar <alx@kernel.org>
Cc: Mark Harris <mark.hsj@gmail.com>, Petr Vorel <pvorel@suse.cz>, 
	linux-man@vger.kernel.org, Yeoul Na <yeoul_na@apple.com>, John McCall
	 <rjmccall@apple.com>
Date: Tue, 15 Sep 2026 12:28:31 +0200
In-Reply-To: <aqkVrTjkEDcSHK7h@devuan>
References: <aqfd1_Xa_TbzE1ML@devuan> <20260914122442.GA1591402@pevik>
	 <aqf1jJ1qxsTdw6kE@devuan>
	 <CAMdZqKFVE-1-LkBR+ei77rd4dwXXS2AG_nySx5ACi61whtxG1g@mail.gmail.com>
	 <aqg0173m_lx_UB4G@devuan>
	 <4ec579cb8963a7221ee833dda507d062a787fd47.camel@tugraz.at>
	 <aqhfPJo4BBnXn2I-@devuan>
	 <1f86348ce948d9e8899b8abaffb8eac0e86b244f.camel@tugraz.at>
	 <aqkDizAvyqOLJw-g@devuan>
	 <856e88cd5491195531ad21d6b338620a29d18af6.camel@tugraz.at>
	 <aqkVrTjkEDcSHK7h@devuan>
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

Am Dienstag, dem 15.09.2026 um 11:59 +0200 schrieb Alejandro Colomar:
> Hi Martin,
>=20
> > Date: 2026-09-15 11:45:31+0200
> > From: Martin Uecker <uecker@tugraz.at>
> >=20
> [...]
> > > Let's quote the text of the constraint, and I'll numerate the lines:
> > >=20
> > >     6.7.7.4  Function declarators
> > > 	@@ p4+1
> > > 1	+Within a parameter declaration list,
> > > 2	+if an identifier used in a parameter=E2=80=99s array bound express=
ion
> > > 3	+refers to a name declared later in the same list,
> > > 4	+no declaration of an identifier with the same name
> > > 5	+shall be visible from an enclosing scope.
> > >=20
> > > Let's write a translation unit:
> > >=20
> > > 	// foo.c
> > >=20
> > > 	int n;  // global 'n'
> > >=20
> > > 	void f(int n);  // fine, doesn't trigger line 2; it shadows
> > >=20
> > > 	void g(int n, int a[n]);  // fine, doesn't trigger line 3; it shadow=
s
> > >=20
> > > 	void h(int a[n]);  // fine, doesn't trigger line 3; uses global 'n'
> > >=20
> > > 	void i(int a[n], int n);  // Constraint violation
> > >=20
> > > 	void j(int n; int a[n], int n);  // Constraint violation, but see be=
low
> > >=20
> > > Does it make sense now?
> >=20
> > I already understand that. I do not want
> >=20
> > int n;
> > void i(int a[n], int n);
> >=20
> > to be a constraint violation, because if I write
> >=20
> > void i(int a[n], int n);
> >=20
> > and any header that later puts an "n" into file scope somewhere, even
> > in a library maintained by somebody else, perhaps a decade after the
> > original code was written, this then may cause a surprising
> > compilation errors.  It is an action at a distance issue nobody
> > needs.
> >=20
> >=20
> > And the only reason why this may seem unlikely in this toy example
> > is that nobody would use a single letter "n" as a global variable, but
> > in real code not all parameters have such short names.
> >=20
> > >=20
> > > I would relax the constraint for case j(), since it's clearly okay.
> > > Since forward declarations are non-standard, we can't have the standa=
rd
> > > wording say something about forward declarations, but as QoI, I'd not
> > > trigger the diagnostic for j().
> > >=20
> [...]
> > > My arguments is that currently, the following code has a meaning:
> > >=20
> > > 	int n;
> > >=20
> > > 	void i(int a[n], int n);
> > >=20
> > > If we add retroactive scoping, the semantics of that code would chang=
e.
> > > (Add 'static' if you care about ISO C not respecting [n].)
> > > Thus, functions using retroactive scoping need to prohibit this code,
> > > to avoid silent changes.
> >=20
> > On a theoretical level I can understand your argument.  But in
> > reality this is a purely theoretical issue as nobody writes such=C2=A0
> > code.  Even using a global variable as length is already extremely
> > rare, but then using the same name as parameter while intending
> > to use the original global variable would seem to make such code
> > so unlikely that I do not think it exists.
> >=20
> > What is more common is to use a constant, e.g. a macro or
> > enumeration value.
> >=20
> > void i(int a[MAX_DIMS], int n);
> >=20
> > But then again, it seems very unlikely that writes
> >=20
> > enum { MAX_DIMS =3D 100 };
> >=20
> > void i(int a[MAX_DIMS], int MAX_DIMS);
> >=20
> > with the intention that the first MAX_DIMS actually
> > refers to the global variable and not to the parameter.
> > If such code exits, it is=C2=A0 almost certainly already an
> > unintentional error.
>=20
> And you would not diagnose such an unintentional error?

This would not be a new error, but an old one.
Nobody felt the need to diagnose this in the last four decades.
And after the change, it would not be an error, so there seems
even less reason to diagnose it.

>=20
> I think this seems to trigger again the discussion about whether we want
> constraints for things that should be diagnostics, but where the user
> should be allowed to continue translation.
>=20
> I guess I can live without the constraint, because QoI will result in
> compilers diagnosing this anyway.  I expect GCC would add a new value
> -Wshadow=3Dretroactive-parameter or something like that to warn
> specifically about this situation.

QoI might result in diagnostic if it turns out to be a problem.

But if it were a real issue, we would have the diagnostic already.

Martin

>=20
> > > As long as the constraint affects only functions using retroactive
> > > scoping and functions that we agree are currently bad (because they l=
ook
> > > like retroactive scoping, but they aren't), the constraint seems
> > > positive.
> >=20
> > It would be positive (although largely irrelevant), if not for=C2=A0
> > the action-at-a-distance issue above (which I do not think is
> > irrelevant).
> >=20
> > > > I am not sure about this, I have seen WG14 add new functions with
> > > > the size later because people insisted it is more ideomatic (despit=
e
> > > > the charter saying this should not be done).
> > >=20
> > > And I still do it for new str*() and mem*() functions, because, indee=
d,
> > > it is more idiomatic/consistent with related APIs.
> > >=20
> > > But that's a conscious decision.  If you add such a function, then yo=
u
> > > either use GNU C's forward declarations to avoid the constraint, or y=
ou
> > > use a parameter name that you know won't be used elsewhere.
> >=20
> > Forward declaration are not standardized, so people avoid them.
> >=20
> > But the issue of name collision in local contexts is much more
> > serious.  This is exactly the reason people come up with sophisticated
> > macro contraptions to create unique names for temporaries in
> > macros, and why people ask for lambdas to have clean alternative
> > instead that does not have such fundamental problems.  Introducing
> > lambdas, but then breaking this in a way that it has the same issue
> > would be really a terrible idea.=20
> >=20
> > But, yes, this was my point: If we added that constraint,=C2=A0
> > something like forward declarations could be used to avoid writing
> > fragile macros.
> >=20
> > >=20
> > > libc has it easy: a name reserved in the global namespace (__n) would
> > > work.  It only needs to be self consistent, and not declare __n
> > > globally.  Other libraries will have to prefix the parameters with th=
e
> > > library prefix, I guess.
> >=20
> > I do not think that breaking fundamental language features such as scop=
ing,
> > and requiring everybody to prefix all their names to prevent collisions
> > is a viable.  Also a single prefix is not enough in nested macros, you
> > would need a unique identifier in each nested instance.
> >=20
> [...]
> >=20
> > Simple not having the constraint would also be ok with me.
>=20
> Agreed.
>=20
>=20
> Cheers,
> Alex
>=20
> >=20
> > Martin
> >=20

--=20
Univ.-Prof. Dr. rer. nat. Martin Uecker
Graz University of Technology
Institute of Biomedical Imaging

