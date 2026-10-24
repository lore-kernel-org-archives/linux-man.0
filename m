Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792849094;
	b=o+sAMoegP6VQnejPcPOKoVhhdL8kGjlsOC6K4VLvU8LiDqBTEk2BuHJyDtYxIKwpr+dx
	 Gxkh1LqSAJCVzi2QpCJc5zxyUYRvSxlM722/kXdsYwPHOmV1q+Ydz5CyO05Zpo3kYlQkT
	 IIqdSiujZn4VqBV7mNLPYGMyijEjO3p4bs9NMc1sGtkjEdpBo1o0TUOWoyYf3zwSneauU
	 XIH64PygzwAhngHTVk6q+dvZkSdzmZukU4jzuPy5KEtw7uWCFgWAKQYmsNxhLzz8LAr7k
	 c44NYc+oQFroB0uETnHNUQKzENWYNAlPpXr0rn+iH/9uabArGrfHWwPxjxllVc4yjVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792849094;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OqszCmjDiOfTruzUyPHsv98bms8Rh6xK3jLp3pisO7A=;
	b=lW8Ags09DYDddjhTOX7oN5pPpnJ6KiObzVx7z6BVKURIBVqiaBIzPcMPskJpANUvhq2f
	 dJOcdmJ73MnC3CJ8UFQxPC2MbQ34M3NisXfC511mNZigZxMlhUF3tAV5JlyW7vFUrApHQ
	 XLVesYVz9x/mgQ0KI7rcPxp12gf2HJtoby+ofiMya5GESN/TQLamfMSQ1DGO6Q9rNjJxt
	 7edJpIJufexxL60VA5yGerg1YOfV1pHSI/x5pmB7bfXLfVQnhAzE8HsErur/dCzE/Z8H3
	 0vhOEKp/FhU1YBjZAx3ehP2uGvLKOd6rl3IUxvsrVrb3SDZA3rGCM98++dLxXESN8aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cw509kfS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E99606A31A
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 13:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cw509kfS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D78031F01825;
	Sat, 24 Oct 2026 13:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792849093;
	bh=OqszCmjDiOfTruzUyPHsv98bms8Rh6xK3jLp3pisO7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cw509kfSYOhaBoGhzcjRkbqgmHp26F8O7zptkDP2K5MvznLu2oSmX1V2b4E/v4OiF
	 11m8HaisZ/jl+7N6zBbd0gQMzNfPIZFIIcu3wJfLOaMshNlGGUxJbDUGdoo3s9+zRj
	 e2JUHnDnjf6TVG9K/8hsM3+9vHrrnbKTHycU07rqoFaikZgm3toAbHxqGJPS4feW6i
	 3mi6Sm+rP7OdwdDrv7YsEoYZ6Ytg/zHtaXEaD8if49PsLlZV6WhPFnK3ghbSXqPmpo
	 b5NvN1vaJm+uvjd1PxOBbDWVfyWL4E4Cb5bzFIMXXE9iENQgfqU8R2wvF8fbZdrGWQ
	 XjYbwoj9HflKA==
Date: Sat, 24 Oct 2026 15:38:04 +0200
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: "Michael Kerrisk (man7.org)" <mtk@man7.org>
Cc: Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>, Martin Uecker <uecker@tugraz.at>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <atyxz7Uj4rue8HjP@debian>
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
 <CAEHU8x9jET+vcrR0NpDz6t57egQG8TZqx5XtV52srH9ZRvdxSQ@mail.gmail.com>
 <atpnWiYQzs_HZ1Q7@debian>
 <CAFs=pgZZeOg7vmkyTjwZdnafYFxn+Yogd9usEzX9Bmv87Z-P4A@mail.gmail.com>
 <CAEHU8x-Zs8E=e5qoJYRB2ecunpcZWoazsj9Pnxq5bn6bS4ndMQ@mail.gmail.com>
 <CAFs=pga6UWmH6FJZcf0wRi2S3PdbrJWNFeVbkQVVmncB3Ni=-g@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="wo72fzpuxakwgo6y"
Content-Disposition: inline
In-Reply-To: <CAFs=pga6UWmH6FJZcf0wRi2S3PdbrJWNFeVbkQVVmncB3Ni=-g@mail.gmail.com>


--wo72fzpuxakwgo6y
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: "Michael Kerrisk (man7.org)" <mtk@man7.org>
Cc: Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>, Martin Uecker <uecker@tugraz.at>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <atyxz7Uj4rue8HjP@debian>
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
 <CAEHU8x9jET+vcrR0NpDz6t57egQG8TZqx5XtV52srH9ZRvdxSQ@mail.gmail.com>
 <atpnWiYQzs_HZ1Q7@debian>
 <CAFs=pgZZeOg7vmkyTjwZdnafYFxn+Yogd9usEzX9Bmv87Z-P4A@mail.gmail.com>
 <CAEHU8x-Zs8E=e5qoJYRB2ecunpcZWoazsj9Pnxq5bn6bS4ndMQ@mail.gmail.com>
 <CAFs=pga6UWmH6FJZcf0wRi2S3PdbrJWNFeVbkQVVmncB3Ni=-g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFs=pga6UWmH6FJZcf0wRi2S3PdbrJWNFeVbkQVVmncB3Ni=-g@mail.gmail.com>

Hi Michael,

> Date: 2026-10-24 09:45:02-0300
> From: "Michael Kerrisk (man7.org)" <mtk@man7.org>
>
> Hello Christopher
>=20
[...]
> > I am curious to know what your attitude would be to lesser-known
> > standard C syntax.
> >
> > For example:
> >
> > int pipe(int pipefd[static 2]);comprehensible
> >
> > is standard C syntax, and requires the caller to pass a pointer to the
> > first of at least 2 array elements, unlike
> >
> > int pipe(int pipefd[2]);
> >
> > which has the same semantics in ISO C as
> >
> > int pipe(int *pipefd);
>=20
> I was unfamiliar with that syntax, but at least in context it is
> immediately understandable,

Actually, it is not understandable.  [static 2] doesn't mean the same as
[2], and this is one historic mistake of the C Committee that I wish had
never happened.  [static 2] is never what you want (I was tempted to say
almost never, but I've never seen a good case for it).  Programmers want
the meaning of [2].

The main differences between [static 2] and [2] are:

-  [2] means (in GNU C, and in common understanding, but not
   acknowledged by ISO C) that:

	-  The caller must supply at least 2 elements.
	-  The callee must not access past those 2 elements.

-  [static 2] means (in ISO C, but ignored by GCC):

	-  The caller must supply at least 2 elements.
	-  The callee is free to access past those 2 elements!!
	   (of course, if there aren't any elements after that, it's UB)
	-  The caller must supply a non-null pointer.

The null-pointer issue is nonsense, but we can live with it.
The allowance to access past the specified length, that's the real issue
with this feature, and why it should not be used at all.

The committee was clearly confused when they added this feature.
It was around the time when 'restrict' was added, which is another
historical mistake of the committee.  In general, every feature they
added thinking of optimizations (and that includes these two) has
resulted in a mistake.

> and I so I don't dislike it, And it is
> standard C.

When the standard clashes with reality and common sense, I'm not sure
I'd give the standard much credibility.

>  I really don't think Linux man-pages is the place to
> introducing nonstandard, GNU-specific syntax (that people clearly
> don't understand).

People clearly don't understand [static 2] either.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--wo72fzpuxakwgo6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrctLYACgkQ64mZXMKQ
wqn2Ow//eFS7Xi4rSj1JEWqxKX55uhiB36jYVhwpGbiCCaThQr3ZvgI/I96QEd1m
WhNvWvFND/IKxyHp0q1FRsjnpSWspvAM9TCA+Bt61a/pu8j3aQQBm0jYAOQuLtwV
tmdMXsscuqt7qzCO0gxJ9mjFYp9eHNfHm5BAmr+ZMsORGlzAI5rCCtRAfA7t9asg
4m/bLLc0VqMImco98vHL8lZqGQiQajyupk4UC3Pc5pcQyv43TKR5Czyhwjtr4XcF
yXRAVHZObOm99fJGWaknltvQBcjw/syG284xOazDywmbM0J6pTrapoI3QFyiBr1A
wnz1lbahdJqP9ZzShtMyrqj1MiAFIRJhM6P1Bwsgtyn8+FwP9FufsraIpqO4Ww/g
l8MQT1y9eErr4pRwTvNk7HqXezZytla82CHRuCNQjW0Uy8ipnl08aQA0jKbFEkOg
/GXbwkgWhN2PzFmZzyIB4ceZFCCif9yHKFnW8IJQCZBHT8l278ZLqhf0i48j6p1s
d09abiXc3+rGQmGpkHHqzswd8mRXCRbgISuMp6Upkh95O7PRP/x9YIEEF8RKUHGs
GHOzAvtWZg1qbst2g81rbR+LmZ3Lt67TMrPeinidRCmGKPf0lLi9wXEdjnNlts70
z3LmA5LSLxX8j6lX/mPR5EF39b9U2ZhhL6rDIToZShfSccfVYqU=
=7Sal
-----END PGP SIGNATURE-----

--wo72fzpuxakwgo6y--
