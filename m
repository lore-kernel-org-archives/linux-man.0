Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E8B1FDE31
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 22:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785623935; cv=none; b=sQEMc8C72h2/6Z9FmCpYR888Sx32yBr+MCASlgtBiuYE4zI7UrwhVavxUDeko/H/CVz2oIwbcOpWCLdFNfLc028IGhWBhLkH8vAzBElyrmb1zFZWksLkqZCAf1e0SuEJQY/27LtYBS0wHMjaSxiorTx/7djknHPmr8adr2lzxG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785623935; c=relaxed/simple;
	bh=Xn3w8dhMv7IkBt1uA8LM96Z+dR1Vda+PYYL5D1nsq+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyrTijbtbTUr5Q+tWaWsn/qP/VW4cseW7mx5p3P7lMvX+LlLt3SJ+jYozaYCvzBVv62Fg2DQDC6s2t9wP0xlMo/Q8p+HYF77yxIXnvBLDW4tX7Gdl/ES7jizdS3AEx6+LLAlraXLzjbJhjSmvM0hjXSmBoObIF99yzrSfN4MTHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEU8pREe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEU8pREe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1CA1F00AC4;
	Sat,  1 Aug 2026 22:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785623934;
	bh=kufVK/bH76ok4vmQMbmz1OXR+OkV5pQ5X2zFwEHvr8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UEU8pREepuEJOg6ZnlcXrVmUWbPyuGpkkI6T0Xp4I2LSeqeaEJvPjerC1ItZlnTlj
	 q04bgH/0p27oOOdJ2qB6OTqyLRJ35hjET2eCp7ThFFkehEvY3SUhM3skA/BMWDclZU
	 HKScfkEdId9aNleNbvedd0gEWD7lDOSEHrAcBR7W2tQtD6JGhWmmm9BPu6+HvbBBkW
	 7/3HUSMOAo/mlP3UR1tfwEvwdxtIw2zmxaW+GFtsB7aBOAPoUtdejb3kO1FNx1meKl
	 AoqrR+iG7ZsAuII6WOXzR45VfUNO/I1/P2ox906d5jIxKK4GbVwTgioPtzF/MO9cnK
	 y0EiWr0BKhT4Q==
Date: Sun, 2 Aug 2026 00:38:48 +0200
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
Message-ID: <am50AM0bdufHa9W3@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <c5bad3a80de2feaf3838cb302eeaea1dcc4ba672.1785543779.git.alx@kernel.org>
 <3556566.BddDVKsqQX@cagnes>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kw6grenbbmggdcvq"
Content-Disposition: inline
In-Reply-To: <3556566.BddDVKsqQX@cagnes>


--kw6grenbbmggdcvq
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
Message-ID: <am50AM0bdufHa9W3@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <c5bad3a80de2feaf3838cb302eeaea1dcc4ba672.1785543779.git.alx@kernel.org>
 <3556566.BddDVKsqQX@cagnes>
MIME-Version: 1.0
In-Reply-To: <3556566.BddDVKsqQX@cagnes>

Hi Bruno!

> Date: 2026-08-02 00:22:34+0200
> From: Bruno Haible <bruno@clisp.org>
>
> Hi Alejandro,
>=20
> All proposed ISO C changes need to be evaluated according to (at least)
> these three dimensions:
>=20
>   * Benefit (for the community of C programmers),
>   * Cost of adoption (for the community of C programmers),
>   * Consistency.
>=20
> Your previous proposal "alx-0097r1 - <memory.h>, the legitimate header for
> memcpy(3) et al." evaluates like this, IMO:
>   * Benefit: Small.
>   * Cost of adoption: Huge
>     (there are more than 700000 references to memcpy() alone in Debian so=
urces
>     [1]).

There's literally no change.  The proposal includes this:

    7.28  String handling <string.h>
	@@ New subsection after title
	+7.28.<0+1>  General
	+1
	+	The header <string.h>
	+	includes the headers <memory.h> and <nonstring.h>.

Which means that <string.h> is still a valid provider of memcpy(3), and
thus absolutely no existing code breaks.

This is really a documentation change only.  libc implementations that
don't already have <memory.h> --i.e., Illumos gate, and gnulib, in the
POSIX-ish world-- will have to do some work, but users won't.

>   * Consistency: Reasonable (you have explained why strncpy is actually a=
 "mem"
>     function).
>=20
> This proposal [v2] is no longer for ISO C, but =E2=80=94 if you want to t=
each the
> community something by modifying the man pages =E2=80=94 needs to be eval=
uated according
> to the same criteria.
>   * Benefit: None.
>   * Cost of adoption: Moderate
>     (because these 5 functions are not frequently used).
>   * Consistency: Totally negative.
>       - memmem() is a generalization of memchr(), therefore it belongs in=
 the
>         same header file, namely <string.h>.
>       - memrchr() is an analogue to memchr(), therefore likewise it belon=
gs in
>         <string.h>.
>       - mempcpy() is a variant of memcpy(), therefore likewise it belongs=
 in
>         <string.h>.
>       - strndupa() is a variant of strndup() which is declared in <string=
=2Eh>,
>         therefore it belongs in <string.h> as well.

Indeed, I've decided to do the entire set of v1, except I'll add some
more text to NOTES documenting that <string.h> provides all of them too.

> Please do us the favour to evaluate your proposals according to these
> dimensions by yourself, before spreading them.

Sure!  Thanks!

> And, of course, for man page changes, consider the authoritative source.
> For example, memfrob() exists only in glibc [2], therefore its authoritat=
ive
> documentation is in the glibc manual [3], and it says "It is declared in
> string.h." The man pages MUST say the same thing.

Yes, in v3 (which I'll send soon), they'll say the same thing.  That is,
all the functions --standard or not-- will have text clarifying that the
functions are also provided in <string.h>.  This covers what glibc says.
What goes in the SYNOPSIS is something I'll diverge from glibc, but
that's fair game.

Thanks for the feedback!


Have a lovely night!
Alex

> Thanks.
>=20
>       Bruno
>=20
> [1] https://codesearch.debian.net/search?q=3D%5Cbmemcpy%5Cb&literal=3D0
> [2] https://gitweb.git.savannah.gnu.org/gitweb/?p=3Dgnulib/maint-tools.gi=
t;a=3Dtree;f=3Dplatforms/various-symlists
> [3] https://sourceware.org/glibc/manual/2.44/html_node/Obfuscating-Data.h=
tml
>=20
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--kw6grenbbmggdcvq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpudXIACgkQ64mZXMKQ
wqmonhAArBwO2n+317Rs9tx+nvfKf1RUtFW5Nk7gxsitQRRWjZOfCrbSqXmTVSji
18+rjA96XnlsGkMcCl0XbEZMBYAOMILkSJJQcTfGN8r0acDAnXsu4ThobLXOdWv6
b4GnuB5r8gd//Va7lhJ4Q71p0x6y4ypRRPUKq2DJYeFuUQ0fyHGNbPTiBd9iqYWC
gMkanStVq6VlxOWqD16rWfaYAiwaiZEywKELv6TfcexlCpYwueLVhTcrCW7w2CFL
iPsTxfOyRNE59ZEGREj7h1zrcOgtUJ15IQBhbdBvaSQYsvRa6sb1JqnTPAQz1kMl
Tvo0FvGZ7MrzPg3kXUBpHujME/gHT69FAWVyITMCGdqX2Y7ZS8Bp3Y5rOdrIC1UA
iJM7ZWygQojb2Cmhn3bs2bYdxBRvMULzY8C9YM/Ejh476Nqz9aXZleZK8CHKCxSO
UKTEYe2j/4i+Mf7QpRBo/YSeweO4wglIh5GaKaG+tt8dorPuIO8mgkk9YID+9x1q
k0SZaowOQhRixKQJuM8o/7VYGza8qEFHbpsEjdHZiQlcNLgRK57c8iNyb/KFs/Zu
zrZX95gAMDmhmNXK7J2+esp7Sc2wm4y88TvZs+8WjDhr5TJ+gy50qsih/2ZAqWPy
SpcZL9nokbPKqtIhg00X+gtCTaJN9ahy2MsGKeQRs4aJ1lPvFJc=
=1k0R
-----END PGP SIGNATURE-----

--kw6grenbbmggdcvq--
