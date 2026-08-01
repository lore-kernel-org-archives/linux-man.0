Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D6121ABD7
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 23:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785625824; cv=none; b=GRq1Nq7KocyDNGkzSlJvXC7da3iz0z+TK3QffOXML3PoshJJXGVVa7uIFVn3yTs39ZVy+Y8wQj5ZUnyTYMlMghxGUYOcvUxboDK1XMPcLif7c0FQEK78Itm3u4xJ0UlHB/1v5I4/IjU159PuiTuc50tTKEhEGeM6ZIKsDd9pgMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785625824; c=relaxed/simple;
	bh=ebDK5NRR0QZKrjWeiXMGDGmvO89Vd0++XGzoEo5Xqpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kznEyvy6CZZxZJlTXDNxHbZQ7lSu7OeEiV2xeoUeVcxOkqXxAthl3/LV6sEbata9cFHyxHpZ8kl8QxccEgJoYGa2xgGQAm6CejJa6wNN3lNN8oPnxCpk+meYbCcxzM23I2re2r3J0fXVEKBRxfyZKLzGaz+v7z9Qk3JwxTCQ/kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m6Taolnr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m6Taolnr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032241F00AC4;
	Sat,  1 Aug 2026 23:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785625823;
	bh=/0D1ac3W8eUTLkDKP5PiharPp0jlMgWPv3ZafRJuiJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m6TaolnrSQg3Nvu2a9N3wbbQ3yM9sxH6zP96yyWlsvVOlqD8xO7l4+Gv4a+pknjej
	 HJjlKBw25E7GsUiggJC1gk4zhB3vTXJc3HNBQoSQzz5lrTWVJ9MyVW1dqSI0IXopo1
	 tjdEzBjKLSjKOpG2Na9o87oxTK8lHiA9UNCBA1v1wjfVT1y9M1wHY4Z19R+8G5w0KS
	 L+1zg9niuNDpLAqp2DNBbaY5EVgJvv8G9oQQfNoKMw0Pu3ozQt3xu3+0nbKJAByzmd
	 ws/2fxLluX0+D1I49W3vGwn1j5IZ1tXy+ft/QwdQgKm6iXF2iFJCNQ7W903dKMoNSC
	 9WcwnyluitJ7A==
Date: Sun, 2 Aug 2026 01:10:17 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Bruno Haible <bruno@clisp.org>
Cc: linux-man@vger.kernel.org, Sam James <sam@gentoo.org>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Joseph Myers <josmyers@redhat.com>, 
	Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>, 
	Nevin Liber <nevin@cplusplusguy.com>, Collin Funk <collin.funk1@gmail.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	Serge Hallyn <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, Evgeny Grin <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: [PATCH v2] man/man3/mem*(): SYNOPSIS: Document non-standard
 mem*() functions as provided by <memory.h>
Message-ID: <am56ZBzNM5J07AUa@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <3556566.BddDVKsqQX@cagnes>
 <am50AM0bdufHa9W3@devuan>
 <15288158.RDIVbhacDa@cagnes>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o3bks3oxj25plxii"
Content-Disposition: inline
In-Reply-To: <15288158.RDIVbhacDa@cagnes>


--o3bks3oxj25plxii
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Bruno Haible <bruno@clisp.org>
Cc: linux-man@vger.kernel.org, Sam James <sam@gentoo.org>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Joseph Myers <josmyers@redhat.com>, 
	Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>, 
	Nevin Liber <nevin@cplusplusguy.com>, Collin Funk <collin.funk1@gmail.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	Serge Hallyn <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, Evgeny Grin <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: [PATCH v2] man/man3/mem*(): SYNOPSIS: Document non-standard
 mem*() functions as provided by <memory.h>
Message-ID: <am56ZBzNM5J07AUa@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <3556566.BddDVKsqQX@cagnes>
 <am50AM0bdufHa9W3@devuan>
 <15288158.RDIVbhacDa@cagnes>
MIME-Version: 1.0
In-Reply-To: <15288158.RDIVbhacDa@cagnes>

Hi Bruno,

> Date: 2026-08-02 00:55:46+0200
> From: Bruno Haible <bruno@clisp.org>
>
[...]
> > Which means that <string.h> is still a valid provider of memcpy(3), and
> > thus absolutely no existing code breaks.
>=20
> Still, for the next 10 years, C programmers would debate whether they sho=
uld
> #include <string.h> or #include <memory.h>. Different C programmers in the
> same team will have different personal opinions. Thus, programmer team le=
ads
> will have to establish coding styles/guidelines which say which header to
> include in this case.

I find that an acceptable result.  #include's aren't that important.
When reading code, the section of #include's is unimportant as long as
it works.

I don't expect existing code to change, so this is a matter of what will
happen in new files, or when a file is changed to newly use such a
function.

Among the stylistic discussions that can happen, this is the least of
our concerns.  Also, if this triggers a discussion of _why_ this
changed, we might have achieved something.

> This is one of the challenges of language design: Each time the language
> offers several nearly equivalent ways of doing the same thing, different
> coding styles and the need for team guidelines are the consequence.
> C++ is particularly affected by this; Go hardly. Pushing C to become
> like C++, in this respect, would not be a good move.

We have precedent in <stdint.h> and <inttypes.h>.  The world hasn't
fallen over our heads so far.  :)

Actually, <stdint.h> is just the tip of the ideberg.  size_t is provided
by 27 headers, if I counted well.  And there's plenty of such examples.
Another curious one is that there's something that's specified by ISO C
to be defined in <time.h>, and by POSIX to be defined by <sys/time.h>.
I don't remember what it was, but it was funny when I found out.

I've been involved for a few years in iwyu(1), contributing code for
dealing with the standard includes from libc, and while we had our share
of discussion of which headers are preferred for each symbol (we're some
pedants, of course), I've never heard that such discussions reached the
general public.  The general public just wants a tool that says which
are the right headers, and go with it.

> The cost of adoption for this proposal is thus still big.
>=20
> > > And, of course, for man page changes, consider the authoritative sour=
ce.
> > > For example, memfrob() exists only in glibc [2], therefore its author=
itative
> > > documentation is in the glibc manual [3], and it says "It is declared=
 in
> > > string.h." The man pages MUST say the same thing.
> >=20
> > Yes, in v3 (which I'll send soon), they'll say the same thing.  That is,
> > all the functions --standard or not-- will have text clarifying that the
> > functions are also provided in <string.h>.  This covers what glibc says.
> > What goes in the SYNOPSIS is something I'll diverge from glibc, but
> > that's fair game.
>=20
> I don't agree with you that it's "fair game". The SYNOPSIS is the first
> eye-catcher, often the only part that a programmer reads. It would be a
> disgrace if the man page, in the SYNOPSIS, mentions a different header th=
an
> the authoritative source.

Some would question the fact that the glibc manual is the authoritative
source for glibc documentation.  :)

> Bruno


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--o3bks3oxj25plxii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpufNQACgkQ64mZXMKQ
wqnO6Q/+JcNAwkwO1RUrLetJApHKj8yMx77iqYI/j+I82j4Leze3rH5NVXKBT9Ay
TzwKn2MetoxEfpj5sniCdhzJvUFx9LqfauRwxHsSZxdv26gpov5In7icc/Zh1TLf
Julfkgj1cOG187knEbzcnrXjza8tn8W0g6llrhW8lJrQk/U9zwlnZ7UnMiKu9Uul
bYsvUr+DckY7R833WOL7nfj0r4+ExgluiTLel4b3aC9+PYFr6+fs6/Ech6Mqh0Gv
OKdl8nou947dMnipA/wPmT+xjLe3lEy7iLKENl7Xnr1sfcSJ3+UtDkatoj9AEjyr
YAFswshWWnNSIzjFD0CD2kX1glmPN2yGqnCjR1tWMaWKvjrXDhLa3SLaj5Qm8w6q
AFUXdOCkCz84svPUlfwLDAN9yrsoUjiVMD1IJBL8Xfo9NZHik1018lq0QaoK6DvM
FjsHwbiss0qs6raPW6PemnyV3h7ayBnhYeFuTzrGwDSSrrkK+ixvSw417CpzX5LA
l/JqOmwCu+zWWyWVkmxbOaEvuuOxq9vD0Ta7tuypw8LIuX7rQkA5AgsLxfBvE+6E
6mfThecvmLyHqhfK8hDkwe5HTBDbdSHLUCVvoxHgof7O2kSN6cn91OpzSv/jXAPT
zP3dLCIIctuIMBhYTXsnkqe3+u2tgi8ufjuLpYR04hoMrfB6bE0=
=6LVP
-----END PGP SIGNATURE-----

--o3bks3oxj25plxii--
