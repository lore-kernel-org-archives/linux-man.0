Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794963988;
	b=ar41yErLFhh2rfbKMys8XefV8oq0PMnzncuXJ6y0dilHSC5EclmiXTKVV+CKHI2n3SUp
	 /hgFPH2nPfsK+eSCmhmiuFEUPcxFOvTxo+Gnh+0NBIQfB/aBTWQ4X7jKd4tvIhi6QUpeM
	 /R4dyisKPrwlLmfIQYecn2zcEj4wdjG2C5DfAMNSwHNXQhjIA54Zay1ohdLq5fp5XWWfN
	 uWs8hSz9lkBAKMWN+ltGstcEERLMt53ZCZxaIM4inl0FPPSZW5pBksLj100fB7iDzKMmO
	 NyrYwmK2d0tbAjvqzZVJSrIcJnNXofpEczPqx/6FC3zFqOGmIPcNl5VXgUUyqv4md8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794963988;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sKgTmbj/OxDcvPmw7wKDjO2g0q7j3o8DPGLsHEc/6a4=;
	b=V7LQOp7UED6PODOL/OPD33311z5qsNFOv93eC5Gj2kMjpla3xnN+QaWkP+Um1Q6iPnjg
	 Lx/oyc0hnprT9LyNvw+R7OJF+e0QPUWdC7sVItPIdaRM9trkCaRgVdLzbviyf6HayUQeV
	 1k6QjgIYI9t86EalcdSNL5zwN986X0qrCQX2EwvBKUc6QMwKrBu6CBVNxohJBCFazOh8w
	 huL9WhaBV/hWFta97aosRH2cBzrtU3pTy4Fbh7OtwRwg/YJurqAM8aHxx8Pb2FwhhrQQc
	 EggTCsP20ZSRIZkIVSRYnvZ0f3TLG3g4mpAU/ks+pzZVFTbYIv8UExaJnGg/hWVcbOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fhORQfRF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128FB606A33E
	for <linux-man@vger.kernel.org>; Wed, 18 Nov 2026 01:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fhORQfRF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD8F1F000C4;
	Wed, 18 Nov 2026 01:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794963987;
	bh=sKgTmbj/OxDcvPmw7wKDjO2g0q7j3o8DPGLsHEc/6a4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fhORQfRFcWb5oTj2X/jUQB5aWGDMnoga5tbRPAukmQ1UAp+UIW+3C1d7HSTTCj6DH
	 0XpmwH60zR2bg9EITtmjB1F0eNLkMXCBFXgmXO4f1IFU5orxixTKZ08FmMxhhYFdNT
	 6EAWPfu9wcBjDsGaaIESkUyD5+RDjKU1X8/DA8ddcSI3DH4Bs4tIFdmWFbQofnDch8
	 wnIqccY78FIMJyBDTI3NVmqcOnbHz2i6MllW02YRAPZFVAI6DmZ3fLi27p49hGt1aL
	 0Gvm8YUWzBETbIG/TrWsjjjyIswq4Bor1auQKvPieWiJNtoDhs5/2W9XEOyu1FezvH
	 Unw+W/i9yDAOg==
Date: Wed, 18 Nov 2026 02:06:24 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>
Subject: Re: [PATCH v2 3/8] man/man7/unix.7: Autobind: Clarify when it
 happens, and mention SO_PASSPIDFD
Message-ID: <avz5_i7oaSB36y1s@devuan>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
 <20261103202211.13820-4-gnoack3000@gmail.com>
 <avpUAEkxyr8ZvDpw@google.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3drfwi35wvuxaqms"
Content-Disposition: inline
In-Reply-To: <avpUAEkxyr8ZvDpw@google.com>


--3drfwi35wvuxaqms
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>
Subject: Re: [PATCH v2 3/8] man/man7/unix.7: Autobind: Clarify when it
 happens, and mention SO_PASSPIDFD
Message-ID: <avz5_i7oaSB36y1s@devuan>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
 <20261103202211.13820-4-gnoack3000@gmail.com>
 <avpUAEkxyr8ZvDpw@google.com>
MIME-Version: 1.0
In-Reply-To: <avpUAEkxyr8ZvDpw@google.com>

Hi,

> Date: 2026-11-16 00:53:28+0000
> From: Kuniyuki Iwashima <kuniyu@google.com>
>
> On Tue, 03 Nov 2026 21:22:05 +0100, G=C3=BCnther Noack wrote:
> > Autobind happens if either one of SO_PASSCRED/SO_PASSPIDFD is set and
> > either connect() or sendmsg() happens.  Mention SO_PASSPIDFD and
> > clarify that autobind does not happen immediately when setting these
> > socket options.
> >=20
> > In linux.git net/unix/af_unix.c, unix_autobind() is called by
> > unix_dgram_connect(), unix_stream_connect() and unix_dgram_sendmsg(),
> > if the socket has no address and unix_may_passcred() is true.
> >=20
> > unix_may_passcred() is also true when SO_PASSPIDFD is set, which was
> > added in linux.git 5e2ff6704a27 (2023-06-12; "scm: add SO_PASSPIDFD and
> > SCM_PIDFD"), Linux 6.5.
> >=20
> > Also, the old text said "not yet connected", but the condition is
> > about the socket not being bound.
> >=20
> > Fixes: 9d1fd1157306 (1999-06-15, 2022-12-19; "man-pages 1.24")
> > Fixes: 0cf2caa41ea6 (2010-10-10; "unix.7: Document the autobind feature=
")
> > Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> > Cc: Alexander Mikhalitsyn <alexander@mihalicyn.com>
> > Cc: Kuniyuki Iwashima <kuniyu@google.com>
> > Assisted-by: LLM
> > Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
>=20
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Thanks!  Patch applied.


Cheers,
Alex=20

--=20
<https://www.alejandro-colomar.es>

--3drfwi35wvuxaqms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr8+hAACgkQ64mZXMKQ
wqnuKQ/9FTmaq/Bw5Hg5NF+4zwJkOVdhHwE3nKfH6DTrZQlOnJC7H45mmmgVqQh6
kPaUIIGcHRg8Pr2D0e5WWgwiUwKIIn84NIz8WpbDxRokAWZTVsQw0ZQ2QXZdENYJ
IvdpnOrtQsYx78y0OkZgER07Wng9h6I/fKqbroE4QwqLn0YDIskHq+gdjh55p3eN
JfLcZncEAwBBe4ydsA45t+hFKuZ2yQrd66DOwKH9rQWG8aVZ3cJg3sLj1ZRqEYVP
+eeulGquozs2uoyk//Q1SIzE151h2RIzlqqxu95V4gfkfMRxdQBlcWBvNkJ9hk9T
XbX97YRc9U6H4jT4/Xq32Do341/Y1G1D0EVAN5yKyg2lYl6Rx79+yVeM+Lsd5JvB
0B7AwoXrftJho9ItaCcpKp1CYnHo0fBbpz8NkFZlufacYR0iB+6N9NNqBXIvwACL
Kn351eGlZOlPdBnAS18F3yAOxNx8V1IEaO7b4CqzCoeD19nIuJSUqr7jcxViku6U
4AN3Gd5pQiB0y4VVB2HNBwzwLu25LUzntOsXzL8B8IPjBiUyGmikXbnmPWYYFWpk
wyfB01aLx/0OYtrEn+zUok05jcWAt4w0g8aK/J4i59UmYklO57bjoZvBiqLNU0iu
8DV7SeV1CcDdsG5nh2AJ0FRnfOvkmn/ixQ2/PDeca08OGHGPtC8=
=QxcV
-----END PGP SIGNATURE-----

--3drfwi35wvuxaqms--
