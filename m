Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943069;
	b=h3WFsN0yVaoPx8e3vH8xVXH4FGC7Ka/JcjAjEA783a426Xmmt448nFydpl7Iv1iz4/mF
	 KWzMlBsv5zkeWqr8EuDRmdmvQtHtF/O197C6G0tB0SytVa0TtMPFxq+ORgj9zICyz5HN2
	 9U6o2qZmgizyOYLrKxyLNfwg5GI2ya2kiafnlEzasAQFfG3/Ditt/Hg4j/aVJQGmrJHuy
	 hgbJBTndbtcS4lVUAWBoklG3s8TaQOGZDBPDqW0CB1igK3CMh6UOO42HwrhQso9IJ9K8O
	 7o+48PbQctV1bJ5m6ZL2B70NAgWNH84E0pkI2u5XSwx/yz3qkYYy+oiBph79qhyPknQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943069;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=g1ZUU0mnasxC6gCTz396aoEyaOGhArK6BAtfau5KALo=;
	b=Is158jo3BrwomaiY9fmRNBduQJ7KYIOXK8TN6ucY06a3OUUkwJtRgsF9cQHgMHhdf2iX
	 Yid/nX2QKi5FrYM/kJlFB2Sun7n95sEM+A5Wh0tHHkxzEkJXs0BIUiLIChWAMUpGJRSwf
	 t2Zzi/HVzyHjuipq5s5UFR6NxEUYx+Z1f5yfZwd3kDHxiSzibUdJdHO5FEr5MLyFX4woq
	 BeQQzXofbsFVusLt7qbZ+ZMnVkV8peJBmrRcCm1u0DKCNP9ru9/slg9/OlxGf4aU0MkEX
	 Hepfhg+kUE9JdFmN7wJVD4XhmWM8oLHT/UIUCtd5PtoO2vZROSe33JrshBx5XVPr3yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QSyhkUlD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB46606A31C
	for <linux-man@vger.kernel.org>; Tue, 17 Nov 2026 19:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QSyhkUlD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA321F000C4;
	Tue, 17 Nov 2026 19:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794943069;
	bh=g1ZUU0mnasxC6gCTz396aoEyaOGhArK6BAtfau5KALo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QSyhkUlDVF9tnrMy1gMbamAP0nM5SVSV6lphXudzh7YmY0cSQKalG6F50HY5gTdHS
	 wl5PT2nfxHrXxJtgWnvla7H0/72ZbywBCZWopP1gSIDs8rFzj9bPek+nR8u51ZjlZS
	 jykjduNRvJ0IjcS4MMQU9UTOVsdVkBY8Y8FMgFkPHNTs4as86jxUUyhUR+WrB2DolH
	 qDGy6gPwJIaBIXAMi+9KL9P+apd5Xu/lStBC7M3C4ZulShviapTsmd0uevSdAAIETD
	 hHbabSQB+vaKpqQrnBAyvp5l8p+ZwdoZvexRUDLWGUeBVtkUpXrkvSkp93h+xU6tkM
	 Yc/QAvcyI/ybw==
Date: Tue, 17 Nov 2026 20:17:44 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: "Michael Kerrisk (man7.org)" <mtk@man7.org>
Cc: Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>, Martin Uecker <uecker@tugraz.at>, 
	Guillem Jover <guillem@hadrons.org>, g.branden.robinson@gmail.com, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= <nabijaczleweli@nabijaczleweli.xyz>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <avyn9TUpxZ6N6sQS@devuan>
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
 <CAEHU8x9jET+vcrR0NpDz6t57egQG8TZqx5XtV52srH9ZRvdxSQ@mail.gmail.com>
 <atpnWiYQzs_HZ1Q7@debian>
 <CAFs=pgZZeOg7vmkyTjwZdnafYFxn+Yogd9usEzX9Bmv87Z-P4A@mail.gmail.com>
 <attQRCILbrngR_70@debian>
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
	protocol="application/pgp-signature"; boundary="zltiq7z67rob7ec3"
Content-Disposition: inline
In-Reply-To: <attQRCILbrngR_70@debian>


--zltiq7z67rob7ec3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: "Michael Kerrisk (man7.org)" <mtk@man7.org>
Cc: Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>, Martin Uecker <uecker@tugraz.at>, 
	Guillem Jover <guillem@hadrons.org>, g.branden.robinson@gmail.com, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= <nabijaczleweli@nabijaczleweli.xyz>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <avyn9TUpxZ6N6sQS@devuan>
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
 <CAEHU8x9jET+vcrR0NpDz6t57egQG8TZqx5XtV52srH9ZRvdxSQ@mail.gmail.com>
 <atpnWiYQzs_HZ1Q7@debian>
 <CAFs=pgZZeOg7vmkyTjwZdnafYFxn+Yogd9usEzX9Bmv87Z-P4A@mail.gmail.com>
 <attQRCILbrngR_70@debian>
MIME-Version: 1.0
In-Reply-To: <attQRCILbrngR_70@debian>

Hi Michael,

> Date: 2026-10-23 14:42:24+0200
> From: Alejandro Colomar <alx+linux-man@kernel.org>
>
> Hi Michael,
>=20
> > Date: 2026-10-23 08:53:22-0300
> > From: "Michael Kerrisk (man7.org)" <mtk@man7.org>
> >
> [...]
> > > > > Also, this syntax is not very dangerous: a programmer thinking
> > > > > that a forward declaration is actually a normal parameter will pa=
ss a
> > > > > wrong number of arguments to the function, and thus will have com=
piler
> > > > > errors.  This syntax is quite robust, as it requires several bugs=
 to
> > > > > happen in the same code to pass compilation silently.  If one rep=
laces
> > > > > ';' with ',', the parameter will be declared twice, which is an e=
rror.
> > > > > If one renames a forward declaration, it will not match a paramet=
er, and
> > > > > will result in a compiler error.  Only if both mistakes happen at=
 once,
> > > > > the compilation would pass, but then the call sites would also ha=
ve to
> > > > > match the bogus declaration.  And also, the function definition w=
ould
> > > > > have unused parameters, which would trigger diagnostics.  So, con=
cerning
> > > > > safety, this feature is not very dangerous, even if used by someo=
ne who
> > > > > is very confused.
> >=20
> > It is not enough to say that the compiler will warn people about the
> > incorrect arguments. I have seen people do the strangest (incorrect)
> > things to "fix" warnings and errors they get from the compiler.
>=20
> Hmmmm.
>=20
> > > > > Do we think programmers are unable to ever learn this new syntax?
> > > >
> > > > No, because programmers are clever and it is relatively simple. I w=
rote a
> > > > paper that explored the drawbacks of the syntax and recommended
> > > > standardising a subset (which I assume is what you are using).
> >=20
> > I have talked with programmers with *decades* of C programming
> > experience who are unfamiliar with this syntax. Indeed, when I first
> > got bug reports about, I also was unfamiliar with it, and thought it
> > was just a bug in the manual page.
>=20
> I agree with this.  Very very few people knew about this feature until
> it started being discussed recently, and still very few people know
> about it.  I only knew about it around 3 years ago or so.
>=20
> What I wonder is whether people can get familiar with it in one or two
> years of exposure to it.
>=20
> One way to test that would be to wait until Fedora contains this syntax
> at least in one release, to get it exposed to more programmers.  So far,
> Fedora remains in man-pages-6.13, and the first version with this
> syntax was 6.14 (1.5 years ago).  Carlos is working on getting the
> packaging updated.
>=20
> There are risks in both alternatives: if we have the GNU C syntax,
> there's a risk with programmers workarounding compiler errors in weird
> ways.  If we have the invalid syntax without forward declarations, the
> risk is in people using that syntax in their own code and triggering UB
> or least logic errors.  The latter risk is a persistent one; there's no
> expectation that the risk will ever decrease.  The former risk (that of
> using GNU C syntax), I expect the risk to be temporary, until
> programmers get accustomed to this syntax.
>=20
> I'd accept adding this patch if there's an overwhelming majority that
> I'm being a bit paranoid about the risk of using invalid syntax, and
> that I'm understating the risk of using GNU C syntax.

The C Committee has discussed this feature, and now my concerns about it
have relaxed somewhat.  I'll probably apply the patch after the next
release.


Have a lovely night!
Alex

>=20
> I'd like to hear explicit comments from Carlos, Sam, and Joseph before
> taking a decision.  But if they seem to agree with that point of view,
> I'd take the patch, even with my own NAK (I'm willing to document both
> ACKs and NAKs).
>=20
> I've now also CCed a few more people, since I'm also curious about their
> opinions.
>=20
> So far, the patch would have:
>=20
> 	Reported-by: Michael Kerrisk <mtk.manpages@gmail.com>
> 	Nacked-by: Alejandro Colomar <alx@kernel.org>
> 	Nacked-by: Martin Uecker <uecker@tugraz.at>
> 	Nacked-by: Christopher Bazley <chris.bazley.wg14@gmail.com>
> 	Acked-by: Mark Harris <mark.hsj@gmail.com>
> 	Acked-by: Michael Kerrisk <mtk.manpages@gmail.com>
> 	Signed-off-by: Alejandro Colomar <alx@kernel.org>
>=20
> (those ACKs and NAKs transformed from messages saying they want or don't
>  want the patch.)
>=20
> (Before anyone comments the possibility of going back to simple pointer
>  syntax, that's certainly not coming back.  The information about array
>  lengths is fundamental in the SYNOPSIS.)
>=20
> [...]
> > My preference would be the earlier status quo: standard C syntax, with
>=20
> As a reminder, it was never standard C syntax.  We have always had
> non-standard exceptions in prototypes, such as open(2) having two
> declarations (as if C++ overload syntax).  It was ISO C syntax regarding
> array parameters, though: we used pointer syntax.  But as said above,
> I really disliked having that information only in the DESCRIPTION.
>=20
> > an explanation in the manual page text that explains the relationship
> > between the arguments. The current proposed patch is a compromise: it
> > has the disadvantage of being nonstandard C, but does at least clearly
> > hint at the relationship between the arguments.
>=20
> Agree.
>=20
>=20
> Have a lovely day!
> Alex
>=20
> > Thanks,
> >=20
> > Michael
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--zltiq7z67rob7ec3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr8qFMACgkQ64mZXMKQ
wqn4QRAAnyfT2dmItbg2aw897dsTlsOQ64ZoZEW5Ry+W3um+ib6QY9osQp7QmvWP
BPtcngtdtU0oTXQvaCBQTaBaLrtngjtzuhIpwO+uFcktY2KsnpPBdoxjlGNeF6hG
qZPwGtLGIxDG1J5wBnrgUBynUzcnAMgehIReWe79WA67wJbSDh0zYLXP2lKjl7e3
GA/TeYGGqoT7uUFwAXoOqb4d1uvGNyfn67T7N9anUyui4xepp8W8jzx+eOt3bDug
v32s+IZ1IteJQ5T3nQRwGxrM57QLYLa+9MBhWQffzBLa3dPrsqDvT6Elyd82lEzo
Lk50wIVNdijY7qvTvjO2UDatLZFy5L5DEOvevtTK+hkKT/3c8ybts+y7Fa1Ba27J
pH6HBoBVfCi2EzgCsAwlUMooC3hHzeBnSZehLL7ok2cp5jSugr0iej+TFIHjVaOA
GcvOcuTldygXgRyf5Y4CKPpwa/lLKQl+e5/7VlrIqROY+AnV/3ikkBX3UT6piLTW
JMCq+6sdJI3cpG4qWUhr4YIuHv/bv8LTiZoV2eNSp0VePsUgz7r61BIP0VifHs0i
iOptenxq7PGTdnummLSaS2hOiSQQc/gmaF2pRYr65KwZCaEstOcs7wmhGjLPGavA
Oz0Q6/jcDTtlolPvAJhb4EbvAnvR62M13eIohzBN8KX3nFkZd2Q=
=29Ty
-----END PGP SIGNATURE-----

--zltiq7z67rob7ec3--
