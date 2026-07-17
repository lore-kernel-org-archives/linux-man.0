Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8A73C555B
	for <linux-man@vger.kernel.org>; Fri, 17 Jul 2026 12:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290228; cv=none; b=QAT4Eu9TwG59KG0wKRW2/iuSIYEFJHlnLF95ydezkUgMkS+hJR3wRm/37DGo16OZu75vRUxNRe29izdyENSTHGy1N6VzFgBkch43OV23Xnw5vljh/fPFh/1OnD9rmQBYeDsNbSloyNnOur66DV1QzlVYLuDWcJPL2AFRuReEMzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290228; c=relaxed/simple;
	bh=ZAoPrHJw57Q0Oqe+Mbz3VNkfLBgzszaiICET2YIWGC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uucc6cuXzmyXn/0YItYUrSo9qzK2Bz41gAJ6ZixxlVgjfRzzhYapYpD6lDz+paEOFMHwBk61Sc9NgokaRjHSDejyCFqjVMtcAConiv2JhuCLYnBaNJKNC+o9MYV2dYZrczYNWOXlABFNmD3+DVlsIr9MtyTbVT+jVJ0+IxLhEuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHoudi+J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHoudi+J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D66BC1F000E9;
	Fri, 17 Jul 2026 12:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784290226;
	bh=VEQQFko2RAjfRS/Ks29S2sZT6eInAZxrWBb4DeBjeJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GHoudi+J+2nvuX9sLTxrMgYd6rebLVIpfV3FcaPH7+u0taoYLF6YwhGso82kVGrba
	 vt6m18ggUu3bhkWVRTGAL3jg/vOn3yp4AaChcKD1yKl+YfJ+dtSHRsdAoK6VvUQFkX
	 p91C/VRI8PqIRiP08HlXGlp/3SEpkIclNynzu9H2HH5sRYgUkXrPFFsTwaHrdbRQq/
	 9xQ6w7ICGcE8tCMpL0JBYJ10kso4HUQoMQCZsmB5N5E4Rm3OC8+XwKYd59x80vj+sJ
	 Q04KiHRguioDo9p/HZwhk8XpaG2fvjVYeLB3xydpDghYF9Ifrsl8zzBQcpUza9qdCm
	 6KlnFfsPo0zjA==
Date: Fri, 17 Jul 2026 14:10:23 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Cc: linux-man@vger.kernel.org
Subject: Re: syntax of options in man1
Message-ID: <alobDcKZVkwVqzRx@devuan>
References: <CAKH6PiXDGL658h1t_bstW0Z+MjjJfcNmcde-DA3QNOYKc0TTGg@mail.gmail.com>
 <aljtsrJVLTN6qlxP@devuan>
 <CAKH6PiXx=WycAiPGti3LAAfpmDQExkcWsatXjOXpD=GdiMc0ng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dgmgextwjjjm3buy"
Content-Disposition: inline
In-Reply-To: <CAKH6PiXx=WycAiPGti3LAAfpmDQExkcWsatXjOXpD=GdiMc0ng@mail.gmail.com>


--dgmgextwjjjm3buy
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Cc: linux-man@vger.kernel.org
Subject: Re: syntax of options in man1
Message-ID: <alobDcKZVkwVqzRx@devuan>
References: <CAKH6PiXDGL658h1t_bstW0Z+MjjJfcNmcde-DA3QNOYKc0TTGg@mail.gmail.com>
 <aljtsrJVLTN6qlxP@devuan>
 <CAKH6PiXx=WycAiPGti3LAAfpmDQExkcWsatXjOXpD=GdiMc0ng@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKH6PiXx=WycAiPGti3LAAfpmDQExkcWsatXjOXpD=GdiMc0ng@mail.gmail.com>

Hi Doug,

On 2026-07-16T13:19:20-0400, Douglas McIlroy wrote:
> > I think there should be a separation between an introduction to the
> > entire system (maybe this could be intro(0)), and an introduction to the
> > first section of the manual (intro(1)).
>=20
> I agree. In the early days, at least, there was such a section, called
> "getting started". I like the idea of calling it intro(0). The very name
> suggests that there are more intro(.) pages. Elegant!

Thanks!  I've done the split already.

	commit 214f536963b0a108abc54b336d8ac21b4c9f1c7f
	Author: Alejandro Colomar <alx@kernel.org>
	Date:   2026-07-17 14:05:19 +0200

	    man/man?/intro.[01]: Split part of intro(1) into a new intro(0)
	   =20
	    Let's keep intro(1) for introducing just the man1 section, and move the
	    more general introduction of the entire manual to a new intro(0).
	   =20
	    Acked-by: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
	    Signed-off-by: Alejandro Colomar <alx@kernel.org>

I haven't yet documented the syntax we were talking about, though.  I'll
think about the best way to document that.

Here's how intro(1) looks like now:

	$ MANWIDTH=3D64 man man1/intro.1 | cat
	intro(1)            General Commands Manual            intro(1)

	NAME
	     intro - introduction to user commands

	DESCRIPTION
	     Section 1 of the manual describes user commands and tools,
	     for  example,  file manipulation tools, shells, compilers,
	     web browsers, file and image viewers and editors,  and  so
	     on.

	SEE ALSO
	     intro(0)

	Linux man=E2=80=90pages (unreleased) (date)                    intro(1)


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--dgmgextwjjjm3buy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpaG64ACgkQ64mZXMKQ
wqm9gxAAox8eG4dCUILkeszszE7o4uqdvdOLCmDS+AoBQOuUD3p7QF9ZTFN+BbxG
EyoQDMC0/smUe0ujTtx27BCZwLvZUIjRCz+tYUClZOz+1lgjGKOarrTiywsYhFiG
DgL+mPEJh0vpUXSyE+JhoQbDHN7J1KNLVsyTGlodbmwX2hUai+ZFqiJX/WF6v0xq
70Ln3hxKjnmO+F1TRRT8Ab+HB8CDO4kF5t4w0HBMuIPJ9pOsLIT2qjqdEz0KBzwv
6roGnyl80zZ5qdRFv0N8WSC6rBv5OqCCUSw2ZZV9jeeH7f0aO9hPzJtwMEClI9Lh
y3ILTnLFV/12kFP4Os5VH9wOk/AKlohXSOpuVzvvuaMVT+G4RMY5LksJiCLLjB0y
TwO8EpWDxbpzU83/gN5CPrMAEAHVZDXaOYuhASJLRzRBEHWahU7kQ8IU26jZAbZE
UvIqMsd8tJEJG6N7oRVyBoxHyjA34CVUc2yjYFR7AFXNJ3m0rFiNJxYCPdRPxdbJ
0PPopRB12KIFUCvN5HjNOfNNLTWPAhC19oHKsQTvlhxasBJ5cHx+UV6bi+At3W+T
QeLrPCHXp9EmtEXZVxEu0VajsO8jeTpyzybYEyV1HVAWTQ5N5na3225C4w9Ndc+P
PcAgRbxafNx1Zu5hgT3W3tdQsfUjBSVPg5hctQLK/e47kkxLTd4=
=nRbU
-----END PGP SIGNATURE-----

--dgmgextwjjjm3buy--
