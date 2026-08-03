Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF7627707
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 00:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785718037; cv=none; b=u4Ml/H6vK4hQg9eJ+JwhaosZK1bimUXmb4HvqzG80JK2xjcFuIePCZbnkUof2C7AZfFBZPAMPsHCtl3lVDjp1szWorBA3GvE6PhwVLw2/SIgrM5xjbThI7HDDFcoK7LFDpg6fQej/MQRp5hwH71Tpo7KsfJOj0KYW+Gaask9VQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785718037; c=relaxed/simple;
	bh=+sjR/vxEbdrkGPnHOt5gz2FnPBgHGTgcfhvFzru3VX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKZF1abnrbdLfepD+MrRrXCikzKYJ4sG+iqgRZj1u4A98SikZEWEWkO/XohlEbebVqYMjgfIOR80wFZemZZ/fwX3oE4/DlO+RuPbDzHVauKJmk/XX9MF6NtZDvKZ0Db0UNyMrXmTaxTIK3fupPe+A9SDb1S3Xr6F7SweH4m7K2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f42KWdkI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f42KWdkI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF3F1F000E9;
	Mon,  3 Aug 2026 00:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785718035;
	bh=ufDE8vOKWgI7x4Cc+57aDfMrv/CRClvUFN/6GI2MrzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f42KWdkIYpLtMPHSXhThcKu4paGcxppL2gN3S26UZ9PGh/wJzNq4av6R+gAzIHtDU
	 GvsnbisQFBZsPesF1CqK6yAR/IPl6U2JAUy2RhqgOaQjjNCPstqWtQcptLltmI2Wxo
	 XDrBwlkpKZHV4JufVNv7XTjPQfFPmSGmwQkKbDjkeoe7Ut/uwL92jDQtLV2SUZ3CNH
	 dZuGs70/7lja9k1itKpvWIKbbYpw3ESnz7S6FDqj7Pz35c+ka9NgtqKLtPGw3lo7Kf
	 Nx5arK5cgX6QykqBmSKm4Fx9TBgTWR5DsNQzi2KxcABvWRS1BeoedaOT5vgEoLRMoy
	 /LblwMWRSRg/w==
Date: Mon, 3 Aug 2026 02:47:12 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Keith Bostic <keith@bostic.com>, linux-man@vger.kernel.org
Subject: Re: proposed revision to memory.h(3head)
Message-ID: <am_jYJL6uAapMGXN@devuan>
References: <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
 <am5_uA4MSujYCS9X@devuan>
 <20260801235332.vc443gozbqkqdqm5@illithid>
 <am6HTtAMkEEkWjfl@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uxz2sa7qo366benp"
Content-Disposition: inline
In-Reply-To: <am6HTtAMkEEkWjfl@devuan>


--uxz2sa7qo366benp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Keith Bostic <keith@bostic.com>, linux-man@vger.kernel.org
Subject: Re: proposed revision to memory.h(3head)
Message-ID: <am_jYJL6uAapMGXN@devuan>
References: <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
 <am5_uA4MSujYCS9X@devuan>
 <20260801235332.vc443gozbqkqdqm5@illithid>
 <am6HTtAMkEEkWjfl@devuan>
MIME-Version: 1.0
In-Reply-To: <am6HTtAMkEEkWjfl@devuan>

[CC trimmed]

Hi Branden,

> Date: 2026-08-02 02:27:44+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> > Date: 2026-08-01 18:53:32-0500
> > From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
> >

[...]

> > If you like the foregoing, consider it:
> >=20
> > Signed-off-by: G. Branden Robinson <g.branden.robinson@gmail.com>
>=20
> I'll probably modify it and note it as
>=20
> 	Suggested-by: ...

The final memory.h(3head) manual page is here.  It contains a mix of
your text and Keith's text.

	memory.h(3head)                                 memory.h(3head)

	NAME
	     memory.h - memory operations

	LIBRARY
	     Standard C library (libc, -lc)

	SYNOPSIS
	     #include <memory.h>

	DESCRIPTION
	   Write
	     bzero(3)
	     memset(3)

	   Copy
	     memmove(3)
	     memcpy(3)
	     mempcpy(3)
	     memccpy(3)
	     strncpy(3)

	   Catenate
	     strncat(3)

	   Duplicate
	     strndup(3)
	     strndupa(3)

	   Compare
	     memcmp(3)
	     strncmp(3)
	     strncasecmp(3)

	   Search
	     memchr(3)
	     memrchr(3)
	     memmem(3)

	STANDARDS
	     BSD.

	     These functions are also provided in <string.h>, as speci=E2=80=90
	     fied  by ISO C.  This is a historic mistake maintained for
	     compatibility reasons.  Don=E2=80=99t let  that  fool  you;  these
	     functions don=E2=80=99t necessarily operate on strings.

	HISTORY
	     SVr1, 4.3BSD.

	     System  V  (1983)  introduced an initial set of mem* func=E2=80=90
	     tions in a <memory.h> header file.  4.3BSD (1986)  adopted
	     them.

	     C89 didn=E2=80=99t standardize this header file (without providing
	     any  motivation  or mentions in the documented rationale),
	     and instead crammed all these functions in <string.h>, re=E2=80=90
	     sulting in confusing programmers about the real purpose of
	     these functions.

	     Most C libraries, including the  BSDs,  glibc,  and  musl,
	     provide <memory.h>.

	     Illumos  and  gnulib don=E2=80=99t provide it, though, and instead
	     use <string.h>.

	SEE ALSO
	     string(3), string_copying(7)

	Linux man=E2=80=90pages 6.18=E2=80=9018... 2026=E2=80=9008=E2=80=9003     =
      memory.h(3head)

You can already get it through git, so if you want to make any specific
changes, please send a patch.

The specific pages (e.g., memcpy(3)) have also been updated.  I believe
the pages now reflect carefully both what the standard says, and the
more reasonable include, while also clearly pointing to this page where
the full story is detailed, for those who wonder, so that they don't
have to wonder and ask.

A sample here:

	SYNOPSIS
	     #include <memory.h>  // See STANDARDS

	     void *memcpy(size_t n;
			  void dest[restrict n], const void src[restrict n],
			  size_t n);

	STANDARDS
	     C11, POSIX.1=E2=80=902008.

	     ISO C and POSIX declare this function in  <string.h>;  see
	     memory.h(3head).

The commit message attributes the text to both of you.

	commit 44d6d3bbace4c5a459efb181bcd264b93a655698
	Author: Alejandro Colomar <alx@kernel.org>
	Date:   2026-08-02 01:20:46 +0200

	    man/man3head/memory.h.3: STANDARDS, HISTORY: Document some history abo=
ut <string.h> and <memory.h>
	   =20
	    This text is an adaptation of text suggested by Keith and Branden.
	   =20
	    Suggested-by: Keith Bostic <keith@bostic.com>
	    Suggested-by: "G. Branden Robinson" <g.branden.robinson@gmail.com>
	    Cc: Sam James <sam@gentoo.org>
	    Cc: Joseph Myers <josmyers@redhat.com>
	    Cc: Mark Harris <mark.hsj@gmail.com>
	    Cc: Nevin Liber <nevin@cplusplusguy.com>
	    Cc: Collin Funk <collin.funk1@gmail.com>
	    Cc: JeanHeyd Meneide <phdofthehouse@gmail.com>
	    Cc: Christopher Bazley <chris.bazley.wg14@gmail.com>
	    Cc: Bruno Haible <bruno@clisp.org>
	    Cc: Paul Eggert <eggert@cs.ucla.edu>
	    Cc: Serge Hallyn <serge@hallyn.com>
	    Cc: Iker Pedrosa <ipedrosa@redhat.com>
	    Cc: Evgeny Grin <k2k@drgrin.dev>
	    Cc: Kees Cook <keescook@chromium.org>
	    Cc: Steve Summit <scs@eskimo.com>
	    Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>
	    Cc: Arsen Arsenovi=C4=87 <arsen@aarsen.me>
	    Cc: bug-gnulib@gnu.org
	    Cc: libc-alpha@sourceware.org
	    Signed-off-by: Alejandro Colomar <alx@kernel.org>



Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--uxz2sa7qo366benp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpv5QoACgkQ64mZXMKQ
wqmZQg/9GsUr/C6E36IBium5jLQ5ePEdkhp2fQULtx7I6Eh/OL1CN8Qz6KmdD9Ok
yjAzdLBrQmIC+72I6ct5QxyLJU0TUZLqeyHfS1yV3r00ybHe82ZNRSXeXUwnaiKP
5+AKgEGpiwKRlJ82GTX2jxKS2Sk4NqBI8tTOT+KynkNKql6SjOkPgIAYr+YPyAkc
JJ8GO9IskMcI4gt41Pb6uk9nSDt9MTr7s9sH703jglDRmVdRHQAS97XTg9KzEPVL
udI2E0sx8NnLVMfup6JJXEaA7Hj59oNWTO/zq9tf/E+rUcrXSigylxg8pam7swEf
uL7fD7pm6cw1t38xXEBDeLHFebVgq9l/FuUTxpwCzDFs1iSkFwME/QHFNfe0kfgY
zUcVwGLHnwpngBF/n+LleVXEIKVdvH1bzbVMDtbEVuXu4JUiuecrwFM+tcNjq5Lo
oTuVd+UCSH1Lh1HzSKuJUvzzyoY3qAR5H5OYvbB1c9lnc9owZjtIzd3fyUPIXswO
g37bDMSBvepCuOcnOuRK7+eMFsMsC1obB3LOb+70CKFVDZTXrK+7z2mfiMgPw7dD
nJv0qITcmfdWzfVi5L6f5WGYSWaX2SIy1x35Aw1LVY1UEW0TlSW+vlPSf2wLGStE
rzJgHv003zhTaWuhfhfaAV4Aq5kVRhv2TNJCfnx9weki3TtrLCA=
=Gyzs
-----END PGP SIGNATURE-----

--uxz2sa7qo366benp--
