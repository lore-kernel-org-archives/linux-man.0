Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7116A414A15
	for <linux-man@vger.kernel.org>; Mon, 14 Sep 2026 21:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420022; cv=none; b=pn/CxkzDr+8m7SKj5DGSrzjmRdfGfoM1ZlDHJpEEwwAVmiMYOXuu/GnxOxQPIZqtKkKaeJFUU+jTv/jNU6dt2UYkqDF+TocHO33JdZ6ZlYYFS6mhQMFvZuybubtAL2+SDRu7aFme1QPqIw80SkYs4yiOydW3kv4v0L/vC15YppM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420022; c=relaxed/simple;
	bh=fQvyvabPSlCfSVPyXU/VGL596dkVAZLMrP/zYk5AGak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3v4SPVbCb/3z0YaRuiIiw/1tChsYxc8CJnQubOMV+ZLhHRgQWaQd0PCbRHyhp/zO3EtDRmVHm4stmXDrfbovimKMCPpNPfn91tdOUnpeJmp4QM0XaCpUtJRmGutBu7ZwcMp8EHJIkCEG9MKRcdNzvxLLUbJJ6obUj7nAZmT8CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5U6nXf7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5U6nXf7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C011F000FF;
	Mon, 14 Sep 2026 21:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789420020;
	bh=MFrRfMQtYHuaRjTjij7Fi+q12U3aK6VnX5LYbpCJOow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M5U6nXf77YXFeoOUFtpJ5rknliuXdgykh8a0OTYDWRzLXPTB6XZKsyFcLgsxxEQJ0
	 kKG//3S6dDzef3kcmZxiTXmxZ5hdi2eqCvU+DtAzsAaWn0a5PSfBKZkePKfIp/1jeg
	 MhZZgzvIDLEhwkqBodm+TbHczMamVF/bny51GQwo0teQDHqr8YJP3SLkSus3tSlBYE
	 f9y0mXZphx81GkSIKAtXRdDfcc33LmPkcSW/V1MQ6q7VMoZnmdw3WSLx1u/rXnq/H0
	 gbAAxpBe/QJQbeANWdcRedJM7MkJiEbkGthZx8I8gcZASyR7Czx3V4/ijlG5QRk1XO
	 QLqcPNvX6KxEA==
Date: Mon, 14 Sep 2026 23:06:58 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: status of C forward declarations (was: [PATCH 1/1]
 man/man2/request_key.2: Add missing GNU size forward-declarations)
Message-ID: <aqhhc0GjnyG42d2L@devuan>
References: <20260914111511.1610878-1-pvorel@suse.cz>
 <aqfd1_Xa_TbzE1ML@devuan>
 <20260914122442.GA1591402@pevik>
 <aqf1jJ1qxsTdw6kE@devuan>
 <CAMdZqKFVE-1-LkBR+ei77rd4dwXXS2AG_nySx5ACi61whtxG1g@mail.gmail.com>
 <20260914183750.cpvfbblgoegjlo2f@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t4jotlow2gpbylfd"
Content-Disposition: inline
In-Reply-To: <20260914183750.cpvfbblgoegjlo2f@illithid>


--t4jotlow2gpbylfd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: status of C forward declarations (was: [PATCH 1/1]
 man/man2/request_key.2: Add missing GNU size forward-declarations)
Message-ID: <aqhhc0GjnyG42d2L@devuan>
References: <20260914111511.1610878-1-pvorel@suse.cz>
 <aqfd1_Xa_TbzE1ML@devuan>
 <20260914122442.GA1591402@pevik>
 <aqf1jJ1qxsTdw6kE@devuan>
 <CAMdZqKFVE-1-LkBR+ei77rd4dwXXS2AG_nySx5ACi61whtxG1g@mail.gmail.com>
 <20260914183750.cpvfbblgoegjlo2f@illithid>
MIME-Version: 1.0
In-Reply-To: <20260914183750.cpvfbblgoegjlo2f@illithid>

Hi Branden,

> Date: 2026-09-14 13:37:50-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> At 2026-09-14T10:19:13-0700, Mark Harris wrote:
> > Alejandro Colomar wrote:
> > > > Anyway N3207 (spec mentioned in d2c2db883) is something I'll need
> > > > to get used to :).
> > >
> > > There's a more recent paper with a slightly better spec (also
> > > compatible with GCC): N3681.
> > > <https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3681.pdf>
> >=20
> > There is an even more recent paper addressing this subject, N3923
> > <https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3923.pdf>, and the
> > outcome from the last WG14 meeting was strong direction to proceed
> > along these lines.  Hopefully this much more human-readable approach
> > will prevail and we can do away with these confusing forward
> > declarations in parameter lists.
>=20
> This sort of naked triumphalism when reporting on working group
> deliberations would be better replaced by a citation of the minutes of
> the WG14 meeting in question.  Since you didn't do that, I will, and
> further will quote the relevant portion.
>=20
> At this point, the meeting minutes for summer 2026 are available in
> draft form only.
>=20
> https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3953.htm
>=20
> ---snip---
> Na/, Forward Parameter References through Retroactive Scoping, v2
> (Updates N3830) [N3923]
>=20
> Celeste: I like this. But I am worried that "constraint" is too strong.
> Unrelated libraries can collide with each other. I would recommended
> practice be strong enough.
>=20
> Bhakta: I like the changes. I also like that there is no new syntax for
> it. Some compilers still have issues with far-enough look-ahead; that is
> my only concern.
>=20
> Gustedt: I am sympathetic to this approach; we need a solution. I am
> still baffled that we did not get any other solutions. I am scared of
> the complexity. I would still prefer forward declarations.
>=20
> Celeste: This is similar for pre-C90 where you had to hook up with a
> declaration later.
>=20
> Adams: How does this integrate with the type system? Is it separated?
>=20
> Na: Your question is about the attributes, right? This is not about
> attributes. We have other proposals about intended attributes. What is
> your proposal number?
>=20
> Adams: My example is for the noreturn attribute. What is the current
> status for the C type system?
>=20
> Na: This proposal is for core language array size.
>=20
> Bazley: SDCC already supports forward parameter declarations, but is
> more limited than GCC. I wonder if this is an over-engineered solution
> for a problem that does not need to exist at all?
>=20
> Celeste: Is this ready for the Wording Group?
>=20
> Gustedt: No, there are too many unanswered questions.
>=20
> Columnar: I strongly prefer forward declarations. I like this proposal
> more. Given that small implementors cannot implement this, I am not
> comfortable accepting this.

This lacks some context.  "I like this proposal more [compared to the
previous version of it]."

> Uecker: The SlimCC developer and another compiler developer wrote in a
> discussion about general features that they are worried about parameters
> for active declaration scoping. It is difficult for them to implement
> this. They would rather implement template C++ functions.
>=20
> Na: I need to discuss with that person offline the nature of their
> problem.
>=20
> Colomar: Would it be acceptable for Clang to propose forward
> declarations, and then allow compilers to decide whether they want to do
> this retroactive parsing?
>=20
> Tarditi: You could use that rationale to deny many changes. I do not
> think this is a serious issue. We could add implementation-defined
> limits if forward tokens is an issue.
>=20
> Celeste: This could potentially be optional. I do not think that is
> possible. It does not give any cues to the compiler. Which bits would be
> optional? If the expression in the array bounds is limited to an
> identifier, there is no parsing problem.
>=20
> Meneide: We do have an "implementation limit" section in the standard
> for such things. Limits on look-ahead for this feature can go there.
>=20
> Straw Poll: Would WG14 like to adopt something along the lines of N3923
> for C2y? 3-0-0+12-7-4=3D15-7-4 strong direction to proceed
>=20
> Gustedt: If we want this into C2y, we should have a paper with the
> semantics cleared by November, so it can go to the Wording Group.
> ---end snip---
>=20
> I assume the "Columnar" listed above is a typo for "Colomar".

Yes, it is.


Have a lovely night!
Alex

>=20
> Regards,
> Branden



--=20
<https://www.alejandro-colomar.es>

--t4jotlow2gpbylfd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqoYfEACgkQ64mZXMKQ
wqlWBA//bB9cuXYOFQN6ev/1Yiw9ehqKux5E/Rrz8qEFMknsQSX0XJaRbwUTAIZd
4h4JewPEg4PMNyR3hsLxZgHu+JR5Zmkt/mowQVyK/hHx0Kqk8pWmv+mzezZJRuGN
sOsEvuvULc3UtAA854OoUCDRDIzk3TAluP5lISDNbhCy/LvL4wGp95SEBdPhtta0
5WT+l5li+wG4MwHn3NLHzl5DlR/J9obd0tgTgys6S6pz4P8gFEi5SvacERlxqMVu
psD5F4MIt9mt1BZyLDVFXhZuhKribsTCVkQZRPFHgQJ7/Sjc8GWYLTap97tKuevn
JGyfnLKHF4XWDAeHSkqPaJWjebrJ6KFZvkfDAVL/8c5fFJ8+HWg1SPAJpm51+6UW
Cpozmen7ulQ2ixJULzM0OOpHtYLa453ki4UqdxRHt0PloEKJmLL4KLqWhq9OKO7m
slE7aP7SDZGIaK19MECozjFTjl80nKMpbqVwoQOY0ABlTMg/qZR1vmuC+oLJzZgS
alAywgmeEUxma7D0yiqVddA1j75u2J+0B8XNAQYKXNmJV2SVeJy1t8nZdAAJitko
kXOd7xtMOm4yE63kMNe0W4dquP2HvnlCHlYu5MSwccZdE4g3prm5SGn25hExRMQn
oWjvTlgBnHV+NI0KYpXoHvRX7xYoo0WxwQskFy4FKJD5kEHIJxM=
=lWtY
-----END PGP SIGNATURE-----

--t4jotlow2gpbylfd--
