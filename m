Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D973C431A57
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 18:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782869; cv=none; b=tF8Q7A9kinSdSMzQepTigvgYSZ/QWz4z5bZACH2ABxYOC5jlQaU+kqXnOWAcnrRr/XZN/9BSQ0ql9nuW3T+o0A3ADYysXD0JbU33Av2Rd1kLdmScs+Tpnn7Mo304SbiCYfvuEIPAY8pRyBqXpRvIJLpOK1vFLLxckejg7zJzQy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782869; c=relaxed/simple;
	bh=y8hQ+enaZehl06TUV2DIBW2o6X1A2Rj4Fa4ZKkblSkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXUjgU3uPLXoDtNB/AwhTt6lyJBIiS476gDgiTxrx248ux6yaZgFNUW6Nmb6WbgQtE0peYOub2vU89Q8C/20W6QqEz+4t5N4pd1FziZuy8suctiZRFNF5mX324ky1nkIqML0jfIG/FHgms6pXImATKBcyxxda49vxeTEERPcn9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4qUnleT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4qUnleT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFC91F000E9;
	Mon,  3 Aug 2026 18:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785782867;
	bh=QoJzFnmWqHc/+dL7uW3BVvUVQijVFcmJPzyX8HBm7JY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a4qUnleT5/ckugPFzw4vwvEVjLODqxaiEk6nlwH5eWQv8I39PWoQYlJIDqfIDW9JY
	 R6yKn7nv3yYtssWsoFVaoSkHJ0ji3BR7Gw3NUU3g+fE4c58xegx8nxlZ+/CuTNSynH
	 YcJZDIvCGsduIMxtgocZDXlRl5kgRs1jgYNsdbDadux7XaldYbDufNYiMf+kI/bjA6
	 DCn2xInDLaDY9afoO4uM5ikvzFEAWi7RF7WK5EjSWFcPPxAEZSGgJDkHqBmtDroryC
	 gOOR9XoZk9IAorF9pU9H8r0BUkEPUGld7EIGX9OihTyqVId3MiamhLQvSEmu22+zJP
	 iZodwpVc/tnlQ==
Date: Mon, 3 Aug 2026 20:47:44 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Keith Bostic <keith@bostic.com>, linux-man@vger.kernel.org
Subject: Re: proposed revision to memory.h(3head)
Message-ID: <anDgpLT-FlRrJKC2@devuan>
References: <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
 <am5_uA4MSujYCS9X@devuan>
 <20260801235332.vc443gozbqkqdqm5@illithid>
 <am6HTtAMkEEkWjfl@devuan>
 <am_jYJL6uAapMGXN@devuan>
 <CAMdZqKGRJuR_Jyt7TapMQFQ-6wz=OF5DROFhXkZLQNAn2vyimQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2ghrdnsev6rf3k3m"
Content-Disposition: inline
In-Reply-To: <CAMdZqKGRJuR_Jyt7TapMQFQ-6wz=OF5DROFhXkZLQNAn2vyimQ@mail.gmail.com>


--2ghrdnsev6rf3k3m
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Keith Bostic <keith@bostic.com>, linux-man@vger.kernel.org
Subject: Re: proposed revision to memory.h(3head)
Message-ID: <anDgpLT-FlRrJKC2@devuan>
References: <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
 <am5_uA4MSujYCS9X@devuan>
 <20260801235332.vc443gozbqkqdqm5@illithid>
 <am6HTtAMkEEkWjfl@devuan>
 <am_jYJL6uAapMGXN@devuan>
 <CAMdZqKGRJuR_Jyt7TapMQFQ-6wz=OF5DROFhXkZLQNAn2vyimQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMdZqKGRJuR_Jyt7TapMQFQ-6wz=OF5DROFhXkZLQNAn2vyimQ@mail.gmail.com>

Hi Mark,

> Date: 2026-08-03 10:58:35-0700
> From: Mark Harris <mark.hsj@gmail.com>
>
> Alejandro Colomar wrote:
> >              Most C libraries, including the  BSDs,  glibc,  and  musl,
> >              provide <memory.h>.
> >
> >              Illumos  and  gnulib don=E2=80=99t provide it, though, and=
 instead
> >              use <string.h>.
>=20
> I don't understand why you claim that illumos does not provide a
> memory.h.  It clearly does:
> https://github.com/illumos/illumos-gate/blob/master/usr/src/head/memory.h

Oh, I was expecting to find it under some .../include/ directory.
I didn't expect .../head/, and thus my confusion.  Thanks!

I'll amend the documentation to say that it also includes is.

> However, it only declares the 5 functions that were historically
> declared there: memccpy(), memchr(), memcmp(), memcpy(), and memset().
> Including memory.h is not going to pull in declarations of functions
> that have always been defined as being in string.h, such as the
> strn*() functions.

Thanks!  I'll also document this detail.

> This matches what was found in SVR4, the first System V release that
> was fully unified with standard C and claimed compatibility, and which
> was the basis for many commercial Unix systems.  For backward
> compatibility SVR4 retained memory.h with the 5 original mem*()
> declarations, and those declarations were duplicated in string.h for
> standard C conformance.  They did not even add memmove() to memory.h;
> it was only added to string.h where the standards committee added it.

Huh!  :)

> Also in 4.3 BSD, when they added memory.h for System V compatibility
> in 1986, it only declared the 5 original mem*() functions.  It did not
> include string.h or declare any str*() or strn*() functions.

Luckily, the modern BSDs have it as a synonym of <string.h>, and so is
musl and glibc.  (I guess bionic too.)

But I'll document this detail.  It is important.

> So I think you will find that a lot of systems that were following
> System V or 4.3 BSD may have a memory.h, but it is not going to work
> the way you are suggesting in the man page.

I wouldn't say a lot, but certainly some.

> > > New programmers will follow those
> > > instructions and find their code breaks on illumos, when it really
> > > shouldn't.
> >
> > I hope Illumos adds <memory.h>.  Also, I don't expect new programmers to
> > be exactly the kind of programmers that use Illumos.
>=20
> What operating system do you think is most used by new programmers?
> You are right that it isn't illumos; it is Microsoft Windows.  I'm no
> Windows expert, so perhaps someone else can confirm, but it appears
> that Microsoft's C runtime also has a memory.h that declares some
> functions like memcpy(), but not any strn*() functions which have
> always been defined to be in string.h.  If it's not even in ISO C I
> doubt you will have much luck convincing Microsoft to add the
> functions that you decided should be in memory.h.

I've been in contact with the implementors of the MS libc for quite some
time already for the fix of realloc(,0) in which I've been working.
I might have a handle there.  :)

> Suppose I was reviewing some code intended to be portable, that
> included memory.h for a function that ISO C and POSIX say is declared
> in string.h and that isn't even one of the 5 original mem*()
> functions.  Even if memory.h works on the author's system, it is by
> accident.  Using the standard string.h header that almost every
> implementation for decades has strived to comply with avoids easily
> preventable build failures when attempting to build the code
> elsewhere.  So I would of course reject the code and point the author
> at the ISO C or POSIX standard.  Perhaps you wouldn't because you are
> willing to fight the other operating systems that don't provide the
> nonstandard memory.h that you prefer, but I am not willing to do that
> and I doubt there are many people willing to take up that fight for
> you without a large standards body like ISO C or POSIX backing them
> up.  I don't want to tell people that the man pages cannot be trusted
> for accurate information, so I hope that you will not lead me to do
> that just to avoid the introduction of non-portable code that will
> cause problems on conforming implementations.

The manual pages document the standard header file, of course:

	     #include <memory.h>  // See STANDARDS

	STANDARDS
	     C11, POSIX.1=E2=80=902008.

	     ISO C and POSIX declare this function in <string.h>; see memory.h(3he=
ad).

Thanks for the details!


Have a lovely day!
Alex

>  - Mark

--=20
<https://www.alejandro-colomar.es>

--2ghrdnsev6rf3k3m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpw4koACgkQ64mZXMKQ
wqlItw/9GznrnqREABpz1zoETX13xFfzC5PD358/FYvEiVF35TDNfKbuWQIJV8he
nDh9qxHxK8HDZ3XJmt2f7te7tci0J/80yjX00e3iqlDmoNI5riIRqAVsKxPiCmLz
52S7lEecVxyAd0Zj389TXDgWIrJ2B+5tJDV5lyzHlN5/ogMnGASfmAfe97kVZf62
4jrQUMTTvh8q4hyfcKOoP9loN6d7xfhg+gNkSLw/oOYK6jdrLsF7sxLjRKMNtHGC
qYCa6mSvnJwdXBFkAb8xJ7jOAT8X9H9BT86ZchHZYQCNF8blLZEvFsZGRsQX3YZ/
LGaNmvgU7FN254UAf1Lz4cN2Hna2abvViUI18PbuEZYVgdJGFHVgD9RgWYjwr/le
+BXtLdaw2lqmblndRHK1Kdx4BFbfLVfLHJPSUAzyQnIoqLD+jhrEXa5Rn5IOEhAA
zLrUX8Zp5UugQXQZbl2V6wq4UQBsNh+0WUNuELoCiSgPnOI+lZ7vSQE/t+nNHa+M
9KpUWfyn9mfcWDOcnCBcQfTLP5IC4DXT4WrNsRkUxOvsRBpSlg4J4RjECDzYztjM
VNKt7YCgL/2tZe5xuwZ4eJss7AsLna9/57DY0/zE5lpaN+dCu1KHdCH1yIRoWq9T
LO9GjnGPHNiN5X7yv0pnM+TlZEefJtzUmRw8dhncK0Ue/uUWMJM=
=1fk/
-----END PGP SIGNATURE-----

--2ghrdnsev6rf3k3m--
