Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130F23C5837
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 11:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785757193; cv=none; b=skzRedRFTX1SzTg77kZkbtmB2a2mWHVowTW5xF1a/YRrkAizxxZZkf0Dg85r6bl8norSDRlcMFitPmKB6na3ztPrXOHHOwig3mUZ4UTysYM0mf88Mqo4ABj2TB8qcC9c2WWjwWdkyN2BY5E4U8t23ztwou29W8lcDypeEVWrWCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785757193; c=relaxed/simple;
	bh=pbkKwsmLUP0lV8/l6yv0jSWWLwSyppBJR6YVI/wRcEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfEvd5fSZY9n/93M6pV5hHZc9Q5ocVXkeajCNlWT79+aKpYHAi8GwKo1w3Sct8xU/OhTdep5zo+k7aziCi2+lZVVBMsaqOap5q6uq38wML3OX/qTgUwhCm8pR4vV+KAq6i/OZSQxRq3ZnWJVjugKaVfp7WG10uSLTbc1RZXtpWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HiEME9xo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HiEME9xo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853C31F000E9;
	Mon,  3 Aug 2026 11:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785757191;
	bh=7mG277IwTDuU9jDP1B3HQYmZCmxt5WQHuRVZmTlPIOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HiEME9xoLsMGmnuVU8cZT3w4ngJLhf7bw7SX8Unce9xsrZxTR5cPHOx07W2spmIY9
	 BnYE3itBSAdLYCFxAuo6CGwqen0a3tx/ICqbaIcnvIUGCAUcrcdWRFvwV1rLgIseHt
	 r7fyysVVl0iys+1QpNMegxo1/SIUAbcfN1q3MG8NGRZ0AGV+xdweRp1A++NOJI+FHl
	 87vDaHEEedVksN1CL3jErnknh0vha7wQoiR2o67Glgqo0pUUj8l+EyQQFYuADswHpZ
	 it5S3TLtaS9vr5hYEXndYPsI0bIlmj4xdkkGefNlS9ncVoI1A6bRjTrRhQBnOn8Reo
	 PtXodSQgVKn9g==
Date: Mon, 3 Aug 2026 13:39:48 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Paul Eggert <eggert@cs.ucla.edu>
Cc: Steve Summit <scs@eskimo.com>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, linux-man@vger.kernel.org
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <anB4niGGaJANJtGf@devuan>
References: <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
 <am5_uA4MSujYCS9X@devuan>
 <2026Aug02.0852.scs.0001@tanqueray.home>
 <am8_MfPmud43naU-@devuan>
 <2026Aug02.0945.scs.0002@tanqueray.home>
 <am9OEJxrIMFc15GZ@devuan>
 <8715af47-867c-417a-8ef5-7b4b7ceb2c31@cs.ucla.edu>
 <am-eAGL6OWqP9Yah@devuan>
 <c4d1d3f9-0c47-45aa-afa4-66dff49c1188@cs.ucla.edu>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="buaeuvfjbnuf72bo"
Content-Disposition: inline
In-Reply-To: <c4d1d3f9-0c47-45aa-afa4-66dff49c1188@cs.ucla.edu>


--buaeuvfjbnuf72bo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Paul Eggert <eggert@cs.ucla.edu>
Cc: Steve Summit <scs@eskimo.com>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, linux-man@vger.kernel.org
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <anB4niGGaJANJtGf@devuan>
References: <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
 <am5_uA4MSujYCS9X@devuan>
 <2026Aug02.0852.scs.0001@tanqueray.home>
 <am8_MfPmud43naU-@devuan>
 <2026Aug02.0945.scs.0002@tanqueray.home>
 <am9OEJxrIMFc15GZ@devuan>
 <8715af47-867c-417a-8ef5-7b4b7ceb2c31@cs.ucla.edu>
 <am-eAGL6OWqP9Yah@devuan>
 <c4d1d3f9-0c47-45aa-afa4-66dff49c1188@cs.ucla.edu>
MIME-Version: 1.0
In-Reply-To: <c4d1d3f9-0c47-45aa-afa4-66dff49c1188@cs.ucla.edu>

Hi Paul,

> Date: 2026-08-02 22:28:00-0500
> From: Paul Eggert <eggert@cs.ucla.edu>
>
> On 8/2/26 15:31, Alejandro Colomar wrote:
> > strncat(3) is for example useful for
> > implementing strndupa(3), which is quite useful (just like strndup(3))
> > if you use substrings or other fixed-width arrays.
> >=20
> > 	#define strndupa(s, n)  strncat(strcpy(alloca(n + 1), ""), s, n)
>=20
> That's a bad implementation of strndupa for several reasons. (Some reasons
> are: it evaluates n multiple times,

That can be solved with a local variable.  I didn't worry about it,
because I don't pass n++ to this thing.

> it overallocates stack space when
> strnlen (s, n) < n,

True; I agree that for glibc it makes sense to implement it with
memcpy(3).  However, for code that's not in a public library --and thus
can afford to be wasteful--, and must implement strndupa(3) to
workaround the fact that musl doesn't provide it, then I think the
simplicity of the strncat(3)-using implementation is worth it.

> it obviously has undefined behavior when n =3D=3D SIZE_MAX,

That's also true of n=3D=3D456789.  Anything not trivially small is already
UB with alloca(3).

> and it less obviously has undefined behavior because it uses alloca as the
> argument of a function call.)

Is this still an issue?  I thought we were past that limitation, but
I was actually concerned when I wrote that code.

The manual page does warn about this:

     On many systems alloca() cannot be used inside the list of
     arguments of a function call, because the stack space  re=E2=80=90
     served by alloca() would appear on the stack in the middle
     of the space for the function arguments.

But since it happens to work in all modern systems I've used, I thought
this was probably a thing of the past.  It would be good to be more
specific about this.  If you know which systems are affected, it'd be
interesting if you could send a patch for the alloca(3) manual page.

> Fixing its problems makes it obvious that
> strndupa should not be implemented via strncat; it's much saner to use
> memcpy. Which is why glibc does it that way.

Actually, I've just realized that the few uses of strndupa(3) that we
had in shadow-utils disappeared when we removed the logoutd(8) program
in the latest release; thus, we can get rid of our strndupa(3)
implementation.  We still use strndup(3), though.

We still have one direct use of strncat(3) which I've been wondering
whether we can get rid of, but every alternative I try seems to be worse
than strncat(3).

	/*
	 * is_my_tty -- determine if "tty" is the same TTY stdin is using
	 */
	static bool
	is_my_tty(const char tty[UTX_LINESIZE])
	{
		char  full_tty[STRLEN("/dev/") + UTX_LINESIZE + 1];
		char  my_tty[countof(full_tty)];

		stpcpy(full_tty, "");
		if (tty[0] !=3D '/')
			strcpy (full_tty, "/dev/");
		strncat(full_tty, tty, UTX_LINESIZE);

		if (ttyname_ra(STDIN_FILENO, my_tty) !=3D 0) {
			(void) puts (_("Unable to determine your tty name."));
			exit (EXIT_FAILURE);
		}

		return streq(full_tty, my_tty);
	}

If you think this could be improved with something else, it'd be
interesting to hear some advice.

> As for the glibc manual's wording in this area, I readily concede that the
> the wording should be toned down (calling programmers "lazy" is just
> counterproductive),

Thanks!

> but its technical aspects are pretty much on target.
> Although one might valiantly argue that strncat etc. are about substrings,
> that's not their original design, that's not what they're good at, and
> that's not what they're mostly used for. What they're designed for, and w=
hat
> they're good at, and what they're mostly used for is arbitrary truncation=
 of
> strings and string-like data,

I'm not so sure about the correctness of this claim.  I'd be interested
in learning more about its design, if anyone here knows about it.

Here's what I can read in the V7 sources:

	alx@devuan:~/src/unix/unix/v7$ grep -rn 'strncat('
	usr/src/cmd/dumpdir.c:153:			strncat(prefix, dir.d_name, sizeof(dir.d_name=
));
	usr/src/cmd/login.c:107:	strncat(homedir, pwd->pw_dir, sizeof(homedir)-6);
	usr/src/libc/gen/strncat.c:8:strncat(s1, s2, n)
	usr/man/man3/string.3:9:.B char *strncat(s1, s2, n)

There are exactly two calls in V7.

The dumpdir.c call is a perfect example of copying a nonstring
(a fixed-size null-padded character array, in this case) into a string
*without* truncation.

The login.c call indeed seems to be a use for truncation.

These are two very different uses, and it'd be interesting which one
came first, and why the other one was used later.

> something that goes against the GNU
> programming guidelines, and something that programmers should be warned
> against.

I agree.  I don't think the current documentation does warn against that
use correctly, though.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--buaeuvfjbnuf72bo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpwff4ACgkQ64mZXMKQ
wqmqAxAAl5MP4okc8Ck0ZxhojqCjDhFoazm3yLWiKdaNkOTdv/QL5MIR/rBcG9Ag
ZuivaA5zrJNZ57OEo4oxRgamT4wSFf2kmRRGMOKf/110bhu4+n6ZGYVK5SEX76O7
C2L96FHjuB+oZ2biOFG8ssIHAXOCvYhgxAUf8nmhRsn7VQVz1TfZrIiBV3Y2z/N3
9abF+hgvqqNWxeLwe01bZoQ9mWmFP3c6AjhQUJi9BjTXl9pOXsNXHIC0UG/sTEJP
nnfFDBTez8WQLYSmsmyn+wMORwOBTgrKva0bZlSp78Zl9c7yPVemvJZgk8uGrHoJ
fTw4g/9wBEh/WkgEvhPaHNHuG6WuQywLiaKh0aSSwwtvnJ1QaPYAJ/0+FUwwHaiG
s/LDcPSgiTabMtNbU1fLuAYikv8f9Y3wK9WHDTG3U52entFs853ue20A02FV2B9K
9m4+mMJ9jPECvRV+6Bb0WBD2OHNF4HMs/JkQBEMfZhxBCE0dGHcpPp/j9tnRm0O3
ZLsXdWWnzyOJO/0rX01WFKCUm/mtwRvCVOmqSrnOAnGZZS0NSy+ZDyHNa+HLdidg
WLTQigQ36s1wxgNOE/d6x7U14ZxCmWIA1dxSl7NB5ownm148e0aLwxqDseeq3ZON
IV6nD25xY10nSL/AYgncy07ITnVTDUWCh5WV7iuIDQYXGxcd7i8=
=vzta
-----END PGP SIGNATURE-----

--buaeuvfjbnuf72bo--
