Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0CC3DAAC2
	for <linux-man@vger.kernel.org>; Sun, 26 Jul 2026 23:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785107683; cv=none; b=n9wVEO+pqhOpb1o/uI/MTicpNEdK8NlaFr9RaqFTC0pkKIKFzNPnLPyagev+Z+PhJFRgD7/VqXdvRi/9suUl1AKTyhg7heTaRmoUdPBet73onA3Q3nJFSpAzWNc/ZjlbcKHsowAwd7ertB5Ndgc29QHOJlyGPcFvOPY+2n31mxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785107683; c=relaxed/simple;
	bh=WcbOqelE7Zk5yMw3LOlaH0PFixqYkJvZAEKlU+/wj/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaIBycSWYQ/fwdFdQpXE3V1YYkkYINlERbw1BCPrJkyxM+QHrIxTJzHBjnAB8ZZV2DwdEevf1Q+r6Lnrw4xHwowU4Bve8kI7XVgba8qApuEQ7wo4HQrSMbZ9yJbhJZIHZgr4kTU/7tNL2ut9AgQajogtwNLf3cUX5jncw6GxShs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DtYPLmOJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DtYPLmOJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582131F000E9;
	Sun, 26 Jul 2026 23:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785107680;
	bh=S/1LPFhAjwQEM53KY7rUKiRq65wi2Zq5yyLVUNxsoms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DtYPLmOJ6SnElEzOVK0zBNpofP2OR7I9i2jgZB3SHYIFn5/jsRDYj5orX5539XFDZ
	 nMuGny4WdmKtQhraZKgD++F3HMP/pFogRCm0Eh/zJXV57qa5jpnhI/IHhMyh8pVsU+
	 jRrJKI4ZbBUHcwBc15gBoxgDgGl9lTQNFBv39roveY5Ym3r7bczHzW+oH/kQ4sS4b8
	 qgZ6T8PJXMrRXRTwcIK7KP+PB3B58wPfkl7hQPEsIiZiN3AiTd9wcOQ02Q5zhv66ci
	 nOiK0FlUIgkFrN49g+XFZZ/MAm4PXVTq728t7NIFPtbeXugH3MyyNnsSaW+83H1p71
	 mM0yWg6pkYp8Q==
Date: Mon, 27 Jul 2026 01:14:36 +0200
From: Alejandro Colomar <alx@kernel.org>
To: sergeh@kernel.org
Cc: linux-man@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>, 
	Mark Harris <mark.hsj@gmail.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: alx-0096r1 - string (and nonstring) copying
Message-ID: <amaTpQxd52iYjlor@devuan>
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1783523064.git.alx@kernel.org>
 <b17a1548f3ab96216e6165bdd3194a80363e99f6.1783523064.git.alx@kernel.org>
 <amO0Wtmi4tpaGUKr@AUS2MQ6190Y76.amd.com>
 <amUw8ArFwmnsIKl1@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xjrwwwmzytle7xrx"
Content-Disposition: inline
In-Reply-To: <amUw8ArFwmnsIKl1@devuan>


--xjrwwwmzytle7xrx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: sergeh@kernel.org
Cc: linux-man@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>, 
	Mark Harris <mark.hsj@gmail.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: alx-0096r1 - string (and nonstring) copying
Message-ID: <amaTpQxd52iYjlor@devuan>
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1783523064.git.alx@kernel.org>
 <b17a1548f3ab96216e6165bdd3194a80363e99f6.1783523064.git.alx@kernel.org>
 <amO0Wtmi4tpaGUKr@AUS2MQ6190Y76.amd.com>
 <amUw8ArFwmnsIKl1@devuan>
MIME-Version: 1.0
In-Reply-To: <amUw8ArFwmnsIKl1@devuan>

Hi Serge,

On 2026-07-26T00:09:23+0200, Alejandro Colomar wrote:
[...]
> > > @@ -5,10 +5,7 @@
> > >  .\"
> > >  .TH strncat 3 (date) "Linux man-pages (unreleased)"
> > >  .SH NAME
> > > -strncat
> > > -\-
> > > -append non-null bytes from a source array to a string,
> > > -and null-terminate the result
> > > +strncat \- nonstring catenate
> >=20
> > why nonstring?  The source string doesn't *have* to be a string,
> > but can be, right?
>=20
> Yup, it can be a string, although it would be useless (if you want
> a string, you can use strcat(3)).
>=20
> >  (IIRC, you define a nonstring as an array
> > of given length that doesn't necessarily end in \0?  I could be
> > mis-remembering)
>=20
> Yes, a nonstring is a character array that doesn't necessarily end in
> \0.  That's why a string is a valid nonstring, but not the other way
> around.
>=20
> > string bounded concatente maybe?
>=20
> Nope; that's what makes people misunderstand these functions, and
> confuse them with safe truncating functions (e.g., strscpy(9)).
>=20
> I'll send you a copy of a paper I'm writing for the C Committee.

It is at the bottom of this email.  I will publish it as an N document
in August.

> > I think it helps the quick association in the mind if the start
> > of the string matches more closely (str).
>=20
> In this specific case, it's not a good idea.  strn*() are NOT string
> functions.


Have a lovely night!
Alex

---
Name
	alx-0096r1 - string (and nonstring) copying

Principles
	-  Facilitate portability
	-  Allow programming freedom
	-  Avoid quiet changes

Category
	Library: <string.h>

Author
	Signed-off-by: Alejandro Colomar <alx@kernel.org>
	Cc: Kees Cook <kees@kernel.org>
	Cc: Serge Hallyn <serge@hallyn.com>

History
	<https://www.alejandro-colomar.es/src/alx/alx/std/wg14/alx-0096.git/>

	r0 (2026-07-16):
	-  Initial draft.

	r1 (2026-07-17):
	-  tfix, wfix
	-  Simplify diff.
	-  More carefully analyze memcpy_and_pad().
	-  strtcpy/cat(): If dst=3D=3D0, the behavior is undefined.
	-  Add wording for removing strncpy_s().
	-  Add TODOs for wide-string wording.
	-  E2BIG or EMSGSIZE?

Abstract
	strncpy(3) is a function with good semantics, but a bad name and
	history, which has led to abuse.

Description
	There's a recent push to remove strncpy(3) from the ISO C
	standard without carefully analyzing the consequences of the
	removal.  There have been informal messages from committee
	members in the mailing list, and now we have an N document that
	will be heard in the next meeting:
	<https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3935.htm>

    N3935 (2026-07-15; "Removing strncpy")
	N3935 contains some truth and good arguments in it, but it is
	mixed with some mistakes too.

	Below is an attempt at carefully analyzing the history of this
	function and why it has been misused, and also a thorough
	analysis of the replacement candidates.

    Seventh Edition Unix; strncpy(3)
	strncpy(3) was first introduced in Seventh Edition Unix (V7).

	It was added for one very specific use case: copying a source
	string into a destination character sequence in a fixed-size
	member of a structure (not a string), and padding the unused
	bytes with '\0'.

	This was useful bad then in members of the utmp(5) structure,
	and modern shadow-utils still need this function for dealing
	with utmp(5).

	While programs should avoid non-NUL-terminated character
	sequences (aka, nonstrings) within fixed-width structure members
	in code that is used only internally, this is sometimes
	necessary in structures that are part of a protocol.  Thus,
	while this is a niche use case, it remains something that some
	programs need to do, and need to do reliably and safely.

	Another program that needs this functionality is tar(1) (from
	what I've heard).

    System V; mem*() functions
	Back in the times of V7, the concept of a string was less
	specific, and what we now call byte arrays, they called byte
	strings.  In fact, memcmp(3) was then called bcmp(3).  That's
	why all the byte functions are provided in <string.h>.

	System V invented the mem*() functions --AFAIK--.  They are
	essentially the b*() funcitons from V7, with minor tweaks to the
	parameters and return values.  For example, memcpy(3) was made
	consistent with strcpy(3), in that both take the input as $2
	and write to $1.  The old bcopy(3) was reversed compared to
	strcpy(3), which was quite confusing and error-prone
	(especially, before 'const' was invented).

	POSIX says memcmp(3) was first standardized in Issue 1 of the
	SVID (System V Interface Definition), which corroborates that
	these functions were invented in SysV.

	It is good that such a renovation of the names, parameters, and
	return values happened.

	It would have been good if strncpy(3) and strncat(3) would have
	been renamed (and tweaked) too back then, but it didn't happen.

    C89; string
	C89 specified the term 'string' very clearly, in 4.1.1:

		A string is a contiguous sequence of characters
		terminated by and including the first null character.

	This differed from the old ambiguous meaning.  The header file
	for operations on byte arrays remained <string.h> for historical
	reasons, even if it conflicted with this specification of
	string.

	The strn*() functions, strncpy(3) and strncat(3), also remained
	with their names, for historical reasons, even if it conflicted
	with this specification of string.

	Other than that, the standard was quite consistent and strict
	with its meaning of the term string.

	I believe this consistency --with the exceptions mentioned
	above-- is what led programmers to trust string functions to
	handle strings, and anything with a str*() in the name was
	believed to be good for handling strings.  Programmers forgot
	the not-so-consistent history of the term string prior to
	standardization.

	In retrospective, the strncpy(3) function would have been better
	called strtomem_pad(), which clearly reflects what it does.
	Maybe that would have made programmers aware of its semantics,
	and it would have significantly reduces misuses of the function.

    strncat(3)
	strncat(3) is similar to strncpy(3) --while at the same time,
	very different--.  It is actually the opposite of strncpy(3):
	it takes a nonstring as input, and writes a string.

	A better name for it would have been memtostr_cat().

	Curiously, there's no 'cpy' version of strncat(3).  There's
	nothing with the semantics of memtostr() in ISO C, nor in the
	historic Unix systems (V7, BSD, System V).

    strn*(); [[gnu::nonstring]]
	In general, the names of strn*() functions are unfortunate,
	because they are better suited for handling nonstrings
	(character sequences that don't fit in the standard
	 specification of 'string').

	GNU C has the attribute [[gnu::nonstring]] to annotate these
	things.
	<https://gcc.gnu.org/onlinedocs/gcc/Common-Attributes.html#index-nonstring>

	While renaming the functions would be better, one can think of
	the 'n' in strn*() as a mnemonic for NonSTRing.  This partially
	mitigates the naming issue.  Still, better names would be much
	better:

		strncpy() =3D> strtomem_pad()
		strncat() =3D> memtostr_cat()

    Linux; strtomem_pad()
	Recently, it appeared in the (fake) news that Linux had
	completely removed all uses of strncpy(3), and banned it in new
	code.

	This is not really true.  They renamed strncpy(3) to
	strtomem_pad(), which has essentially the same semantics of
	strncpy(3), with a different name.  They still use it.  This
	reflects that there are still legitimate uses for which
	strncpy(3) is still good and necessary.

	The number of uses of strtomem_pad() (i.e., strncpy(3) renamed)
	is very small --because as explained above, it's a niche
	function--, but they exist.  Here are the uses in the Linux
	source some time after v7.2-rc2:

		$ grep -rc 'strtomem_pad(.\+)' | grep -v :0$
		include/linux/string.h:1
		lib/tests/string_kunit.c:1
		drivers/soc/qcom/cmd-db.c:1
		drivers/gpu/drm/drm_connector.c:2
		drivers/auxdisplay/panel.c:3
		arch/x86/coco/tdx/tdx.c:1
		fs/nilfs2/ioctl.c:2
		fs/ext4/file.c:1
		fs/ext4/super.c:1

	What they achieved is a removal of all misuses of strncpy(3),
	while keeing the good ones.  This is the really good news.  And
	we should learn of how Linux achieved it, as it has achieved
	something that few people had achieved before.

	Saying "Linux got rid of strncpy(3); let's wipe it here too"
	without carefully analyzing exactly what they did and how would
	be dangerous.

	Instead, it seems Linux has proved that by carefully renaming
	functions, we can get rid of their misuses.

    Linux; strscpy(9), memtostr(), ...
	Renaming strncpy(3) alone wasn't enough.  One or more new
	functions had to be designed to replace the existing misuses of
	the function, so that code could replace the misuses by
	something appropriate.

	Linux claims to have replaced strncpy(3) with the following
	functions or macros:

		strscpy(9)
			when the destination must be NUL-terminated.
		strscpy_pad()
			when the destination must be NUL-terminated and
			zero-padded (for example, for structs crossing
			privilege boundaries).
		memtostr()
			for NUL-terminated destinations copied from
			non-NUL-terminated fixed-width sources, with the
			__nonstring attribute on the source.
		memtostr_pad()
			for the same case, but with zero-padding.
		strtomem()
			for non-NUL-terminated fixed-width destinations,
			with the __nonstring attribute on the
			destination.
		strtomem_pad()
			for non-NUL-terminated destinations that also
			need zero-padding.
		memcpy_and_pad()
			for bounded copies from potentially unterminated
			sources where the destination size is a runtime
			value.

	Here's a more detailed analysis of whether we need these
	functions in the standard, and also some comments about their
	name or semantics.

		strscpy(9)
			This is the main use case that programmers miss
			in ISO C: copying a string with truncation.

			A better name for this function would have been
			strtcpy(), with a T for truncation.  Safety is
			not absolute, and thus an 's' for safety in the
			name of a function will likely result in misuse.
			The name should describe the semantics of the
			function.

			The committee should seriously consider adding
			this function to the standard, with high
			priority.

		strscpy_pad()
			This is a niche function, which is useful for
			writing strings in structures that are passed
			from privileged code to non-privileged code.

			Outside of a kernel, this functionality is rare,
			and thus the committee should ignore this one,
			at least in a first round.

			A better name would be strtcpy_pad(), for
			similar reasons.

		memtostr()
			This is the 'cpy' version of strncat(3).

			As long as we have strncat(3) in the standard,
			it would be good to have this 'cpy' version of
			it, since they're useful for the same kinds of
			code.

			Implementations can use strncat(3) to trivially
			implement this function:

				#define memtostr(dst, src, n) \
					strncat(strcpy(dst, ""), src, n)

			(And in fact, this is a common workaround for
			 the lack of a 'cpy' version of strncat(3).
			 Programmers may open-code this directly, but
			 the pattern remains.)

			If we add this function, it would be good to
			rename strncat(3) to memtostr_cat().

		memtostr_pad()
			Like strscpy_pad(), this is rare.  The kernel
			needs this, beacuse it has to pass structures to
			less privileged code, but regular programs don't
			need this.  We should avoid standardization, at
			least in a first round.

		strtomem()
			This is *bogus*.  The Linux kernel should remove
			it ASAP.

			Outside of tests, it has exactly one use case in
			the Linux kernel:

				$ grep -rc 'strtomem(.\+)' | grep -v :0$
				include/linux/string.h:1
				lib/tests/string_kunit.c:4
				drivers/s390/char/sclp.c:1

			The commit that added it says:

			    We don't need strtomem_pad() because `e` is
			    already memset to 0 -- rendering any
			    additional NUL-padding useless.

			This would be more robust using strtomem_pad().
			The performance difference should be negligible,
			especially since the field has 4 bytes only.
			This function is entirely unnecessary, and is
			only asking for trouble (the day they remove
			that memset(3), it will break).

			If a copy didn't pad remaining bytes, it would
			be impossible to distinguish data from noise, so
			this function is evil.

		strtomem_pad()
			This is the old strncpy(3), with a better name.
			It's still as useful and necessary as it has
			always been.

		memcpy_and_pad()
			This seems a workaround for other cases in the
			kernel that aren't necessarily useful for the
			general public.

			This is a niche function, which is useful for
			copying fixed-width arrays in structures that
			are received in privileged code from
			non-privileged code.

			Outside of a kernel, this functionality is rare,
			and thus the committee should ignore this one,
			at least in a first round.

	So, the list of functions that we should consider for
	standardization is smaller:

	-  strtcpy()		(strscpy(9) in Linux)
	-  memtostr()		(the 'cpy' of strncat(3))
	-  strtomem_pad()	(strncpy() renamed)

	As Jens Gustedt pointed out in the mailing list of the
	committee, and as pointed above, strtomem without padding
	doesn't make sense.  Thus, the name strtomem_pad() can be
	simplified to just strtomem(), because padding is obvious.

	Thus, the functions that should be considered are:

	-  strtcpy()		(strscpy(9) in Linux)
	-  memtostr()		(the 'cpy' of strncat(3))
	-  strtomem()		(strncpy(3) renamed)

	And for consistency, strncat(3) should be renamed to something
	like memtostrcat().

    strncpy(3), strtomem(), and truncation
	One thing we should consider improving if we'll have a breaking
	change is to report truncation.

	strtomem()/strncpy(3) necessarily truncates if the string
	doesn't fit.  However, it doesn't report truncation if it
	happens.  Since the return value of strtomem()/strncpy(3) isn't
	very useful, we can take advantage and modify it to return an
	error code if there's truncation.  Let's return NULL on
	truncation.

    shadow; strtcpy(), strncpy(3)
	The shadow project more or less agrees with the Linux kernel in
	this regard.  It has implemented strtcpy(), and uses strncpy(3).
	It doesn't have memtostr() yet, because it happens to always
	allocate the buffer at the same time, using strndup(3) --which
	is essentially malloc(3)+memtostr()--, but that will change
	soon, because (non-VLA) arrays are safer, as they allow
	validation of source and destination sizes at compile time.

	The implementations are independent, and happened to be
	fundamentally identical.  It seems that good implementations of
	string and nonstring copying code converge to this set of
	interfaces.

	Here's a naive implementation of strtcpy():

		ssize_t
		strtcpy(char *restrict dst, const char *restrict src, size_t dsize)
		{
			bool    trunc;
			size_t  dlen, slen;

			if (dsize =3D=3D 0)  // UB
				abort();

			slen =3D strnlen(src, dsize);
			trunc =3D (slen =3D=3D dsize);
			dlen =3D slen - trunc;

			stpcpy(mempcpy(dst, src, dlen), "");

			if (trunc) {
				errno =3D E2BIG;
				return -1;
			}

			return slen;
		}

    shadow; strtcat()
	A cat version of strtcpy() is also useful.  The Linux kernel
	seems to be misusing strncat(3), because they took priority on
	addressing misuses of strncpy(3), but it would do good in also
	replacing misuses of strncat(3).

	shadow does have strtcat() --although the number of uses is way
	smaller than those of strtcpy()--.

	Thus, for consideration:

	-  strtcpy()		(strscpy(9) in Linux)
	-  strtcat()		(the 'cat' of strtcpy())
	-  memtostr()		(the 'cpy' of strncat(3))
	-  memtostrcat()	(strncat(3) renamed)
	-  strtomem()		(strncpy(3) renamed)

	An implementation of strtcat() is:

		ssize_t
		strtcat(char *restrict dst, const char *restrict src, size_t dsize)
		{
			char  *p, *end;

			end =3D dst + dsize;

			p =3D stpecpy(strnul(dst), end, src);
			if (p =3D=3D NULL)
				return -1;

			return p - dst;
		}

    SEI CERT STR32-C
	SEI CERT --which supposedly is a "secure" coding guideline--
	recommends using strncpy(3) for copying a string with
	truncation.
	<https://cmu-sei.github.io/secure-coding-standards/sei-cert-c-coding-stand=
ard/rules/characters-and-strings-str/str32-c/#compliant-solution-truncation>

	This is the kind of bad teaching that has had the negative
	effects we have today.  Programmers misuse tools like strncpy(3)
	--among other reasons-- because they're taught by SEI CERT and
	others to use those tools for something they weren't designed
	for.

	SEI CERT STR32-C proposes this code as correct code for copying
	a string with truncation:

		size_t func(const char *source) {
		  char c_str[STR_SIZE];
		  size_t ret =3D 0;

		  if (source) {
		    strncpy(c_str, source, sizeof(c_str) - 1);
		    c_str[sizeof(c_str) - 1] =3D '\0';
		    ret =3D strlen(c_str);
		  } else {
		    /* Handle null pointer */
		  }
		  return ret;
		}

	I claim that that code is bogus, and that good code for doing
	that should instead look like this:

		if (strtcpy(buf, source, countof(buf)) =3D=3D -1)
			goto trunc;

	That's one line that does one thing and does it well.  It takes
	an input string, and copies the string into an output buffer,
	truncating as necessary, not reading more than necessary, and
	not writing more than necessary.  It reports truncation if it
	happens, because truncation is usually a bad thing.

	For that, one must implement strtcpy() (see above for an
	implementation).

    System V; memccpy(3)
	memccpy(3) was invented in System V (like the other mem*()
	functions).  The System V sources are not public (AFAIK), so
	it's not known what this function was designed for.  It was
	later added to the BSDs and glibc for compatibility with SysV,
	but nobody really knew what this function is good for.  It
	doesn't seem ergonomic for any basic functionality.

	Ignoring tests, you can find 0 calls to memccpy(3) in NetBSD,
	and 3 calls in FreeBSD --two of which are in two repeated
	implementations of strncat(3), and the other one is really
	unique, in "bin/sh/parser.c"--.

	Debian shows several more uses of memccpy(3) that are not in
	tests, but all of those seem to be newer than C23, so they seem
	to be cases of "if C23 added this, it must be good, let's use
	it" without really analyzing whether that function was actually
	good.

	These two unique calls found in NetBSD are *terrible*.  By
	*terrible* I mean as bad as misuses of strncpy(3).  They show
	how error-prone memccpy(3) is, even for the most natural use
	cases.  Here's one of the examples:

		if (fmt[0] !=3D '}') {
			char *end;

			end =3D memccpy(tfmt, fmt, '}', sizeof(tfmt));
			if (end =3D=3D NULL) {
				/*
				 * Format too long or no '}', so
				 * ignore "\D{" altogether.
				 * The loop will do i++, but nothing
				 * was written to ps, so do i-- here.
				 * Rewind fmt for similar reason.
				 */
				i--;
				fmt--;
				break;
			}
			*--end =3D '\0'; /* Ignore the copy of '}'. */
			fmt +=3D end - tfmt;
		}

	This is the most legitimate use case of memccpy(3) that one can
	conceive: we want to copy the leading part of a string until a
	delimiter character is found.  And even this use is full of
	opportunities for off-by-one bugs.  A better design would have
	not copied the delimiter, allowing the user to decide whether to
	copy it or not (instead of forcing it to go back and remove it,
	which is more complex).

    POSIX; memccpy(3)
	POSIX standardized memccpy(3) just because it was in System V.
	POSIX derives from Issue 1 of the SVID.  It's not surprising
	that it's there.  Especially, this function was always in POSIX,
	and the early revisions of POSIX are known to have strong
	preference for SysV functions, regardless of their quality or
	widespread use.

	Interestingly, POSIX mentions that memccpy(3) does not check for
	overflow.

	> The memccpy() function does not check for the overflow of the
	> receiving memory area.

	This is because the 4th parameter to memccpy(3) is not the size
	of the destination buffer, but the size of the source buffer.
	It is assumed that the destination buffer is large enough.

	This hints that the original (System V) authors of the function
	didn't consider copying strings as a use case for this function.

    N2349 (2019-03-17; "Toward more efficient string copying and concatenat=
ion")
	The C Committee, for C23, considered adding new functions for
	copying strings.  They didn't really had a clear idea of what
	use case they intended to cover, and thus didn't really take an
	informed decision regarding the design of the function.  This
	reminds us of the fiasco of Annex K.

	This time, at least, they decided to restrict the search to
	existing functions, instead of inventing more Annex-K-like
	functions.  This reduced the risk, but didn't remove it.

	There was an inherent desire to add a function for copying
	strings with truncation, due to the frustration of the historic
	misuses of strncpy(3) and strncat(3) for that use.

	However, the paper that discussed this (N2349) --surprisingly--
	didn't mention safety in the title.

	The proposal seemed to focus on efficiency... except it didn't,
	either.

	memccpy(3) has been historically not used (see above, 0 uses in
	NetBSD, and 2 unique uses in FreeBSD), which has caused that
	implementations have very little interest in optimizing it, and
	thus is possibly one of the slowest <string.h> functions.

    POSIX; stpcpy(3)
	N2349 first suggests that

		strcat(strcpy(d, s1), s2)

	could be written as

		memccpy(memccpy(d, s1, '\0', SIZE_MAX) - 1, s2, '\0', SIZE_MAX)

	to be more efficient.  This is insanely dangerous.  I hope the
	intention of the paper was to allow compilers to rewrite that
	code, and not to suggest that programmers actually write that
	code.

	But even if this is for code generated by the optimizer, there's
	a much more efficient alternative (both in actual
	implementations, and in theoretical implementations that are
	perfectly optimized), which is to use POSIX's stpcpy(3).  This
	is the equivalent code using stpcpy(3):

		stpcpy(stpcpy(d, s1), s2)

	And in this case, this is code that can be written by humans.
	The simplicity of the interface makes it both more efficient
	and safer.

	stpcpy() would be another function interesting for
	standardization, but it's less important than the ones above, so
	let's ignore it in this first round.

	It would certainly allow compilers to generate much more
	efficient code, even when the programmer calls strcat(3).
	And it would allow programmers writing slightly more ergonomic
	code in certain cases.

    shadow; stpecpy();; Plan9; strecpy()
	Reading N2349 further, one finds an example of copying with
	truncation:

		char *p =3D memccpy (d, s1, '\0', dsize);
		dsize -=3D (p - d - 1);
		memccpy (p - 1, s2, '\0', dsize);

	This is more prone to bugs than the case above, and more than
	strncpy(3).  Anyone suggesting to use this to improve safety
	compared to strncpy(3), please, please, explain to me how they
	think this can be safe in any way.

	In fact, the code above is completely bogus, because if the
	string is truncated, p will be NULL, and it invokes UB in
	line 2.  See how it was predictably prone to bugs?  :)

	At the bottom of the N2349 paper, there's a more correct --and
	also more worrying-- example of how memccpy(3) could be used for
	copying strings with truncation.  This shows how terrible
	memccpy(3) is for copying strings:

		char *p =3D memccpy (d, s1, '\0', dsize);
		if (p) {
		  --p;
		  p =3D memccpy (p, "/", '\0', dsize - (p - d));
		  if (p) {
		    --p;
		    p =3D memccpy (p, s2, '\0', dsize - (p - d));
		  }
		}
		if (!p)
		  d[dsize - 1] =3D '\0';

	I think I don't need to explain what can go wrong in such
	unreadable, brittle, and complex code.

	It is evident that memccpy(3) must be removed from the standard.

	Using a more suitable function --similar to POSIX's stpcpy(3)--,
	this could be written much more safely:

		char *p =3D d;
		char *e =3D d + dsize;
		p =3D stpecpy(p, e, s1);
		p =3D stpecpy(p, e, "/");
		p =3D stpecpy(p, e, s2);
		if (p =3D=3D NULL)
			goto trunc;  // The string was truncated

	Here's how stpecpy() can be implemented for this:

		char *
		stpecpy(char *dst, const char *end, const char *restrict src)
		{
			ssize_t  dlen;

			if (dst =3D=3D NULL)
				return NULL;

			dlen =3D strtcpy(dst, src, end - dst);
			if (dlen =3D=3D -1)
				return NULL;

			return dst + dlen;
		}

	With the strtcpy()/strtcat() discussed above, it could be
	written as

		if (strtcpy(d, s1, dsize) =3D=3D -1)
			goto trunc;
		if (strtcat(d, "/", dsize) =3D=3D -1)
			goto trunc;
		if (strtcat(d, s2, dsize) =3D=3D -1)
			goto trunc;

	stpecpy() was invented by me, and is used in the shadow project.
	Plan9 provides a function that is essentially the same, under
	the name strecpy(2), although it reports truncation by returning
	'end' instead of NULL.  NULL is slightly safer, and programmers
	related to Plan9 have acknowledged that stpecpy() is slightly
	better because of this.  Again, independent implementations
	(several decades apart) seem to converge to this function.

	Like stpcpy(3) compared to strcpy(3)/strcat(3), this stpecpy()
	compared to strtcpy()/strtcat()  would be another function
	interesting for standardization, but less important than
	strtcpy()/strtcat(), so let's ignore it in this first round.

	It would certainly allow compilers to generate much more
	efficient code, even when the programmer calls strtcat().
	And it would allow programmers writing slightly more ergonomic
	code in certain cases.

    OpenBSD; strlcpy(3)/strlcat(3)
	OpenBSD invented a set of functions for copying with truncation
	(and thus, attempting to cover the same use case that
	 strtcpy()/strtcat() covers in shadow, or strscpy(9) in Linux).

	They invented strlcpy(3)/strlcat(3).

	They have two major flaws, though.  They copied the conventions
	from snprintf(3), which make error handling more difficult to
	detect (instead of a simple -1 error code or a NULL pointer,
	they return the hypothetical length of the string they tried to
	create).  Compare:

		if (strtcpy(d, s, countof(d)) =3D=3D -1)
		    goto trunc;
	vs
		if (strlcpy(d, s, countof(d)) >=3D countof(d))
		    goto trunc;

	The second example could be accidentally written with > instead
	of >=3D, which would result in an off-by-one bug.

	The other major flaw of strlcpy(3)/strlcat(3) is that it must
	read the entire source string, even after the function has
	noticed that it will truncate the string.  This makes it
	vulnerable to denial of service (DoS) if an attacker can control
	the length of the source string.

	They don't have any advantage that would compensate for these
	issues, so they seem inferior to strtcpy()/strtcat().

	POSIX standardized this pair of functions in POSIX.1-2024,
	mainly because they were the only functions in an existing libc
	implementation that copies a string with truncation.  This is
	because the Linux kernel has strscpy(9), but it is only
	available for internal code, and thus it wasn't a candidate for
	standardization.

    Annex K; strncpy_s()
	Annex K is bad, but strncpy_s() is especially bad within
	Annex K.  It has absolutely no relationship with strncpy(3).

	This is probably because Annex K was not written for meeting the
	needs of existing code, but rather designed by committee, with
	the attempt to remove all sources of UB at any cost.

	The group or groups that designed Annex K seems to have picked
	strncpy(3), and changed its semantics to make it free of UB,
	even if that means it doesn't serve its purpose anymore.

	The whole Annex K should be removed from the standard
	eventually.  However, strncpy_s() should be removed now,
	because we're removing badly named string (and nonstring)
	copying functions to avoid misuse, and this one is a case of
	a badly named function that will mislead users.

    Summary
	Let's consider now the most essential functions for
	standardization:

	-  strtcpy()		(strscpy(9) in Linux)
	-  strtcat()		(the 'cat' of strtcpy())
	-  memtostr()		(the 'cpy' of strncat(3))
	-  memtostrcat()	(strncat(3) renamed)
	-  strtomem()		(strncpy(3) renamed)

	These have proved in Linux that they serve to remove *all*
	misuses of strncpy(3), (and in shadow, of strncat(3) too).
	The reason why they work is that *both* they have an appropriate
	name and they cover the use cases that users need.

	Let's remove functions that are known to be bad:

	-  strncpy(3)		(actually, rename it to strtomem())
	-  strncat(3)		(actually, rename it to memtostrcat())
	-  memccpy(3)		(this one is just terrible and useless)
	-  strncpy_s()		(Annex K is bad; this is worse than bad)

	There are other interesting functions that will cover more use
	cases, and improve both efficiency and ergonomics/safety even
	further, which should be considered in a second round of
	standardization, after the first round proves successful.
	For then (maybe in some years from now), let's consider:

	-  stpcpy(3)		('p' version of strcpy(3))
	-  stpecpy()		('p' version of strtcpy())

	And as a general advice for programmers, please, please, use the
	right tools for the job.  If those tools are not available in
	your system, you should write them!  They won't cost you more
	than a few lines of code.  Misusing other function instead is
	just negligence, and will increase the chances of having
	important bugs.

Design decisions
	We could change the order of parameters to put the size first.
	However, because that would cause inconsistency between
	<string.h> functions, let's not gamble.

Proposed wording
	Based on N3886.

	(The wording for wide strings is not yet written.  First I want
	 to circulate a draft to discuss it, and then I'll do the boring
	 work of specifying the wide-string functions.)

    7.28.2  String handling <string.h> :: Copying functions
	@@ New subsections after 7.28.2.4 ("The strcpy function")
	+7.28.2.<4+1>  The <b>strtcpy</b> function
	+
	+Synopsis
	+1
	+	#include <string.h>
	+	ssize_t
	+	strtcpy(char *restrict dst, const char *restrict src, size_t dsize)
	+
	+Description
	+2
	+	The <b>strtcpy</b> function
	+	copies the string pointed to by <tt>src</tt>
	+	(including the terminating null character)
	+	into the array pointed to by <tt>dst</tt>.
	+	If any characters would cause the copy to
	+	write past the end of the array
	+	determined by <tt>dst</tt> and <tt>dsize</tt>,
	+	those characters are discarded,
	+	and a null character is written
	+	as the last character in the array.
	+	If <tt>dsize</tt> is zero
	+	or copying takes place between objects that overlap,
	+	the behavior is undefined.
	+
	+Returns
	+3
	+	The <b>strtcpy</b> function
	+	returns the length of the resulting string in <tt>dst</tt>
	+	if all characters were copied,
	+	or <tt>-1</tt>
	+	if any characters were discarded.

	## E2BIG need not be standardized, because -1 is enough to
	## determine truncation.  It is encouraged that implementations
	## also set errno to E2BIG, for consistency.  This
	## recommendation extends to all <string.h> functions that
	## truncate a source string: strtcpy(), strtcat(), strtomem().
	## Or maybe EMSGSIZE would be more appropriate?  Anyway, not
	## something that ISO C should care about.

	+7.28.2.<4+2>  The <b>memtostr</b> function
	+
	+Synopsis
	+1
	+	#include <string.h>
	+	char *
	+	memtostr(char *restrict dst, const char *restrict src, size_t ssize)
	+
	+Description
	+2
	+	The <b>memtostr</b> function
	+	copies not more than <tt>ssize</tt> characters
	+	(a null character and characters that follow it are not copied)
	+	from the array pointed to by <tt>src</tt>
	+	into the array pointed to by <tt>dst</tt>.
	+	A terminating null character is always appended to the result.
	+	XXX)
	+	If <tt>dst</tt> is a null pointer value
	+	or copying takes place between objects that overlap,
	+	the behavior is undefined.
	+
	+XXX)
	+	Thus,
	+	the maximum number of characters
	+	that can end up in the array pointed to by <tt>dst</tt>
	+	is <tt>ssize+1</tt>.
	+
	+Returns
	+3
	+	The <b>memtostr</b> function
	+	returns the value of <tt>dst</tt>.

    7.28.2.5  The strncpy function
	@@ Title
	-The strncpy function
	+The strtomem function

	@@ Synopsis, p1
		#include <string.h>
		char *
	-	strncpy(char *restrict s1, const char *restrict s2, size_t n)
	+	strtomem(char *restrict dst, const char *restrict src, size_t dsize)

	@@ Description, p2, p3
	-The <b>strncpy</b> function
	-copies not more than <tt>n</tt> characters
	-(characters that follow a null character are not copied)
	-from the array pointed to by <tt>s2</tt>
	-to the array pointed to by <tt>s1</tt>.
	-329)
	+The <b>strtomem</b> function
	+copies the string pointed to by <tt>src</tt>
	+(excluding the terminating null character)
	+into the array pointed to by <tt>dst</tt>.
	+If any characters would cause the copy to
	+write past the end of the array
	+determined by <tt>dst</tt> and <tt>dsize</tt>,
	+those characters are discarded.
	+Any unused elements of the array pointed to by <tt>dst</tt>
	+are filled with null characters.
	 If copying takes place between objects that overlap,
	 the behavior is undefined.
	-
	-If the array pointed to by s2
	-is a string that is shorter than n characters,
	-null characters are appended
	-to the copy in the array pointed to by s1,
	-until n characters in all have been written.

	## This rewrite doesn't change semantics, but it makes it more
	## evident what this function is good for.

	@@ Footnote 329
	-Thus,
	-if there is no null character
	-in the first n characters of the array pointed to by s2,
	-the result will not be null-terminated.

	## This is now evident, both by the name and the new description.
	## More importantly, let's remove this comment that could lead
	## programmers to think this might be useful for creating
	## strings.

	@@ Returns, p4
	+The <b>strtomem</b> function
	+returns the length of the resulting string in <tt>dst</tt>
	+if all characters were copied,
	+or a null pointer
	+if any characters were discarded.

	## There's a semantic change here compared to strncpy(3).  The
	## function now must read byte dsize+1 if a NUL wasn't present
	## in the first dsize characters of src, to determine whether
	## the source string was longer or not (to determine
	## truncation).

    7.28.3  String handling <string.h> :: Concatenation functions
	@@ New subsection after 7.28.3.1 ("The strcat function")
	+7.28.3.<1+1>  The <b>strtcat</b> function
	+
	+Synopsis
	+1
	+	#include <string.h>
	+	ssize_t
	+	strtcat(char *restrict dst, const char *restrict src, size_t dsize)
	+
	+Description
	+2
	+	The <b>strtcat</b> function
	+	appends a copy of the string pointed to by <tt>src</tt>
	+	(including the terminating null character)
	+	to the end of the string pointed to by <tt>dst</tt>.
	+	The initial character of <tt>src</tt>
	+	overwrites the null character at the end of <tt>dst</tt>.
	+	If any characters would cause the copy to
	+	write past the end of the array
	+	determined by <tt>dst</tt> and <tt>dsize</tt>,
	+	those characters are discarded,
	+	and a null character is written
	+	as the last character in the array.
	+	If <tt>dsize</tt> is zero
	+	or copying takes place between objects that overlap,
	+	the behavior is undefined.
	+
	+Returns
	+3
	+	The <b>strtcat</b> function
	+	returns the length of the resulting string in <tt>dst</tt>
	+	if all characters were copied,
	+	or <tt>-1</tt>
	+	if any characters were discarded.

    7.28.3.2  The strncat function
	@@
	s/strncat/memtostrcat/g
	s/s1/dst/g
	s/s2/src/g
	s/\<n\>/ssize/g

    7.33.4.3  Wide string copying functions
	TODO.

    7.33.4.4  Wide string concatenation functions
	TODO.

    K.3.7.2  Copying functions
	@@
	-K.3.7.2.4 The strncpy_s function

	## Remove the entire K.3.7.2.4 subsection.
	## Remove any references to strncpy_s in the entire standard.

--=20
<https://www.alejandro-colomar.es>

--xjrwwwmzytle7xrx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpmlNAACgkQ64mZXMKQ
wqnQhBAApBR6ngkxMIbDJpxXfVZB/GsFE6kdkAzfRvTACL/k2JQle6GjJJwNm9C/
8W2KQEMjRTSocT46WoY+10afvLLYlb/e0T8RKij2TMLfSIbQvent/2Wiw3PHFjDu
CiS3mmLe0WBPGhYiNBfyb7P9GlhpFIydi904Rka3cpEaOuM+WPQbguPLTXhJxkzV
BhIJzUiY0yPA1iyOTtUzMfENvcPpQw1mfWujta5mGIfJ6iPn/670gQOz3R77pHW+
8MG43yNNA+ZSNfOGSa7BKSp9PBfh+qH9wKTG/OLOXAEtj38VCbnBNqzs6qRk6tZ+
1U+brV1ulHxGs3sw+FyPNIoLDYOKv7dliyJxI5jry9toyc0E3KYsChRf1DXz33rY
wUUUQoZWOJSNyY3fj5+31IETuZRfshsBqbLEPM6u3NgwORl8/Kk7a9vb8UZIEbyF
XpHYSzzwGI7u4Pye5/BZefFwgeGE/bxRoRPUdBvT+1+5FSDDYntXOgGAgR4pkfzk
EdMsQnAUbWXYeDRt087SKzlQ3as7hfT49BxfBCmHW4YhM4403GWb21u4jYkqJPu1
7KIxSRFdVDDtnxg5IDs+EDcRYgN/o67qEKX7MqmM9iYVYv7eLMJ1Guvtra9rkyFZ
nXG4y1UG1u3g3SG25rPBVRib0PfhGdKy0lS9CL42fx4Vi46+boI=
=/BIJ
-----END PGP SIGNATURE-----

--xjrwwwmzytle7xrx--
