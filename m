Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792759345;
	b=l4/UftXODzNxH0870V0+Df/WqbOcdM/oqygzTbdr0bOdBdEEH0Nsbjqj117Ccj+d5WJ9
	 i/I2xQIfrYj9zxYJSufJw/xnbHSr+lBLF85KLh/jj0xAc1PrFncxOUZI1uUPdBLuiqxUp
	 aNd9Majo1MYSehe4tIYnT3+G0jQjovj3u+X8rinXQ+QrZ+KYotGlxwS9Xv415AKKVF5Y/
	 YHSgyYaK7luvcyuTgTwr0irBZ8Od1YfYWPvkznCbqaShG2C4nZ9etURSYVH9L4qo4p0MF
	 U61/G6Nd2Uy8nYRJXiZePBEDrXU4C+Erk7sGiDRCVW4N6pp+izbCNpXFOIeZb/+FX1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792759345;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+hct7GAHxZduKMsaCMLvSkWHOZfSGYwHYG0pm3cjjDI=;
	b=4FhvRQFClGKfDfLFWPqYmje5DEfZL9/DtuSPnbVaA/d5QWGMngBxHIbrZ5VjlbKU1p4P
	 pugKDANGohZcQq6luPLT+pc8wrCPA+hffF8LLA/1crmBJbH12gtWzIoe5rf4lJHlQ2MsO
	 sPSVrS7yksWMMvWT6Xd+EKJgI7c0gyiquC8vKOH4t+LktzsS/hZyzJQwm0YXrpfDTe4vH
	 8C+T/lBvaNeEYgc17adUQFMeNrlpQW/sedv2qI5HgREdNfJybjEoCCQ31LLeNxYo/0r8A
	 n7bAPA6GAI6+HwUSHgGUForDoPptrJ/v7kbw4GeimwcFjYxiWrE56lAf6v8AKBh55aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bDNM+3VD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D775A606A325
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 12:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bDNM+3VD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3F51F031E2;
	Fri, 23 Oct 2026 12:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792759344;
	bh=+hct7GAHxZduKMsaCMLvSkWHOZfSGYwHYG0pm3cjjDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bDNM+3VDwsTHtp/cnAD9MjiMZTUiLyVYO9N/Pm3jfjSaqhbV19yM/Y5aQCUL7CR9y
	 SntgN1b2sGx7f5/WXjnRhFGxFTZyj9bZCHoDTfvuJ4sXhBx8m6dEx0M5NemgFdYKSj
	 yHfEXz5c2nYfFqJCcjfJOM4C584EYLKJLfjB13vSKI8s4cdYJm3XVUJLpfGcRgV8l0
	 LuI8y5RMkayJIcXG4mMmhs43w5FDaeXRk7BJnw9WS5S2vRuW4UCcJ0uiil38TeYa6f
	 W976MXfKg6S2/1Cm4iX+W6rWTSva36hOUohkdRKQsLlsQdH2yd7WvyI8rvBQySnwns
	 vXlmsK+1kmDKQ==
Date: Fri, 23 Oct 2026 14:42:14 +0200
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
Message-ID: <attQRCILbrngR_70@debian>
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
 <CAEHU8x9jET+vcrR0NpDz6t57egQG8TZqx5XtV52srH9ZRvdxSQ@mail.gmail.com>
 <atpnWiYQzs_HZ1Q7@debian>
 <CAFs=pgZZeOg7vmkyTjwZdnafYFxn+Yogd9usEzX9Bmv87Z-P4A@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="7hpz5bztedov3qpd"
Content-Disposition: inline
In-Reply-To: <CAFs=pgZZeOg7vmkyTjwZdnafYFxn+Yogd9usEzX9Bmv87Z-P4A@mail.gmail.com>


--7hpz5bztedov3qpd
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
Message-ID: <attQRCILbrngR_70@debian>
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
 <CAEHU8x9jET+vcrR0NpDz6t57egQG8TZqx5XtV52srH9ZRvdxSQ@mail.gmail.com>
 <atpnWiYQzs_HZ1Q7@debian>
 <CAFs=pgZZeOg7vmkyTjwZdnafYFxn+Yogd9usEzX9Bmv87Z-P4A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFs=pgZZeOg7vmkyTjwZdnafYFxn+Yogd9usEzX9Bmv87Z-P4A@mail.gmail.com>

Hi Michael,

> Date: 2026-10-23 08:53:22-0300
> From: "Michael Kerrisk (man7.org)" <mtk@man7.org>
>
[...]
> > > > Also, this syntax is not very dangerous: a programmer thinking
> > > > that a forward declaration is actually a normal parameter will pass=
 a
> > > > wrong number of arguments to the function, and thus will have compi=
ler
> > > > errors.  This syntax is quite robust, as it requires several bugs to
> > > > happen in the same code to pass compilation silently.  If one repla=
ces
> > > > ';' with ',', the parameter will be declared twice, which is an err=
or.
> > > > If one renames a forward declaration, it will not match a parameter=
, and
> > > > will result in a compiler error.  Only if both mistakes happen at o=
nce,
> > > > the compilation would pass, but then the call sites would also have=
 to
> > > > match the bogus declaration.  And also, the function definition wou=
ld
> > > > have unused parameters, which would trigger diagnostics.  So, conce=
rning
> > > > safety, this feature is not very dangerous, even if used by someone=
 who
> > > > is very confused.
>=20
> It is not enough to say that the compiler will warn people about the
> incorrect arguments. I have seen people do the strangest (incorrect)
> things to "fix" warnings and errors they get from the compiler.

Hmmmm.

> > > > Do we think programmers are unable to ever learn this new syntax?
> > >
> > > No, because programmers are clever and it is relatively simple. I wro=
te a
> > > paper that explored the drawbacks of the syntax and recommended
> > > standardising a subset (which I assume is what you are using).
>=20
> I have talked with programmers with *decades* of C programming
> experience who are unfamiliar with this syntax. Indeed, when I first
> got bug reports about, I also was unfamiliar with it, and thought it
> was just a bug in the manual page.

I agree with this.  Very very few people knew about this feature until
it started being discussed recently, and still very few people know
about it.  I only knew about it around 3 years ago or so.

What I wonder is whether people can get familiar with it in one or two
years of exposure to it.

One way to test that would be to wait until Fedora contains this syntax
at least in one release, to get it exposed to more programmers.  So far,
Fedora remains in man-pages-6.13, and the first version with this
syntax was 6.14 (1.5 years ago).  Carlos is working on getting the
packaging updated.

There are risks in both alternatives: if we have the GNU C syntax,
there's a risk with programmers workarounding compiler errors in weird
ways.  If we have the invalid syntax without forward declarations, the
risk is in people using that syntax in their own code and triggering UB
or least logic errors.  The latter risk is a persistent one; there's no
expectation that the risk will ever decrease.  The former risk (that of
using GNU C syntax), I expect the risk to be temporary, until
programmers get accustomed to this syntax.

I'd accept adding this patch if there's an overwhelming majority that
I'm being a bit paranoid about the risk of using invalid syntax, and
that I'm understating the risk of using GNU C syntax.

I'd like to hear explicit comments from Carlos, Sam, and Joseph before
taking a decision.  But if they seem to agree with that point of view,
I'd take the patch, even with my own NAK (I'm willing to document both
ACKs and NAKs).

I've now also CCed a few more people, since I'm also curious about their
opinions.

So far, the patch would have:

	Reported-by: Michael Kerrisk <mtk.manpages@gmail.com>
	Nacked-by: Alejandro Colomar <alx@kernel.org>
	Nacked-by: Martin Uecker <uecker@tugraz.at>
	Nacked-by: Christopher Bazley <chris.bazley.wg14@gmail.com>
	Acked-by: Mark Harris <mark.hsj@gmail.com>
	Acked-by: Michael Kerrisk <mtk.manpages@gmail.com>
	Signed-off-by: Alejandro Colomar <alx@kernel.org>

(those ACKs and NAKs transformed from messages saying they want or don't
 want the patch.)

(Before anyone comments the possibility of going back to simple pointer
 syntax, that's certainly not coming back.  The information about array
 lengths is fundamental in the SYNOPSIS.)

[...]
> My preference would be the earlier status quo: standard C syntax, with

As a reminder, it was never standard C syntax.  We have always had
non-standard exceptions in prototypes, such as open(2) having two
declarations (as if C++ overload syntax).  It was ISO C syntax regarding
array parameters, though: we used pointer syntax.  But as said above,
I really disliked having that information only in the DESCRIPTION.

> an explanation in the manual page text that explains the relationship
> between the arguments. The current proposed patch is a compromise: it
> has the disadvantage of being nonstandard C, but does at least clearly
> hint at the relationship between the arguments.

Agree.


Have a lovely day!
Alex

> Thanks,
>=20
> Michael

--=20
<https://www.alejandro-colomar.es>

--7hpz5bztedov3qpd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrbVh8ACgkQ64mZXMKQ
wqnZWg/9F9VOuiT/FS8f0ywwDUcg1BhQ9HcKZw4RrqRgJvqxcJWaTzkWJsZ9F1Ww
liIStbVsp8SlQLVJ/c01gVJQw9e/yWtIaYNcFu1g/jF0DJPde87ymDB4WAMRfzQC
SA/oLtEQSOKVcpnScydHLJtdOhfvmjhLOnxHKsMUixGEIkhG/yi1tvi6AvbMlO1h
iEBS7ime0BOZ0CbsstDkryN7Lpjm48cSln0LtFy2tsoG5H0pMszPwKX1XdyfDToE
7ifgWBvZl7NRFyjpQcr9TNBGx4+/K1znMPTvGDZjD4j+SJfnlU/x80Lo7mBsgsqz
TzVjBjzy4VYxoEqVaPR+0GZYELKrfseLgOP4kEl3I6RTK1LV6H6CHcxRBlzhRzhB
+SZFN5mqnk1oUYgShTt6w3uMMnfWOqKBUdObM35n79ijwM3QgJpm6C4qX7p5Q235
gnAaqnmhJzpsZ+x3RZulFewqrEAax0aRsPNX5jZwsOt/qQvei2APRoK3jI+d+4kj
K+WlShlptRuyoYdYhEtyclhQO5uXmFAn5V088h5w5ozoM2KfQJWE4a4nFKVIH10v
8lFkaiuVQYcQOVGVkjwpEMv7fPOEKUQbcvYkfWL06ZtdelmAhPf9Y2G7vWyZKOL+
grvWD8GVkUo6Mz8QHiObtDu0L/dzvcAOvX4br+J3zFjl6cSs4oY=
=VwZ2
-----END PGP SIGNATURE-----

--7hpz5bztedov3qpd--
