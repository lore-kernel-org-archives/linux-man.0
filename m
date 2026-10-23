Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785969;
	b=saMxzTUBIJ7kM+OatI0ORG1JM0IeupqErBggpMq5j/FTxVbFqYqlnbE10gdOhcLq1YCs
	 dF/TEeGEvzAm52jT4WMYb+stAcKqpVyK7HNo+OSB2yFo+wQBdXh9d0X1H/fdUN2qn/aic
	 N7cFMut8Zpk+19FJHsxMRiapC6fFVYsdbM2pBvrgj+vTr9mGg4Dx9TAyB9jfP6Od1OeTl
	 H2wBx4ThOzYKlPzcax6GsGd5zkTszbcSpqLXfZfI4LzBamoqN+VfzoqEQAGcJFKD1kifJ
	 EnCRIEeuQDZOikt66QJ7GmZC+sEWPZi/iIq7QOVnEihr+JpqrukxG1df1Nv6fz6GIWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785969;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NNd+RfkQBq58+ibP9XTmROoJv9OzWx+Z8J1qenb1UqM=;
	b=5Yql78waaZiXmwouER0ppWy+q5MZRA/XyDN9jW4qz2G2WwxR2xNOpCdbklZpNfskO32l
	 hAoRzDswzj4yZ345wNwwPmMWR4ze6TlKSUknEwiLLvQH/9DxSv908fLr/L4JoF7qQ/2yE
	 4na6rN7v2S0m09X99VIToAasCNxmlrpA0WOSA9FkBOFEM4QDJc4xAMu7/AlB5B6n+uYXM
	 vBCZ09ix5Z+vSMaFeuOAATGQn/CqDFk9PilNVKNsmRr0/zWChvgizsuKCSdDelBdAEWk+
	 576bQbv9IBwbN8TSD8Ft+SOUpD7LohiEEHCyi1i8Zr+e6DF6WB+qYTjNvANSZ0WezAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YNTYrNqB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA8A606A31D
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 20:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YNTYrNqB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19BCE1F01828;
	Fri, 23 Oct 2026 20:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792785969;
	bh=NNd+RfkQBq58+ibP9XTmROoJv9OzWx+Z8J1qenb1UqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YNTYrNqB7gcUUhQkWibfK9LSCQeF06FOMX0vprjB5aYKcsXY6rFxWaKRx90vn+yEd
	 iuGLkzWEfS90//TRY3mG52tfKYSfEwFMKbcFePmi9UJUfZKbdmKDMN0xb/iAi1IgSx
	 SbKC8ItG1b8mGhhHlrjvhd2hlDzzA93JiEh+fcJhnf4td9BWAMaVTQvljggAL2cFl2
	 l6gIMawgu+KOfSHau0LLDMNlt1/0qyuFOFJcjYngcprCPRo3iAwZqXQDdcoRZgmn7M
	 I4aEK+YUUB7obkTrIFxNdh2DRTnfgZim+xbs6zg3rYXGtjt0bYUaVca45yPmnAKdeT
	 IK/cBLyI9odUg==
Date: Fri, 23 Oct 2026 22:06:00 +0200
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>, Martin Uecker <uecker@tugraz.at>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <atu86HJu42lNGA7z@debian>
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
 <CAMdZqKEWzg6Z5oYp8N+S4rkOjUU7WT6jwbVDCAk3YN3ZdP7u+Q@mail.gmail.com>
 <atsrNyzuYebABZjH@debian>
 <CAMdZqKH=pJUf4kvHNKaPMzdznajxS6EWTn2cXnTqT2ttjithbw@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="zajiv76ivafae7qh"
Content-Disposition: inline
In-Reply-To: <CAMdZqKH=pJUf4kvHNKaPMzdznajxS6EWTn2cXnTqT2ttjithbw@mail.gmail.com>


--zajiv76ivafae7qh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>, Martin Uecker <uecker@tugraz.at>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <atu86HJu42lNGA7z@debian>
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
 <CAMdZqKEWzg6Z5oYp8N+S4rkOjUU7WT6jwbVDCAk3YN3ZdP7u+Q@mail.gmail.com>
 <atsrNyzuYebABZjH@debian>
 <CAMdZqKH=pJUf4kvHNKaPMzdznajxS6EWTn2cXnTqT2ttjithbw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMdZqKH=pJUf4kvHNKaPMzdznajxS6EWTn2cXnTqT2ttjithbw@mail.gmail.com>

Hi Mark,

> Date: 2026-10-23 12:32:37-0700
> From: Mark Harris <mark.hsj@gmail.com>
>
[...]
>=20
> I am not talking about someone writing new code that they will then
> try to compile at some point, I am talking about someone trying to
> understand or debug existing code.
>=20
[...]
> trying to debug what is happening.  The man pages should do what it
> can to help them, not throw monkey wrenches in their path.

I see your concern.

> > You didn't take into account my other concerns, though.  I'd like to
> > hear your opinion about the concerns that letting users think that is
> > valid C might lead to them writing code that has UB (or logic errors).
>=20
> An error in thinking that this is valid C syntax doesn't impact anyone
> trying to understand existing code, so I don't see the concerns as
> comparable.

It is actually valid syntax already.  It doesn't have the meaning that
we would be using for it, but it's valid syntax.

	int n =3D 42;

	int f(char a[n], int n);

	f(a, 7);

The array parameter is declared to have 42 elements, regardless of the
7 used at call site.

> If someone adds this in their own C code, and it has not been adopted
> as valid ISO C

The code above is valid C89, and it doesn't mean what one would
intuitively think it means.  That's my concern.  This is a source of
bugs.

Future extensions to the language will make that even more dangerous, by
making it more likely to compile:

	alx@debian:~/tmp$ cat param.c=20
	int
	main(void)
	{
		int n =3D 42;

		int f(char a[n], int n)
		{
			return _Countof(a);
		}

		char s[] =3D "foo";

		return f(s, _Countof(s));
	}
	alx@debian:~/tmp$ /opt/local/gnu/gcc/cap/bin/gcc -Wall -Wextra param.c=20
	param.c: In function =E2=80=98f=E2=80=99:
	param.c:6:30: warning: unused parameter =E2=80=98n=E2=80=99 [-Wunused-para=
meter]
	    6 |         int f(char a[n], int n)
	      |                          ~~~~^
	alx@debian:~/tmp$ ./a.out; echo $?
	42

> or as a compiler extension, then it is extremely likely
> to result in a compiler error.  If a likely compiler error was good
> enough for you when someone writes the arguments in the wrong order in
> their code due to confusion over the syntax, then I don't see why it
> wouldn't be satisfactory in this case where a compiler error is even
> more likely.  In both cases there is a chance that it will be accepted
> and do the wrong thing.

This analysis is wrong.  See above.


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--zajiv76ivafae7qh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrbviIACgkQ64mZXMKQ
wql0TRAAlDF1RsXh7E4ZUilCflzVy8GC00+RyrSPc1kwHYL+5kH+vy7M+TP4lnhB
U6EpoLhJ9LN3Edi6IbAqfLYlremxX9XoV7mn1buTl6ElkLF915dh19eRNfJfwvS4
BMe07y6BX/xc1Xf2+BRmn5hRPuhCudAPlrOW1T5L0s/qaUuj5/wnusilCClszkrS
qduvqm7ZBb+WBfLTqKNj1l/bc3dBKw4m+rV+hVOqtxEHT7UFBi51kW16YSTU+/HN
8QTACBglJNuZO92GCmfOLAcmibtawUWiaegAb+RwEKRTRUWj0bU6E02W4vI3gLoU
L4d+y1qG1sqztol8ulDAZdq8eOrOBdAL13dKYiLRpnJitTQb5S53mkzY6NiS99rO
sVVyJfWukj5OPP3suaxm4CxQnWSpBeFlVKf7d2Q1BNzHeg6MRu6b6jPp+rgCHxpQ
LOE/cz1AfEwsMteGOcscpJj7Q8bbUbwylE1HOhx7URUj96OK6gTxdEK35J2qm05E
qg1RAYm5IRbDozGz3H+Q30oz1RD60Hv5IA/QKg3/MH4nvUEleByELDBxOTjln1dM
0xFBlGe7motpgUbsza6j2+EgNJihtBxLqwDKByznqMApYHPBEIMpkxhE9cLNJ1h5
Sl6wwtV566/9XGFW3jp4mqAofCOa5KgXzYUGKRX85uHNc0T4dO0=
=quUn
-----END PGP SIGNATURE-----

--zajiv76ivafae7qh--
