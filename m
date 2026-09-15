Received: from mailrelay.tugraz.at (mailrelay.tugraz.at [129.27.2.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D6A395DBF
	for <linux-man@vger.kernel.org>; Tue, 15 Sep 2026 06:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.27.2.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789452517; cv=none; b=G3Si+bHG+EveUifo0pLtFWSd6i7PsEb7fLRKCNK+36lrVJfAUZirT/mH0AEZlvLCqxRLPhMNEwI7OS7UO4hjq1PI8P+ZHg7js5D+MRFrh31GJ2gI3+Aux9y6qctm2VFbXum8oFhHGJYw2GIuKS4U7xvpt/QNV75Hjbkb4hhRT1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789452517; c=relaxed/simple;
	bh=u6WxTiq3dsliNJ2Rw9/rCQ8xtB32q+KIDo+Y9ahS3/4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U+lfCZB9R0Hl3hgCcO4R2ZM1ohDiPesqA+c8VffnaUVYdd/bG/RkSwWy70i0pmtjRxjPychGJiyOzulLhCIe4n07H9UoUFP+xWdayD8ChIal6UfqZ1Gf8IkLq2R50WmFR21zVoa4MGw3Hy1/bEiO2yewOFoRlhhVER8nRK7cc4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tugraz.at; spf=pass smtp.mailfrom=tugraz.at; dkim=pass (1024-bit key) header.d=tugraz.at header.i=@tugraz.at header.b=bCK5jKHm; arc=none smtp.client-ip=129.27.2.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tugraz.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tugraz.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tugraz.at header.i=@tugraz.at header.b="bCK5jKHm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tugraz.at;
	s=mailrelay; t=1789452505;
	bh=xQoPwQCEPuR5eUgDo6hI7MdEP7cBQMowrRuirHn39XQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bCK5jKHmrv+xnSO0LegFQibc8lDUbTEHYrO0FTkSJOErwRRx8TIjjx7IqVDv/hxCA
	 8zGcL1VBUJy1eGNazBQRvZJx9kyZF/p123MfuQPEwQzYMU/3iscUxdT6sqO3zjono6
	 uatY3MseXv59qGErB4iB69tjBAaA7kGEHAewRhwA=
Received: from [192.168.0.221] (84-115-216-146.cable.dynamic.surfer.at [84.115.216.146])
	by mailrelay.tugraz.at (Postfix) with ESMTPSA id 4hkWm926WSz2xHy;
	Tue, 15 Sep 2026 08:08:25 +0200 (CEST)
Message-ID: <1f86348ce948d9e8899b8abaffb8eac0e86b244f.camel@tugraz.at>
Subject: Re: [PATCH 1/1] man/man2/request_key.2: Add missing GNU size
 forward-declarations
From: Martin Uecker <uecker@tugraz.at>
To: Alejandro Colomar <alx@kernel.org>
Cc: Mark Harris <mark.hsj@gmail.com>, Petr Vorel <pvorel@suse.cz>, 
	linux-man@vger.kernel.org, Yeoul Na <yeoul_na@apple.com>, John McCall
	 <rjmccall@apple.com>
Date: Tue, 15 Sep 2026 08:08:24 +0200
In-Reply-To: <aqhfPJo4BBnXn2I-@devuan>
References: <20260914111511.1610878-1-pvorel@suse.cz>
	 <aqfd1_Xa_TbzE1ML@devuan> <20260914122442.GA1591402@pevik>
	 <aqf1jJ1qxsTdw6kE@devuan>
	 <CAMdZqKFVE-1-LkBR+ei77rd4dwXXS2AG_nySx5ACi61whtxG1g@mail.gmail.com>
	 <aqg0173m_lx_UB4G@devuan>
	 <4ec579cb8963a7221ee833dda507d062a787fd47.camel@tugraz.at>
	 <aqhfPJo4BBnXn2I-@devuan>
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

Am Montag, dem 14.09.2026 um 23:03 +0200 schrieb Alejandro Colomar:
> Hi Martin,
>=20
> > Date: 2026-09-14 20:34:07+0200
> > From: Martin Uecker <uecker@tugraz.at>
> >=20
> > Am Montag, dem 14.09.2026 um 20:12 +0200 schrieb Alejandro Colomar:
> > > Hi Mark,

..

> > >=20
> > > The actual poll results are 15 in favour, 7 against, and 4 abstention=
s.
> > > I wouldn't have called that "strong direction to proceed".  I know
> > > that's what the minutes say, but I don't agree with how polls are tak=
en
> > > as strong direction.  7 votes against is quite vocal opposition.
> > >=20
> > > Here's a summary of the room feelings:
> > > The committee was more or less (including myself) saying "as a user, =
I'd
> > > like it, but as an implementor, it'd probably be a nightmare; as long=
 as
> > > implementors are okay with it, we're fine".  There was a comment from
> > > one implementor of a small C compiler which essentially said it was
> > > un-implementable for them, which raised some concerns.  From the
> > > minutes:
> > >=20
> > > 	Uecker:	The SlimCC developer and another compiler developer
> > > 		wrote in a discussion about general features that they
> > > 		are worried about parameters for active declaration
> > > 		scoping.  It is difficult for them to implement this.
> > > 		They would rather implement template C++ functions.
> > >=20
> > > I suggested a way forward: first, write a proposal prohibiting the us=
e
> > > of parameter names in array length expressions that clash with variab=
les
> > > declared at an outer scope.  The wording would look like this (taken
> > > from n3923 itself):
> > >=20
> > >     6.7.7.4  Function declarators
> > > 	@@ p4+1
> > > 	+Within a parameter declaration list,
> > > 	+if an identifier used in a parameter=E2=80=99s array bound expressi=
on
> > > 	+refers to a name declared later in the same list,
> > > 	+no declaration of an identifier with the same name
> > > 	+shall be visible from an enclosing scope.
> > >=20
> > > This would require that the following code results in a diagnostic:
> > >=20
> > > 	int n;
> > > 	void foo(int a[n], int n);
> >=20
> > The - rather serious in my opinion - issue with having a constraint
> > is that you can not always control what identifiers are in
> > scope, or will come into scope ten years later when some library
> > you happen to use adds a new symbol and then now breaks your code.
> >=20
> > Yes, for "n" this will not happen, for other symbols it might.
> > The whole point of having scopes is that they shield the nested
> > scopes from the outside.
>=20
> I remember your concern.  But when I re-read the constraint today, I was
> less concerned.  The thing is that the constraint is not triggered for
> any clashes.  It's only triggered if all of the following happen:
>=20
> 	-  The identifier must be used in an array length expression.
> 	-  The identifier must be declared after the use in the array.
>=20
> So, unless you're using retroactive declarations (which necessarily
> needs this constraint, anyway), you shouldn't worry about the
> constraint.  This code is fine:
>=20
> 	int n;
> 	void bar(int n, int a[n]);

I don't see why you need the constraint.  You can just change
scoping rules so that the inner "n" shadows the outside, making
the code work as intended.

> > This becomes even more serious once you allow any kind of nested
> > functions or lambdas, because then the collision surface becomes
> > much larger.  If you insert lambdas via macros because people
> > start to use them as a replacement for statement expressions, then
> > you suddenly have macro that randomly fail to compile in
> > specific contexts.
>=20
> Still, as long as you don't use retroactive declarations in local
> functions or function literals, you shouldn't worry.

I don't see how you come to this conclusion, I think it is
an issue even at file scope.=20

>=20
> > Maybe we should have both, forward declarations and some limited
> > form of retroactive scoping.  Then one could fix collisions with
> > a forward declaration that hides the outer symbol and harden
> > macros.
>=20
> Because of the above, I don't think this is needed.
>=20
> I think forward declarations will still be useful in GCC, for example in
> case you need --for some reason-- to specify a local function or a
> function literal with an array declared before its length.  But this is
> such a weird case that I think the standard could live without it.

Is your argument that people simply will not use retrospective scoping
for new code anyway, so it is not a practical problem?=20

I am not sure about this, I have seen WG14 add new functions with
the size later because people insisted it is more ideomatic (despite
the charter saying this should not be done).

Martin

>=20
> > The issue that it would be a major pain to implement full
> > retrospective scoping even in GCC remains.
>=20
> Agree.  As a user, it seems great (given the constraints that make it
> safe); as an implementor, it's a nightmare.
>=20
> > I think the only
> > realistic fix for this is to really narrow it down to a very
> > limited set of expressions.
> >=20
> > Martin
>=20
>=20
> Have a lovely night!
> Alex
