Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB0A44DB73
	for <linux-man@vger.kernel.org>; Wed, 27 May 2026 17:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779904714; cv=none; b=X6mlb/T62SkOsEBGYG6MgILQm6L8Bm2krtOkECUceeuXEIMylb6+qMpqGk9uteKfemL73x6xo/7H3QfMeNJn1nFdVPNhXD9nUEl0mBQMtAKmgXGgeEwo4QAaqCz7LEFcKQsZkK0fWyAggn+9pBrGAXVYSpXwaf1eG/3Kq9WgkUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779904714; c=relaxed/simple;
	bh=bPToN+UDiJpY5uAJOa2XaiHvHWK+0RbEEy/q+pU23xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Br47brAPylx11YVwPzN2M8w0gQvPnOHir0cc9jTz30VheuL6tTU2yUOdwk3WZIIp4jXSU9TAHgdK89844Zc/fy9KrDkCnxztZKnjJgkuf6tNQJPp05gYNq9l5t5ZNhh4+Qb7Zxo7el1eUEWQxWRqxzKT80Mqpc0hGf8jdRWTSOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DK8t21x/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DK8t21x/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0391F000E9;
	Wed, 27 May 2026 17:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779904712;
	bh=aRig4eFVWbWZ/v0nT12CQcjcjB6msQnQQYaUtCOQPnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DK8t21x/weLgqmfU3pB7DEEYWzT4ARsgd+0i/BWhMSrdPvfevlzw4hrYwCM9ARzmS
	 sFkS75+XDSZC0lwkXYvmlG34X4SpX4d/y0km998fjw1D8QiuTWkJt64LCx/F/R3DIa
	 oo/ShpRfiMAqKU3C8oWfsY7U/HNGRaxM7opvGzWLmMq4v+vTlW7rysbvMvyi4RMElO
	 d7hlb37Qre31GL4rtGUrEISyJcii5dDKpqx244EmPGWgmRjIFSx7eNhNSjLH22wJpR
	 aGZcwwJzJM5uliSGlrfiWWD9QHcEl8rxprruP3fkE6VyO/OdkRoBnBRuW/u+YOnuXA
	 Nt018B1oPZQ4Q==
Date: Wed, 27 May 2026 19:58:28 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "Michael Kerrisk (man7.org)" <mtk@man7.org>
Cc: linux-man <linux-man@vger.kernel.org>
Subject: Re: Mangled function prototypes (phantom arguments)
Message-ID: <ahcvtYzeadqmhk62@devuan>
References: <CAFs=pgbvWhm7KUcdyt=ELT66FNuLNjqh3Ek-1d9V6sY2npJ5jg@mail.gmail.com>
 <ahbxJGIK8Qf4AqVl@devuan>
 <CAFs=pgYAfonz99yGyoS+h76v7YrfT8=f4yg6zQFqDPgm8XfsoQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xpvqyofzahcmskut"
Content-Disposition: inline
In-Reply-To: <CAFs=pgYAfonz99yGyoS+h76v7YrfT8=f4yg6zQFqDPgm8XfsoQ@mail.gmail.com>


--xpvqyofzahcmskut
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "Michael Kerrisk (man7.org)" <mtk@man7.org>
Cc: linux-man <linux-man@vger.kernel.org>
Subject: Re: Mangled function prototypes (phantom arguments)
Message-ID: <ahcvtYzeadqmhk62@devuan>
References: <CAFs=pgbvWhm7KUcdyt=ELT66FNuLNjqh3Ek-1d9V6sY2npJ5jg@mail.gmail.com>
 <ahbxJGIK8Qf4AqVl@devuan>
 <CAFs=pgYAfonz99yGyoS+h76v7YrfT8=f4yg6zQFqDPgm8XfsoQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFs=pgYAfonz99yGyoS+h76v7YrfT8=f4yg6zQFqDPgm8XfsoQ@mail.gmail.com>

Hi Michael,

On 2026-05-27T18:46:06+0200, Michael Kerrisk (man7.org) wrote:
> Hello Alex,
>=20
> Thanks for responding.
>=20
> > > The problems have all resulted in prototypes adding a phantom first
> > > argument. See for example this prototype from read.2:
> > >
> > >        ssize_t read(size_t count;
> > >                     int fd, void buf[count], size_t count);
> >
> > This is valid C (except for the array of void, but that's a separate
> > topic).
>=20
> As we see, I'm not keeping up with my C :-).

To be fair, this is a very little-known feature (even though it's a very
old one).  I (and a few others) are trying to make it more well known,
as it's quite interesting.

>=20
> Is this a GNU extension? Or part of the standard? Or an upcoming part
> of the standard?

It is a very old GNU extension.  For decades, almost nobody had been
interested in it (I've never seen it used in the wild).  One or two
years ago, we started discussing it in the C Committee; several of us
want it to be standard.  However, Clang is vetoing it.


Cheers,
Alex

>=20
> Thanks,
>=20
> Michael

--=20
<https://www.alejandro-colomar.es>

--xpvqyofzahcmskut
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmoXML8ACgkQ64mZXMKQ
wqlVfBAAvq2LRhaAYWmXaYmM8jaZYPqZbQ971GEmHxOYzpQ+nTF1npmekg00G92X
PsXIQNA8Fbpb2gMe9euukL7AcDaSK55pr8Ku8sC3dTykIRiUSfBSW35dPzYVuyBd
vkB/x+Op00wyOOs3D0irIIIcKpam2JAEZooU4fdSgmSOMl7J3aZha0IbMRLUofuz
4jtaH1YwFgWPjFa/sQ1txmZp9JZ4Vhs7+7EJR3Z1p7q4yK6FvhPVgswr5kMtzmaP
Ii5T9oiaNEaFmTwladCa/AvY6IHBHxIOSjKMaljpVnxEagcGpMdNhtgpoIr4pMMA
hNSnrPgEQnsAJ+0bKxHQTRamfKegUtc9w/lAF81BaB/nHnIBpZPRF1US1Zk+Po+v
bzZoP2aq72Wgu1vr74PKAm8IYNly/FNW808Wo8L59mgGO36ORjKeQTMKCSIYABxK
lWq+avodxd8x2LoSiumtuSmDE4omNO/gJnJAZ/B+SEdSUKIugZrtlNWMdf4I3Wbl
Fe8DcuO9V3a++Kdv/Ky/gT5FkKugqSyzUwrThHf83JyJZU5WjZRD/xlKYl5JVrkM
mcBcIM/1r/PJxzT3lnIfw8tLIJe22NH+nf46OVD9qid1vVc5ViGdzGRfqCCD+ohZ
f6AX1TtThB1HIZj9Pk7JdE3G4+Rh5ie1zz5fGwddxhHqes8FNWw=
=4yy0
-----END PGP SIGNATURE-----

--xpvqyofzahcmskut--
