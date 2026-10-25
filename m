Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918662;
	b=eOHorZsHWnivcfPUJshiILNDPxjl6iyQ4g94fYRa9i5qd+ZdMFtBFuSxEWb2R8IZEGD8
	 aunMq9uxGVhdD7fCs03i27CGBOgyErHM7lJw0OMTP/EpSI5TlYyPn/vlsfdy7/s1Y3uJx
	 5iDhKng5EX/wH91WcVKK+cGvGhOMKCSDDGe+aFee2+VCtxKHVhQnwIbszLgYZj2iI3wf4
	 XDxk8PuOxBAvlE+Ypnj+sXbaQTbhWI8ja3MHjd7mAgFaC49fFuLxS/X4C3Taemk3k9hrF
	 cICdG17KjmUzahtPp6XJj0zxM9aGmUSOkplok7inV6gLuR3e7N2GVgG3+rmJevp/r/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918662;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4OBbNqQwWLs4ejMZakILkiKtNj6U/IIdPStR6fuWZeU=;
	b=bziTvAkKwFj2LNRxg3rJnoz/WFzxAZoRvezGmrQDvrgeITs8wuiBBaEa1SR/dPGPBG2w
	 pN+dEszUeCCQPglgCs0K08lDt3b+3jamAvoI2JXD2upOBJcpzkCWmlHGYpmj6SaPwN65Y
	 euR4JuAEWXanDlARqT++AJaZXo/w8NkVw5Tr08tpDIM+Ti2kD/l3vwO8KNi5qTruUvx18
	 vDQClcgWlWr6NwbM04mKf0wJ/rzHCiltU67kY2UZlK5MbQ6fW3WcI1n5yZUGryEbfeSDS
	 VE05TNIuKmI/goiPKfo4x2p2Z6e2OLPQpTu9fdlEbyrLBzg23yRvx4tQvZf/1/xuRsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kG8njqx1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EB0606A31A
	for <linux-man@vger.kernel.org>; Sun, 25 Oct 2026 08:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kG8njqx1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A55D61F01825;
	Sun, 25 Oct 2026 08:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792918662;
	bh=4OBbNqQwWLs4ejMZakILkiKtNj6U/IIdPStR6fuWZeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kG8njqx1VBlvqtdAvYBNKv79cfC3KqMsrMIeOwfOhnoakJP7zpP3fx9vlRKklgMv6
	 nbMVGlmSenIgd2eftfjoyo+IY8SWmKErDv4KULkJRqW9bCaSPD0fpNXFvD+9SiQ9dC
	 dc6vrbRoJC2zACNi40vRCBphb0fmMt+vbDpzb/XIuMCG4qWyXCu9Q+++ixY3T+fwJv
	 x3tNkQXbOGVbrQ6VhvVaVb87U/I/bbNec3k47Yj2ut9bXoWOC7QPtH+BPSkYOZt7+f
	 sLczODqAT9uYX/jMkqu+h9ccG7jHdD7Xly423+4FK6n8P2+HgoxfDuIUvdoqIL1m8O
	 U/95+kzsX5dpw==
Date: Sun, 25 Oct 2026 09:57:33 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Michael Kerrisk (man7.org)" <mtk@man7.org>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>, corbet@lwn.net
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <at3CrSg8Rpf5JDOY@debian>
References: <CAEHU8x-Zs8E=e5qoJYRB2ecunpcZWoazsj9Pnxq5bn6bS4ndMQ@mail.gmail.com>
 <CAFs=pga6UWmH6FJZcf0wRi2S3PdbrJWNFeVbkQVVmncB3Ni=-g@mail.gmail.com>
 <atyxz7Uj4rue8HjP@debian>
 <CAEHU8x9P3PLFAMpJ7wfYapvJkEt4b09KR9sypjUuONRniAQT3w@mail.gmail.com>
 <atzcMTC3Hl4GPD39@debian>
 <fbd4d03cbaf3e0b3a978ca3ff3902103ed954a87.camel@tugraz.at>
 <at2l_NpU28j3n6L0@debian>
 <dd9ca27e6b4c227c08cd707aab9b0b5d495c203c.camel@tugraz.at>
 <at2vv1isjbPZ6-34@debian>
 <76bff7cc342961bf81acc4a2d60e8c3d01918433.camel@tugraz.at>
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
	protocol="application/pgp-signature"; boundary="64mczudc73zkjd3y"
Content-Disposition: inline
In-Reply-To: <76bff7cc342961bf81acc4a2d60e8c3d01918433.camel@tugraz.at>


--64mczudc73zkjd3y
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Michael Kerrisk (man7.org)" <mtk@man7.org>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>, corbet@lwn.net
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <at3CrSg8Rpf5JDOY@debian>
References: <CAEHU8x-Zs8E=e5qoJYRB2ecunpcZWoazsj9Pnxq5bn6bS4ndMQ@mail.gmail.com>
 <CAFs=pga6UWmH6FJZcf0wRi2S3PdbrJWNFeVbkQVVmncB3Ni=-g@mail.gmail.com>
 <atyxz7Uj4rue8HjP@debian>
 <CAEHU8x9P3PLFAMpJ7wfYapvJkEt4b09KR9sypjUuONRniAQT3w@mail.gmail.com>
 <atzcMTC3Hl4GPD39@debian>
 <fbd4d03cbaf3e0b3a978ca3ff3902103ed954a87.camel@tugraz.at>
 <at2l_NpU28j3n6L0@debian>
 <dd9ca27e6b4c227c08cd707aab9b0b5d495c203c.camel@tugraz.at>
 <at2vv1isjbPZ6-34@debian>
 <76bff7cc342961bf81acc4a2d60e8c3d01918433.camel@tugraz.at>
MIME-Version: 1.0
In-Reply-To: <76bff7cc342961bf81acc4a2d60e8c3d01918433.camel@tugraz.at>

Hi Martin,

> Date: 2026-10-25 09:40:52+0100
> From: Martin Uecker <uecker@tugraz.at>
>
> Am Sonntag, dem 25.10.2026 um 08:38 +0100 schrieb Alejandro Colomar:
[...]
> > > Yes, but we do not even have a proposal and [static 1] exists today.
> >=20
> > Actually, we do have one: n3803.
> > <https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3803.txt>
> >=20
> > The wording on this one is good.  I think I forgot some trivial
> > duplication of the diff for both the non-abstract and the abstract
> > declarators, but I can fix that when I arrive home, so we could have it
> > in time for the next meeting.
>=20
> Yes, please.  But this would also not work for function pointer,
> so I thought you meant something new.

Done.  I've asked Dan for a number, and sent the draft to the mailing
list.

> > > > And we also have the issue that it changes the meaning of the bound.
> > > > It's just terrible.
> > >=20
> > > The bound in [1] has no meaning in parameters,
> >=20
> > This is not true.  ISO C is just toilet paper in this regard.
> > It has a meaning in SDCC and GCC, and every programmer that ever wrote
> > [1] assigned a meaning to it.  Moreover, I'm using [1] myself to express
> > pointers to exactly 1 element.
>=20
> In GCC [static n] and [n] have the same meaning, except
> that [static] additionally implies that the pointer is not null.
> I have worked on this, so please assume I know this.

Indeed, I know you know.

> In ISO C it is as I said, [n] has no meaning and [static n]
> is a strict subset of what we want.

And I insist that ISO C should be ignored.  It doesn't matter what ISO C
says about it, and your statement that [1] has no meaning in parameters
is giving it too much credibility.

> So I am really confused about what you are trying to tell me.

I'm trying to say that [1] has a meaning, even outside of GCC.  Every
programmer that ever wrote [n] meant the obvious thing.  The fact that
ISO C ignores this shouldn't be an excuse to claim that [static n]
doesn't change the meaning, because it is a de-facto change of meaning.


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--64mczudc73zkjd3y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrdxHwACgkQ64mZXMKQ
wqlgtw/+IWU2Ih9gclEQaLo7qAyyQtCH/wQNwqHmB1u7qBVeZ2UlU2Errz0migDB
KiXYdWwFaL5beGWCH5ExgWwvRixaMoy01lYn8ZBH+xf2Wrj7Qw8s4c8/b/4yVZkl
T9wo2OmOoUQAZSyW6owtopPGXbIZxNdTLcyoceCLJMd9yXD4pSren0VdFvoYa7DD
8E2gDA+V6xwp/koP9Ue9CKxa/sRvEeYD55jFbhzZidIiqrM+8zDLQV/NKdr5L/g1
CR9n7EjmCWzXwX/cq2SW14lmRUlH6bsq+8rtAUIFBBHfVovCrNZZZ2Vg3LrNqMhP
d2g5hWJlgu8xw+3vLSiYNh6sL173h/P7muwsN9Xdj2mC91kNcon9mHkwsT8i6A5I
bElTW1VtfFBvU4NpnG256nKGBGt8mo8CV0OryePINAt/6eB4nz3U43ZMviSInEzu
xPV76LeZ740XekVUiRKxODJ9+NeZdZvumHHL38DQHEDgp7AxmQCXahrr3oz+pnNl
+myIBfmcnbXe/I8ZdsIfi/vWtNnfPtLhdoK99gzFQnrTZZ8vlqDC28maWJn9hP8+
Bb4Kj/1Uz/xXqHc2+ooIyBye1j1n9v4uMMjySSL/T1WHs1d4BhoILm+Lr/DH0Qgz
8HvjagxJ0jSB/dZLJcb7fBwGvGDC3GVdOZQ2gnN46ChqOQvjr5M=
=avhg
-----END PGP SIGNATURE-----

--64mczudc73zkjd3y--
