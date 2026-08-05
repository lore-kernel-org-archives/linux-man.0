Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5A8360ECF
	for <linux-man@vger.kernel.org>; Wed,  5 Aug 2026 14:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785939314; cv=none; b=ivXtvzXU6acSt6qgnk/vpLijOZ0qca7anWD8EZyxIv/Zpgh4Xnpvzu5eRrrGIOQLZoRyEyOkJJLlFDHLl7ZoVkd9M/tEtOhzU4mA8rxSLBPbMic5bLNzhz7tkxwdu9+A19gJLdCqH+RCIId0z+EGVgq1oF12gC1/AJdafsPvHiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785939314; c=relaxed/simple;
	bh=tdExyDOnYzWEwk8XmHwyN+83sTDFbMSJd2JOh2sUpFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Itg1D8CPNxuee/Y9WUy+rX5YcPc6Zv+ZFsBccra2MofZY2fCRA4tQ3e9oXsDu25ECffgFvkaU99ib+CsUPL5trA3xcro3Mqtr2WY78Aqka1owQWMTAz4JLo+BW9ZhVc0mq/JOLtnKF3PZRrnpy2ovgBJ+u1MpevTtN4w8+jSqMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+rQVpYO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+rQVpYO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730701F000E9;
	Wed,  5 Aug 2026 14:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785939312;
	bh=+lqFVuyHsAnHcRwykq4OnnJPNch3pjy/rubS7hi1IUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A+rQVpYOKjN9brathxP2pwBSEpFxubR8wLpuDD7Iie/uDWoRMDqQJrIAtkDyeB9CR
	 xic1cZZwLa9pw4lWgbDz6U+o60GndpX+2PplbRcYX9LqshDs+/jVtgVHxiXHAGnmK6
	 bq2pYW7ldGE/08KiZosNJ6aNbMHJd3LZSvUnkY3oU+uLkuX9lsIxHpjnCe2kAH8T8Y
	 bkz+N5bHGrovKq3qp0XRDS1VqXRMDNpdYJLqKpqubbufX7BDyI+vAR4maFB6gbXtfg
	 VAM11sYaOMav+83UWeWCpADrRwBFt7ZIO9uXyFPiD0lhBfmGBnXemYXU0hp8AvtaLH
	 Dmttzgz0RxF3g==
Date: Wed, 5 Aug 2026 16:15:07 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>
Cc: Collin Funk <collin.funk1@gmail.com>, Sam James <sam@gentoo.org>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: The goal of the Linux man-pages project
Message-ID: <anNBLjQj8-Eg1TUf@devuan>
References: <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <87h5lb9u8d.fsf@gentoo.org>
 <8733wusj68.fsf@gmail.com>
 <anHVx-xWLmL7SPyM@devuan>
 <8633wtnaw8.fsf@aarsen.me>
 <anIaZ8X_73ZjmYtR@devuan>
 <865x1ohq1s.fsf@aarsen.me>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fy2epkflwppah6nc"
Content-Disposition: inline
In-Reply-To: <865x1ohq1s.fsf@aarsen.me>


--fy2epkflwppah6nc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>
Cc: Collin Funk <collin.funk1@gmail.com>, Sam James <sam@gentoo.org>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: The goal of the Linux man-pages project
Message-ID: <anNBLjQj8-Eg1TUf@devuan>
References: <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <87h5lb9u8d.fsf@gentoo.org>
 <8733wusj68.fsf@gmail.com>
 <anHVx-xWLmL7SPyM@devuan>
 <8633wtnaw8.fsf@aarsen.me>
 <anIaZ8X_73ZjmYtR@devuan>
 <865x1ohq1s.fsf@aarsen.me>
MIME-Version: 1.0
In-Reply-To: <865x1ohq1s.fsf@aarsen.me>

Hi Arsen,

> Date: 2026-08-05 11:31:11+0200
> From: Arsen Arsenovi=C4=87 <arsen@aarsen.me>
>
> Hi Alex,
>=20
> Alejandro Colomar <alx@kernel.org> writes:
>=20
> >> >     man/man3/: Put first <string.h> in SYNOPSIS, then comment about =
<memory.h>
> >> >    =20
> >> >     This is a compromise between the fact that <string.h> is the sta=
ndard
> >> >     header and (only slightly) most portable header file for these
> >> >     functions, while hinting at the fact that it might be more appro=
priate
> >> >     to use <memory.h> where possible.
> >> >    =20
> >> >     Remove the STANDARDS and NOTES about this, since now the SYNOPSIS
> >> >     contains all the necessary information.  The extra info is in
> >> >     memory.h(3head), which is linked to in the SYNOPSIS.
> >> >
> >> > What do you think?
> >>=20
> >> Why, though?
> >
> > To help guide programmers to understand these APIs, and consequentially
> > be able to write better code.  That's the goal of this project.  It's
> > the Linux Programmer's Manual, and its purpose is that programmers on
> > a Linux system are able to write correct programs.
>=20
> First of, this doesn't answer the question I asked.  Why should this
> change, even the "compromise", be done?
>=20
> But, ignoring that this doesn't answer the question posed, how exactly
> is hinting that it's "more appropriate to use <memory.h> where possible"
> accomplishing the goals of the project you've stated there?
>=20
> It seems to me to just sow confusion.
>=20
> I think the references to <memory.h> should be confined to a single page
> that documents what it is, memory.h(3head) or whatever, which should be
> honest and say only:
>=20
>   <memory.h> is an obsolete header.  It exists for compatibility with
>   older programs, and is implemented as an alias of <string.h>.
>=20
> This makes it clear that the header is never useful, and that it's
> strictly redundant with <string.h>, in a way that still lets someone
> reading old code discover it.

You've convinced me to further reduce the change.  I've removed any
explicit suggestions in the functions' pages about including <memory.h>.
They're not necessary for the purpose they were meant for.  Here's how
memcpy(3) looks like now:

	SYNOPSIS
	     #include <string.h>  // see memory.h(3head)

	     void *memcpy(size_t n;
			  void dest[restrict n], const void src[restrict n],
			  size_t n);

The only reference is a comment to read the memory.h(3head) manual page,
as it contains historic details that are relevant about this header
file.  The fact that <string.h> is the only header file included, and
there no "or ...", clearly says that programmers should include
<string.h>.

We (or at least I) still want to clarify --already at the point where
<string.h> is used-- that <string.h> is the right header for this
function as a result of a historical mistake --which we can't solve at
this point in time, but it still is an (ossified) mistake--.

This should accomplish the fundamental objective of this change, which
is to clarify users that these functions are not strictly string APIs
(even if they might be used for strings, in some cases, and with great
 care).  The pure string APIs don't have this comment, as they naturally
belong in <string.h>.

The <memory.h> manual page is now the only place that documents an
'#include <memory.h>', for obvious reasons, and tells a detailed history
of why things happened as they happened.

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

	VERSIONS
	     In  some systems (Illumos), <memory.h> contains only a few
	     of these functions, and thus <string.h> is needed.

	STANDARDS
	     BSD.

	     These functions are also provided in <string.h>, as speci=E2=80=90
	     fied by ISO C.  This is a historic mistake maintained  for
	     compatibility  reasons.   Don=E2=80=99t  let  that fool you; these
	     functions don=E2=80=99t necessarily operate on strings.

	HISTORY
	     SVr1, 4.3BSD.

	     System V (1983) introduced an initial set  of  mem*  func=E2=80=90
	     tions  in a <memory.h> header file.  4.3BSD (1986) adopted
	     them.

	     SVID Issue 1 (1985) standardized  this  header  file,  but
	     stated that the functions would be moved to <string.h>.

	     XPG  Issue  3  (1989)  listed <memory.h> as WITHDRAWN, and
	     stated that the functions had been moved to <string.h>.

	     C89 didn=E2=80=99t standardize this header file and instead speci=E2=
=80=90
	     fied all these functions in <string.h>.

	     This merge of header files has historically confused  pro=E2=80=90
	     grammers about the real purpose of these functions.

	     Most C libraries, including the BSDs, glibc, musl, Bionic,
	     and Illumos continue to provide <memory.h>.

	     gnulib  doesn=E2=80=99t  provide  it,  though,  and  instead  uses
	     <string.h>.

	SEE ALSO
	     string(3), string_copying(7)

	Linux man=E2=80=90pages 6.18=E2=80=9018... 2026=E2=80=9008=E2=80=9004     =
      memory.h(3head)

I believe this text is quite objective.  It doesn't anywhere suggest
that users keep using it, as glibc maintainers have strongly pushed for.
It doesn't subjectively discourage its use either, though.  It just
gives a detailed clarification of how portable it is (which might indeed
discourage its use).

I believe the way this is documented will result in readers being more
aware of this history, which would help for example programmers find
existing uses of <memory.h> and wondering if they can remove them.

Does this sound reasonable to you?

I might be persuaded of further tweaks to this, FWIW.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--fy2epkflwppah6nc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpzRWUACgkQ64mZXMKQ
wqkW+w/+N636Vov7kW7XrsbWxv4pqMcG15f+LnZjzsgh/o+tLgUgDpGBNikWsvRs
W3Z1iBXfUR+KHzLivqWikL43ip050cBArBae5QJrOcrSVskmZ7MO/c0Fzuj5szoe
CD1qlXuzWwzHbQghKwQuUKwik9LBfRawSrFWNxMqciN0S1KCDF4aWI26gnmSiwh2
XowJFkgrd2tUl8+e/0Q2hqSor1KSUyMc78hx71YH8aoobEo+0YDBhUuNK9/gWi5s
uyPaSGvfqim3bV8kwhPejgX0hNrFP1DZtHJ1KkTJlCh5OE1saVqyyQLEshn/YhwR
ZTX+CquXO2pH/usC6dHQyLtc+nCyEK7fmcMT/uQEW9CqxVzybvAHCgtHE0SxANLT
Fx9OZE73dB+v2mYWVVV4S7WVRe5XbBqa5oezwMdK1G/DF4ELTywDW6xE3RhjdRdl
ETFrKG8QMefjCO1YaFLN4BD2QxCj48IxLhyNd/0KNq74z6+5QfhrTDL2ofmLmh/Q
q1Ba10EzUEEYkcgxuEKbsUHJVH/2dzh4VE2gpyc7/Qz0CXhrWjqAALCKBv2tvFgj
8gnfjjxKfCgyITKPA6PdwN7pp+bdehoMtIoKNxXqHukU9tydaJ1a/ZiXWRyWukdb
MEjyk/ZWL4JuAcY5mQ1JBaD2pZjyQX9liPGTNXIsz5kkVwLpaL0=
=Kxug
-----END PGP SIGNATURE-----

--fy2epkflwppah6nc--
