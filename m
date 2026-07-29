Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F58468C14
	for <linux-man@vger.kernel.org>; Wed, 29 Jul 2026 19:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785353005; cv=none; b=WfCCC51QqGsVN9lUhic7dXwPOAbiVPGcNLuGVYRaguafOhkXJkS7DZVHhcEz1mszLJ6ahwtCW5CkSPyLwbV83j0RsTCJX/6AxKt3QP4xDzqcNuyK5tIh+GqK025iKLkpkHk+UNlWG/yut6VdNheG0iXwesKszYZm0IU7Ht1TEig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785353005; c=relaxed/simple;
	bh=+zub4FK9gV01Vr9DELEnzRnc4A1Chqji3yfaHhM90wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cN64qlSIE+iJK9fCSmMB30k5T0e1g5kQ5eI7Noo4RDUdlo62Vrrcb0dCItGNqV44cJ3T88pUSR+SIxHr/K4B5n8jk9t278RvvCFHkAT0x+Emxy4TROG0rp+Qd0JHHF0OPbY3TVUqtu3EYXpgNpYdivBEenukdQ9exeRm71OtPr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BsKtXTJO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BsKtXTJO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFE11F000E9;
	Wed, 29 Jul 2026 19:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785353001;
	bh=UsQeFZBofBHjn+OC8RwPVdjP6bLGlt1Ib2Ts/ZO7plk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BsKtXTJOmYhFFPoqyhgZPyxbC8HcEB7pw/b0Qh0DL/wxOL+XrFTdS53vtfoSU3y6S
	 svuY/BkiyHG2+f3TijfegmBdMdhe02mhXMfH86XeucKzNtKLanoBEO76ZnZYFmcIPQ
	 ylV0CdmCCfW7XZTfykQf8Zy6pF6KmK2sgg/rsRvWtEwkaPvmOovptvZ3oFHjLId1u6
	 7twWT6f3II7NPx9w/KN5MBidt6SkUYrQJ8mGE14LmlxB/giQYtbDDL+82eb4vFuqug
	 RooN6vrqLopQlCM2UdVI4Rs+lF5jPYeHNwX7Gmhur9cTnSlE0YIv4PEO34Nj7FQMVE
	 ZYLKDQ5Gy5HAw==
Date: Wed, 29 Jul 2026 21:23:18 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: sergeh@kernel.org, linux-man@vger.kernel.org, 
	"Serge E. Hallyn" <serge@hallyn.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: alx-0096r1 - string (and nonstring) copying
Message-ID: <amo4wqgjuirq_otN@devuan>
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1783523064.git.alx@kernel.org>
 <b17a1548f3ab96216e6165bdd3194a80363e99f6.1783523064.git.alx@kernel.org>
 <amO0Wtmi4tpaGUKr@AUS2MQ6190Y76.amd.com>
 <amUw8ArFwmnsIKl1@devuan>
 <amaTpQxd52iYjlor@devuan>
 <CAMdZqKGFF-1fqsT0xSZDrBSGC-zztxayX3xAhFHXP-cKjEthpg@mail.gmail.com>
 <ami6Pbs0oT9gLi4W@devuan>
 <CAMdZqKE-ZkCWhH3yY7200qEYf7xtFQuhxsEi9jiLgnVU4gKoAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jgbblskvilm346pf"
Content-Disposition: inline
In-Reply-To: <CAMdZqKE-ZkCWhH3yY7200qEYf7xtFQuhxsEi9jiLgnVU4gKoAQ@mail.gmail.com>


--jgbblskvilm346pf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: sergeh@kernel.org, linux-man@vger.kernel.org, 
	"Serge E. Hallyn" <serge@hallyn.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: alx-0096r1 - string (and nonstring) copying
Message-ID: <amo4wqgjuirq_otN@devuan>
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1783523064.git.alx@kernel.org>
 <b17a1548f3ab96216e6165bdd3194a80363e99f6.1783523064.git.alx@kernel.org>
 <amO0Wtmi4tpaGUKr@AUS2MQ6190Y76.amd.com>
 <amUw8ArFwmnsIKl1@devuan>
 <amaTpQxd52iYjlor@devuan>
 <CAMdZqKGFF-1fqsT0xSZDrBSGC-zztxayX3xAhFHXP-cKjEthpg@mail.gmail.com>
 <ami6Pbs0oT9gLi4W@devuan>
 <CAMdZqKE-ZkCWhH3yY7200qEYf7xtFQuhxsEi9jiLgnVU4gKoAQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMdZqKE-ZkCWhH3yY7200qEYf7xtFQuhxsEi9jiLgnVU4gKoAQ@mail.gmail.com>

Hi Mark,

> Date: 2026-07-29 10:27:15-0700
> From: Mark Harris <mark.hsj@gmail.com>
>
>  Alejandro Colomar wrote:
> > >  4.3 BSD (1986) then also added the mem*()
> > > functions for System V compatibility.  Later the C89 committee chose
> > > to standardize the mem*() functions but moved them from their own
> > > header file memory.h (introduced by System V) to string.h with the
> > > str*() functions.
> >
> > Wow!  This is very interesting.  So, after all, we shouldn't blame old
> > Unix systems, but the C Committee!!  Another very important issue to add
> > to the list of bad inventions of the committee.  :)
> >
> > I wish we could re-introduce the <memory.h> header, and move these back
> > there (of course, with compat declarations in <string.h>).
>=20
> Since you propose to add functions like memtostr() and strtomem(), I
> would think that having them both in the same header file would be
> beneficial.  Otherwise it would add yet another area of potential
> confusion for users:  Do I need to include memory.h or string.h for
> strtomem()?

Actually, I'd use a third header file for these hybrids: <nonstring.h>.
All of the current strn*() functions belong there.
They don't belong in either <memory.h> or <string.h>.

>  Does it depend on the source or destination argument?  I
> thought the goal was to reduce confusion.
>=20
> > > That is, memtostr(str, mem, n), introducing a whole
> > > new area of potential confusion that was not present in any existing
> > > mem*() or str*() functions.  If reducing potential confusion is that
> > > important I would have expected maybe strfrommem(str, mem, n) or
> > > similar.
> >
> > Hmmmm, interesting suggestion!  That makes it resemble the strfromd(3)
> > family, with which it actually has some (minor) relation.  (It might be
> > a bit
> >
> > strfrommemcat() would be a weird name, because the cat is next to mem
> > instead of str.  Should it be strcatfrommem()?
>=20
> I think that strcatfrommem() is better than strfrommemcat().

Agree.

>  Although
> I am not convinced that it is worth changing the name of a
> well-established 49-year-old function just because the name may
> confuse some people, especially if it may end up just exchanging one
> area of confusion for a different one that people haven't even yet
> learned to watch out for.
>=20
> > On the other hand, there's precedent in strtol(3) having the arguments
> > reversed compared to the name.  Programmers are used to having the
> > destination in the first parameter.
>=20
> strtol() is fine, because str is first in the name and is also the
> first argument.

Ouch, I was wrong.  Every time I read the strtol() manual page, I get
confused by the 'nptr' argument, which looks like it'd be a pointer in
which to store the number.  I'll change it to 's'.

>  What makes memtostr() confusing is that mem is
> mentioned first in the name but it is the second argument, and str is
> mentioned second but it is the first argument.
>=20
> > [...]
> > > >     shadow; strtcpy(), strncpy(3)
> > > >         The shadow project more or less agrees with the Linux kerne=
l in
> > > >         this regard.  It has implemented strtcpy(), and uses strncp=
y(3).
> > > >         It doesn't have memtostr() yet, because it happens to always
> > > >         allocate the buffer at the same time, using strndup(3) --wh=
ich
> > > >         is essentially malloc(3)+memtostr()--, but that will change
> > > >         soon, because (non-VLA) arrays are safer, as they allow
> > > >         validation of source and destination sizes at compile time.
> > > >
> > > >         The implementations are independent, and happened to be
> > > >         fundamentally identical.  It seems that good implementation=
s of
> > > >         string and nonstring copying code converge to this set of
> > > >         interfaces.
> > > >
> > > >         Here's a naive implementation of strtcpy():
> > > >
> > > >                 ssize_t
> > > >                 strtcpy(char *restrict dst, const char *restrict sr=
c, size_t dsize)
> > > >                 {
> > > >                         bool    trunc;
> > > >                         size_t  dlen, slen;
> > > >
> > > >                         if (dsize =3D=3D 0)  // UB
> > > >                                 abort();
> > > >
> > > >                         slen =3D strnlen(src, dsize);
> > > >                         trunc =3D (slen =3D=3D dsize);
> > > >                         dlen =3D slen - trunc;
> > > >
> > > >                         stpcpy(mempcpy(dst, src, dlen), "");
> > > >
> > > >                         if (trunc) {
> > > >                                 errno =3D E2BIG;
> > > >                                 return -1;
> > > >                         }
> > > >
> > > >                         return slen;
> > > >                 }
> > >
> > > ISO C does not have ssize_t or E2BIG.
> >
> > I'm aware; this is a push to add ssize_t.  In the wording, I have
> > specified strtcpy() as not-necessarily setting errno, though, since it's
> > not strictly necessary.
> >
> > >  Also this API does not handle
> > > the case of slen too large for ssize_t, which may not be an issue for
> > > Linux, however ISO C has to support a much wider range of systems.
> > > The same issues apply to strtcat().
> >
> > I believe sizes beyond ssize_t are not valid.  At least, for a ssize_t
> > that matches ptrdiff_t.  No object may be larger than PTRDIFF_MAX,
> > because that would mean that pointer subtraction would be undefined:
> >
> >         char *first =3D a;
> >         char *end =3D a + sizeof(a);
> >
> >         end - first;  // Overflows ptrdiff_t
> >
> > That's because pointer subtraction happens on ptrdiff_t instead of
> > size_t.  Thus, we don't need to care about sizes larger than SSIZE_MAX.
>=20
> ISO C allows objects to have a size up to SIZE_MAX (=C2=A7 6.2.5).  ISO C
> does not limit objects to size PTRDIFF_MAX, it just says that the
> pointer subtraction is undefined if the result is not representable in
> an object of type ptrdiff_t (=C2=A7 6.5.7).  It is the responsibility of
> your code to avoid undefined behavior.  Glibc malloc() deliberately
> fails on sizes > PTRDIFF_MAX to help clients to avoid this undefined
> behavior, but that is not an ISO C requirement and it is still
> possible to obtain such an object in other ways.

Yup.

>  Also some systems
> (e.g. with segmented or banked memory models) have a ptrdiff_t that is
> larger than size_t.

I'm interested in those systems.  Do they support POSIX.1-2024 and/or
ISO C23?  We were discussing the possibility of standardizing ssize_t in
ISO C, and also adding a requirement that it's as large as size_t, and
also potentially adding a requirement that it's the same type as
ptrdiff_t.

It would be good to know if those systems that have a larger ptrdiff_t
are still alive or can be ignored/forced to adapt.

> > [...]
> > > >     System V; memccpy(3)
> > > >         memccpy(3) was invented in System V (like the other mem*()
> > > >         functions).  The System V sources are not public (AFAIK), so
> > > >         it's not known what this function was designed for.  It was
> > > >         later added to the BSDs and glibc for compatibility with Sy=
sV,
> > > >         but nobody really knew what this function is good for.  It
> > > >         doesn't seem ergonomic for any basic functionality.
> > >
> > > It is for implementing functions like fgets(), which needs to copy the
> > > next '\n'-delimited line from a buffer filled by read() (so not a
> > > null-terminated string).
> >
> > Hmmmm, do you have any such code?  I'd be interested in reviewing it.
> > I still suspect it might have been better if it didn't copy the
> > terminator.
>=20
> Sure.
> https://github.com/illumos/illumos-gate/blob/4b44494cae63d4bf0c7d3f348285=
03e68d1c0e69/usr/src/lib/libc/port/stdio/fgets.c#L44

Thanks!

Let's now consider an alternative world where there was a function with
semantics similar to memccpy(3) with one difference: it wouldn't copy
the delimiter.  Let's call such a function memcpyc().  Here's a naive
implementation of memccpy(3):

	void *
	memccpy(void *dst, const void *src, int c, size_t n)
	{
		unsigned char  *d =3D dst;
		unsigned char  *s =3D src;

		for (size_t i =3D 0; i < n; i++) {
			*d++ =3D *s++;
			if (*s =3D=3D c)
				return d;
		}
		return NULL;
	}

Here's a naive implementation of the hypothetical memcpyc():

	void *
	memcpyc(void *dst, const void *src, int c, size_t n)
	{
		unsigned char  *d =3D dst;
		unsigned char  *s =3D src;

		for (size_t i =3D 0; i < n; i++) {
			if (*s =3D=3D c)
				return d;
			*d++ =3D *s++;
		}
		return NULL;
	}

(I've written both of the above quickly, without compiling nor testing;
 I might have made a mistake.)

With such a function, the fgets(3) implementation from Illumos gate
would change in this manner:

	diff --git i/usr/src/lib/libc/port/stdio/fgets.c w/usr/src/lib/libc/port/s=
tdio/fgets.c
	index 9401217410ca..ac1f330ea46e 100644
	--- i/usr/src/lib/libc/port/stdio/fgets.c
	+++ w/usr/src/lib/libc/port/stdio/fgets.c
	@@ -82,9 +82,12 @@ fgets(char *buf, int size, FILE *iop)
					break;          /* nothing left to read */
			}
			n =3D (int)(size < iop->_cnt ? size : iop->_cnt);
	-               if ((p =3D memccpy(ptr, (char *)iop->_ptr, '\n',
	+               if ((p =3D memcpyc(ptr, (char *)iop->_ptr, '\n',
			    (size_t)n)) !=3D NULL)
	+               {
	+                       p =3D stpcpy(p, "\n");
				n =3D (int)(p - ptr);
	+               }
			ptr +=3D n;
			iop->_cnt -=3D n;
			iop->_ptr +=3D n;

IMO, this wouldn't make it more complex.  However, such a hypothetical
memcpyc() would be much more useful elsewhere.  For example, it would
simplify the two unique uses of memccpy(3) in FreeBSD:

	diff --git i/bin/sh/parser.c w/bin/sh/parser.c
	index 0c1b7a91c257..713a35ad8cd8 100644
	--- i/bin/sh/parser.c
	+++ w/bin/sh/parser.c
	@@ -2116,7 +2116,7 @@ getprompt(void *unused __unused)
				if (fmt[0] !=3D '}') {
					char *end;
	=20
	-                               end =3D memccpy(tfmt, fmt, '}', sizeof(tfm=
t));
	+                               end =3D memcpyc(tfmt, fmt, '}', sizeof(tfm=
t));
					if (end =3D=3D NULL) {
						/*
						 * Format too long or no '}', so
	@@ -2129,7 +2129,7 @@ getprompt(void *unused __unused)
						fmt--;
						break;
					}
	-                               *--end =3D '\0'; /* Ignore the copy of '}'=
=2E */
	+                               *end =3D '\0'; /* Ignore the copy of '}'. =
*/
					fmt +=3D end - tfmt;
				}
				now =3D localtime(&(time_t){time(NULL)});
	diff --git i/lib/libc/amd64/string/strncat.c w/lib/libc/amd64/string/strnc=
at.c
	index 2c63ab50b3c3..4a1e8c0119ac 100644
	--- i/lib/libc/amd64/string/strncat.c
	+++ w/lib/libc/amd64/string/strncat.c
	@@ -19,13 +19,13 @@ strncat(char *dest, const char *src, size_t n)
		char *endptr;
	=20
		len =3D strlen(dest);
	-       endptr =3D __memccpy(dest + len, src, '\0', n);
	+       endptr =3D memcpyc(dest + len, src, '\0', n);
	=20
		/* avoid an extra branch */
		if (endptr =3D=3D NULL)
	-               endptr =3D dest + len + n + 1;
	+               endptr =3D dest + len + n;
	=20
	-       endptr[-1] =3D '\0';
	+       *endptr =3D '\0';
	=20
		return (dest);
	 }

memccpy(3) is a bad design, which forces complex code, prone to
off-by-one bugs.

> > [...]
> > > >     POSIX; memccpy(3)
> > > >         POSIX standardized memccpy(3) just because it was in System=
 V.
> > > >         POSIX derives from Issue 1 of the SVID.  It's not surprising
> > > >         that it's there.  Especially, this function was always in P=
OSIX,
> > > >         and the early revisions of POSIX are known to have strong
> > > >         preference for SysV functions, regardless of their quality =
or
> > > >         widespread use.
> > > >
> > > >         Interestingly, POSIX mentions that memccpy(3) does not chec=
k for
> > > >         overflow.
> > > >
> > > >         > The memccpy() function does not check for the overflow of=
 the
> > > >         > receiving memory area.
> > > >
> > > >         This is because the 4th parameter to memccpy(3) is not the =
size
> > > >         of the destination buffer, but the size of the source buffe=
r.
> > > >         It is assumed that the destination buffer is large enough.
> > >
> > > That is silly; the maximum size applies to both the source and
> > > destination, like memcpy().  Obviously if one is smaller than the
> > > other, you must not pass in a size that is larger than the smaller of
> > > the two, as with memcpy().
> > >
> > > >
> > > >         This hints that the original (System V) authors of the func=
tion
> > > >         didn't consider copying strings as a use case for this func=
tion.
> > >
> > > It's a "mem" function, not a "str" function, so it should be clear
> > > that it is intended for processing byte arrays and not null-terminated
> > > strings.  That said, if you wanted to I guess you could use it to
> > > implement a function like your strtcpy() pretty easily:
> > >
> > >     if (dsize =3D=3D 0) abort();
> > >     char *p =3D memccpy(dst, src, '\0', dsize);
> > >     return p ? p-dst-1 : (dst[dsize-1] =3D '\0', -1);
> >
> > FWIW, I wouldn't call this 'pretty easily', but this is a bit
> > subjective.  I'd possibly make bugs in the code above.
>=20
> It is shorter than your "naive" strtcpy() implementation,

I can golf too, but lines of code isn't a good measure of simplicity,
unless you limit to certain common guidelines such as avoiding that
tricky comma operator in the third line.

Ignoring the abort() line, which is identical to my implementation, I'd
write it as this, for a fair comparison:

	char  *p;

	p =3D memccpy(dst, src, '\0', dsize);
	if (p =3D=3D NULL) {
		dst[dsize-1] =3D '\0';
		return -1;
	}

	return p-dst-1;

That's only slightly shorter than my implementation of strtcpy() with
strnlen(3)+mempcpy(3) (ignoring also errno).

Moreover, it's full of '-1's, which give plenty of opportunities of
making a mistake (adding one '-1' too much, or forgetting to put one),
and resulting in a bug.

> and doesn't
> depend on an undocumented non-C23 function.

You mean mempcpy(3), I guess.  I am working on standardizing it.  In any
case, you can use good ol' memcpy(3).  After all, it's as simple as
this:

	void *
	mempcpy(void *dest, const void *src, size_t n)
	{
		return (char *)memcpy(dest, src, n) + n;
	}

Here's an implementation using exlusively old POSIX functions:

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

		strcpy(memcpy(dst, src, dlen) + dlen, "");

		if (trunc) {
			errno =3D E2BIG;
			return -1;
		}

		return slen;
	}

Now, let's do something interesting: let's see how this would be
implemented with the memcpyc() I've implemented above.

	char  *p, *nul;

	p =3D memcpyc(dst, src, '\0', dsize);
	nul =3D p ?: dst+dsize-1;
	strcpy(nul, "");
=09
	return p ? p-dst : -1;

It still contains one '-1' too much for my taste, but it'd be more
acceptable.  Actually, memcpyc() would be better for implementing
stpecpy() --similar to Plan9's strecpy(2)--:

	char *
	stpecpy(char *dst, const char *end, const char *restrict src)
	{
		char  *p;

		if (dst =3D=3D NULL)
			return NULL;

		p =3D memcpyc(dst, src, '\0', end - dst);
		strcpy(p ?: end-1, "");

		return p;
	}

And then this stpecpy() could be used for implementing strtcpy():

	ssize_t
	strtcpy(char *restrict dst, const char *restrict src, size_t dsize)
	{
		char  *p;

		p =3D stpecpy(dst, dst + dsize, src);
		return p ? p-dst : -1;
	}


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--jgbblskvilm346pf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpqUyAACgkQ64mZXMKQ
wqlDNRAArVuxem3F9EC4fHL6xSfIng2TV49YfoTeBaWvTaURZHEbx2WYvmykHUm8
98W60/nbO9guVQ25MrsOEyn1r7VYp/8PsSfKIi+OW3vLySXapjz1+NgZL+osE/Yf
mi03kV0YYYLkhdQpml3h2PjYZNxnS6vySpSvS1wlF4GNQWx4rEfwVWzA7mVsY5oP
INMA7spEgn8XeP2kBARmSZuTbfReXbaonjycrnl7I4JxEhHvxU6pnh2VTAWpJtkh
/gGK2Hd/qcg/zu0yCnOr7v7yRTe60+FQuuwR96UZhzKmcnUbjiu1P58NZm28sqLf
3OPfIMHPWIQggH7nJkUbr4teNc2EcXeulnihqBWMOKjPU2sSyPWX5wFipuCDdP4z
IIV9a8zDBL++JaXcs2i2chheoPElWNg2QizBayJGiVaOptdOH0NC2Gefkwgsroxm
UnMmx0JowBsvJ76n9r+DjXBcS5cE/mEBN01rcWbykw211LIcitqxAkmemPdoxDHu
q/8BuWKY2cJuzGjbhhVIE8mrwwllPEbEevb2HzTKf2lMjwq3gsIxbvD2tKp/rbMR
0eKkX+Ba7wEHuJT8QaSi4vWsUitrHWfeZ3ZoOI7pCV6fdA9wyAG6wnhFa+iW3llG
vrpIm6lnFhdowj8gDzv1C3ltaOp3SJhyUSZf3izjcEQhkEacoOk=
=PtmM
-----END PGP SIGNATURE-----

--jgbblskvilm346pf--
