Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E280B345EA3
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 22:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535549; cv=none; b=s8YJsOqVgs94lmqOvAUMC6DT3W/fuxtfZFLwy/MS08h+miP4SxZrrk8Bm7PGaBqAKyyiibF1jQA/m0yU7YxiV9N8VNnK63+H/43Sd6858APE7L1UZOZqM97u7wYP9ynC76MFY2i7PUQq0mBv5SekFaVaK9obF6cyxoZsvAG/4dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535549; c=relaxed/simple;
	bh=etUK9+rOxgr/+BYGxNgoLxs/jA0XS1xgYGApdycMncI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWtIElxJZIsfAmRy7VGZqV3EMJGW58UQi1tyFtk5bwJ7YejmHlxTRq2YEh2smsGUVMmGdGXgzhIOSobyNq+r5mXDPiJf8Rt901Nk3aIosGdg1ljnJPk48YFZKj/L/UA3nOnM+IOlkNkWEfIiGISSeQF2P6EEy2MJNIKpn5eThY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IeUPHbvJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IeUPHbvJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4617F1F00AC4;
	Fri, 31 Jul 2026 22:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535548;
	bh=7EVlHXG+SSIyQJBwaiaTNznKPo9xJeUpO69TCEdKP9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IeUPHbvJAFwUWBbV76mv9gSoNPJunuIqQUUxTW9yjcxUSnWweDtqI+cDhqY3kQWiW
	 tUAaZPoJ2EcKDF4zAXHmWIyUBxsm9slwERzcLGIYP0itj7tytxf2bmcMvA+Fw1IwOg
	 aavZ16tK2mwmN9PPomj48uXXJTjYqlqeR6oJZXjP7U7gK8bK3o7iGaoJwCBe2i5TSQ
	 8GwASZqDcBMUFz5GMKbNgbiemk5FOuKffpEmC0eM2FuCwHJW4JBF/CFWYxcBr8M8vm
	 me03nByBcxquNvBkxiucl5fnDAPrcEKvFj4Z414yh94cEc+sKhGEG9nOlkaQENckIj
	 INqrBGTBrK3Xg==
Date: Sat, 1 Aug 2026 00:05:44 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
Message-ID: <am0ax4Oe6--0Deco@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f7tgyx7qgfaazlmg"
Content-Disposition: inline
In-Reply-To: <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>


--f7tgyx7qgfaazlmg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
Message-ID: <am0ax4Oe6--0Deco@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>

Hi Joseph,

> Date: 2026-07-31 21:23:35+0000
> From: Joseph Myers <josmyers@redhat.com>
>
> I think it's irresponsible to use the man-pages project to promote=20
> personal idiosyncratic ideas like this in preference to what's been the=
=20
> standard location of functions since 1989.

That's 37 years.  During these 37 years we have gathered a lot of
experience and data about this.  And the conclusion is that it was
a huge mistake.  Programmers have struggled to understand this, and
continue struggling.  This is not about new programmers.  This includes
programmers that have been around for decades, including maintainers of
core projects in which we all rely.

The move from <memory.h> to <string.h> seems to be entirely unjustified,
and was unilateral by the C Committee for C89 (from what I can see).

It's easy to see that all these problems about string handling would
probably be significantly less if these functions had never been
moved to <string.h>.

I agree that changing stuff that has been unchanged for decades should
usually be avoided, be done very carefully, and with strong
justification.  But in this case, it's justified, and doesn't break any
existing or new code, because <memory.h> has been provided since
forever.


Cheers,
Alex

>=20
> I'd rather we add a mandatory deprecation warning to memory.h in glibc.
>=20
> --=20
> Joseph S. Myers
> josmyers@redhat.com
>=20

--=20
<https://www.alejandro-colomar.es>

--f7tgyx7qgfaazlmg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmptHDIACgkQ64mZXMKQ
wqlIAA/7Blspp8+mnmaz85el3KSqOojhRfQh5JxWsjuibML1fokyEUo/Ligil7o/
fqF6G3Grfxa/PIxHbPf5THvxgeHi3ONX7LMVL6sTD3ta6gj7JYgGa+cqphA7qwV6
01KZykKshmfQJmyDs+IN/Uyb827KojN07o02BogGR3ZDlMWSDIDcXlEt1tRe8h8x
7wgGYALC+dDD4ZWRbCyVvOKqi1QciZLZ78azqU4oXL0V3MT2Nt2lWG7ow3O2fBOu
eDtZVtOVvDWJiXRLSv1/1fp9w/mMqchtfTFulpoNE5SOsvoUwRcVXb6K5YxhxAQO
MdfJIjBB9Qc0OrDAdG5Zlbj9NetiS8cvM9WxNS1y3vmRSjjjgTAzCfnNjoSTHaXK
JDSdDJhwlx/jF5SYRFneJdomYEfUyUjU8hya9ETEE74/qOKCw8fpWzZZEBy/cEyV
ufRPqtbL/sV67rQ0D+KoUJPjkbyUOTO0gRVNm+lqfWuToOQPUw55rIC8VwixEVxc
ylfUGguVPYFOoM3DIC3nHFwDI22zdUuAAhlhatyLOPNoJrXdbAeJ8oG6nMp3eSS5
agvyvI+T6F6P0unyEx9sSKo3aXq/GW05IaenMdSLXyKZvHgVtR0F6kKK7DERBevv
1aIBWj55hNr41peHWnG152hmZeGqYN7W8QhSjFQPIVZZo+Cs+Vs=
=A4iY
-----END PGP SIGNATURE-----

--f7tgyx7qgfaazlmg--
