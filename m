Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E047370D6E
	for <linux-man@vger.kernel.org>; Sat, 22 Aug 2026 14:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787407839; cv=none; b=buqmLY8vqYmdgT2OJJtU6wUCnIjJdQy5xzFA6OuRiUmFoUo0i/yBBSRXsmHeRYe8LhNV9vM5eByILx2rxWTgalPcPaTyvPey3h+vGHc2wO/Mgce68/9v0OfkIAwfv1WagNo8oDTFHSK1VFkaoTdcj7iIlvMaBC0BU08ngeiVS3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787407839; c=relaxed/simple;
	bh=EjNO3A1eUw9UYUxt7KRskuGI30pnekST4SXwIE/cGn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXXkrHAKTyEb62LLGIVJaab7nvk3UkhNWiXtZsDlnULueCFrdhJXcozAsuynd0QscNj6TucajewDJ/qi5crLLfc0/DYYS2nad1q2IskR7IG+DjYgJrSg1L8V/1wEfjGEO96t4RQqf3YTEDOfpN8XdPJ2XTU728PsXHpbXKn2feg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lv0jgGm3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lv0jgGm3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D3E1F000E9;
	Sat, 22 Aug 2026 14:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787407837;
	bh=5wZxMECkURxGRZc9twwLk9z6OWZrD6zd0mUn/VVDkgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lv0jgGm3oXk4b0deNNSg3WtYcCWJaddgtwIhlIl8jnS0ExNAuGtDxMM8G18r17XCB
	 mgxdODe6ttQcSqnGezUoUdIAA9kNsx8b/MbzRNX0ADWjDD0KgY6nK/usZ8F1oW9VoS
	 2bDQB30PU3DYHEeeRqf8iaYJA7oX2J1T7Zgde9ou4xvbxF4o9jIiB3LceKjLxdMCEP
	 5FbcyQ/SIlQhYHY+BxG+XSUoQKTQFlqkXnlMkpX+B+wKMKwoKuIQxEGTeUxhUVTuCY
	 mMBRERGQKt3GzCraM5DrMe2EGiJQUC9tgxJoS63kGfgSDICnuxyEp4IlE7LHvTIJvw
	 r/sSoxl2S9eyg==
Date: Sat, 22 Aug 2026 16:10:34 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <aomtdXK5M19xrk0z@devuan>
References: <anZdHxYJZ6hLleQv@devuan>
 <xnecg92tt1.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wxeqkqbbuindgotj"
Content-Disposition: inline
In-Reply-To: <xnecg92tt1.fsf@greed.delorie.com>


--wxeqkqbbuindgotj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <aomtdXK5M19xrk0z@devuan>
References: <anZdHxYJZ6hLleQv@devuan>
 <xnecg92tt1.fsf@greed.delorie.com>
MIME-Version: 1.0
In-Reply-To: <xnecg92tt1.fsf@greed.delorie.com>

Hi DJ,

> Date: 2026-08-07 23:08:10-0400
> From: DJ Delorie <dj@redhat.com>
>
>=20
> I'm ok with :
>=20
>   The resulting data is read when the program starts execution.

Nice!  :)

>=20
> This is what I've got so far:
>=20
> commit 8ed803ba1e814dd7efdeec787b9b278c2e44be83
> Author: DJ Delorie <dj@redhat.com>
> Date:   Fri Aug 7 23:07:04 2026 -0400
>=20
>     man/man5/tunables.conf: Document system-wide tunables config
>    =20
>     Signed-off-by: DJ Delorie <dj@redhat.com>

Thanks!  I've applied the patch.  Still, a small question (I'll amend
myself with the result of the answer).

> diff --git a/man/man5/tunables.conf.5 b/man/man5/tunables.conf.5
> new file mode 100644
> index 000000000..a27f78cde
> --- /dev/null
> +++ b/man/man5/tunables.conf.5
[...]
> +The syntax is:
> +.P
> +.in +4n
> +.EX
> +.BI [ filter : pattern ]
> +.EE
> +.in
> +.TP
> +.B proc
> +The
> +.B proc
> +filter limits the following tunables to processes
> +whose name matches the pattern.

Is this also a glob(7) pattern?  Or is it a literal name?

> +The pattern may be an absolute path
> +or just the base name.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--wxeqkqbbuindgotj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqJrdoACgkQ64mZXMKQ
wqkd9Q/9F9ztt2VHktB4kasBRbcYw4yVVpuZ0bFDZJz+AFDvHAu32rogZlNgtDKo
xPmr+LYz4UAaK+CXOdVe/NBibH9DOe93R4M4SZzasZxKFbUWeSAVC7S5gKq4SiUp
0hQ3S9+8P9jhWPuZ57QQlD7Jm8cIfUMTwUkpC8T7PQv+DU0uyVsMDYz3Dj4Jt8uL
S9qRswlGiUnqi0B3z70pbBLZCOSgowNppF2UeG5Rej9G4K1NFaZfLfE1k/uTWpWG
joERrA28+fXpZ1HbgiueAMTv6RrzrVr9wx65xvOeAqya7q37Dr+hyKNi1OBqgDK1
zCW6XfLGYVVuHF3iLUiEcfJ87qhZHGN5R/IL/Ue6ELOYNGzHtfUtjMKjT5dhFKcV
+M30MY+gQbAFX5m858Ka7lGqxJpA3CluaNTui7QIN4t6u5KltkALD3g6bBMRl5Mc
Qf28YFAGkCa58dNBY/L3FuX7ZZaER7XW8GpVVohc/d+Fk1Dulw1wCKJSJ2/gWYNI
UlwHA/YA00OYYzdPa+lNmBjq5M0LpEB72wP9BBUhn+ePY3BTO56RHzWhYI9wZFsz
ARWxBOsu8c1bE/fUKTjhx1It1MXtOA0GrLLdU/YWVgqez3WD4pQfV4b7q7EdONVB
8sHDZ9R2FnNik8XKkpnrPtoixWdhgIyEhew9bmXtn827msmfXas=
=1nsU
-----END PGP SIGNATURE-----

--wxeqkqbbuindgotj--
