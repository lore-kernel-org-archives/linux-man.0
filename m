Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792859845;
	b=xPDQuZ0rp5B5J2S8XnDqgD4Y/6IjEuM0Ps/TJyczbLZenQ6Saa0t/qwXb5whvRiJU/uV
	 6fwDv2gC89K2xDZNVSeXzOnHQsd9znOPqHDMP4EFsXR5lSmut410D29XHm+G+1rzkth6h
	 3RHQ4itwhukfmzeyWy2MDh0lupZTLXDbOp9/7tkPJnuKQa4Lt7hV0CMoTeulw1fq6Z/Yp
	 wU5ub02k1+i2MEA3JEKkQECMeMXKzZnIu82P+sdDi2Af6ydaG++nN8dHWu5P8eelLjuy3
	 iZvtYyfveJphpeBh8y/dd9sPPN/vwBYyKgN/snNCwu+Lt3Rx/etlzn2HBgwPYQhbtYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792859845;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1wrXHu5Y9zEZpAXDXINHRL7Wq2MWQu24ykDPpqBa/jg=;
	b=pkHQu1aoj54Vxr70H3B4uFFBNxq0ueiFkp/33jEQzE2tZ0FahwtIkfFM9AM34ilfG7sR
	 JKLObF07WOnEeV0Yx/uULn2P+lvTeExSBCV0ULu2n716XgRvhgyhpx7j+bd+XK3tyoCFo
	 8ekH3H4VfCSNJ3updAarr/PV+8k3lpa1s83Q1xfoX4fZFXQxQIXQZa0RN3LbU4/mKoc6s
	 RcXPT2xLXrhNuDrbHz/cDljGTassMmdvMNMclheLznfPRgpQCpBhO47fGJNhE7fU7rOW2
	 3+dEC2EyLmXpRruXH/z8r1qYMdzlDuxlvzSgjviIhnw8kRr7fsbj4eWf530vIMaOlPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cJtzX6eI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4DD606A31A
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 16:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cJtzX6eI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E85A1F01825;
	Sat, 24 Oct 2026 16:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792859845;
	bh=1wrXHu5Y9zEZpAXDXINHRL7Wq2MWQu24ykDPpqBa/jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cJtzX6eI6krcrHI3Gvbf9cjUMDmqDQ1cYsZoNp1c5YKv992dzCZFQXw/rGq0Fb4r7
	 Ml+5YjtbZ8bIZLHr95P0LLxiCMcdAiQenUy1DXUCgNx9Pg6ZBA8/HOV9UnOytNb1TR
	 Jg2bXEFckokcg8wSo7ZRyEm56xY9xL9cveOiXDYEvAIZ88Kxt5yCsZtMJjyZZ8SnPH
	 yK2tP43fwez1oo4U8ndcnzmH9X3eLcGje7Ud8Ziq3aK4LuE0RLsveyMCydfglSx0Cz
	 6go7xhN9B1B7YmxDgzmgcUwmig95G9S2SnPnwGKqsvFCJy9q73j9YqVI3FlPcIg2H2
	 lZvnHbXoxkf1A==
Date: Sat, 24 Oct 2026 18:37:14 +0200
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Christopher Bazley <chris.bazley.wg14@gmail.com>
Cc: "Michael Kerrisk (man7.org)" <mtk@man7.org>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>, Martin Uecker <uecker@tugraz.at>, corbet@lwn.net
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <atzcMTC3Hl4GPD39@debian>
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
 <CAEHU8x9jET+vcrR0NpDz6t57egQG8TZqx5XtV52srH9ZRvdxSQ@mail.gmail.com>
 <atpnWiYQzs_HZ1Q7@debian>
 <CAFs=pgZZeOg7vmkyTjwZdnafYFxn+Yogd9usEzX9Bmv87Z-P4A@mail.gmail.com>
 <CAEHU8x-Zs8E=e5qoJYRB2ecunpcZWoazsj9Pnxq5bn6bS4ndMQ@mail.gmail.com>
 <CAFs=pga6UWmH6FJZcf0wRi2S3PdbrJWNFeVbkQVVmncB3Ni=-g@mail.gmail.com>
 <atyxz7Uj4rue8HjP@debian>
 <CAEHU8x9P3PLFAMpJ7wfYapvJkEt4b09KR9sypjUuONRniAQT3w@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="naboqo5zy4go2yex"
Content-Disposition: inline
In-Reply-To: <CAEHU8x9P3PLFAMpJ7wfYapvJkEt4b09KR9sypjUuONRniAQT3w@mail.gmail.com>


--naboqo5zy4go2yex
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Christopher Bazley <chris.bazley.wg14@gmail.com>
Cc: "Michael Kerrisk (man7.org)" <mtk@man7.org>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>, Martin Uecker <uecker@tugraz.at>, corbet@lwn.net
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <atzcMTC3Hl4GPD39@debian>
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
 <CAEHU8x9jET+vcrR0NpDz6t57egQG8TZqx5XtV52srH9ZRvdxSQ@mail.gmail.com>
 <atpnWiYQzs_HZ1Q7@debian>
 <CAFs=pgZZeOg7vmkyTjwZdnafYFxn+Yogd9usEzX9Bmv87Z-P4A@mail.gmail.com>
 <CAEHU8x-Zs8E=e5qoJYRB2ecunpcZWoazsj9Pnxq5bn6bS4ndMQ@mail.gmail.com>
 <CAFs=pga6UWmH6FJZcf0wRi2S3PdbrJWNFeVbkQVVmncB3Ni=-g@mail.gmail.com>
 <atyxz7Uj4rue8HjP@debian>
 <CAEHU8x9P3PLFAMpJ7wfYapvJkEt4b09KR9sypjUuONRniAQT3w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEHU8x9P3PLFAMpJ7wfYapvJkEt4b09KR9sypjUuONRniAQT3w@mail.gmail.com>

Hi Chris,

> Date: 2026-10-24 17:16:19+0100
> From: Christopher Bazley <chris.bazley.wg14@gmail.com>
>
> On Sat, Oct 24, 2026 at 2:38=E2=80=AFPM Alejandro Colomar
> <alx+linux-man@kernel.org> wrote:
> >
> > > Date: 2026-10-24 09:45:02-0300
> > > From: "Michael Kerrisk (man7.org)" <mtk@man7.org>
> > >
[...]
> > > I was unfamiliar with that syntax, but at least in context it is
> > > immediately understandable,
> >
> > Actually, it is not understandable.  [static 2] doesn't mean the same as
> > [2], and this is one historic mistake of the C Committee that I wish had
> > never happened.  [static 2] is never what you want (I was tempted to say
> > almost never, but I've never seen a good case for it).  Programmers want
> > the meaning of [2].
> >
> > The main differences between [static 2] and [2] are:
> >
> > -  [2] means (in GNU C, and in common understanding, but not
> >    acknowledged by ISO C) that:
> >
> >         -  The caller must supply at least 2 elements.
> >         -  The callee must not access past those 2 elements.
> >
> > -  [static 2] means (in ISO C, but ignored by GCC):
> >
> >         -  The caller must supply at least 2 elements.
> >         -  The callee is free to access past those 2 elements!!
> >            (of course, if there aren't any elements after that, it's UB)
>=20
> You can, of course, document for the benefit of callers that a
> function does not read past the static array bound.

Comments are bound to be wrong in the future, often near future.  It's
better to not use the feature, because it's not necessary.  Just use
[2], and ask your compiler to be better than what ISO C requires.

> >         -  The caller must supply a non-null pointer.
> >
> > The null-pointer issue is nonsense, but we can live with it.
> > The allowance to access past the specified length, that's the real issue
> > with this feature, and why it should not be used at all.
>=20
> Of the compilers I have tried, only SDCC currently warns about access
> past the specified length, and it does so regardless of whether the
> length is specified using 'static' or not:
>=20
> int foo(int a[static 2])
> {
>   return a[2]; // warning from SDCC
> }
>=20
> int bar(int a[2])
> {
>   return a[2]; // warning from SDCC
> }
>=20
> https://godbolt.org/z/zf3nPerdn

GCC has some partial diagnostics for out-of-bounds accesses.

	alx@debian:~/tmp$ cat oob.c=20
	void five(int a[5]);
	void four(int a[4])
	{
		five(a);
	}
	void three(int a[static 3])
	{
		five(a);
	}
	alx@debian:~/tmp$ gcc -Wall -Wextra -S oob.c=20
	oob.c: In function =E2=80=98four=E2=80=99:
	oob.c:4:9: warning: =E2=80=98five=E2=80=99 accessing 20 bytes in a region =
of size 16 [-Wstringop-overflow=3D]
	    4 |         five(a);
	      |         ^~~~~~~
	oob.c:4:9: note: referencing argument 1 of type =E2=80=98int[5]=E2=80=99
	oob.c:1:6: note: in a call to function =E2=80=98five=E2=80=99
	    1 | void five(int a[5]);
	      |      ^~~~
	oob.c: In function =E2=80=98three=E2=80=99:
	oob.c:8:9: warning: =E2=80=98five=E2=80=99 accessing 20 bytes in a region =
of size 12 [-Wstringop-overflow=3D]
	    8 |         five(a);
	      |         ^~~~~~~
	oob.c:8:9: note: referencing argument 1 of type =E2=80=98int[5]=E2=80=99
	oob.c:1:6: note: in a call to function =E2=80=98five=E2=80=99
	    1 | void five(int a[5]);
	      |      ^~~~

I wish it diagnosed as much as SDCC, but not yet.  :)

> (I'm tempted to report the warning produced in the 'static' case as a
> bug, but in reality no warning is a conformance issue, so that
> characterisation is subjective.)

Clearly, not a bug, but rather QoI.  ISO C has a bug.

> > The committee was clearly confused when they added this feature.
> > It was around the time when 'restrict' was added, which is another
> > historical mistake of the committee.  In general, every feature they
> > added thinking of optimizations (and that includes these two) has
> > resulted in a mistake.
> >
> > > and I so I don't dislike it, And it is
> > > standard C.
> >
> > When the standard clashes with reality and common sense, I'm not sure
> > I'd give the standard much credibility.
> >
> > >  I really don't think Linux man-pages is the place to
> > > introducing nonstandard, GNU-specific syntax (that people clearly
> > > don't understand).
> >
> > People clearly don't understand [static 2] either.
>=20
> My understanding is that [static 2] was introduced to facilitate cases
> like the following, where an implementation could theoretically
> generate code that reads the first four elements together, but would
> have to load subsequent elements individually:

My understanding is tthe same.

>=20
> int len(int s[static 4])
> {
>   int i =3D 0;
>   do
>   {
>     if (!s[i]) break; else ++i;
>     if (!s[i]) break; else ++i;
>     if (!s[i]) break; else ++i;
>     if (!s[i]) break; else ++i;
>   } while (1);
>   return i;
> }
> https://godbolt.org/z/ra6zh7Ej3
>=20
> I have never yet managed to persuade a compiler to optimise such code
> differently from a version without 'static 4', and I struggle to
> believe it would ever be beneficial to do so. The more obvious case,
> where an array bound such as [static 4 * n] potentially enables
> speculative loads when unrolling a loop with an early exit, does not
> need the compiler to be permitted to generate code that reads beyond
> the passed-in array bound.

And indeed, I agree.  This seems a case of bad design, wishing that it
might eventually be optimizable, while it wasn't and still isn't, and
also while ignoring the safety issues caused by it.  We should just
pretend that the feature doesn't exist.


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--naboqo5zy4go2yex
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrc3rQACgkQ64mZXMKQ
wqmStBAAiaIceOejzjugs6pwSzrYbMBR9U3D+U/PRUWeySbtWjvAIvTR+uo99Ptn
AHv3lV1N7OMVV2n6JGSGSFhTkd19zQ30UmPKcw3Aolb/oFEbLxmLKnqpFTP9WLor
PFRYs8+rdCneJdH2BAtQW7yOuDOHIA8wHBs0eRT+jmVGl7pDKqZE1L8oRE/WrpTq
g3ullwzYZ7gZReYXpzV8S6yn0sBJ9LHbNxuDGPhqkGnwrk/5r49b/VA3RH5B6prY
SXFh8qiE/Nx2mdRstX73Y4k4O0MqBQ1vow6CR/Dh3K5T6s8DF94Ov3kggY9wvqyx
JdknviwPbXBPJqvIe2Vr078UlA7vL0GLslchuqIIvaIz9sNQOuFjS+YmRnz3rJuy
P3dTY2WMKcTGfi7xg6UOvUVbuYvfkk3G5/RmIg8t7dZTHq78i8UV73/Sx5IE/uIJ
oW9iOaXJ9StgEG7Z9SAdzMZbJw04wEkKwO4LCtOkeITtawthKQYzI+mukGzN7XtB
vEkx2UP/vmdM/QtdpNms5O4zkFY77u++RUsFwTmtLEDh2ekT364WyAuRTm8L2HWq
uZEFAhE0uZ40tXCVCR15dcBAKn8HEpMZIaLhBHb2FnZPSmqpjsc0uF8fUuOdsZxL
jMpnfT8xqDmp1y2Zn+K8j6nbLDgpXvC2Q5IRGPTILHmNenGJsDc=
=riq5
-----END PGP SIGNATURE-----

--naboqo5zy4go2yex--
