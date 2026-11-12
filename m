Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486437;
	b=Ux3AmkUDEjLMAK31IK0Ede1JhJhwAGO9/Vlh4TmY2ooPRUnUxSyWr6OPMLHWiprbq2wG
	 DCVuJz/DdQAgvBsotXplbFB6/uOjUl+gZA761jDtB9r94bCBsecCYORqjaoRefusWWt8z
	 YYJQBLLg3xZU1Q28W4RFEwFokPJF1uKQHthkkzE7OlmwRjoI+gXWxsGRupTSClREVjBhK
	 ix+5h0UJHcl/bx//XC8YIzVP6RdODfMhasd0PQIj2y5jUZtNMDiQaFO8p6hJXwrkxhCdt
	 T7jEPSLryoAxbqqB5bgnGssMTAaU32yXgv591wpMO2pw5dnOCXWuHjK2rBZEaxwKIgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486437;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+J2igLk18YXiPo+HTfROCNkGZhns2lQo4B3cNlyr1n0=;
	b=CqiLHohSJeNIxluOzQ6RwgaZsLVD+FsUZTJzli/PkaECotm/x2nI/vVY5nytkeSfMrJq
	 9IOYMgEAI+IBIT+ESdzXCzk1Jk6y5CwLhEUgmChi3SP2e36QGHwHPqUl+/Nj/xfhKLwad
	 MoQVDKXzaRycBveKUs2+kKBH/kpKizIpUEMhoEifH64nGCUFrtQV9X7SGnU7MuA9nNcBP
	 9F6CQ5JJyFABzHc1BoyXvmvZq58MK5onoWVN3a0UaPv98cX5Q8uATbzeaaseKgiSAKLre
	 AIxrbD3MhJEqGvx9tClm172uCD14TwXms9bJpUJEPeO261Ln45/TpO1cNyQD6vLeYaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQwne6Fj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88B9606A31C
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 12:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQwne6Fj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC2811F00A05;
	Thu, 12 Nov 2026 12:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794486437;
	bh=+J2igLk18YXiPo+HTfROCNkGZhns2lQo4B3cNlyr1n0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WQwne6Fjbqa1MJ1z1/enyW+EEn0FhobtMouPUBJ3NaRvScQu9FheiNrPSAYKp+ami
	 bYGbJugoPztLG2V2j74xUi9bpak9ci8Kn6zZnQU32o2h9EnOfIBAxpnzPj7A+fNeYo
	 KDBLxgRjgsp3rojMcZot+K1P7CEgu9+/LqxMSvJ0Nq0pnqtk6HEcDlcxMWXpa8JVOY
	 utYLRa3XK+kI8a4XSLVwKOBuVKytKtU1K+iJCVDT8+yzR6RhXWzGZe93AGoWwU5Rgt
	 oI4Fr/H/UgMdPMjpO9qQANN5O2tYpCyEMwhok8dBkeOM7UxEUTE2dujZu8POhyD8T0
	 XwQ2oPcdwU8Zw==
Date: Thu, 12 Nov 2026 13:27:13 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Rich Felker <dalias@libc.org>
Cc: Alejandro Colomar <alx@kernel.org>, 
	Vincent Lefevre <vincent@vinc17.net>, linux-man@vger.kernel.org, libc-alpha@sourceware.org, 
	Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <avWwXGpq1OLtNDSV@devuan>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <20261112015223.GA242717@joooj.vinc17.net>
 <20261112025339.GM26138@brightrain.aerifal.cx>
 <20261112032929.GB160897@qaa.vinc17.org>
 <20261112033742.GG5716@brightrain.aerifal.cx>
 <avWT2aQCFY2GIwLp@devuan>
 <20261112120831.GH5716@brightrain.aerifal.cx>
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
	protocol="application/pgp-signature"; boundary="dndfgeex7in2ziev"
Content-Disposition: inline
In-Reply-To: <20261112120831.GH5716@brightrain.aerifal.cx>


--dndfgeex7in2ziev
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Rich Felker <dalias@libc.org>
Cc: Alejandro Colomar <alx@kernel.org>, 
	Vincent Lefevre <vincent@vinc17.net>, linux-man@vger.kernel.org, libc-alpha@sourceware.org, 
	Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <avWwXGpq1OLtNDSV@devuan>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <20261112015223.GA242717@joooj.vinc17.net>
 <20261112025339.GM26138@brightrain.aerifal.cx>
 <20261112032929.GB160897@qaa.vinc17.org>
 <20261112033742.GG5716@brightrain.aerifal.cx>
 <avWT2aQCFY2GIwLp@devuan>
 <20261112120831.GH5716@brightrain.aerifal.cx>
MIME-Version: 1.0
In-Reply-To: <20261112120831.GH5716@brightrain.aerifal.cx>

Hi Rich,

> Date: 2026-11-12 07:08:32-0500
> From: Rich Felker <dalias@libc.org>
>
[...]
> > 	+.SH VERSIONS
> > 	+While POSIX only specifies the DES algorithms for these functions,
> > 	+all systems implement several other algorithms.
>=20
> POSIX doesn't specify any algorithm. It specifies the input format for
> salt in a way that's aligned with the traditional DES password hashing
> algorithm but it doesn't assign any actual definition for the
> algorithm.
>=20
> DES hash provides the implementation-defined algorithm POSIX mandates
> exists but doesn't specify. The other hashes fill in the gaps where
> the specification leaves things undefined.
>=20
> For practical purposes POSIX is irrelevant to the way you choose salt
> strings for producing new password hashes; it only specifies how to
> call the function and validate a password against a hash.

How about something this (we can improve the wording)?

	diff --git i/man/man3/crypt.3 w/man/man3/crypt.3
	index 524781d3c2a0..d579bc5394fb 100644
	--- i/man/man3/crypt.3
	+++ w/man/man3/crypt.3
	@@ -111,6 +111,9 @@ .SH ATTRIBUTES
	 .BR crypt_r ()
	 T}     Thread safety   MT-Safe
	 .TE
	+.SH VERSIONS
	+POSIX specifies a quite useless API,
	+and all systems extend it significantly.
	 .SH STANDARDS
	 .TP
	 .BR crypt ()


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--dndfgeex7in2ziev
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr1sJsACgkQ64mZXMKQ
wqnQ3Q//WtpEr4o8XYymNxLJfIlKphgGnukNRKNyndV+k1xQyy7rcMMv6XuS5vOs
GEEK6XIGQxMXMCxzjtb0572LGhuKJJNyYPVg0jItn7WMILTjRhwuLThRYHxH1JnQ
LQNREgeBTdgpCsQl7woy+qsR+Xy6KHv2qRoGgtW8jTry1wjz39DwzUFjXiJ+hf/p
ijr1ODsgQ1DCxJTmJus26KYl9i53lgQG77q6lCEb6NVKnoQwTMSJSD+OFyW7tQjd
ipZN7GrWe0P4zQewFwd9qeVfbyPnzP2vZftcbAmvoTbpKJPGTV/+sbSPaZcMFwkC
VTsFoZ4znwr8KS+9/Zd8UtFoKgVp4Nyd8VjANP9tViAdWFcNCi9EY+DsoTXLGz6l
rU/p2t2Vh2SBNNDMgDtpzGQq0QKIXVsH2fkkTMGKiKWdKWszcFrdrHCsNF5ZL6Uk
bYKVxBH2BQGuXGfB6DGcMbvj1H7aQ9zXOhJVrpQh6ztBQi7LoAwgWoncwV9nQOlB
WLEWytS6vs+6dNII1Y73ufpRwwDJlWPmVEQSj/znYSTM0HxpGKQC8hxqPWnrfzhw
iC3IRTQHf36pL+kbm42wwTNxh6MrpeLAXxk7Wcr7CPmmZYlMqk7PcmBOlg9pJGt4
iYslaGEudAKmGLeSM1LkLoNBJHknQj5PTg2Lk4dKD2J+53To3nw=
=0Ush
-----END PGP SIGNATURE-----

--dndfgeex7in2ziev--
