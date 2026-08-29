Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C19E33FE05
	for <linux-man@vger.kernel.org>; Sat, 29 Aug 2026 08:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787992935; cv=none; b=V2Skq+wOOtNePeNXy09zubJbSKAc+BzPE2YdGiDI7v7BfDX1EQHAr3QqUMlSJANur7h4LXYo5nmUUzSGFsuIMIY6Z/o6WjLC/7vosbs2wmde2TNHhM3PLQaa9uzgaw/jqHcxq+P7L4viim93r3JU2XYahgc/sEDgA4IqLpslewc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787992935; c=relaxed/simple;
	bh=N5JVZKyf86oCyTU0u1vwA6CZQHiEPpuv5g3tGud9Hik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oC4mWRaXlu0JlWRsfcDNxyRjWF/YCL3QMHX5xOnaAfwBsINH6X/6LFbAIhVxx3Kxf6bNk4PaeMw2SPgffyot+XM/tVb7OXEAoFFPEVsJhEli8h82yLI/N9sFzDmlZx9wwK4Lu3uYVqVhMieRDidruVNR3a66Gwx1/EziiKy/FPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9YASKrg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9YASKrg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578F11F000E9;
	Sat, 29 Aug 2026 08:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787992934;
	bh=5fBUhhMKKUFzJsBoPn17HdMmkMnyO9M5S54e/UM3X/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U9YASKrgpjObfthTvRYZzla0Njrkoc12vQeKZFFSDP9MCBJtXsT/abMCIVBtB88aK
	 fx2tDufkS8Gd8z4Nl+hohklyGqk44vnNlC00eVOsqBVzNk/PtSUg8mWMsvJX4HYvZh
	 o8bc2c70AMD+7WSJ3JjJOVIh1OSvIRgxT8OOWMgd2djEHeANkakprGtfz8A9bRkFod
	 JM9iyhvX9aaBBS8kUZIz4p5EhE9fQieLRzTvc+EGU20DWnsk7xAerTQyA+caAvbeJd
	 h83Oy2XrNaWk2m7RA+C8fGKiVf2aEQdZj5ehYAtELJL42m9aDPCI6U0VBilGSHKnnL
	 S+ZRwogd5+mdw==
Date: Sat, 29 Aug 2026 10:42:10 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Larry Kollar <larry.kollar@icloud.com>
Cc: Groff <groff@gnu.org>, linux-man@vger.kernel.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <apKYVACSvXx2pcGw@devuan>
References: <xn33wr3rr8.fsf@greed.delorie.com>
 <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <8DE76435-CBDB-42D6-9E0F-9E27291560B6@icloud.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bhsswpjzedzrzjr2"
Content-Disposition: inline
In-Reply-To: <8DE76435-CBDB-42D6-9E0F-9E27291560B6@icloud.com>


--bhsswpjzedzrzjr2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Larry Kollar <larry.kollar@icloud.com>
Cc: Groff <groff@gnu.org>, linux-man@vger.kernel.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <apKYVACSvXx2pcGw@devuan>
References: <xn33wr3rr8.fsf@greed.delorie.com>
 <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <8DE76435-CBDB-42D6-9E0F-9E27291560B6@icloud.com>
MIME-Version: 1.0
In-Reply-To: <8DE76435-CBDB-42D6-9E0F-9E27291560B6@icloud.com>

Hi Larry,

> Date: 2026-08-28 22:50:50-0400
> From: Larry Kollar <larry.kollar@icloud.com>
>
>=20
> Alejandro Colomar <alx@kernel.org> wrote:
>=20
> > I believe that a set of makefiles that would handle all of the targets
> > of a project like groff wouldn't take much more than that.  It might be
> > a few hundred kB.  If it's well organized, it can be maintainable.
> >=20
> > Because the makefile language is so simple, bugs are easy to spot and
> > fix, compared to autotools (possibly automake, but I can't distinguish
> > them enough).
>=20
> I don=E2=80=99t know. Can a Makefile check for the presence of certain li=
braries
> or other apps and fail gracefully (by which I mean exiting with a message
> like =E2=80=9CYou need app X, plus libraries Y and Z, installed to succes=
sfully
> compile this.=E2=80=9D)? That=E2=80=99s one of the things that =E2=80=9Cm=
akes" me appreciate taking
> that extra step of typing `.configure` before make.

Yes, it can.  Here's a trivial test for that:

	alx@devuan:~/tmp/testlib$ cat Makefile=20
	HAS_LIBFOO :=3D $(shell find /usr/include/foo.h >/dev/null && echo yes || =
echo no)

	ifeq ($(HAS_LIBFOO),no)
	  $(error You need library FOO installed to successfully compile this.)
	endif

	all:
		echo Done
	alx@devuan:~/tmp/testlib$ make
	find: =E2=80=98/usr/include/foo.h=E2=80=99: No such file or directory
	Makefile:4: *** You need library FOO installed to successfully compile thi=
s..  Stop.

You may of course write more complex tests if you need.  Anything that
you can do with a shell script, you can do it with a Makefile.

That said, I personally prefer to fail compilation due to missing header
files.  It's simpler, and there's not much difference.  After all, if
compilation fails for <foo.h>, it's trivial to run

	$ apt-file find /include/foo.h

But if you want the test, you can have it.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--bhsswpjzedzrzjr2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqSm1YACgkQ64mZXMKQ
wqnpGBAAuJjtPTYpLkI8SSG/hFFcyLKUPHi8fvkTNP+30PDNqo6o4Uo+4duhb8k0
ilkIC00O+tdb5Ch/5rBRQb5eUS06ndQ9rrzP7oC1sbT8Kp9mVRiyakhFOjNYG6cB
sOa6thWrssdiLbU2KNT/FoPajv0ElxXBp6ARkh67PAlHYfh+0/fDUs8yhyJHYhKj
vb9wBRjOvsdZvtSyFqRVF1s3ccRf1V9MsB3AAgo4rIlXaj08xC0j7e3IijJ1CKsI
jHLswpadPNfXQ86wGXImlXYE3XNL/uXK4MBsV+5dABX63zFrOPT09nZoCciAfZMa
aE0EY36oi0k+ZIs5/Zy2GfGTzLFaa2IK+YKOWr7llLLYRCgOS32C1/FK9/75Nu2c
EHRqbdb+0RCYMKtMxSychvKt8rPe6Cn2k1ElxkTWb1FEbra+CHXwNqB1XAbHSYkk
ahbj1iegscnVO00Yr86WPUj/iaRTUq9MXP0Phfiim8/PDhsYCw54U9NsK2CQVGIU
qQ8VhvL/BzgLUstYXVcrvnNNhlKYsmo2i/gH4DyMmjfpyKA/KW9AMSY4SJZQjOI/
XwKEKl5WyelKL7UpbIGs1IZ4JpMyhRbAyfKf68W2lHskhbeHw65P5u/GFfq4XBy5
2Q2d0wINHRxn8MQc3yzWdZh4mm6R/mjiveUxE2f1aWgeQ0y+9XY=
=nx0K
-----END PGP SIGNATURE-----

--bhsswpjzedzrzjr2--
