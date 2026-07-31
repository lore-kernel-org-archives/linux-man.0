Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1652D0C64
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 21:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785532840; cv=none; b=jvms3pe0/e6PPiPf59I0UX9PHBBubvVy07bRid+wIVIFEyPkED11Zpa0nhIigjd1bZPx0b6uQ6ND0fRVbp5mHRAeliVMrie9sPaj4H6DF8Oyt0iUjJsFTDGUd1YSU9aEtqRls/4FsLBrlTUYQUNu82IG7HhSE3gpXiqEYKvGQwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785532840; c=relaxed/simple;
	bh=PBss2cDVzp7lP8DXEqdvYPS5Aq/MquN6L/BED0hH0II=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQJyKqKVK48A/msHmd67MqCG4kYueCtIRh51nlU+6DjMGvkGQu6Y8iXY28WkHwUSv7RfhCXJXPAYdTrKTmRhLxq3r9BNl08Kotb6vldmcR54/Hy+rc1Xo+96CV0YLjgX1AEOKOg5uOqJuNgdf35ZKDUwrtzNafVs4Ew8B0joZ98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtZx+A/b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtZx+A/b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C0A21F00AC4;
	Fri, 31 Jul 2026 21:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785532838;
	bh=Gm5vtCrltjpbdRTbUdXdxLxgz/NlQzM1L4rHXt0ANv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YtZx+A/bvP5uB+Uj0HMJUam72U+C+/0TmiOxjdDrUH3gys3l69xun3c1bnA9ymTB2
	 AGajeiS2s5EiKCU5gbqNYnVJYDusfHVB3unHCQgs1ub2c7464iumh3hsKXYjU5HSPE
	 FRE4B+tPNrisOKM547uN6xVZeQY56WzYRHdszBLez8mC1R2hNULO2+bNuQXHLPmYUl
	 sygADwfZ0nJd9gIZcRwP/0G+imyCc72N60i81Ht4XfgHoasRU77llyYXkjzGyHI9jQ
	 cyQsR0UlvCv/PpT2hYQ3fvfuyv5zdmvB0FfqKATVEA2p0kCMwbKoVyywYkO5ALXqXy
	 D65sbbtWkCsQw==
Date: Fri, 31 Jul 2026 23:20:33 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Keith Bostic <keith@bostic.com>, Joseph Myers <josmyers@redhat.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: [PATCH 0/2] alx-0097r1 - <memory.h>, the legitimate header for
 memcpy(3) et al.
Message-ID: <am0RdPxvbIYUKAL-@devuan>
References: <cover.1785532392.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g4tjeworvulkj6lv"
Content-Disposition: inline
In-Reply-To: <cover.1785532392.git.alx@kernel.org>


--g4tjeworvulkj6lv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Keith Bostic <keith@bostic.com>, Joseph Myers <josmyers@redhat.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: [PATCH 0/2] alx-0097r1 - <memory.h>, the legitimate header for
 memcpy(3) et al.
Message-ID: <am0RdPxvbIYUKAL-@devuan>
References: <cover.1785532392.git.alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1785532392.git.alx@kernel.org>

> Date: 2026-07-31 23:18:54+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> Hi!
>=20
> Here's a patch set for documenting mem*(3) and strn*(3) functions as
> provided in <memory.h>.  This should put a stop to the misunderstanding
> and misuse of these functions as handling strings; they handle bytes and
> nonstrings (and in some cases, strings can be used as nonstrings or as
> byte arrays, but very carefully).
>=20
> This header is quite portable: {Free,Net,Open}BSD, glibc, and musl, at
> least and since forever.
>=20
> The C Committee is discussing standardization of <memory.h>, so let's
> give it a bump.

Here's a draft of the proposal:

---
Name
	alx-0097r1 - <memory.h>, the legitimate header for memcpy(3) et al.

Principles
	-  Avoid ambiguities
	-  Codify existing practice to address evident deficiencies

Category
	Revert regression; library

Author
	Alejandro Colomar <alx@kernel.org>

	Cc: Mark Harris <mark.hsj@gmail.com>
	Cc: Nevin Liber <nevin@cplusplusguy.com>
	Cc: JeanHeyd Meneide <phdofthehouse@gmail.com>
	Cc: Joseph Myers <josmyers@redhat.com>
	Cc: Keith Bostic <keith@bostic.com>

History
	<https://www.alejandro-colomar.es/src/alx/alx/wg14/alx-0097.git/>

	r0 (2026-07-31):
	-  Initial draft.

	r1 (2026-07-31):
	-  Avoid cd(1).

Rationale
	The standard mixes functions for handling strings, functions for
	handling bytes, and other hybrids, all in a single header file:
	<string.h>.

	This has historically caused confusion, as for example leading
	to believe that strncpy(3) is appropriate to handle strings.

	Let's separate the standard clearly into three different header
	files that differentiate these APIs.

    System V
	It turns out that mem*() functions haven't been always in
	<string.h>.  These functions were first introduced in 1983 in
	System V, and were added in a separate <memory.h> file.  Very
	soon, they were added to 4.3BSD in 1986 for compatibility to
	System V, also in <memory.h>.

	Most modern-day POSIX-compatible libc implementations still
	provide this header file for backwards compatibility reasons:

		$ find ~/src/bsd/freebsd/main/ | grep /include/memory.h
		/home/alx/src/bsd/freebsd/main/include/memory.h
		$ find ~/src/bsd/netbsd/trunk/ | grep /include/memory.h
		/home/alx/src/bsd/netbsd/trunk/include/memory.h
		$ find ~/src/bsd/openbsd/master/ | grep /include/memory.h
		/home/alx/src/bsd/openbsd/master/include/memory.h
		$ find ~/src/gnu/glibc/master/ | grep /include/memory.h
		/home/alx/src/gnu/glibc/master/include/memory.h
		$ find ~/src/musl/libc/master/ | grep /include/memory.h
		/home/alx/src/musl/libc/master/include/memory.h

    C89
	It seems that it was C89 that moved the mem*() functions to
	<string.h>, even though the Rationale document for C89 doesn't
	mention it at all.

	This was a huge mistake --we can see the consequences in the
	many misuses of these functions, and programmers that believe
	they are appropriate for uses that they are unappropriate-- that
	we can undo now.

    Design decisions
	To avoid breaking the world, let's provide the declarations of
	mem*() in both <string.h> and the old-but-new <memory.h>.  This
	will allow existing programs to continue working without
	changes.  It will also allow new programs to use the more
	higienic header files.

	This is actually what is done by existing implementations, which
	provide the declarations in both header files.  So, this is
	standardization of prior art.

    <nonstring.h>
	The strn*() functions didn't have their own separate header, but
	to avoid miususe, let's have a third header file for them.
	The name comes from the GCC [[gnu::nonstring]] attribute, which
	is used to refer to things that are somewhat similar to a string
	but aren't really a string (they are not necessarily
	NUL-terminated).

	Strings are valid nonstrings, but not the other way around.
	This is why some strn*() functions still work well on strings,
	such as strncmp(3).  However, that shouldn't prevent moving them
	to this header file.

	Also, some strn*() functions work with strings in some
	parameters, while taking nonstrings in others.  For example,
	strncat(3) takes a nonstring, and produces a string; and
	strncpy(3) takes a string (or a nonstring), and produces a
	nonstring.  Let's put all of these in <nonstring.h>, so that
	<string.h> will remain as a header file for functions that
	*exclusively* handle strings.

    <wchar.h>
	Because <wchar.h> is already more packed than <string.h>,
	containing also stuff that would correspond to other headers
	(e.g., wcstol(3)), let's not split that one.  A refactor of
	<wchar.h> should entertain a much larger task, and create files
	such as <wstring.h>, <wstdlib.h>, <wmemory.h>, etc.

Proposed wording
	Based on N3886.

    7  Library
	@@ New subclause after 7.27 ("_Noreturn <stdnoreturn.h>")
	+7.<27+1>  Memory handling <memory.h>
	+7.<27+1>.1  Memory function conventions

	@@ Copy 7.28.1p1 as 7.<27+1>.1p1, then:
	 The header
	-<string.h>
	+<memory.h>
	 declares one type,
	 several functions,
	-several type-generic functions,
	+one type-generic function,
	 and defines two macros
	 useful for manipulating
	-arrays of character type and other
	 objects
	 treated as arrays of character type.
	-328)
	+AAA)
	 The type is <b>size_t</b>
	 and one of the macros is <b>NULL</b>
	 (both described in 7.22).
	 Various methods are used for
	 determining the lengths of the arrays,
	 but in all cases a
	-<b>char *</b> or
	 <b>void *</b> argument
	 points to
	 the initial (lowest addressed) character
	 of the array.
	 If an array is accessed beyond the end of an object,
	 the behavior is undefined.
	+
	+AAA)
	+	See "future library directions" (7.35.<17+1>)

	@@ p2
	+2
	+	The macro
	+		__STDC_VERSION_MEMORY_H__
	+	is an integer constant expression
	+	with a value equivalent to <tt>202ymmL</tt>.

	@@
	## Copy 7.28.1p3 as 7.<27+1>.1p3, verbatim.
	## Copy 7.28.1p4 as 7.<27+1>.1p4, verbatim.

	+7.<27+1>.2  Copying functions
	## Move 7.28.2.1 as 7.<27+1>.2.1 ("The memcpy function").
	## Move 7.28.2.2 as 7.<27+1>.2.2 ("The memccpy function").
	## Move 7.28.2.3 as 7.<27+1>.2.3 ("The memmove function").

	+7.<27+1>.3  Comparison functions
	+7.<27+1>.3.1  General
	@@ Copy 7.28.4.1p1 as 7.<27+1>.3.1p1, then:
	 The sign of a nonzero value
	 returned by the comparison functions
	 <b>memcmp</b>
	-, strcmp, and strncmp
	 is determined by the sign of
	 the difference between
	 the values of the first pair of characters
	 (both interpreted as unsigned char)
	 that differ in the objects being compared.

	@@
	## Move 7.28.4.2 as 7.<27+1>.3.2 ("The memcmp function").

	+7.<27+1>.4  Search functions
	+7.<27+1>.4.1  Introduction
	@@ Copy 7.28.5.1p1 as 7.<27+1>.4.1p1, then:
	 The stateless search functions
	 in this subclause
	 (<b>memchr</b>
	-, strchr, strpbrk, strrchr, strstr
	 )
	 are <i>generic functions</i>.
	 These functions are
	 generic
	 in the qualification of the array to be searched
	 and will return a result pointer to an element
	 with the same qualification as the passed array.
	 If the array to be searched is <b>const</b>-qualified,
	 the result pointer will be to a <b>const</b>-qualified element.
	 If the array to be searched is not <b>const</b>-qualified,
	-332)
	+BBB)
	 the result pointer will be to an unqualified element.

	## Copy footnote 332) as BBB), verbatim.

	@@ Copy 7.28.5.1p2 as 7.<27+1>.4.1p2, then:
	 The external declarations
	 of these generic functions
	 have a concrete function type
	 that returns a pointer to an unqualified element
	-(
	 of type
	-<b>char</b> when specified as <bi>QChar</bi>, and
	 <b>void</b>
	-when specified as <bi>QVoid</bi>
	-)
	 ,
	 and accepts a pointer to
	 a <b>const</b>-qualified array of the same type to search.
	 This signature supports all correct uses.
	 If the macro definition of
	 any of these generic functions
	 is suppressed to access
	 an actual function,
	 the external declaration
	 with the corresponding concrete type is visible.
	-333)
	+CCC)

	@@
	## Copy footnote 333) as CCC), verbatim.
	## Copy 7.28.5.1p3 as 7.<27+1>.4.1p3, verbatim.

	@@
	## Move 7.28.5.2 as 7.<27+1>.4.2 ("The memchr function").

	+7.<27+1>.5  Miscellaneous functions
	## Move 7.28.6.1 as 7.<27+1>.5.1 ("The memset function").
	## Move 7.28.6.2 as 7.<27+1>.5.2 ("The memset_explicit function").

    7.28  String handling <string.h>
	@@ New subsection after title
	+7.28.<0+1>  General
	+1
	+	The header <string.h>
	+	includes the headers <memory.h> and <nonstring.h>.

	@@
	## Move 7.28.1p2 as 7.28.<0+1>p2, verbatim.

    7.28.1  String function conventions
	## Delete p2 --moved elsewhere--.

    7.28.2  Copying functions
	## Delete 7.28.2.1 ("The memcpy function") --moved elsewhere--.
	## Delete 7.28.2.2 ("The memccpy function") --moved elsewhere--.
	## Delete 7.28.2.3 ("The memmove function") --moved elsewhere--.
	## Delete 7.28.2.5 ("The strncpy function") --moved elsewhere--.
	## Delete 7.28.2.7 ("The strndup function") --moved elsewhere--.

    7.28.3  Concatenation functions
	@@ Title
	-Concatenation
	+Catenation

	@@
	## Delete 7.28.3.2 ("The strncat function") --moved elsewhere--.

    7.28.4.1  Comparison functions :: General
	@@ p1
	 The sign of a nonzero value
	 returned by the comparison functions
	+(
	-memcmp,
	 strcmp
	-, and strncmp
	+)
	 is determined by the sign of the difference
	 between the values of the first pair of characters
	 (both interpreted as unsigned char)
	 that differ in the objects being compared.

    7.28.4  Comparison functions
	## Delete 7.28.4.2 ("The memcmp function") --moved elsewhere--.
	## Delete 7.28.4.5 ("The strncmp function") --moved elsewhere--.

    7.28.5.1  Search functions :: Introduction
	@@ p1
	 The stateless search functions
	 in this subclause
	 (
	-memchr,
	 <b>strchr</b>, <b>strpbrk</b>, <b>strrchr</b>, <b>strstr</b>
	 )
	 are <i>generic functions</i>.
	 These functions are
	 generic
	 in the qualification of the array to be searched
	 and will return a result pointer to an element
	 with the same qualification as the passed array.
	 If the array to be searched is <b>const</b>-qualified,
	 the result pointer will be to a <b>const</b>-qualified element.
	 If the array to be searched is not <b>const</b>-qualified,
	 332)
	 the result pointer will be to an unqualified element.

	@@ p2
	 The external declarations
	 of these generic functions
	 have a concrete function type
	 that returns a pointer to an unqualified element
	-(
	 of type <b>char</b>
	-when specified as <bi>QChar</bi>,
	-and <b>void</b>
	-when specified as <bi>QVoid</bi>
	-)
	 ,
	 and accepts a pointer to
	 a <b>const</b>-qualified array of the same type to search.
	 This signature supports all correct uses.
	 If the macro definition of
	 any of these generic functions
	 is suppressed to access
	 an actual function,
	 the external declaration
	 with the corresponding concrete type is visible.
	 333)

    7.28.5  Search functions
	## Delete 7.28.5.2 ("The memchr function") --moved elsewhere--.

    7.28.6  Miscellaneous functions
	## Delete 7.28.6.1 ("The memset function") --moved elsewhere--.
	## Delete 7.28.6.2 ("The memset_explicit function") --moved elsewhere--.
	## Delete 7.28.6.5 ("The strnlen function") --moved elsewhere--.

    7  Library
	@@ New subclause after 7.28 ("String handling <string.h>").
	+7.<28+1>  Nonstring handling <nonstring.h>
	+7.<28+1>.1  Nonstring function conventions

	@@ Copy 7.28.1p1 as 7.<28+1>.1p1, then:
	 The header
	-<string.h>
	+<nonstring.h>
	 declares one type,
	 several functions,
	-several type-generic functions,
	 and defines two macros
	 useful for manipulating
	 arrays of character type and other
	 objects
	 treated as arrays of character type.
	-328)
	+DDD)
	 The type is <b>size_t</b>
	 and one of the macros is <b>NULL</b>
	 (both described in 7.22).
	 Various methods are used for
	 determining the lengths of the arrays,
	 but in all cases a
	 <b>char *</b>
	-or <b>void *</b>
	 argument
	 points to
	 the initial (lowest addressed)
	 character
	 of the array.
	 If an array is accessed beyond the end of an object,
	 the behavior is undefined.
	+
	+DDD)
	+	See "future library directions" (7.35.<18+1>)

	@@ p2
	+2
	+	The macro
	+		__STDC_VERSION_NONSTRING_H__
	+	is an integer constant expression
	+	with a value equivalent to <tt>202ymmL</tt>.

	@@
	## Copy 7.28.1p3 as 7.<28+1>.1p3, verbatim.
	## Copy 7.28.1p4 as 7.<28+1>.1p4, verbatim.

	+7.<28+1>.2  Copying functions
	## Move 7.28.2.5 as 7.<28+1>.2.1 ("The strncpy function").
	## Move 7.28.2.7 as 7.<28+1>.2.2 ("The strndup function").

	+7.<28+1>.3  Catenation functions
	## Move 7.28.3.2 as 7.<28+1>.3.1 ("The strncat function").

	+7.<28+1>.4  Comparison functions
	+7.<28+1>.4.1  General
	@@ Copy 7.28.4.1p1 as 7.<28+1>.4.1p1, then:
	 The sign of a nonzero value
	 returned by the comparison functions
	-memcmp, strcmp, and
	+(
	 <b>strncmp</b>
	+)
	 is determined by the sign of
	 the difference between
	 the values of the first pair of characters
	 (both interpreted as unsigned char)
	 that differ in the objects being compared.

	@@
	## Move 7.28.4.5 as 7.<28+1>.4.2 ("The strncmp function").

	+7.<28+1>.5  Miscellaneous functions
	## Move 7.28.6.5 as 7.<28+1>.5.1 ("The strnlen function").

	## I've kept plurals in sections that only have one function.
	## This is because we may add functions in the future, so it's
	## better to keep the wording generic to avoid having to update
	## it needlessly.

--=20
<https://www.alejandro-colomar.es>

--g4tjeworvulkj6lv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmptEaEACgkQ64mZXMKQ
wqnwMQ/9FlkyvZg1P0X00+otqcmiaGJLrPYkOZbDdAe67H4lER/P1vikpORhR7T4
3RX3tLGM5/nc0zxbhc93c1oRnwT7O2Sg84PRJT9SzYIA9bzI3eKIkW0Zb3pNNbwA
KyrvQtuOJ+zyrx/AH8xhuHXN3FfikST/tv42vRU0h0ZrtozsHpS9lbE2jzocdx8M
1ezjxdxBrs8E52mP5QBLglJzj3qdopfyFAxChcLFHBHObRVav1H4LY0z89HTOSMH
+yOluwqwoOoTCO5xyBfbKwYxTTqDQX4AaVowQrpYfhETbi03ijLJzoABYvrmwKw7
3QBsRWbEAxsmVKxyZuysdqpn7YvyfqpfQjWqBmvKOpb0u+o8/bL+vwNWAXBsPUDa
rguiYsNPD076baPGQ3gef63KiqXVuDeDHbTsSnCBnViN13e45NtuuyzXQzA8DZpW
6eXAHBYepA77miGOaiw65t12D5CJnkDA8It0BoP9KbYIzwDvvbhzeV/mlRcmTm6P
ttAAZaAHTpBqHSBGZ+0K+rPGtPpR1N3LGHwzgY4iJOvsjVOHyCCzkB4ZGEu0GtUX
enXc3ALM3DzUA/Ui7U/dEkOEnceFNDQFGNqiR5dBWSXzVNfC3NeH1aC1QlBJQNS7
UMTbP3gNZhfq1SAxc2O+q+HrzYFY6PvF2atKQ9uSlGjXakcgwJ8=
=DWR2
-----END PGP SIGNATURE-----

--g4tjeworvulkj6lv--
