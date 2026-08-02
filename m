Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AE02561A7
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 20:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702720; cv=none; b=UEysHqtA2EhvWtbiIUIaFjih1ZhREj9L7Pm4UopnLLy/S3Cd85rC7RmXhgCZCD7vd17Q1uWlSY/K0Mbh1UMvVSnCxWHt9SgzmdJveMcBjYRRDPsTHJs2z1DsDTlRSGihEDaMEajvb5u+zcXljBkkj/QbtKBcX05WvG8dz8s+KHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702720; c=relaxed/simple;
	bh=Y1rKqzCBIEMqRa4iMSLJl15AFUF9FiQgo4Yp6RlgD3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mge7LuVNYuQhuirsmzdaFBGTAVNceFA6xzb58ioUBhhLtt+c5xeFTtKBhIc/XH7u4U/Nlf8a6roFw+1AH2za5PS/HKOB48G8iniv9pSqpcBzHcUDyQPNLiXntC5Hcu7Gvqqv5on0E/vMW3HshlMk9FFLY7m8e7S/Qo07Rb8ShbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R871MoqC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R871MoqC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27EC1F000E9;
	Sun,  2 Aug 2026 20:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785702719;
	bh=4BOJz9metmBHyzPWjL/k8ts4KWdyKR+KGFoT4vEYYjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R871MoqC07bU2fnkqqUqXG4/1jHz06TkRzjF4kmDcLRsEn1xvroVJhY9nWwRrwFL6
	 Csv/WI6c0MNPzYnK9fef2G00r56AP7IVTQ9LvUPaEoYvK6uSM/m5G7djU2NdwO9XMB
	 PcoFEDWutrR03l2hZl+JbccdNE1mqN+H6rYY4/wWzmh6+bUsDXz9668VtaTj4yhjXt
	 XjcD7AWmhBE/ypxZ+CeQgtKUaD4M4cIY6YCNK7YSawLlL3H/h8Lh0UCu+QW1W1mdNA
	 JWCTHSNWg5eQF5Cvdm7y+tLgaqJOnDE3rAsxRFKKNMjXdkovEz+STq6LwzNKgq1+Vf
	 jQ0U235jDgktg==
Date: Sun, 2 Aug 2026 22:31:55 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Paul Eggert <eggert@cs.ucla.edu>
Cc: Steve Summit <scs@eskimo.com>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, linux-man@vger.kernel.org
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <am-eAGL6OWqP9Yah@devuan>
References: <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
 <am5_uA4MSujYCS9X@devuan>
 <2026Aug02.0852.scs.0001@tanqueray.home>
 <am8_MfPmud43naU-@devuan>
 <2026Aug02.0945.scs.0002@tanqueray.home>
 <am9OEJxrIMFc15GZ@devuan>
 <8715af47-867c-417a-8ef5-7b4b7ceb2c31@cs.ucla.edu>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mxoanngs453fmudx"
Content-Disposition: inline
In-Reply-To: <8715af47-867c-417a-8ef5-7b4b7ceb2c31@cs.ucla.edu>


--mxoanngs453fmudx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Paul Eggert <eggert@cs.ucla.edu>
Cc: Steve Summit <scs@eskimo.com>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, linux-man@vger.kernel.org
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <am-eAGL6OWqP9Yah@devuan>
References: <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
 <am5_uA4MSujYCS9X@devuan>
 <2026Aug02.0852.scs.0001@tanqueray.home>
 <am8_MfPmud43naU-@devuan>
 <2026Aug02.0945.scs.0002@tanqueray.home>
 <am9OEJxrIMFc15GZ@devuan>
 <8715af47-867c-417a-8ef5-7b4b7ceb2c31@cs.ucla.edu>
MIME-Version: 1.0
In-Reply-To: <8715af47-867c-417a-8ef5-7b4b7ceb2c31@cs.ucla.edu>

Hi Paul,

> Date: 2026-08-02 14:28:33-0500
> From: Paul Eggert <eggert@cs.ucla.edu>
>
> On 8/2/26 09:11, Alejandro Colomar wrote:
> > I do use it in new code still today in shadow-utils.  I've heard tar(1)
> > also needs that, and a few other places.
>=20
> GNU tar proper has not used strncpy since 2018. It generally uses memcpy =
in
> the places it formerly used strncpy. Tar's 2018 change worked because the
> destinations were already zeroed out, so strncpy's zero-fill semantics we=
re
> unnecessary and indeed a bit slower.

Ok; thanks!  In shadow-utils we still need it, though.

> As for strncat, its API is a recipe for confusion

The semantics are okay.  strncat(3) is for example useful for
implementing strndupa(3), which is quite useful (just like strndup(3))
if you use substrings or other fixed-width arrays.

	#define strndupa(s, n)  strncat(strcpy(alloca(n + 1), ""), s, n)

It's weird that there's no cpy version of it, though, but this is solved
with the usual strcpy(p,"") as first argument.

And the name is certainly bad in context, although an appropriate name
would be much more verbose: strcatfrommem().  Maybe we can live with the
name strncat(3).

> and almost nobody
> remembers how it works.

This is true, and in part, it's because of bad teaching.  The fact that
GCC's diagnostics recommend bogus usage don't help.  I think having it
in <memory.h> could help understand it and remember it.

> It is a poor design, plain and simple.

There's a need for taking a nonstring (i.e., a fixed-width null-padded
buffer, or a substring) and append it to a string.  strncat(3) is good
for that use case.

> Although
> strncpy may have a use or two for obsolete non-string data structures that

Substrings are still necessary.  If you want to copy the leading part of
a string until a given length, and append it to an existing string, you
need strncat(3).  I guess this doesn't violate any guidelines.

For this use, in some sense, it's similar to memccpy(3).  You don't use
it all the time, but when you need it, it's useful.

> violate GNU coding guidelines that have been in place since the 1980s,
> strncat has no such redeeming virtues. The current man page for strncat d=
oes
> readers a misservice by not saying so clearly.

I disagree that strncat(3) is dead, and will not document it as such.

Moving it to <memory.h> would signal that it's something less
appropriate for usual code using strings.

> In contrast, the glibc manual
> has reasonably decent warnings to users about how bad strncat is
> (strncpy/strlcpy/etc. too).

Let's review that.

	5.5  Concatenating Strings

	...

	Programmers using the strcat or wcscat functions
	(or the strlcat, strncat and wcsncat functions
	 defined in a later section, for that matter)
	can easily be recognized as lazy and reckless.

Lazy can be a virtue, IMO.  I wouldn't call them reckless.  If they know
the prefix string is controlled and small, using the cat functions can
be wise: you don't waste much performance, and instead get a simple
program.  Plan9's strecpy(2) is certainly faster, and doesn't add much
complexity, but it still adds a little bit of complexity, so it can
sometimes make sense to keep the source simple, at the expense of a few
cycles.

	In almost all situations the
	lengths of the participating strings are known
	(it better should be
	 since how can one otherwise ensure
	 the allocated size of the buffer is sufficient?)

You may know an upper bound without caring about the exact value.  Yes,
most of the time you know it, but I wouldn't dismiss those times where
you don't know (or, for simplicity, you don't want to know).

	Or at least,
	one could know them if one keeps track of
	the results of the various function calls.

Indeed, but simplicity might call for not doing this.  The compiler can
do it for us.

	But then it is very inefficient to use strcat/wcscat.

The compiler can do it for us.  Correct simple code is better than fast
code; and correct code can be optimized by compilers.  Since, as you
said, the length is easy to find if you keep track of the return values
--and the compiler can keep track of them--, then it's a case for
improving optimizers.

	A lot of time is wasted
	finding the end of the destination string
	so that the actual copying can start.=20

	...

	Whenever a programmer feels the need to use strcat
	she or he should think twice and look through the program
	to see whether the code cannot be rewritten
	to take advantage of already calculated results.

As said, give me a better compiler, and I'll give you a faster program.

	The related functions strlcat, strncat, wcscat and wcsncat
	are almost always unnecessary, too.
	Again:
	it is almost always unnecessary to use functions like strcat.=20

Again, I don't agree.

	---
	5.6 Truncating Strings while Copying

	...

	Function: char * strncat (char *restrict to, const char *restrict from, si=
ze_t size)

strncat(3) does *not* truncate its input.  It copies exactly as many
bytes as the source nonstring contains (identified by the pointer and
size), unless the source nonstring is shorter, of course, in which case,
it's not truncation.  It doesn't belong in this section.  This is part
of the reason why it's misunderstood and misremembered by people: nobody
explained it correctly to them.

	...

	    This function is like strcat except that not more than size
	    bytes from from are appended to the end of to, and from need
	    not be null-terminated.

This is pretty much saying that a cat is similar to a fish, except that
the cat doesn't live in the sea, and it is a mammal.

	    A single null byte is also always
	    appended to to, so the total allocated size of to must be at
	    least size + 1 bytes longer than its initial length.

This is good advice, but not precise wording.  If the source nonstring
is shorter than its reported size, then the total allocated size need
not be so large.  Of course, it's good advice that the size is always
enough for the worst case, but the wording doesn't seem to be clear that
this is only advice, and not a requirement.

	    The strncat function could be implemented like this:

	    char *
	    strncat (char *to, const char *from, size_t size)
	    {
	      size_t len =3D strlen (to);
	      memcpy (to + len, from, strnlen (from, size));
	      to[len + strnlen (from, size)] =3D '\0';
	      return to;
	    }

This one might be faster and shorter (thanks to Mark for teaching me
this):

{
  if (memccpy(to + strlen(to), from, '\0', size) =3D=3D NULL)
    strcpy(&to[strlen(to) + size], "");
  return to;
}

	...

	    As a companion to strncpy, strncat was designed for
	    now-rarely-used arrays consisting of non-null bytes followed
	    by zero or more null bytes.

But it also works for substrings.  If you want to copy a prefix from
a string into a new string, strncat(3) --or the dup versions,
strndup[a](3)-- help.

	    However, As noted below, this function is generally a poor
	    choice for processing strings.

Yes, it's a poor choice for handling strings.  By moving it to
<memory.h>, we signal that it's not for handling strings.

	    Also, this function has significant performance issues.
	    See Concatenating Strings.=20

Those are a problem of the optimizer, not of the programmer.

	...

	Because these functions can abruptly truncate strings or wide
	strings, they are generally poor choices for processing them.
	When copying or concatening multibyte strings, they can truncate
	within a multibyte character so that the result is not a valid
	multibyte string.  When combining or concatenating multibyte or
	wide strings, they may truncate the output after a combining
	character, resulting in a corrupted grapheme.  They can cause
	bugs even when processing single-byte strings: for example, when
	calculating an ASCII-only user name, a truncated name can
	identify the wrong user.=20

strncat(3) does not truncate its input, and thus this doesn't tell much
about it.  It rather compounds on the historic misunderstanding of the
function.

> To improve the man pages it should be waayyy higher priority

We don't need to prioritize.  I have plenty of time to address both
issues.  While I wrote string_copying(7) for clarifying what strncat(3)
is and is not (alongside all the other string-copying functions).
I need to revise that page, since I've learnt a lot since I wrote it.
I also need to add at least some paragraph in CAVEATS in strncat(3),
since readers might not find the other page at all --even if it's in
SEE ALSO--.

I'll address all of these.

> to fix their
> poor discussion of these truncation functions

That's a wrong categorization of this function.  strncat(3) has nothing
to do with truncation (as said above).

> than to worry about whether
> the man page mentions <string.h> or some other header.


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--mxoanngs453fmudx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpvqTUACgkQ64mZXMKQ
wqndbg/9HqWMiGi8qpvRz3Ep2tu+myk0GXPe/95jkNyCJZGa1ywbMEH06qRK6rdb
Gf6lTkiOx0lqydGaZuSvMduLbzi/7Z/avnceb4/2qrxdzG9/ILkI+QvrrrP05sH+
8fbZ5rq5tRKn3wQBq1fdrwrzkMfLYZzwr4cyUa26YXgxxDI34uIp6VIi+61BvDsy
uMFABzKruoctd9rNwZlJZkPm/4lYDZ2lV9Q7E9b9QB7wLBfKG99x/4Vz9LXffWeT
dBVvCjuDsdvfwLXx6/7+i4uGiR2cBNx+CF3DtsqqNqGq9ioJOaPieItIbcr+mARL
kUIwTl5YEuDoTvP864SuVEysEPK6KikStqT3666LsAF5HElSoR2/Xcgq1sdK7qKl
z2AeeDaF79xRgU9xuI/dP0BX7SMJgdH3mZXgWpQ3TmU91moWZ9nXJBqTpzFC29BJ
mIGEuiBCMDCKfCikEmRAPD2OAy6B/X9cXLl+XnIH/T7r3kswq/mjxqB3J0RWbrmX
UKaII04LxjTv1+M7LzjRSiry2wA7bLP0zXMJSwJXnkXxnklHY2ODg0BWJFrkd0wZ
kIjXGewcjhvojdHo3g5zEKsx5t7ANLMMeffl0Z8zEVx9Ezi5NlDWY8Zhe2K/+sgf
UmSKq41yx3nDskZhBQ5XlJLrWGJJMQxVyDFL6amZFUM4hYDJ0w4=
=nJOu
-----END PGP SIGNATURE-----

--mxoanngs453fmudx--
