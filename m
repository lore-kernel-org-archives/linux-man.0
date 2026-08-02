Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1E54A21
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 13:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785676625; cv=none; b=kfxHEO8vB3CXTHYFd5UJpOypK3CaZQyWawWXFTQExmJL254/fnwCyvj6zUcZyJ5kIzt4rk0wP4slqCxNIbQmEdlq9YLx/QaOtj5EHZ+rFA/hQlN6h23/nZx5s1cQwaXT3PAah79vxVgneoRsjtTuPgqPE94V28M+KeARsMDspvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785676625; c=relaxed/simple;
	bh=cjyjrofwlPHMs4xxGTB4DMvQG4XkeToSPTmsjvpa3/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8ThxKsu9ylFGoHvwN5EkAKLASRJ4t6O+QwGEIe0I9UbE9llaS5Q2tmIoSVpWwomuIlNZ+bzTzoTyfA7Nb/GdjAp1dOBZZ/BxsbKlV+4jzTpQoBC8K6B/3b5OuyJ5AC8/4vGmPCXyDyyPUn2rZRMkscMg5W+iz7yLhdXOfKyY2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6xcoyNu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R6xcoyNu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6EE71F000E9;
	Sun,  2 Aug 2026 13:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785676623;
	bh=93+xjsmT1zpAYu19WfZGjvBX1TKtWSmDg4LKEuBUaho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R6xcoyNuL5blWdHViymuNOtcUAvhWlP3D96YmYZEDW0gWRS7SeBvqrHXGdB32g2UQ
	 AfLI1LtugNNXYoK43ni/MNdaaq9RfQ8v4FhrMda2Vh8bRTeEV5FeEo0/LoxKPaFzbx
	 imiGgMCjNQLZCIRJjLPwnaHngEwgh/YXeeqDA4M13So8UFW1+3qX21iC8Qtt6LHU+d
	 3SBTRNrgfboYg0mzTWHSC7S/glayrt8/OjdPjR3V8RexkuyDuhO7RufArdJbW3LmEQ
	 +g2g1yO5NeTIrtpOhhmo29fTndlHISQBJ0wdew9SByX5h9YHJk/0aqq3AAbt70u8Ep
	 yXaa1Wj7F3O3w==
Date: Sun, 2 Aug 2026 15:17:00 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Steve Summit <scs@eskimo.com>
Cc: bug-gnulib@gnu.org, libc-alpha@sourceware.org, 
	linux-man@vger.kernel.org
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <am8_MfPmud43naU-@devuan>
References: <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
 <am5_uA4MSujYCS9X@devuan>
 <2026Aug02.0852.scs.0001@tanqueray.home>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="na2pdvzcmheiie35"
Content-Disposition: inline
In-Reply-To: <2026Aug02.0852.scs.0001@tanqueray.home>


--na2pdvzcmheiie35
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Steve Summit <scs@eskimo.com>
Cc: bug-gnulib@gnu.org, libc-alpha@sourceware.org, 
	linux-man@vger.kernel.org
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <am8_MfPmud43naU-@devuan>
References: <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
 <am5_uA4MSujYCS9X@devuan>
 <2026Aug02.0852.scs.0001@tanqueray.home>
MIME-Version: 1.0
In-Reply-To: <2026Aug02.0852.scs.0001@tanqueray.home>

Hi Steve,

> Date: 2026-08-02 08:52:04-0400
> From: Steve Summit <scs@eskimo.com>
>
[...]
> Certainly,
> today, strncpy and strncat are the new gets.

This is deeply incorrect.

gets(3) is a function that can't possibly be used safely.

strncpy(3) is a fine function for copying a string into a fixed-width
buffer.  strncat(3) is a fine function for appending a
[[gnu::nonstring]] to a string.  strncpy/cat(3) are bad when they are
misused, just like a screwdriver is bad for hammering nails.

gets(3) is not that.

This is something that even most of the people disagreeing to this
proposed change agree with.

> (As it happens,
> I've been spending real time just in the past few weeks coping
> with the fact that not every Linux C compiler I use ships with
> a glibc that supports strlcpy and strlcat.)

strlcpy/cat(3) have their own issues, although admittedly a DoS is
better than a buffer overflow.

Ideally, you should be looking for strscpy(9); but you should write it
yourself, because it's not provided by any libraries.

> But with that said, the place for those "interesting arguments"
> is not a man page!  Man pages are supposed to be maximally
> pithy.  Just the facts, ma'am.

"The facts" is more subjective than it seems at first glance.

Just some examples of manual pages before I touched them, to show that
I'm not even innovating.  Maybe because I CC people I know disagree with
me, I get more vocal opposition, I guess.

Here's part of str[n]cpy(3) well before I got involved in the project.

	DESCRIPTION
	     The strcpy() function copies the string pointed to by src,
	     including  the terminating null byte ('\0'), to the buffer
	     pointed to by dest.  The strings may not overlap, and  the
	     destination  string  dest  must be large enough to receive
	     the copy.  Beware of buffer overruns!  (See BUGS.)

	     The strncpy() function is similar, except that at  most  n
	     bytes  of  src  are  copied.  Warning: If there is no null
	     byte among the first n bytes of src, the string placed  in
	     dest will not be null=E2=80=90terminated.

	     If  the length of src is less than n, strncpy() writes ad=E2=80=90
	     ditional null bytes to dest to ensure that a  total  of  n
	     bytes are written.

	     A simple implementation of strncpy() might be:

		 char *
		 strncpy(char *dest, const char *src, size_t n)
		 {
		     size_t i;

		     for (i =3D 0; i < n && src[i] !=3D '\0'; i++)
			 dest[i] =3D src[i];
		     for ( ; i < n; i++)
			 dest[i] =3D '\0';

		     return dest;
		 }
	NOTES
	     Some  programmers consider strncpy() to be inefficient and
	     error prone.  If the programmer knows (i.e., includes code
	     to test!)  that the size  of  dest  is  greater  than  the
	     length of src, then strcpy() can be used.

	     One  valid  (and intended) use of strncpy() is to copy a C
	     string to a fixed=E2=80=90length buffer while ensuring  both  that
	     the  buffer is not overflowed and that unused bytes in the
	     destination buffer are zeroed out (perhaps to prevent  in=E2=80=90
	     formation leaks if the buffer is to be written to media or
	     transmitted  to another process via an interprocess commu=E2=80=90
	     nication technique).

	     If there is no terminating null byte in the first n  bytes
	     of src, strncpy() produces an unterminated string in dest.
	     If  buf has length buflen, you can force termination using
	     something like the following:

		 if (buflen > 0) {
		     strncpy(buf, str, buflen - 1);
		     buf[buflen - 1]=3D '\0';
		 }

	     (Of course, the above technique ignores the fact that,  if
	     src  contains  more  than buflen - 1 bytes, information is
	     lost in the copying to dest.)

	   strlcpy()
	     Some systems (the BSDs, Solaris, and others)  provide  the
	     following function:

		 size_t  strlcpy(char  *dest,  const  char *src, size_t
	     size);

	     This function is similar to strncpy(), but  it  copies  at
	     most  size-1 bytes to dest, always adds a terminating null
	     byte, and does not pad the destination with (further) null
	     bytes.  This function fixes some of the problems  of  str=E2=80=90
	     cpy()  and strncpy(), but the caller must still handle the
	     possibility of data loss if size is too small.  The return
	     value of the function is the length of src,  which  allows
	     truncation  to  be easily detected: if the return value is
	     greater than or equal to size,  truncation  occurred.   If
	     loss of data matters, the caller must either check the ar=E2=80=90
	     guments  before  the  call,  or  test  the function return
	     value.  strlcpy() is not present in glibc and is not stan=E2=80=90
	     dardized by POSIX, but  is  available  on  Linux  via  the
	     libbsd library.

	BUGS
	     If  the  destination  string  of  a  strcpy() is not large
	     enough, then anything might  happen.   Overflowing  fixed=E2=80=90
	     length  string buffers is a favorite cracker technique for
	     taking complete control of the machine.  Any time  a  pro=E2=80=90
	     gram reads or copies data into a buffer, the program first
	     needs to check that there=E2=80=99s enough space.  This may be un=E2=
=80=90
	     necessary if you can show that overflow is impossible, but
	     be  careful:  programs  can get changed over time, in ways
	     that may make the impossible possible.

You may have thought that the manual pages have never been opinionated
before, and that they were strict about containing facts.  That's never
been true, though.  You may or may not agree with the previous
non-facts, but that doesn't make them more valid.

> Finally, I really don't think that the the mapping between
> function x and header <y.h>, a mapping which I characterized as
> somewhat arbitrary, is something that the average programmer pays
> that much attention to.  If strncpy or memset is to be found in
> a header called <string.h>, that doesn't tell us that these
> functions operate on strings,

That contradicts explicit claims by programmers in CC in this thread,
who have complained during code review (some months ago) that if
strncpy(3) is in <string.h>, then it must be because it's for copying
strings, and that I must thus be wrong rejecting code using it for
copying strings.

> any more than ssprintf appearing in
> <stdio.h> implies that ssprintf does I/O.  So let's put the
> arguing, and the opinionating, and the educating, somewhere else,
> and have the man pages document (nay, recommend) precisely the
> headers that the Standard(s) say are standard.


Have a lovely day!
Alex

> Steve Summit
>=20

--=20
<https://www.alejandro-colomar.es>

--na2pdvzcmheiie35
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpvQ0YACgkQ64mZXMKQ
wqlLkBAAo2yYio9jWgKIx0Fx68Pva7zcanh3Hdc+7xl6MRB3cK80yrIVODOYBFP7
sgf0n+rLdCstm9a/7eU8vsYlRwF7AluT/w5GAHsRQStZEcsIQb5LfzNfUdvsxDqK
SU9RIiWJlmk/orGcIWNrJPErieUkFvLzeR6a8Orvstuozpilf9HED1L32dpTuvG/
wweku08hPFkcCA1OKaETuEmmYdijmkc5szojPsBSURTPKhEN07XP/J8gY3g12MFG
kxQjI2aZxoITMHznOie9YGDVupOL0UCz3CSxEf/HY1QVIVYvlOWo9Hbbf14nAqax
Q2CSDI7t9b3rv7kPSxbEzRGvIGq3Mt8tSlesWN3hs+MWO8mhpcD4i0x9X+YzZ/U7
yFJOs80U+r+WFimjaH9V+QJkhhewUryXkcj3DzZHXL6HEFcXcR0/FbCGJGDJ/hZm
mkHmuCJ+IZVsGT95wrufaWTIYBpIuAlLqFFCaxU2yY5JWOFT5Ri22TWhhxEQ2+BF
IWGiDIJelT/CdmTJiJ3/utjwRGeGR7n3I529CITray+syJRpn91wMd+edR/X6Tg2
wxJ71RwOQb6tBl+Cpn+jk8Y+VDK5OeRnygnZhY8g4mWCTghB0rGHp0e0dXCdKBvQ
+UnUzfiurpGgqUhNPJHVwNpvKP3kXhmMPrjv+ckLEPjHikmmz3k=
=0ofT
-----END PGP SIGNATURE-----

--na2pdvzcmheiie35--
