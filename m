Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC0F2D47FF
	for <linux-man@vger.kernel.org>; Tue, 30 Jun 2026 09:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810925; cv=none; b=flsEIu55kDSBhhZBeK6UekgT8ZihAa9JgmjtVNnKMw9a5DOFbW8VSGFDIGaf/YLQZhjcNUZcw9cc2v+ptskunAZ6+q0oXAa9inrews/l3tfNtfJRoXuYFdd1udg8ka2o1eYclGpmbHps8hIGDdvM3pU1d5ZaNDzRs0H3KriRGL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810925; c=relaxed/simple;
	bh=FOkQ+QvUbREForKc7A1O2fFAcQvSc55YJfmiwSL7uwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLUZGEs2NbLLqa01GGwD11or2k5QSU0vQwNaA3v7qndFdxBu84CzGuBI5cHcFWk1AekzDU+XjkHwVx7CrzOCvMrh2t2IzUnNrRvw5DqpFC3t0RddAx7Vtm4Nfg3C2UwjvuoegqDV31aqBK6m0igrBlDvOyo5STFPq+gbaWhPPZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUcxoydM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUcxoydM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF471F000E9;
	Tue, 30 Jun 2026 09:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782810923;
	bh=GSTwNeCxspMR2G1YV9jVi2qO1BQs6FPDLXB6owBZ6GE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TUcxoydML0Os9Y/FJvdL+mq5A/iYl5IlML5BUafC64vVD+Nry8WGikWiwW39mFiTV
	 XCpz9f9apMWAc8wF1632QXxwJZ1htHw45Ze+MKw6LRj8cOh7J491XPkPCI5Egdhca3
	 JJ0yi6ioXCJKqfEBpgWH4o50NNjYBAHWVjt8NFQHD1PYn/ivbJMSrPmCD5FS60wsGL
	 28EUxeqZ32y/mv2WHQr+XcFDlVlJ3v25EAkuFNL7OzbdtDRoA5Sk5qEiNweJQFny6R
	 Mo4xnAxM3amziUa5auYuC/py0c5XnnmllyN5idKb3p7momr5mo/tJ40izXptJOozGT
	 QS+YGA06W5RsA==
Date: Tue, 30 Jun 2026 11:15:20 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: Re: [PATCH v2 2/4] man/man3/termios.3: note that setserial(8) rate
 hacking is dangerous
Message-ID: <akOJFM5tLTHCy9Jc@devuan>
References: <20260629135910.143781-1-hpa@zytor.com>
 <20260629135910.143781-3-hpa@zytor.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7lsly27nj4rax6q5"
Content-Disposition: inline
In-Reply-To: <20260629135910.143781-3-hpa@zytor.com>


--7lsly27nj4rax6q5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: Re: [PATCH v2 2/4] man/man3/termios.3: note that setserial(8) rate
 hacking is dangerous
Message-ID: <akOJFM5tLTHCy9Jc@devuan>
References: <20260629135910.143781-1-hpa@zytor.com>
 <20260629135910.143781-3-hpa@zytor.com>
MIME-Version: 1.0
In-Reply-To: <20260629135910.143781-3-hpa@zytor.com>

Hi,

On 2026-06-29T06:59:06-0700, H. Peter Anvin wrote:
> The use of setserial(8) to modify the 38400 baud rate was an early
> hack to support baud rates beyond those standardized by POSIX. As it
> is, it is a real trap for applications that actually want to use 38400
> bps if a previous user has not cleaned up the setting.
>=20
> Signed-off-by: H. Peter Anvin <hpa@zytor.com>

Thanks!  I've applied the patch.


Have a lovely day!
Alex

> ---
>  man/man3/termios.3 | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/man/man3/termios.3 b/man/man3/termios.3
> index cd3f9ce4d7c0..f563923fc7cf 100644
> --- a/man/man3/termios.3
> +++ b/man/man3/termios.3
> @@ -1119,7 +1119,9 @@ constant is defined prior to using it.
>  The actual bit rate corresponding to
>  .B B38400
>  may be altered with
> -.BR setserial (8).
> +.BR setserial (8);
> +doing so is discouraged as it may break other applications
> +later trying to use the same serial port.
>  .P
>  The input and output baud rates are stored in the
>  .I termios
> --=20
> 2.54.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--7lsly27nj4rax6q5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpDiScACgkQ64mZXMKQ
wqkOuhAAvk0M5qsgIXznlKnDF/RWx62/4AM3JoEl8rXtoCmfvS1nDtpGsnrm2zuk
pw6/SxWrtTT4AxoyLshrZwB4lrf6wFLKnIzUefGmnwi4TM4HQLqiCkESCagsWw76
M6PI+cKxDXML46aSohKnu2qIFOUeC5ZXReAC6dKkmn9bYLkdYE9ZXKchovZBlPkM
J3R+UeNjyOEM3vboC2qf61gF5FxqOE9+FCKvBPKY26ycZ3/vhaSUaF1ymuVwWILe
whaWa3kgSibjop/RiEb832Hkm/sDBdNnSNb0VMbZSnjRivVaS/KJT5H5BHgpEzvy
2FB2/KVipm2bjqeH+qmOpMfjrVMlmADH8ltZ6Af1OILRTd9+c6eQQOAarzwNNtho
eccm72oRq3EC2AxyCVV0EXGYaoaGDDXcWw3/6giTUDmtq6Xbrb8ttgqgcBZkiUrQ
t7/C5moaUDE0HOzBjiCUq8UKXF+wgA5h6pXkZG0j5OuInD8/q6d1Gh4kHpn/46iv
TXDAPYzWlenXzsjg+3sWLUlsd/LT5zsIkQGZ+Rx3Lmkm7MRFINkO5Nji3MM5IM8z
74vz/61uFrEJbpuAXUlREHWuhmGGcLM8L6tlom68ymJ+mxu4EB0OzaChO2XlgHwV
hCz+4O994fuUcSrLl1ENb9hvhSlt6ZKYpM7lXEahRiuUuwGMvTw=
=YjxC
-----END PGP SIGNATURE-----

--7lsly27nj4rax6q5--
