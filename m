Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FC838331F
	for <linux-man@vger.kernel.org>; Sat, 22 Aug 2026 22:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787437810; cv=none; b=rs0Mq76opQOGZkB16P1Z6guQkplDDGWgkKpguiBLqPxpRQwDARS8RpPY+BKJQOCRuW1vRV7mY/HiXuGYyfPii6k8+2Ib+Ecc+DTKySbIJOIaVkYRw66kBHQ+7KTPPPUSBc+rhATL8wIkFPwXNgetwyq1OCYU5tKQ2w7c5yCmFBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787437810; c=relaxed/simple;
	bh=6IUxbooyKNfCZd2FVrHBNSEVpptMgAINu3miuRoJbVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7x+f36h98EwQzjXiCzL1o8NCtBL3Ob8eLilmLhu0IrP3RVvVn/bW58guDR0X+Yq8yvQpss+s+btn8IpyUelqw7LMt6PCDhlr1bRm8MAGlNgXT0SVYqFMMDOpAmotfFYHLDVKixfEC7p4rCGUHGmgbwOwZwCnnOCJoUJQhkM2Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mB2aQKb8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mB2aQKb8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7871F000E9;
	Sat, 22 Aug 2026 22:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787437807;
	bh=1fDjlro3ZKm5jslImHWz2PVsgz2qQXIycJ/eqCkJycA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mB2aQKb8DsHrU/OS/WduHECDXDpMxSdg01xUg4n3HXCV9I86jUM/L4aEhY6IULiYE
	 cZStOO/vXKuXbALdlLmuPcFt04BJaNCVemLOejU+R7MnNgAIWgGRlNraHtgOfGSrNe
	 1sEZ4uYIYYvR5N90odsDd7aQ2aVkHVyuPQAGMPlVm0aNEhYR2gohbYIcN8M3mdDBQB
	 XxuYx8VuWcqHmB2VDAsiozNuFR2ucN/XNFpKuo5yEa2Z6y/JKrsTey2pGNxn9NA6yf
	 Rt2JeKhoFOrOJxgoEmV3Kv8ab/j+T352o2a0Ftl8v9bwpw6bqEeY7Yl3P0fIrvbQOe
	 VonbwURqgi+3Q==
Date: Sun, 23 Aug 2026 00:30:04 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <aooioNNOhTmULlfl@devuan>
References: <aonfyurBGGpdjEil@devuan>
 <xn8q5y9h3a.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r7mlnqrdkpkeux7m"
Content-Disposition: inline
In-Reply-To: <xn8q5y9h3a.fsf@greed.delorie.com>


--r7mlnqrdkpkeux7m
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <aooioNNOhTmULlfl@devuan>
References: <aonfyurBGGpdjEil@devuan>
 <xn8q5y9h3a.fsf@greed.delorie.com>
MIME-Version: 1.0
In-Reply-To: <xn8q5y9h3a.fsf@greed.delorie.com>

Hi DJ,

> Date: 2026-08-22 13:54:01-0400
> From: DJ Delorie <dj@redhat.com>
>
> Alejandro Colomar <alx@kernel.org> writes:
> > Another detail I noticed now: How is the process name taken?
>=20
> The kernel doesn't actually tell us the name of the file we're exec'd
> from.  It passes an already open file descriptor.  So we have to infer
> the file name from /proc/self/exe.  If that isn't available, we use
> argv[0] (unless AT_SECURE) but that can be vastly different than
> /proc/self/exe as it's a separate parameter in the execve() call (hence
> unless AT_SECURE ;).

Hmmmm; interesting!  I'll push your patch already, as is, and work on
a patch (set) of my own to improve it a little bit.  I'll send you the
patch (set) for discussion.  Thanks!


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--r7mlnqrdkpkeux7m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqKIuYACgkQ64mZXMKQ
wqm2Sg//XM25/m6eFL2qnpzcZsiwB5p/jG9I5d8ru9sTiwd3mro2qUnzUkoKGxoG
ya2VvEyeADHLLvNG4sLcGQJl6r3AzNxGiJwGNTcVlYmQ9RMgtgutB4Ll2V82Bhfa
YQF2/RtGs1PQ99kt7YRqSSzo3Q7hadCcSZgmrtvJDo/6hlEJMEzfN97v4sokrp2S
aO5QsP6UJYdAq/tXEpWBsLZzTqK4sv66VBn9PzwCplxNYLo/bdGN1nmRsFnU20QN
LKzIsWihDmEJ8SlH8+fDSXTi+yNTGaEA1u2VlDuzar/r/aP/W2tmMrulTM7z7Tne
bfTu84ghvHf3S9nzFdjjprHwCHFNqwJdYL01QUhnEE66P5MwKcoYhVERohp2Qw/m
RSiElfRpOzV9SYn6RF3NLeOIlBd4sCdHI1LAZISCEU2TTfraxZGexSnmO4ptEWeY
fH9/OiqXzXicxVhyf48ixmWrIKS/j9sCuaK5GikZtJsRX43Mn7+mrp3QXgWYJA5m
a5IHH4/CQizEvqMspB3heCCZJ7HhOhEKu0ODW4bDzkYRZdzfqxGynpHeBOUQskwt
4k/2Gjkc0L3aU5RVqrWVEE4nqr9JoDY4GFQnLsRL8qXqgUVd4188OuZYEXxAOWJP
7/4etNh10N50MJx5oxUDFDFs0mARqVfZNrgp8FzSr3gggZzZLdc=
=vonb
-----END PGP SIGNATURE-----

--r7mlnqrdkpkeux7m--
