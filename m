Received: from mailrelay.tugraz.at (mailrelay.tugraz.at [129.27.2.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97CC36CDE9
	for <linux-man@vger.kernel.org>; Mon, 14 Sep 2026 18:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.27.2.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789411279; cv=none; b=XMz4S3blhiYysbhbW1o6qKtkgXv5N388XUFAlHvX9sMTCyKNFCg5918cfR3V0LPKPbCFylDDIjdqmI3kze3KDJzwC9sCKixiwk1fVwqA/COStQVQexVsO5DH2kcEnBqPwZSqMv7zVszDPdfUoaEeap23qTg7FheYpHZDlYxmb5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789411279; c=relaxed/simple;
	bh=nbO9uqi5NV6IJgcoRbS9ZJ6weUDjhHmkAgp5OA1LJIU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S8f2MGJdr+qcGnQ3+gf4qSw1/nO6ucskLyE5ITkQJjB2kg0Z/e2eyScLfExcfaGl3cVjeroIkNWD/Jyh4v61omeMf6Uphs8Q5vW67vdS3RRROjeNbc5VJTVNJRt5DvCQKphSZPMSkknOool/8aw31/CfO3MC90iCydyH4rD+HAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tugraz.at; spf=pass smtp.mailfrom=tugraz.at; dkim=pass (1024-bit key) header.d=tugraz.at header.i=@tugraz.at header.b=A5q1YDoL; arc=none smtp.client-ip=129.27.2.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tugraz.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tugraz.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tugraz.at header.i=@tugraz.at header.b="A5q1YDoL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tugraz.at;
	s=mailrelay; t=1789410848;
	bh=bm72rZ5644b//2QqN8gdZPL5EFvgjnQ3zBPwGKnpJYo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=A5q1YDoLDoYhY6owMHCPGkz6p5rCC4LrNjNckvckWVhWIGFdVIKTALDh7vn+rGDA4
	 1tf+1VllPA0eyL3zSVIctLNVjZTptRT3i1Hj/3VDAOBn1xqWaDJyHKiRnvseEi6xVn
	 4UL7DhFOV30WLpy/m8ZE72uhoOoSbjpszyvrP5DM=
Received: from vra-168-188.tugraz.at (vra-168-188.tugraz.at [129.27.168.188])
	by mailrelay.tugraz.at (Postfix) with ESMTPSA id 4hkDM4330mz2xMM;
	Mon, 14 Sep 2026 20:34:08 +0200 (CEST)
Message-ID: <4ec579cb8963a7221ee833dda507d062a787fd47.camel@tugraz.at>
Subject: Re: [PATCH 1/1] man/man2/request_key.2: Add missing GNU size
 forward-declarations
From: Martin Uecker <uecker@tugraz.at>
To: Alejandro Colomar <alx@kernel.org>, Mark Harris <mark.hsj@gmail.com>
Cc: Petr Vorel <pvorel@suse.cz>, linux-man@vger.kernel.org, Yeoul Na
	 <yeoul_na@apple.com>, John McCall <rjmccall@apple.com>
Date: Mon, 14 Sep 2026 20:34:07 +0200
In-Reply-To: <aqg0173m_lx_UB4G@devuan>
References: <20260914111511.1610878-1-pvorel@suse.cz>
	 <aqfd1_Xa_TbzE1ML@devuan> <20260914122442.GA1591402@pevik>
	 <aqf1jJ1qxsTdw6kE@devuan>
	 <CAMdZqKFVE-1-LkBR+ei77rd4dwXXS2AG_nySx5ACi61whtxG1g@mail.gmail.com>
	 <aqg0173m_lx_UB4G@devuan>
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

Am Montag, dem 14.09.2026 um 20:12 +0200 schrieb Alejandro Colomar:
> Hi Mark,
>=20
> > Date: 2026-09-14 10:19:13-0700
> > From: Mark Harris <mark.hsj@gmail.com>
> >=20
> > Alejandro Colomar wrote:
> > > > Anyway N3207 (spec mentioned in d2c2db883) is something I'll need t=
o get used to :).
> > >=20
> > > There's a more recent paper with a slightly better spec (also compati=
ble
> > > with GCC): N3681.
> > > <https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3681.pdf>
> >=20
> > There is an even more recent paper addressing this subject, N3923
> > <https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3923.pdf>,
>=20
> Indeed, there's that newer proposal.  It's a different one, though.
>=20
> > and the
> > outcome from the last WG14 meeting was strong direction to proceed
> > along these lines.
>=20
> The actual poll results are 15 in favour, 7 against, and 4 abstentions.
> I wouldn't have called that "strong direction to proceed".  I know
> that's what the minutes say, but I don't agree with how polls are taken
> as strong direction.  7 votes against is quite vocal opposition.
>=20
> Here's a summary of the room feelings:
> The committee was more or less (including myself) saying "as a user, I'd
> like it, but as an implementor, it'd probably be a nightmare; as long as
> implementors are okay with it, we're fine".  There was a comment from
> one implementor of a small C compiler which essentially said it was
> un-implementable for them, which raised some concerns.  From the
> minutes:
>=20
> 	Uecker:	The SlimCC developer and another compiler developer
> 		wrote in a discussion about general features that they
> 		are worried about parameters for active declaration
> 		scoping.  It is difficult for them to implement this.
> 		They would rather implement template C++ functions.
>=20
> I suggested a way forward: first, write a proposal prohibiting the use
> of parameter names in array length expressions that clash with variables
> declared at an outer scope.  The wording would look like this (taken
> from n3923 itself):
>=20
>     6.7.7.4  Function declarators
> 	@@ p4+1
> 	+Within a parameter declaration list,
> 	+if an identifier used in a parameter=E2=80=99s array bound expression
> 	+refers to a name declared later in the same list,
> 	+no declaration of an identifier with the same name
> 	+shall be visible from an enclosing scope.
>=20
> This would require that the following code results in a diagnostic:
>=20
> 	int n;
> 	void foo(int a[n], int n);

The - rather serious in my opinion - issue with having a constraint
is that you can not always control what identifiers are in
scope, or will come into scope ten years later when some library
you happen to use adds a new symbol and then now breaks your code.

Yes, for "n" this will not happen, for other symbols it might.
The whole point of having scopes is that they shield the nested
scopes from the outside.

This becomes even more serious once you allow any kind of nested
functions or lambdas, because then the collision surface becomes
much larger.  If you insert lambdas via macros because people
start to use them as a replacement for statement expressions, then
you suddenly have macro that randomly fail to compile in
specific contexts.


Maybe we should have both, forward declarations and some limited
form of retroactive scoping.  Then one could fix collisions with
a forward declaration that hides the outer symbol and harden
macros.

The issue that it would be a major pain to implement full
retrospective scoping even in GCC remains. I think the only
realistic fix for this is to really narrow it down to a very
limited set of expressions.

Martin

=20


>=20
> But it would allow the following code without diagnostics:
>=20
> 	int n;
> 	void bar(int n, int a[n]);
> 	void baz(int a[n]);
>=20
> This is obviously a good constraint, since it disallows code that is
> most likely already broken, and doesn't affect code that works fine.
>=20
> Once that constraint is in place, we could add --as a second proposal--
> retroactive declaration of parameters being optional (so that small
> compilers can say they don't support it), but we'll be sure that code
> will not misbehave on such compilers.
>=20
> >  Hopefully this much more human-readable approach
> > will prevail and we can do away with these confusing forward
> > declarations in parameter lists.
>=20
> Agree.
>=20
>=20
> Have a lovely day!
> Alex
>=20
> >=20
> >  - Mark
