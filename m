Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0270850AC2B
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651105; cv=none; b=DgUB9tEOt3t4fv760nTAVhrpORSae4wP/4iesZaj5QV3vjC6fxzaHFB9nBHm5qo6upbq0FupaIhRd4RPV0aChTH7VKWKYiC0J8AUhI1xZMJ0Ir65mcbUEiAswKR7N3fsb5wl44FXbbgGoY05yxl35Uai6+kgzAV89732OLA0omk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651105; c=relaxed/simple;
	bh=WBzl39WoXe/2KMBqHE55HwkWlnJTxKIWE81n9g4LsgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTvGRrj3XTphREYfWPTCiiQWwUof/DBvqczUuNuyL8kPSeN1NEOgYjylUXTK2I0mYa0ndcWzP9mKY08+maQFDZOTW/peJ9R5kC2mc1ogvmQoxusAuCxy9SBvgyn95P16lPDuW2tbzgKX/X+1wUKvAevJE86GYMRWctbEKZdUcBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y7xi0+c6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y7xi0+c6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83BAA1F000FF;
	Thu, 17 Sep 2026 13:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789651103;
	bh=zLUQY6Lkt4QbBvHsprlgsQvqYL82cQNdoqVKlt3EZLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y7xi0+c6eHyLVfu2J1B+jy2f/GmiuB5LYXx8ThEIWVRYUkiI94JakOdzWWRG2cBsQ
	 7e8oaodV6SL/LJpWexGy7pkS8xRgH8sNgY9g5QMXLapPVk4olg/6OuvuQLo+4i1hX5
	 yldam1+C1mtwkH67I63qZhBmK+yMlhgNg0jTPVlWeusO9PA3BwZ5RUljb+h0QlN2KN
	 sKqrpbRkJoNh/+snSEC4fddv2/z3Yq4SvXB7pqG13xOeuPIjjv7tFzOyo25gBtsyJ5
	 c98n3HonIpWznnkOPuU0iIoAL/3mmCCMPgOQjuqaa6qrvKFbt52wKEDVomL4MWRseT
	 bG+BbvAdW/Saw==
Date: Thu, 17 Sep 2026 15:18:20 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: astian <astian@memeware.net>, linux-man <linux-man@vger.kernel.org>
Subject: Re: ioperm(2): confusing terminology
Message-ID: <aqvnsW9CxCtEG5lE@devuan>
References: <aqvHRZ7DfbdG5XBt@devuan>
 <aqvVeSW_dHnYbwca@devuan>
 <20260917123845.valu5ro5zur23o56@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cvpyb5hmsjhz5el6"
Content-Disposition: inline
In-Reply-To: <20260917123845.valu5ro5zur23o56@illithid>


--cvpyb5hmsjhz5el6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: astian <astian@memeware.net>, linux-man <linux-man@vger.kernel.org>
Subject: Re: ioperm(2): confusing terminology
Message-ID: <aqvnsW9CxCtEG5lE@devuan>
References: <aqvHRZ7DfbdG5XBt@devuan>
 <aqvVeSW_dHnYbwca@devuan>
 <20260917123845.valu5ro5zur23o56@illithid>
MIME-Version: 1.0
In-Reply-To: <20260917123845.valu5ro5zur23o56@illithid>

Hi Branden,

> Date: 2026-09-17 07:38:45-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> Hi Alex,
>=20
> At 2026-09-17T13:00:30+0200, Alejandro Colomar wrote:
> > > Date: 2026-09-17 07:04:37+0000
> > > From: astian <astian@memeware.net>
> > > On 14 Sep 2026 14:56 +0200, Alejandro Colomar wrote:
> > > [...]
> > > > One thing that is very important is that we use semantic newlines.
> > > > That discards .md and .rst, since they are meant to be written
> > > > with paragraphs as they'd be read by humans.
> > >=20
> > > Sorry, I didn't read groff_man fully, but I'm curious: what is the
> > > meaning of newlines in man that gets lost in those other formats?
> >=20
> > They have no meaning.
>=20
> I wouldn't go that far.
>=20
> Like TeX, *roff uses newlines, _in context_, to help it automatically
> decide where sentence boundaries are.

Oh, yeah, I was comparing two spaces vs a newline.  If one doesn't use
two spaces, then it would indeed be a problem.

> Because the formatter, not the macro package, makes that decision, the
> rules are documented not in groff_man_(7), but roff(7) and groff's
> Texinfo manual.  If a person follows the "semantic newline" guidance
> from man-pages(7), they can worry less often about what the rules for
> automatic sentence boundary detection are.
>=20
> roff(7):
>=20
> Input conventions
>      Since a roff formatter fills text automatically, its experienced
>      users tend to avoid visual composition of text in input files: the
>      esthetic appeal of the formatted output is what matters.
>      Therefore, roff input should be arranged such that it is easy for
>      authors and maintainers to compose and develop the document,
>      understand the syntax of roff requests, macro calls, and
>      preprocessor languages used, and predict the behavior of the
>      formatter.  Several traditions have accrued in service of these
>      goals.
>=20
>      =E2=80=A2  Follow sentence endings in the input with newlines to eas=
e their
>         recognition.  It is frequently convenient to end text lines
>         after colons and semicolons as well, as these typically precede
>         independent clauses.  Consider doing so after commas; they often
>         occur in lists that become easy to scan when itemized by line,
>         or constitute supplements to the sentence that are added,
>         deleted, or updated to clarify it.  Parenthetical and quoted
>         phrases are also good candidates for placement on text lines by
>         themselves.
>=20
> Following this practice also helps keep document revisions from
> "bleeding" into unaltered adjacent sentences in a diff.  (I think it's
> worth studying why the Markdown/AsciiDoc/"plain text markup" communities
> have not independently re-created this practice.)
>=20
> > > diff --git a/man/man2/ioperm.2 b/man/man2/ioperm.2
> > > index e4a058164f6f..9b9aaf3840e2 100644
> > > --- a/man/man2/ioperm.2
> > > +++ b/man/man2/ioperm.2
> > > @@ -4,7 +4,7 @@
> > >  .\"
> > >  .TH ioperm 2 (date) "Linux man-pages (unreleased)"
> > >  .SH NAME
> > > -ioperm \- set port input/output permissions
> > > +ioperm \- set input/output port permissions
> >=20
> > If I'm understanding this proposal correctly, the fix is because I/O
> > is an adjective of port, not of permissions.  And then 'I/O port'
> > would be modifying permissions.
>=20
> The parse is not quite that rigid, but the proposed change helps steer
> the reader to the correct one.

Thanks!

> > If my interpretation is correct, then I believe I/O would be separated
> > from 'port' by a hyphen, not a space.
>=20
> Not the case!
>=20
> One does not say:
>=20
>   *I am a Linux-kernel programmer.
>=20
> but rather this.
>=20
>    I am a Linux kernel programmer.
>=20
> Generally, in English, you can chain nouns that function as adjectives
> to an almost silly degree.  I recall a favorite example from
> alt.usage.english on Usenet many years ago.  Here is a noun phrase.
>=20
>   sump pump backup alarm silencer switch

Would you mind clarifying when you should put hyphens and when not?
This is more weird than I thought.

>=20
> What kind of switch is it?  A silencer.
>=20
> A silencer for what?  The alarm.
>=20
> An alarm for what condition?  Backup.
>=20
> Backup of what?  A pump.
>=20
> What sort of pump?  A sump pump.[1]
>=20
> > Is this the correct interpretation of the proposed fix?
> >=20
> > BTW, should we contract to I/O?
> >=20
> > 	ioperm \- set I/O-port permissions
>=20
> I have no strong opinion on the ordering, but a hyphen does not belong
> there.

Thanks!


Have a lovely day!
Alex

>=20
> Regards,
> Branden
>=20
> [1]  The word "sump" is almost never seen in isolation in general usage.
>      One doesn't typically say the following.
>=20
>        My basement flooded in the storm.  I'm standing in the sump and
>        water is up to my ankles.
>=20
>     It parses, and is grammatical and meaningful, but it would sound
>     odd.  Maybe not to a plumber, though.



--=20
<https://www.alejandro-colomar.es>

--cvpyb5hmsjhz5el6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqr6JMACgkQ64mZXMKQ
wqljWw/7Be27E+sGqe1+iEIJttmqG7m1ny07h0Ct7o14CWCvs+r/GldpdGv+89Yj
cGlAC3/Km9IlKl9kkVsgSzmhxVdEUqQJVFFHiEkAILLgYQsUqpeahu3Fz7ThjMqP
bm/bKdAM6n4S6AfBux7+en0i6mY2OkFEVTbYz2G+AhPBknmN8TiMG1YjZttxQ4a9
CTe8bDvsup+1DWktHqhT6+zug9/OaFu0oKkRRRkPIYGpWn+Ge98cfgmJpIVaKKOT
DKPpKdXM+xsblocNmo6P5ETMcLJqgJHaoKyV6OD6+bJnTXMiVMlaIO8H9EZAMFnr
6JsW+NcD7hKySFlP6+1tN4zYhs/+y+3pNt/CI7U5nPA/K+3q0HIv4zyK4pKY5Naj
YUgkGtplaCNY86i1/zKLUQGLJDE3FKflYV9e2HKy9SOwST1Q7fLMxC9A1NOjtUVn
ufYlLsFfU9irJgCpXNZmKvTDuqiA0mRXGzRU2rc5R4p/O3RiBt77pYqK2kCmB5u4
a/t9j0bMTREmZM3iRC56IE4hT43OHMqeWpybEt/Kr8lH1CMJfkQWRExk0eBArfYs
t+hF2KmqOD4fZrBGWtnnayBc4J3RlEZA5v6NHmzLt2oW35BGMyiC2V/AWyF1yeST
pDKZJoxX0ogOpt2eZv3rEew+NwX/1autG3MtIWKiO7TAihlnO1w=
=vsGS
-----END PGP SIGNATURE-----

--cvpyb5hmsjhz5el6--
