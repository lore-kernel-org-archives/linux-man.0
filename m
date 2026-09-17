Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894034BD359
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 11:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642851; cv=none; b=bw6hr7KCoSFZq3b06IGVjCos8zjvdNzb6q+WscZx6PiKVZeLs/EmaLOSB3Asm866GcZVexvliObEOuoro2R6XD21L5msHqWQsrb8et0IPGGVYb0AJDTqXzYinhJsF/WaYOcVxWrZNlHNWjcUF9Jpza5H7D48hDprVX5dNYiaNAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642851; c=relaxed/simple;
	bh=i5OLwRz7SKR11N4FASS6jNAh+Kouk7PBmUEm0W/mAwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kb1mHXeaK/izohAin7Gn7TUAsqTQeitgmA4nZmOMlTFw6E4D4ftOijkqmSRJXYOVJzIr3G/EikXmsgFuNEMEslS3ZGpYRIT65C8y3C/QDnZpuLSIUlcRLLMyyBKcZYIkYx9dX5ZtaObFhEjdb3CYa1WUnK9PaKSnDdclMPwF+C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2S9SKMs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2S9SKMs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B761F000FF;
	Thu, 17 Sep 2026 11:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789642834;
	bh=YhUROskAXSk/yAlgPOP1bo0Zxf8TEpW5+PVCjS5GAIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S2S9SKMszJ7GYqZwB3pETBqbrZmgzJLCem3v0lglM55RW6pGDIOMHIR1AvkhSh05p
	 4QC7NTf9Cl65XGBWM+rPi2L3p0kT6jl52c5rlZu/Dk6nEXKdFfZs/KJb1fmMkG1QNU
	 bhedc8jFWM4IQK0TiS7AfHrvjXw3YyoCJ1rnBwV08wqf0Efc4r9MUI5t9lNN5R9az+
	 ecfeyt8XmfZQM7Rv4ZzKhQX1UM+YNdO2G3CmPQGuasrSZEtP9d97W7p3XCy9UOvcgr
	 qd9OZyaJLTWRP8lhkZf1t2so9e738Ea2pZfHsupEKOTzz1JIkthSMCA/3+uy/cOuf4
	 FPORnUdTaQyBA==
Date: Thu, 17 Sep 2026 13:00:30 +0200
From: Alejandro Colomar <alx@kernel.org>
To: astian <astian@memeware.net>
Cc: linux-man <linux-man@vger.kernel.org>
Subject: Re: ioperm(2): confusing terminology
Message-ID: <aqvHRZ7DfbdG5XBt@devuan>
References: <DLDOCNQUCW9N.3GGL01BMV0HNG@memeware.net>
 <aqXOgqne-v4GtglY@devuan>
 <DLDZ6A0QS5NY.E0Y1TPNME1IN@memeware.net>
 <aqfsMbQWdqq_TG_b@devuan>
 <DLHEF3KZF52V.2PBZHFYF7KPYO@memeware.net>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lwcco4rvgpummx4c"
Content-Disposition: inline
In-Reply-To: <DLHEF3KZF52V.2PBZHFYF7KPYO@memeware.net>


--lwcco4rvgpummx4c
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: astian <astian@memeware.net>
Cc: linux-man <linux-man@vger.kernel.org>
Subject: Re: ioperm(2): confusing terminology
Message-ID: <aqvHRZ7DfbdG5XBt@devuan>
References: <DLDOCNQUCW9N.3GGL01BMV0HNG@memeware.net>
 <aqXOgqne-v4GtglY@devuan>
 <DLDZ6A0QS5NY.E0Y1TPNME1IN@memeware.net>
 <aqfsMbQWdqq_TG_b@devuan>
 <DLHEF3KZF52V.2PBZHFYF7KPYO@memeware.net>
MIME-Version: 1.0
In-Reply-To: <DLHEF3KZF52V.2PBZHFYF7KPYO@memeware.net>

Hi astian,

> Date: 2026-09-17 07:04:37+0000
> From: astian <astian@memeware.net>
>
> On 14 Sep 2026 14:56 +0200, Alejandro Colomar wrote:
> [...]
> >> Which bring up the question, why not moving to a less hairy source
> >> format?
> >
> > This question comes up every now and then.  TL;DR: other formats are
> > worse.
> >
> > man(7) is pretty simple, and easy to learn exactly by editing words
> > blindly.  There are very few macros, and their behavior is trivial once
> > you use them a few times.
> >
> > One thing that is very important is that we use semantic newlines.
> > That discards .md and .rst, since they are meant to be written with
> > paragraphs as they'd be read by humans.
>=20
> Sorry, I didn't read groff_man fully, but I'm curious: what is the
> meaning of newlines in man that gets lost in those other formats?

They have no meaning.

> Looking at some source pages now and it seems most newlines are about as
> (non) meaningful as in those formats (i.e., the paragraph is reflowed
> during rendering).

I don't know how you read .md or .rst, but I read them in the terminal,
usually with less(1), which doesn't reflow them.  Is there any program
for reading these in the terminal reflowed?

> > mdoc(7) is more complex than
> > man(7), and thus we don't want that.  There are other formats, also
> > inappropriate, for the same or other reasons.
> >
> > A summary that will serve for 95%+ of the text written in manual pages:
> >
> > 		.SH section heading
> > 		.SS sub section
> > 		.B bold
> > 		.I italics
> >
> > 	Alternating per word (spaces removed):
> > 		.BI bold italics
> > 		.IB italics bold
> > 		.BR bold roman
> > 		.RB roman bold
> > 		.IR italics roman
> > 		.RI roman italics
> > 	(roman means normal)
> >
> > 	paragraph separator:
> > 		.P
> > 	Indented paragraph:
> > 		.IP
> > 	Tagged paragraph:
> > 		.TP
> > 		tag
> >
> > 	Examples:
> > 		.EX
> > 		this is an example (monospace, no fill)
> > 		.EE
>=20
> Thanks for the synopsis.

You're welcome!


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--lwcco4rvgpummx4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqryEgACgkQ64mZXMKQ
wqkoxA/+N7SZbJOitumRLfKOXZHpZFYWMaGm59DCWZvbYPE8jHN5/gLNYcZuRyhj
OCLg3l87m5zPnFlVEJj/1qZC53X2vECTYD5DdHYykz7aft81WnbMr6EFgPgIq6AZ
ofc/tmnptxekAhcG7KDK6wZNzqSD0Qu8eMfJ9aOTyJ/dhiAenrKAXcVjJQLzitBL
uKFZhBawSz3aOU6KaoMTbzjxLaJVqxo1thtEYuLSwgwJ5S/YJpxkH1v/t0T2F1Kw
5ltuXpkW9iHKvYHyCAJQktFXrMDGROijJjXgomYG4DC4ScWEsFHiWqQHvABAqPMu
jYc4e3D+oNmar5St44ldgt4OCFzdbUFcuzssYTkVbMQvFxozqouGB21TgZUj7K5b
kt1B+y1s1lboHUFDt+STuS12quCJHKs/O09uHyooSgn34JYLY9R89p+WbyrW55T4
0FZiYUCsEygBOa0oaXzFTgLUtvTW6ZYOzDXvPbct+GYnAJNh3rPZf5OFpIxnoep9
7wkbcgkin4UbHMkcJts3LJ5dByhmR33xvmirAQheqBPx/0p6oiif/1+qLjxWdS3m
g9EqG0uDAlbKa7+1EQUUWubBCxOFiwWHyxfIKG15e3seiQ79XE2zkvMm5HO+/64/
nAl9Xy9Row7jVXjFFZo5KQXSjF3C861MVhfLHFA1MlkUJeRiMmg=
=Zf9/
-----END PGP SIGNATURE-----

--lwcco4rvgpummx4c--
