Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC5D30B517
	for <linux-man@vger.kernel.org>; Tue, 28 Jul 2026 15:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785251061; cv=none; b=pxfR3LaNdbYgfZiblfo9TlfIu/PGs8M9A0PM2NIIEeRrTcJTRfEzRM98USYAWrhhuzQ4NTJHcfpavhiPW1hWi6CROwFka/72FfDE8QXwkjdXwAX6ZUtPiOAFBPcgBx/tiPi3cIuzLH93+AK8EblYUSpThV5Bv2pyNR9m6g+1Q70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785251061; c=relaxed/simple;
	bh=jXQqXN250/cldiYcwDkwHYU4fSLAfhmcPt7NCNm39gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVbzNGpHhx5pTOoMZCSBcuMXdoczm3juYrTxfMgXmn7anmP64oEiYM+EAhzBL1NsoOdp2SUsYOXdFDPGxx9JhHQqxYjTS86B6A/abyr2vz9rE4I6fGIOIxsyVVp5Bo2eWr8fvR1ipzHbVZ9dyQEmY2itWT1m5VdrjaBkQlMz9wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EevWKofz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EevWKofz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1E81F000E9;
	Tue, 28 Jul 2026 15:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785251059;
	bh=YztB+IRLH6HJnMz9VrsFzTTluQtUWSmNpnaV/GpRcwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EevWKofzJ0a3xEPJD+uubqYizm5REcjd+X2XrnPw4uXau5j03/46tTXNAR4ojPgA+
	 ZCfNxInwzz/yzgkCSRQVj8kfH8UniBEeH+vAJj8gmCJDgtPsUVN0uB/j3IU9zPEB0A
	 pgKGt+QIBSq0hudYdiN9yEzMgLHaCAtrAo1u9h2HAhx8LQFgBP40Qud2/kOBqgbb9K
	 IosGEBbT6AmS7TGALkuF8oVGnyBx9IjwG3RYmyd4YdGbnBmAnOshkKJvLurCl8eNDq
	 UjHv6XAW8Lc15t8XGgtOV+x7UGw/f4St/PrPfcjYmyjCP4wY5qmoK8jPumdsjobqck
	 pfXc8oxbQlzUw==
Date: Tue, 28 Jul 2026 17:04:15 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: sergeh@kernel.org, linux-man@vger.kernel.org, 
	"Serge E. Hallyn" <serge@hallyn.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: alx-0096r1 - string (and nonstring) copying
Message-ID: <ami6Pbs0oT9gLi4W@devuan>
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1783523064.git.alx@kernel.org>
 <b17a1548f3ab96216e6165bdd3194a80363e99f6.1783523064.git.alx@kernel.org>
 <amO0Wtmi4tpaGUKr@AUS2MQ6190Y76.amd.com>
 <amUw8ArFwmnsIKl1@devuan>
 <amaTpQxd52iYjlor@devuan>
 <CAMdZqKGFF-1fqsT0xSZDrBSGC-zztxayX3xAhFHXP-cKjEthpg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="si4or6e3ckhupbv4"
Content-Disposition: inline
In-Reply-To: <CAMdZqKGFF-1fqsT0xSZDrBSGC-zztxayX3xAhFHXP-cKjEthpg@mail.gmail.com>


--si4or6e3ckhupbv4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: sergeh@kernel.org, linux-man@vger.kernel.org, 
	"Serge E. Hallyn" <serge@hallyn.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: alx-0096r1 - string (and nonstring) copying
Message-ID: <ami6Pbs0oT9gLi4W@devuan>
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1783523064.git.alx@kernel.org>
 <b17a1548f3ab96216e6165bdd3194a80363e99f6.1783523064.git.alx@kernel.org>
 <amO0Wtmi4tpaGUKr@AUS2MQ6190Y76.amd.com>
 <amUw8ArFwmnsIKl1@devuan>
 <amaTpQxd52iYjlor@devuan>
 <CAMdZqKGFF-1fqsT0xSZDrBSGC-zztxayX3xAhFHXP-cKjEthpg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMdZqKGFF-1fqsT0xSZDrBSGC-zztxayX3xAhFHXP-cKjEthpg@mail.gmail.com>

Hi Mark,

Thank you very much for the thorough review!

On 2026-07-28T05:05:51-0700, Mark Harris wrote:
[...]
> >     Seventh Edition Unix; strncpy(3)
> >         strncpy(3) was first introduced in Seventh Edition Unix (V7).
> >
> >         It was added for one very specific use case: copying a source
> >         string into a destination character sequence in a fixed-size
> >         member of a structure (not a string), and padding the unused
> >         bytes with '\0'.
> >
> >         This was useful bad then in members of the utmp(5) structure,
> >         and modern shadow-utils still need this function for dealing
> >         with utmp(5).
>=20
> It used to be much more common.  For example, in V7 Unix there was
> only one filesystem type and no opendir()/readdir(); any user program
> wanting to read the contents of a directory would open() it for
> reading like any other file and read the sequence of 16-byte directory
> entries, each of which is a 2-byte inode number followed by a
> fixed-size 14-byte filename.  A shorter filename was padded with null
> bytes at the end but there was no null if it was exactly 14 bytes (the
> maximum length).  strncpy() could write this kind of fixed-length
> field, and strncat() could append such a filename to a path string.

Indeed.  These days, cheap storage means these 1-byte savings are less
common.  They still appear in some cases, but they're significantly less
common.

> At https://softwareengineering.stackexchange.com/questions/438025/what-wa=
s-the-original-purpose-of-c-strncpy-function/450802#450802

Hmmmm, thanks for the link!  That's interesting.

> the original author (or so they claim) says that the original
> motivation was to handle the fixed length command name in process
> accounting records.

The claim seems credible.  He gives some detail that seems likely true:

He says the strncpy(3) functions were previously called strcpyn().
While I can't verify this, there's the macro SCPYN().  I had always
wondered why they reversed the order in the name --the natural thing
would be to call it SNCPY()--.  If the original strncpy(3) was called
strcpyn(), this would make sense.

[...]
> >     System V; mem*() functions
> >         Back in the times of V7, the concept of a string was less
> >         specific, and what we now call byte arrays, they called byte
> >         strings.  In fact, memcmp(3) was then called bcmp(3).  That's
> >         why all the byte functions are provided in <string.h>.
> >
> >         System V invented the mem*() functions --AFAIK--.  They are
> >         essentially the b*() funcitons from V7, with minor tweaks to the
> >         parameters and return values.  For example, memcpy(3) was made
> >         consistent with strcpy(3), in that both take the input as $2
> >         and write to $1.  The old bcopy(3) was reversed compared to
> >         strcpy(3), which was quite confusing and error-prone
> >         (especially, before 'const' was invented).
>=20
> It was 4.2 BSD that introduced bcopy/bcmp/bzero in libc, the same year
> (1983) that System V introduced the mem*() functions in their libc.
> V7 Unix did not have any of these functions in libc, although it did
> have a bcopy() function in the V7 kernel so BSD may have been trying
> to be compatible with that.

Hmmm, I had seen bcopy() existing there in the source code, and didn't
imagine that it would be a private function for the kernel only.

I also had seen some bcmp():

	alx@devuan:~/src/unix/unix/v7$ grep -rn bcmp
	usr/src/cmd/sa.c:54:	extern tcmp(), ncmp(), bcmp();
	usr/src/cmd/sa.c:202:	qsort(tab, k, sizeof(tab[0]), nflg? ncmp: (bflg?bcmp=
:tcmp));
	usr/src/cmd/sa.c:345:bcmp(p1, p2)

And I guessed it was the bcmp(3) we know, but now I've checked the
implementation and it was something entirely different.

Thanks for the correction!  I'll fix the paper.

>  4.3 BSD (1986) then also added the mem*()
> functions for System V compatibility.  Later the C89 committee chose
> to standardize the mem*() functions but moved them from their own
> header file memory.h (introduced by System V) to string.h with the
> str*() functions.

Wow!  This is very interesting.  So, after all, we shouldn't blame old
Unix systems, but the C Committee!!  Another very important issue to add
to the list of bad inventions of the committee.  :)

I wish we could re-introduce the <memory.h> header, and move these back
there (of course, with compat declarations in <string.h>).

> >         POSIX says memcmp(3) was first standardized in Issue 1 of the
> >         SVID (System V Interface Definition), which corroborates that
> >         these functions were invented in SysV.
> >
> >         It is good that such a renovation of the names, parameters, and
> >         return values happened.
> >
> >         It would have been good if strncpy(3) and strncat(3) would have
> >         been renamed (and tweaked) too back then, but it didn't happen.
> >
> >     C89; string
> >         C89 specified the term 'string' very clearly, in 4.1.1:
> >
> >                 A string is a contiguous sequence of characters
> >                 terminated by and including the first null character.
> >
> >         This differed from the old ambiguous meaning.  The header file
> >         for operations on byte arrays remained <string.h> for historical
> >         reasons, even if it conflicted with this specification of
> >         string.
>=20
> When System V introduced the mem*() functions they put them in a new
> header file memory.h.  Also when 4.3 BSD added the mem*() functions
> for System V compatibility, they added a memory.h header file with
> these functions and did not add them to string.h.  When C89 adopted
> these functions they moved them from memory.h to string.h; they did
> not "remain" in string.h since they did not start there.  Modern Linux
> and macOS have a memory.h that includes string.h, for compatibility
> with code that may still include memory.h, even though no version of
> ISO C or POSIX has ever required a memory.h.

Thanks a lot for these details!!  These are very important to understand
why this has been so wrong.  I'll make sure to fix the paper to include
this history.

> >         The strn*() functions, strncpy(3) and strncat(3), also remained
> >         with their names, for historical reasons, even if it conflicted
> >         with this specification of string.
> >
> >         Other than that, the standard was quite consistent and strict
> >         with its meaning of the term string.
> >
> >         I believe this consistency --with the exceptions mentioned
> >         above-- is what led programmers to trust string functions to
> >         handle strings, and anything with a str*() in the name was
> >         believed to be good for handling strings.  Programmers forgot
> >         the not-so-consistent history of the term string prior to
> >         standardization.
> >
> >         In retrospective, the strncpy(3) function would have been better
> >         called strtomem_pad(), which clearly reflects what it does.
> >         Maybe that would have made programmers aware of its semantics,
> >         and it would have significantly reduces misuses of the function.
> >
> >     strncat(3)
> >         strncat(3) is similar to strncpy(3) --while at the same time,
> >         very different--.  It is actually the opposite of strncpy(3):
> >         it takes a nonstring as input, and writes a string.
> >
> >         A better name for it would have been memtostr_cat().
> >
> >         Curiously, there's no 'cpy' version of strncat(3).  There's
> >         nothing with the semantics of memtostr() in ISO C, nor in the
> >         historic Unix systems (V7, BSD, System V).
>=20
> I think the main source of confusion with strncat() is that for other
> str*() and mem*() functions that take a destination buffer and size
> argument, the size is the size of the destination buffer (i.e., it
> will not write to dst[size] or later), whereas for strncat() the size
> only limits how much is read from the source.

Yup.  In retrospective, strn*() functions should be treated as a third
class of functions, entirely unrelated to str*() and mem*().

> So what I find more curious is that ISO C has no string concatenation
> function that takes a destination buffer size (such as your
> strtcat()).

I'd say this is reasonable, since it doesn't have strtcpy() either.

> If that is what a person is looking for, the plausible
> name and arguments and absence of other contenders can lead them to
> conclude that strncat() must be that function.

Yup.

[...]
> >     Linux; strtomem_pad()
> >         Recently, it appeared in the (fake) news that Linux had
> >         completely removed all uses of strncpy(3), and banned it in new
> >         code.
>=20
> Perhaps clarify that you are referring to the Linux kernel, not Linux gli=
bc.

Okay.

> > ...
> >         Thus, the functions that should be considered are:
> >
> >         -  strtcpy()            (strscpy(9) in Linux)
> >         -  memtostr()           (the 'cpy' of strncat(3))
> >         -  strtomem()           (strncpy(3) renamed)
> >
> >         And for consistency, strncat(3) should be renamed to something
> >         like memtostrcat().
>=20
> Given that the entire point of strtomem() and memtostrcat() is to
> change a confusing name, I am surprised that the new names you came up
> with name mem and str in the opposite order that they apply to the
> argument list.

I derived the names from those invented by the kernel; they're not my
invention.  I took their names because they were better than the ones
I had been using myself in my code.  But I agree your suggestion seems
even better.

> That is, memtostr(str, mem, n), introducing a whole
> new area of potential confusion that was not present in any existing
> mem*() or str*() functions.  If reducing potential confusion is that
> important I would have expected maybe strfrommem(str, mem, n) or
> similar.

Hmmmm, interesting suggestion!  That makes it resemble the strfromd(3)
family, with which it actually has some (minor) relation.  (It might be
a bit

strfrommemcat() would be a weird name, because the cat is next to mem
instead of str.  Should it be strcatfrommem()?

[...]
> >     shadow; strtcpy(), strncpy(3)
> >         The shadow project more or less agrees with the Linux kernel in
> >         this regard.  It has implemented strtcpy(), and uses strncpy(3).
> >         It doesn't have memtostr() yet, because it happens to always
> >         allocate the buffer at the same time, using strndup(3) --which
> >         is essentially malloc(3)+memtostr()--, but that will change
> >         soon, because (non-VLA) arrays are safer, as they allow
> >         validation of source and destination sizes at compile time.
> >
> >         The implementations are independent, and happened to be
> >         fundamentally identical.  It seems that good implementations of
> >         string and nonstring copying code converge to this set of
> >         interfaces.
> >
> >         Here's a naive implementation of strtcpy():
> >
> >                 ssize_t
> >                 strtcpy(char *restrict dst, const char *restrict src, s=
ize_t dsize)
> >                 {
> >                         bool    trunc;
> >                         size_t  dlen, slen;
> >
> >                         if (dsize =3D=3D 0)  // UB
> >                                 abort();
> >
> >                         slen =3D strnlen(src, dsize);
> >                         trunc =3D (slen =3D=3D dsize);
> >                         dlen =3D slen - trunc;
> >
> >                         stpcpy(mempcpy(dst, src, dlen), "");
> >
> >                         if (trunc) {
> >                                 errno =3D E2BIG;
> >                                 return -1;
> >                         }
> >
> >                         return slen;
> >                 }
>=20
> ISO C does not have ssize_t or E2BIG.

I'm aware; this is a push to add ssize_t.  In the wording, I have
specified strtcpy() as not-necessarily setting errno, though, since it's
not strictly necessary.

>  Also this API does not handle
> the case of slen too large for ssize_t, which may not be an issue for
> Linux, however ISO C has to support a much wider range of systems.
> The same issues apply to strtcat().

I believe sizes beyond ssize_t are not valid.  At least, for a ssize_t
that matches ptrdiff_t.  No object may be larger than PTRDIFF_MAX,
because that would mean that pointer subtraction would be undefined:

	char *first =3D a;
	char *end =3D a + sizeof(a);

	end - first;  // Overflows ptrdiff_t

That's because pointer subtraction happens on ptrdiff_t instead of
size_t.  Thus, we don't need to care about sizes larger than SSIZE_MAX.

[...]
> >     System V; memccpy(3)
> >         memccpy(3) was invented in System V (like the other mem*()
> >         functions).  The System V sources are not public (AFAIK), so
> >         it's not known what this function was designed for.  It was
> >         later added to the BSDs and glibc for compatibility with SysV,
> >         but nobody really knew what this function is good for.  It
> >         doesn't seem ergonomic for any basic functionality.
>=20
> It is for implementing functions like fgets(), which needs to copy the
> next '\n'-delimited line from a buffer filled by read() (so not a
> null-terminated string).

Hmmmm, do you have any such code?  I'd be interested in reviewing it.
I still suspect it might have been better if it didn't copy the
terminator.

[...]
> >     POSIX; memccpy(3)
> >         POSIX standardized memccpy(3) just because it was in System V.
> >         POSIX derives from Issue 1 of the SVID.  It's not surprising
> >         that it's there.  Especially, this function was always in POSIX,
> >         and the early revisions of POSIX are known to have strong
> >         preference for SysV functions, regardless of their quality or
> >         widespread use.
> >
> >         Interestingly, POSIX mentions that memccpy(3) does not check for
> >         overflow.
> >
> >         > The memccpy() function does not check for the overflow of the
> >         > receiving memory area.
> >
> >         This is because the 4th parameter to memccpy(3) is not the size
> >         of the destination buffer, but the size of the source buffer.
> >         It is assumed that the destination buffer is large enough.
>=20
> That is silly; the maximum size applies to both the source and
> destination, like memcpy().  Obviously if one is smaller than the
> other, you must not pass in a size that is larger than the smaller of
> the two, as with memcpy().
>=20
> >
> >         This hints that the original (System V) authors of the function
> >         didn't consider copying strings as a use case for this function.
>=20
> It's a "mem" function, not a "str" function, so it should be clear
> that it is intended for processing byte arrays and not null-terminated
> strings.  That said, if you wanted to I guess you could use it to
> implement a function like your strtcpy() pretty easily:
>=20
>     if (dsize =3D=3D 0) abort();
>     char *p =3D memccpy(dst, src, '\0', dsize);
>     return p ? p-dst-1 : (dst[dsize-1] =3D '\0', -1);

FWIW, I wouldn't call this 'pretty easily', but this is a bit
subjective.  I'd possibly make bugs in the code above.

> Note that this just passes the destination buffer size directly to
> memccpy(); unless I missed something this should not allow the
> destination buffer to overflow.

Your implementation seems correct.

> I don't see sufficient justification for removing this function.

I'd like to review an fgets(3) implementation using memccpy(3) before
making a judgement.


Have a lovely day!
Alex

>=20
>=20
>  - Mark

--=20
<https://www.alejandro-colomar.es>

--si4or6e3ckhupbv4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpoxOkACgkQ64mZXMKQ
wqnFFQ/9HgcJHKKVameSQMNcSuRMdxX0EDkVI5hIKr9rdmkfWthCV51Yyk1VuzPw
Y61RgtvIwAW1pLhtW0ZbS7Y1RGlKSHWU74HQvXjZhR7crzfE/ZKE0x0ZNE0pGxby
NCAmozyXXmSAfCcxkjCUgFShnNtadE6Dhb1bJUN6i0274zIWDpxCX84XmOyZ8jdP
N/JNZHhA1InH4OAV7MFfOz1sLnY8hwDR0LXA9bk+or/wJnJlsIRi5l484lmU4Kzb
OJZUhm92Gu0sOyJuM1kKw+O/V0HawkJu4Tt1RG80CAl8w3Slxww9FpkjG/vzRqV3
Z/OXF0vP/l3cKYXYPT92XIrJPViZXildZI3bEPRXDipjFkfA0ltj7rJVZtkwj9/l
vdQWaozH5fcdSBJsplRKuRPCJiJ1f5GbmyD7isTm+yz9prYzVGxKkNgYUy+hbWBz
PhjjWUWq8vBKHNPGxGcwMONhTQu/Lk5cH+MoUwbvB6kxwJfEqweX/UOsuC2LxOcF
P5T2XCGPgihu7accPosTI76nnPvubVswUxUgoE1uKUFiiQnPjmgnMnXOEcy4ENKB
kJBvdDoVG6EbvihDL6rpRYJTHuvLgb5myx1RhTJaSBTAanCXJmWXlDBszKiGn1nj
76TgahdkS9ICToMvg1k5JG9QJSV+d9GyLoOh1MMJgW63abZevgs=
=Na2L
-----END PGP SIGNATURE-----

--si4or6e3ckhupbv4--
