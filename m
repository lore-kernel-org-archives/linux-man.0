Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792698849;
	b=aI/Yakkw5eiqDPLq13v80/f4R/kQ+6gFFSAaCliC+PaPwBfZYAL65bJCPIBIvwogKLEy
	 SuUNdoMVYMUHDYTkYJ0MWOxD8Jp1DWKR6VXdmZ6AQphM82DyKh90az8ZaclA7LZnD5Ai5
	 +dOfc8XCq8DiN9eyvrvGRfnTJngJy3sY7c1Z1tUBY/hPc5jxpTQVvGQhQbwPGAn6WRD7c
	 HgzPI40p+gvvE0W9NAgOrIeaRY5oJShqqxe+XDeuKUyL0DCPjRGNfBHhVtQ3Z4Rd7bpkW
	 V0l/uYaBEmKNXe2vAw+YugjJokrG0q/Ry4GVRI/2+hBWBukYzw3CfPuXLz8BedtQ/ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698849;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eIT3+kQYMkP2olMDbpGcjV9JAXqxNhL63H79NnfrAkk=;
	b=K2kK6IGg3gVkpEAHIehMbKgoVOwpB1rgTVpfyfR712lCao6oDZdslSUF1K2pc44gR6HU
	 NiYPK+9cw8s5srfEI/tOcZjIrAXaZVHAPDiRSFOsIv7Bgy7LHKyhYP/TM9fX3PCdus3Xf
	 uH+tNZTrCxfiLAdjar7iKgJngBLYkXyn1rVps3cacDy+DUjSK7YXgVsuU0cjPt0aKX8Uu
	 zzd8FEHX0B+CPrNgbgDcwYFeqReLk5ltRkPhLCjWd5eU2hc50rX0HeaAIhaFxOfZtfr0t
	 db6uSNkj6ULSWXzOD8Uknq/jTcnwIUlgd8z+2cpKFBfYzuIbWWouzpRIPyIiAUFhJhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IrBuI2Jj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AE5606A319
	for <linux-man@vger.kernel.org>; Thu, 22 Oct 2026 19:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IrBuI2Jj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 576CA1F01828;
	Thu, 22 Oct 2026 19:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792698849;
	bh=eIT3+kQYMkP2olMDbpGcjV9JAXqxNhL63H79NnfrAkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IrBuI2Jjv+UxLbtxFRXsBnf0LkR1hQM2f2yCYkbPK3DnWZxAZxtGHInf+DQ1D7Pdj
	 GG/H19yliSKYg7NPtKQxgLSQr5YQKZVgczD8s6SxPzxJHJ9rfPggJ5pKe7EjseWYa9
	 2qli8rIL5u66tBfbalUc5I+pixcmjRoRNSQipD9yjf7glf5C3CWbGT7SgRSH2qoF/i
	 wLnIPVeA/t+9L+II3EFK04up6gKgLyw9NczgT3iiPJL4FUHux3YfsIO9RcElOLP9qa
	 MnFL17GVqeaylz8f5enEC46WEeFwJQh9Y8onFnCVRPsjXgbYy+FMbCyWT0794EZP0F
	 Ig+wrUheEwsew==
Date: Thu, 22 Oct 2026 21:54:01 +0200
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Christopher Bazley <chris.bazley.wg14@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>, Martin Uecker <uecker@tugraz.at>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <atpnWiYQzs_HZ1Q7@debian>
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
 <CAEHU8x9jET+vcrR0NpDz6t57egQG8TZqx5XtV52srH9ZRvdxSQ@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="yf6jcu55i7xchwky"
Content-Disposition: inline
In-Reply-To: <CAEHU8x9jET+vcrR0NpDz6t57egQG8TZqx5XtV52srH9ZRvdxSQ@mail.gmail.com>


--yf6jcu55i7xchwky
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Christopher Bazley <chris.bazley.wg14@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>, Martin Uecker <uecker@tugraz.at>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <atpnWiYQzs_HZ1Q7@debian>
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
 <CAEHU8x9jET+vcrR0NpDz6t57egQG8TZqx5XtV52srH9ZRvdxSQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEHU8x9jET+vcrR0NpDz6t57egQG8TZqx5XtV52srH9ZRvdxSQ@mail.gmail.com>

Hi Chris,

> Date: 2026-10-22 18:29:31+0100
> From: Christopher Bazley <chris.bazley.wg14@gmail.com>
>
> Hi Alejandro,
>=20
> On Thu, 22 Oct 2026 at 17:45, Alejandro Colomar <alx@kernel.org> wrote:
>=20
> > From: Alejandro Colomar <alx+linux-man@kernel.org>
> >
> > From: Alejandro Colomar <alx@kernel.org>
> >
> > I'm not fully convinced of this patch.  But I'm open to being convinced.
> > I've written the patch, as Michael asked me to do, but am willing to
> > hear everyone's opinion before applying the patch.
>=20
>=20
> Why did Michael ask you to do this?  I think there is some context missin=
g.

We have dozens of users having reported a bug in the documentation,
as they believe the forward declarations are an accident/typo.
Clearly, most readers don't know this syntax, and think it's some
mistake.  I've been dealing with them nicely explaining them the
existance and validity of the syntax, and they tend to understand it
quickly.

> > As Michael reminded me recently, and as I've defended in other cases, it
> > is true that the SYNOPSIS of the manual pages does not need to be
> > strictly valid C.  It only needs to be useful enough for readers to
> > understand the interface.  Thus, if using lengths without declaring them
> > would improve the usefulness of the documentation, even if becoming
> > invalid C, it would be okay.
> >
> > However, I still have doubts, because this change comes with risks:
> >
> > Programmers might think it is valid C to refer to parameters that have
> > not been declared yet, and use that in their code, and if they are
> > unlucky, it might compile for them, which might result in UB at some
> > point.
> >
>=20
>=20
> I think it is reasonable to assume that anything which resembles C source
> code will at some point be copied and pasted into a C program.

Indeed.

> > One valid point is that this is rather unlikely to happen, and most of
> > the time it will just result in a compiler error, because no global
> > variables with the name of the parameter exist.
> >
> > However, with local (nested) functions, this might be easier to happen,
> > as variables declared in the outer function are more likely to share a
> > name with a length parameter.  Given that the C Committee is working
> > hard to standardize local functions, it might be a very bad idea to have
> > this combination of events going on.
> >
>=20
> I agree with this concern in general, although I don=E2=80=99t quite see =
how it
> applies in the specific case of the functions that you are documenting.
> (Unless you are expecting those functions to be declared inside a function
> definition instead of by including the appropriate header =E2=80=94 in wh=
ich case
> the hazard already exists.)
>=20
> I guess you are really worried about people copying the style rather than
> the content.

Indeed, my worry is not that people will copy these declarations
verbatim, but that they'll think it is valid, and write similar code for
their own declarations.

> > Concerns that have been raised against using the GNU C syntax in the
> > manual pages:
>=20
>=20
> Parameter forward declarations are also supported by SDCC, albeit with mo=
re
> limitations. I would be interested to see whether your usage falls into t=
he
> category of usage that would be supported by SDCC or not.

Our users are mainly interested in POSIX compilers.  That is more or
less GCC, Clang, TCC, PCC, and maybe something like Intel or IBM
compilers.  The main two are GCC and Clang.

> > Very very few programmers know this syntax, and thus they are confused
> > when reading it for the first time.
> >
> > This is obviously true.  However, this is true of any innovative syntax.
> > We should consider whether the confusion is dangerous or not, and
> > whether programmers can learn it easily or not.
> >
>=20
> Can we still call it innovative, many decades after its invention?

Maybe I should have used the term 'novel' rather than innovative.
While it's clearly not new, being decades old, it is certainly a novelty
to the programmers that have never seen it before.

> > I believe once you've been exposed to this syntax, after some research,
> > or asking the right people, one would easily learn to read it, and then
> > we'd have overcome the issue.  I don't think the syntax is inherently
> > difficult to understand once you've seen the documentation and seen it
> > a few times.
> >
> > Also, this syntax is not very dangerous: a programmer thinking
> > that a forward declaration is actually a normal parameter will pass a
> > wrong number of arguments to the function, and thus will have compiler
> > errors.  This syntax is quite robust, as it requires several bugs to
> > happen in the same code to pass compilation silently.  If one replaces
> > ';' with ',', the parameter will be declared twice, which is an error.
> > If one renames a forward declaration, it will not match a parameter, and
> > will result in a compiler error.  Only if both mistakes happen at once,
> > the compilation would pass, but then the call sites would also have to
> > match the bogus declaration.  And also, the function definition would
> > have unused parameters, which would trigger diagnostics.  So, concerning
> > safety, this feature is not very dangerous, even if used by someone who
> > is very confused.
> >
> > Do we think programmers are unable to ever learn this new syntax?
>=20
>=20
> No, because programmers are clever and it is relatively simple. I wrote a
> paper that explored the drawbacks of the syntax and recommended
> standardising a subset (which I assume is what you are using).
[...]

Agree.

> I still have not yet seen a proposal for anything easier to learn (that
> does not rely on forward-parsing).

Agree.  But indeed the counter-proposal that I've received is to use
retroactive scoping in the manual pages.

> > Are we ready to accept the risks of using the dangerous invalid syntax,
> > but which is more intuitive to programmers?
> >
> > Reported-by: Michael Kerrisk <mtk.manpages@gmail.com>
> > Not-yet-Signed-off-by: Alejandro Colomar <alx@kernel.org>
> > ---
> >
> > I've cut the diff below to just a single page, because this is just for
> > discussion; the actual diff is huge and uninteresting.  It's just a
> > removal of all uses of fwd decls of parameters in the manual pages.
> >
>=20
> I don=E2=80=99t agree with the change,

Thanks!

> but the fact that there are no useful ISO C
> semantics for parameters of pointer type declared using array syntax
> weakens my concern. (If the parameters actually had variably-modified typ=
es
> then the change would be far worse, from my point of view, because the
> parameter types would no longer be expressed correctly.)

We don't care about what ISO C says.  GNU C clearly assigns semantics to
array parameters, and that means we have to be careful about them here.
If this can result in sanitizers breaking code, it is something to be
careful about.  Moreover, I hope ISO C eventually catches up.

> You know your customers better than I do. If they expect GNU C semantics,
> then it seems reasonable to document those semantics using GNU C syntax.

Agree.


Have a lovely night!
Alex

P.S.:  I see two emails from you; are they the same?  One has a smaller
recipient list, but the contents seem visually the same.

>=20
> Christopher

--=20
<https://www.alejandro-colomar.es>

--yf6jcu55i7xchwky
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmraadMACgkQ64mZXMKQ
wqlNFg//ZmJgAKkX7kRXGzayIfVjqc7IatbV0Ym64F9QeMJOPIUbIta3aO/IdenY
EX4HppedYSIJVQFY2EBz5+V6lmCLMve9Z07kkczlBVTRSN4slrDpMQIeMcDXM7XE
plbSE0UrHF/taHp2N9uxEeP+lZBJe+N/a/Ueh9OaChS+gh0h8mmNw4ol9eeJDUsT
iZot7hD44J/EXy4KM2TmNv6rIFWr2Y47n2AVVBxmR8iHf9H6Q97ZOsXgLQ8jkUvl
NSt2laUxHtQunf0eV1kB1Hvtkz8t09MXuY2vwpfeQkxNV5Nx8u4o3fJ6N/tnGXYo
1bUEl14fAnoXAzpBFdAfFVnUfzw5OSkReJw026TA7mP9g9PbahxnOvFyJ+3HxJhF
ENL5T7xIZ/6Jhw2Ei6UDEAZm1VHkLVdHSw8+Gsm19mK1ZAcb9+s5ZPWaNcwLwnXa
OZQH/33UvPpwnecCSnsrGSkB+lTwNGe158aI6VSEi/a/e7xMPW+9jwgcZTFNuoUX
QrD53cE5U6CdhjQ0mIOpPhygqS7GGQMcReFAL2KZyfNN+xGPcfi3FjEoQoK8AeWp
S/x51y/Q1mbWTFnTMwiTUPm0+y2YFc78s7Pd903Jt9uyALsJzn/umwo5jtFW6mVe
ykGECwd2XM9yj80ElYvwO5MrHUPuE1L33p3pdut22eFEVYMIVus=
=9pOU
-----END PGP SIGNATURE-----

--yf6jcu55i7xchwky--
