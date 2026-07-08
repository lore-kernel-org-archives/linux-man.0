Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58876401A33
	for <linux-man@vger.kernel.org>; Wed,  8 Jul 2026 12:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512148; cv=none; b=pYBP8sAIiQQYtb0KvqZMtAw00mOS2+LnJmIdWc9TsgvltWmIVC1uNz5Z4JupJZTI94wC7w26TSlB9ZeRqEnQFnkLx61GQVui7LjbTHaezeq0pFFRxwMvffSLI5vLIEaXrhE5x3frlF9EqoLoZGQQ1mwoLLKQdEn7TGfX+nYDK2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512148; c=relaxed/simple;
	bh=wYeflACh/JtoAvT15rCbs0NmONRORY2a7gqZ9y3W24o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhWqsH0pN14Htsn9KHIlQriwV6wLWxgDDg0fTagAHxA0GD0dFVrS/sy2ncf4+uFdfRZ5HbHtADPVmnGKIRE/qykjTunm/WFzWPml+tqttIBwKWPyPsOdRjHHQJGiwU0yLuaOq7iH7vgWnQw5h+hrAFJOsftJ12eogJuSX0qrmsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cfw0VnnJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cfw0VnnJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C861F00A3A;
	Wed,  8 Jul 2026 12:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783512145;
	bh=C/zrmzlmtfsdyyEX2oLxfEIFWx0PhZqsP/zylfLKQyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cfw0VnnJsnQp69BWGrGtbDdkEPmc3kYGS3u/zzJZ/phoF025f+Nobeq+5WwKKuRzN
	 yXyHENbFDED69K/A/z8PZ2A4QW0YSFy8ljbxazMlFWyJMr+YcQLzlywQ8xE1wn9taD
	 xMuwTo0bc62xQqPHhZGsvVzUAF0W/G3xK6RHfGoIAB9486qMAPQEvwxWAvXHNzY/N0
	 fDSzq+0WmpKoZTpknSC2fQex9N/9r44PuFWMyZKne2/vyTAbD/ZQyWbUYEOPIYaBXE
	 2gB+cH7B363y1INKcx0Q4XhLkmhDpp9SPuyMm4nxRB6hQ4d1KdtOcLdSI0L7RPu01v
	 zL+4rb0HQsirg==
Date: Wed, 8 Jul 2026 14:02:22 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Jan Engelhardt <ej@inai.de>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v3 2/2] console_codes.4: document more xterm codes
Message-ID: <ak47_pq0BTsoSw0P@devuan>
References: <20260708104303.39708-1-jengelh@inai.de>
 <20260708104303.39708-2-jengelh@inai.de>
 <ak4xQ66nid2RrSKe@devuan>
 <p87sp316-232n-8303-q91n-o385066pr74r@vanv.qr>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qjpmksduenmpi6se"
Content-Disposition: inline
In-Reply-To: <p87sp316-232n-8303-q91n-o385066pr74r@vanv.qr>


--qjpmksduenmpi6se
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Jan Engelhardt <ej@inai.de>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v3 2/2] console_codes.4: document more xterm codes
Message-ID: <ak47_pq0BTsoSw0P@devuan>
References: <20260708104303.39708-1-jengelh@inai.de>
 <20260708104303.39708-2-jengelh@inai.de>
 <ak4xQ66nid2RrSKe@devuan>
 <p87sp316-232n-8303-q91n-o385066pr74r@vanv.qr>
MIME-Version: 1.0
In-Reply-To: <p87sp316-232n-8303-q91n-o385066pr74r@vanv.qr>

Hi Jan,


On 2026-07-08T13:58:04+0200, Jan Engelhardt wrote:
>=20
> On Wednesday 2026-07-08 13:17, Alejandro Colomar wrote:
>=20
> >>  ESC ] 1 ; \f[I]txt\f[] ST	Set icon name to \f[I]txt\f[].
> >>  ESC ] 2 ; \f[I]txt\f[] ST	Set window title to \f[I]txt\f[].
> >> -ESC ] 4 ; \f[I]num\f[] ; \f[I]txt\f[] ST	Set ANSI color \f[I]num\f[] =
to \f[I]txt\f[].
> >> -ESC ] 10 ; \f[I]txt\f[] ST	Set dynamic text color to \f[I]txt\f[].
> >> +ESC ] 4 ; \f[I]num\f[] ; \f[I]txt\f[] ST	Set color \f[I]num\f[] (0-25=
5) to \f[I]txt\f[].
> >
> >This seems to reword the description of ESC]4;num;txt, which doesn't
> >seem to match the commit message.  Should this go into a separate
> >commit?
>=20
> I had inspected the xterm source code to figure out what codes are availa=
ble
> and what they really do. This naturally led to rewording inaccurate
> descriptions in console_codes. I do not think it is necessary to split th=
is
> into much more commits. I could might have written
>=20
> console_codes.4: document more xterm codes and fix some behavioral descri=
ptions
>=20
> but that gets a little long for a summary line, wdyt?

I prefer a couple of commits.  One commit fixing existing descriptions
and another one adding new ones.  Two commits should be enough.  That
makes the diff nicer.


Cheers,
Alex

>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--qjpmksduenmpi6se
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpOPEcACgkQ64mZXMKQ
wqnG7w/9GEupR2SinKhUl/oFeKhDQJy3ojvXgmHyzoDtqicVGGeyQ9RhZ3OP5hLc
51oV+H5Jhfzzy4Ka/DVvI3YdOigv9/BsPd8/fVDGcj1j2ekVx0+ftQygz/wVnbkw
usGomLWg4zuGTvh32QjrRL2FyNtyZu5N+dEVBCSsnQkuldOQulMNkJuoDyybRqDa
9PCV/Q0W67wzjE1xcy3VE6lhJGO67sRWCAfgbBwJDdZXFDqVZe2NDhdnrvgq17d5
VnQVGPMGqZN4cbjVJ/+16p930H7kvJrZpoB5cIqzvXFxnd8oPKGYStl/G0pZS7fr
k+itWuoyNlkcGR4zhImkGsM85EReWpjUjkPvUyvs3URaqm4gLeIV/Zihyr4HRKg3
lHTYcRgQ3QzNn81lNArDNjwweXHGX/IZSF5NkNpzI5bk2TXLxLwZbL5SbBpiS+rz
nPNjnki8UtAbC4JhIzhLHOp5vBvK/PmYPcPo3AtH/3RER4bcQE6B8CmhNYErhT2k
H3lnX6G2BUxihY9xx72SPnaDa1kPjnk3sGgp69sHVIHNn873zTuem6Qoit/WWvpV
9unuqFXgYt0MntIm5Rlj43gPMqXyO76OU4CmxYyL2C/QTvNPDqwLjb1Wzo/acV76
5iOnWVEXj6ZqrUv0XmavolIRKVJgg40gmqW3VNXHwoukFPqwB7I=
=V8aF
-----END PGP SIGNATURE-----

--qjpmksduenmpi6se--
