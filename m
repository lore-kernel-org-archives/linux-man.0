Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A7F35FF5B
	for <linux-man@vger.kernel.org>; Thu, 30 Jul 2026 19:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785441083; cv=none; b=AyXR/eK95a0l2OhXEzllZxi0vu/5XFfbqCWmlggelSJgPZv+8oMaGyit0JsRGHf0USio0Q+986r66BUJY0FXIXAo728fzqwBaeJfzOLmp5J3NzCYxGhVY5Q0wwKErma0hhAJt9WsKmqcvy7l8GSNPrxS7Ekl2y32I2hJgIbsaRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785441083; c=relaxed/simple;
	bh=wkPeYVaL7FzbTewF8uYQXxxf9naGYVvkawYJsQkH1cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kd+Smm/fKTI3+Qo33pyO+14o4JErDXYD4VPry31/ypEBg7frKXToRqgcH56ioNAI5OAH8nypyxF80TWA5NE8rAxnEVvnw/KHTb+beWMoi3TeS3z7CX3PF+2F+QSknOjBLP5C+DTB3N/xhngdhfdL59T9RP0z72QkNtIIvfYKJJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HM2+5A2W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HM2+5A2W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 831E21F000E9;
	Thu, 30 Jul 2026 19:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785441081;
	bh=DUGy8+XdXrSWTwPkHJisR5KMWjNbXXPpqEesL+uPSeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HM2+5A2WCJaPBq0fwBeDPwMFqtD41pdRsETavEVIL/jKvM/C13MOq1HO/ZoQHhILo
	 kdiHm+tuoLY+EhB9xpO1CqVbuPNPJt99sTm8GifcCn0QeJ2JkEb9WSXn3+kLnLxeOI
	 U0JpUv3Mc5h0Fqnje6sH2wwyWAAkmLMFKcOmFVfwJVTe6zDP39wZiKslrv3IijsU1K
	 TLtlYB0C3ZOKiOK1A8CR0jPOLmXT0nvYbykXAxZkRIydBhnc6X22Gi8dNZ/qD8q4ia
	 NaMRboYjqV2Ns0BLqzxsY/aaXfqETfCqVtHZLTtlI9WJlRKX3D6wG1dQuG/lPbbuei
	 TG30ew7dUtITQ==
Date: Thu, 30 Jul 2026 21:51:16 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: sergeh@kernel.org, linux-man@vger.kernel.org, 
	"Serge E. Hallyn" <serge@hallyn.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: alx-0096r1 - string (and nonstring) copying
Message-ID: <amupqzN_X57Du4AJ@devuan>
References: <cover.1783523064.git.alx@kernel.org>
 <b17a1548f3ab96216e6165bdd3194a80363e99f6.1783523064.git.alx@kernel.org>
 <amO0Wtmi4tpaGUKr@AUS2MQ6190Y76.amd.com>
 <amUw8ArFwmnsIKl1@devuan>
 <amaTpQxd52iYjlor@devuan>
 <CAMdZqKGFF-1fqsT0xSZDrBSGC-zztxayX3xAhFHXP-cKjEthpg@mail.gmail.com>
 <ami6Pbs0oT9gLi4W@devuan>
 <CAMdZqKE-ZkCWhH3yY7200qEYf7xtFQuhxsEi9jiLgnVU4gKoAQ@mail.gmail.com>
 <amo4wqgjuirq_otN@devuan>
 <CAMdZqKEEncWS64BUL1qa0SfcNUaNA9XRBPWTpHPB==N3VV_Nzg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w6y7hdi6467ygtuo"
Content-Disposition: inline
In-Reply-To: <CAMdZqKEEncWS64BUL1qa0SfcNUaNA9XRBPWTpHPB==N3VV_Nzg@mail.gmail.com>


--w6y7hdi6467ygtuo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: sergeh@kernel.org, linux-man@vger.kernel.org, 
	"Serge E. Hallyn" <serge@hallyn.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: alx-0096r1 - string (and nonstring) copying
Message-ID: <amupqzN_X57Du4AJ@devuan>
References: <cover.1783523064.git.alx@kernel.org>
 <b17a1548f3ab96216e6165bdd3194a80363e99f6.1783523064.git.alx@kernel.org>
 <amO0Wtmi4tpaGUKr@AUS2MQ6190Y76.amd.com>
 <amUw8ArFwmnsIKl1@devuan>
 <amaTpQxd52iYjlor@devuan>
 <CAMdZqKGFF-1fqsT0xSZDrBSGC-zztxayX3xAhFHXP-cKjEthpg@mail.gmail.com>
 <ami6Pbs0oT9gLi4W@devuan>
 <CAMdZqKE-ZkCWhH3yY7200qEYf7xtFQuhxsEi9jiLgnVU4gKoAQ@mail.gmail.com>
 <amo4wqgjuirq_otN@devuan>
 <CAMdZqKEEncWS64BUL1qa0SfcNUaNA9XRBPWTpHPB==N3VV_Nzg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMdZqKEEncWS64BUL1qa0SfcNUaNA9XRBPWTpHPB==N3VV_Nzg@mail.gmail.com>

Hi Mark,

> Date: 2026-07-30 10:58:26-0700
> From: Mark Harris <mark.hsj@gmail.com>
>
[...]
> > It would be good to know if those systems that have a larger ptrdiff_t
> > are still alive or can be ignored/forced to adapt.
>=20
> SDCC (https://sdcc.sourceforge.net/), when building for mcs51
> (-mmcs51) or ds390 (-mds390), uses a 16-bit size_t and 32-bit
> ptrdiff_t.  It appears that Open Watcom C/16 v2
> (https://github.com/open-watcom/open-watcom-v2) with the huge memory
> model also uses a 16-bit size_t and a 32-bit ptrdiff_t, although I
> haven't verified that one.  Both compilers have active development and
> support some of the new features in C23, but do not have full C23 or
> POSIX support.  I don't know about any others with ptrdiff_t larger
> than size_t.

Thanks; I guess that can't be done.

[...]
> > > https://github.com/illumos/illumos-gate/blob/4b44494cae63d4bf0c7d3f34=
828503e68d1c0e69/usr/src/lib/libc/port/stdio/fgets.c#L44
> >
> > Thanks!
> >
> > Let's now consider an alternative world where there was a function with
> > semantics similar to memccpy(3) with one difference: it wouldn't copy
> > the delimiter.  Let's call such a function memcpyc().  Here's a naive
> > implementation of memccpy(3):
> >
> >         void *
> >         memccpy(void *dst, const void *src, int c, size_t n)
> >         {
> >                 unsigned char  *d =3D dst;
> >                 unsigned char  *s =3D src;
> >
> >                 for (size_t i =3D 0; i < n; i++) {
> >                         *d++ =3D *s++;
> >                         if (*s =3D=3D c)
> >                                 return d;
> >                 }
> >                 return NULL;
> >         }
> >
> > Here's a naive implementation of the hypothetical memcpyc():
> >
> >         void *
> >         memcpyc(void *dst, const void *src, int c, size_t n)
> >         {
> >                 unsigned char  *d =3D dst;
> >                 unsigned char  *s =3D src;
> >
> >                 for (size_t i =3D 0; i < n; i++) {
> >                         if (*s =3D=3D c)
> >                                 return d;
> >                         *d++ =3D *s++;
> >                 }
> >                 return NULL;
> >         }
> >
> > (I've written both of the above quickly, without compiling nor testing;
> >  I might have made a mistake.)
> >
> > With such a function, the fgets(3) implementation from Illumos gate
> > would change in this manner:
> >
> >         diff --git i/usr/src/lib/libc/port/stdio/fgets.c w/usr/src/lib/=
libc/port/stdio/fgets.c
> >         index 9401217410ca..ac1f330ea46e 100644
> >         --- i/usr/src/lib/libc/port/stdio/fgets.c
> >         +++ w/usr/src/lib/libc/port/stdio/fgets.c
> >         @@ -82,9 +82,12 @@ fgets(char *buf, int size, FILE *iop)
> >                                         break;          /* nothing left=
 to read */
> >                         }
> >                         n =3D (int)(size < iop->_cnt ? size : iop->_cnt=
);
> >         -               if ((p =3D memccpy(ptr, (char *)iop->_ptr, '\n',
> >         +               if ((p =3D memcpyc(ptr, (char *)iop->_ptr, '\n',
> >                             (size_t)n)) !=3D NULL)
> >         +               {
> >         +                       p =3D stpcpy(p, "\n");
> >                                 n =3D (int)(p - ptr);
> >         +               }
> >                         ptr +=3D n;
> >                         iop->_cnt -=3D n;
> >                         iop->_ptr +=3D n;
> >
> > IMO, this wouldn't make it more complex.  However, such a hypothetical
> > memcpyc() would be much more useful elsewhere.  For example, it would
> > simplify the two unique uses of memccpy(3) in FreeBSD:
> >
> >         diff --git i/bin/sh/parser.c w/bin/sh/parser.c
> >         index 0c1b7a91c257..713a35ad8cd8 100644
> >         --- i/bin/sh/parser.c
> >         +++ w/bin/sh/parser.c
> >         @@ -2116,7 +2116,7 @@ getprompt(void *unused __unused)
> >                                 if (fmt[0] !=3D '}') {
> >                                         char *end;
> >
> >         -                               end =3D memccpy(tfmt, fmt, '}',=
 sizeof(tfmt));
> >         +                               end =3D memcpyc(tfmt, fmt, '}',=
 sizeof(tfmt));
> >                                         if (end =3D=3D NULL) {
> >                                                 /*
> >                                                  * Format too long or n=
o '}', so
> >         @@ -2129,7 +2129,7 @@ getprompt(void *unused __unused)
> >                                                 fmt--;
> >                                                 break;
> >                                         }
> >         -                               *--end =3D '\0'; /* Ignore the =
copy of '}'. */
> >         +                               *end =3D '\0'; /* Ignore the co=
py of '}'. */
> >                                         fmt +=3D end - tfmt;
> >                                 }
> >                                 now =3D localtime(&(time_t){time(NULL)}=
);
> >         diff --git i/lib/libc/amd64/string/strncat.c w/lib/libc/amd64/s=
tring/strncat.c
> >         index 2c63ab50b3c3..4a1e8c0119ac 100644
> >         --- i/lib/libc/amd64/string/strncat.c
> >         +++ w/lib/libc/amd64/string/strncat.c
> >         @@ -19,13 +19,13 @@ strncat(char *dest, const char *src, size_t=
 n)
> >                 char *endptr;
> >
> >                 len =3D strlen(dest);
> >         -       endptr =3D __memccpy(dest + len, src, '\0', n);
> >         +       endptr =3D memcpyc(dest + len, src, '\0', n);
> >
> >                 /* avoid an extra branch */
> >                 if (endptr =3D=3D NULL)
> >         -               endptr =3D dest + len + n + 1;
> >         +               endptr =3D dest + len + n;
> >
> >         -       endptr[-1] =3D '\0';
> >         +       *endptr =3D '\0';
> >
> >                 return (dest);
> >          }
> >
> > memccpy(3) is a bad design, which forces complex code, prone to
> > off-by-one bugs.
>=20
> It seems like you've already made up your mind that memccpy() is bad
> and are now just looking to justify that decision.

Not necessarily.  I can be convinced with good arguments.  :-)

> Your modification of fgets() is obviously more complex; it adds a
> whole additional function call, and instead of copying all of the
> bytes at once from a single source it does two copies from two
> different sources, specifying the delimiter twice making it more
> error-prone and difficult to change.  Both fgets() and strncat() need
> the delimiter in the destination buffer, and the one place that
> doesn't is only "simplified" by removing a single "--"; certainly not
> worth a whole new function.  And if simplicity or eliminating the
> +/-1s was important to the author of that strncat() implementation,
> they could trivially achieve those goals with the existing function:
>=20
>     size_t len =3D strlen(dest);
>     if (__memccpy(dest + len, src, '\0', n) =3D=3D NULL)
>         dest[len+n] =3D '\0';
>     return dest;
>=20
> Changing that to use memcpyc() would have made it more complex.

Agreed; the above is a good implementation of strncat(3), and better
than with memcpyc().  Thanks!

> I think that copying the delimiter makes sense.  For example, you
> should be able to use this function directly in a loop, e.g. to
> process '\n'-delimited lines.  If it stopped before the delimiter it
> would need extra code to skip over the delimiter before the next
> iteration to avoid getting stuck there.  But if the final line didn't
> have a '\n' at the end it would have to be sure not to skip over it to
> avoid advancing past the end of the buffer.

Agreed; there are use cases where memccpy(3) is preferrable.  You've
convinced me.  :)

> Even if this hypothetical memcpyc() function was slightly better I
> don't see how that matters.  memccpy() has been around for decades, is
> already in ISO C, is already in POSIX, has already been implemented in
> numerous C libraries even before ISO C existed, and is in use in
> non-buggy ways, so I don't see it going away in the foreseeable
> future.  The purpose of the standard is to allow for confident
> reliance on a defined base set of features, and removing functions
> from that set that are in use and have no fundamental flaws erodes
> that confidence.  memcpyc() has no existing uses, and also little
> expected use, so it would be difficult to imagine there being enough
> support to add it to ISO C.

Agreed.


Have a lovely night!
Alex

>=20
>=20
>  - Mark
>=20

--=20
<https://www.alejandro-colomar.es>

--w6y7hdi6467ygtuo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmprqy4ACgkQ64mZXMKQ
wqkR4Q//V+L4iPHPGWxO/oir25KMdSyN3iAxZyt0EcXiN1lPyQMjlGiwMuAEMxKi
2RJyAOBoKe4E6wWwKkvAHi/OviotsH/f5iLMyg/4WY4+GIeerzbdRY75a9bUWpag
Y2DsmY7c/EeXJ2CPi+U6I+akXl1dl1sDWjJgwVlsIq2pfPZzoAkYiyYDu4izCTqo
f4HXZfTiNBv0+Aak3UdSfujj8HFyTKHyBs/JpDcZJ07/pg83/iZNeroSYcUf4bmr
EP9kD2gdszOn6E2sEYrU7hSMXoe3GR75GzpL+jkvLS+zVF1Mit2Vp8Kr4mDQ3mmz
qVBO12vA/VX/5/c/wk3gB6kz17R+EHR95++Xpo5yizYaM56JKDCYqrW6gFwsRFOj
tpM1qXEYohMZRoNrAzTwiq6kva+7LxTOf2eK1w/iVLo56osnsNo3tuz7P0Rm/pC4
3SScFtyyZO9jwN92jDCZoF7egWRnILUaH0322FUDs71ekgYMp2o58aW7gxLc3rv4
1i8AeQbxuDip0ZT//Cye2Kn0WfBeliSoE54genE1+J92D//T4NG59GiKhFeenMTW
73YmMbfjBACzwpmFDTZdmeYkAaQxwqnJrKiM7RhQM8nCJQtCP3H2pAlsRNEBGlMS
9x8y+eb0iew/D8Dd1qmdetRNTAUTUoDVAp8KqYvghHXi+owChCQ=
=GGnd
-----END PGP SIGNATURE-----

--w6y7hdi6467ygtuo--
