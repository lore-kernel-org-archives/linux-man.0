Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D0232E13B
	for <linux-man@vger.kernel.org>; Thu, 30 Jul 2026 20:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785441735; cv=none; b=N6P+n2H23+ktLhvBexqwaXdL9dMCPi8I67qgBuMF6v1gFrzmILtLXuYnCx1pztqnR5/T0lTjoAEyyqjkpKbETjTj9ZKWTjyrLcrPHgO3LvLOVHW+7CgWoekX0WrRnSSX0h5b9UqC72ehI9F5Gt6kboj6OSj94oRPBt8/9A+13Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785441735; c=relaxed/simple;
	bh=tYf7jPdeZdoYkI7nSSDEilGuEitRt7zFkPUoN2YZy/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bxglBpICk1hqv3hPBNEPT8vXynEBRdpAwatrJFUMnceHKCzP6wvl+J4nFCcI38UrxVTFAdjTcmJphQEH7woo1yUigGj8aXcpVbGcce4B+yckGAipw25sOLkzr9X6MkDdNKnfuvJhkNzaZunu9eyCh4ksJhy4oXAPgOyNKI0zeP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jYwgBwP0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jYwgBwP0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988E51F000E9;
	Thu, 30 Jul 2026 20:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785441733;
	bh=YSufi6aLczbFOH6rtv5FouRvA6zryUy/kIekdJnl0tU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jYwgBwP0ZCFwpLeQFqGI85rlGpq8ghyHFYf/S5XAs7wzcwwzh+Uw13W7XJ+IdaZtZ
	 MsRmgoQtmHVtsSORaWOc7EGilJGmQtmsaTzFj5y9DZR7ljTMAbm0/DJzbg0i2ivRld
	 yUAIqqFFy0l+rGhLxWBL/DMMRb2lB8m/7MteamCi/XSWR3hn7MiVXlEm3Uh+OLRent
	 1o5nKHkBRO/sQH3nu/1Z2TDE0ELykN6xnSown3H/+dv0MdSwww01H4WbhfBn01x2cP
	 sV75IFPW7vi/BsOosZVr6tqcSs4x0cYv8ZjHfqGZxbMZQyB65hceOhZuzWnQz7fnMz
	 m3+n21pRX09hg==
Date: Thu, 30 Jul 2026 22:02:08 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: sergeh@kernel.org, linux-man@vger.kernel.org, 
	"Serge E. Hallyn" <serge@hallyn.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: alx-0096r1 - string (and nonstring) copying
Message-ID: <amus_s5gwmZ69UU7@devuan>
References: <b17a1548f3ab96216e6165bdd3194a80363e99f6.1783523064.git.alx@kernel.org>
 <amO0Wtmi4tpaGUKr@AUS2MQ6190Y76.amd.com>
 <amUw8ArFwmnsIKl1@devuan>
 <amaTpQxd52iYjlor@devuan>
 <CAMdZqKGFF-1fqsT0xSZDrBSGC-zztxayX3xAhFHXP-cKjEthpg@mail.gmail.com>
 <ami6Pbs0oT9gLi4W@devuan>
 <CAMdZqKE-ZkCWhH3yY7200qEYf7xtFQuhxsEi9jiLgnVU4gKoAQ@mail.gmail.com>
 <amo4wqgjuirq_otN@devuan>
 <CAMdZqKEEncWS64BUL1qa0SfcNUaNA9XRBPWTpHPB==N3VV_Nzg@mail.gmail.com>
 <amupqzN_X57Du4AJ@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5l4o5tux7x4udrbq"
Content-Disposition: inline
In-Reply-To: <amupqzN_X57Du4AJ@devuan>


--5l4o5tux7x4udrbq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: sergeh@kernel.org, linux-man@vger.kernel.org, 
	"Serge E. Hallyn" <serge@hallyn.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: alx-0096r1 - string (and nonstring) copying
Message-ID: <amus_s5gwmZ69UU7@devuan>
References: <b17a1548f3ab96216e6165bdd3194a80363e99f6.1783523064.git.alx@kernel.org>
 <amO0Wtmi4tpaGUKr@AUS2MQ6190Y76.amd.com>
 <amUw8ArFwmnsIKl1@devuan>
 <amaTpQxd52iYjlor@devuan>
 <CAMdZqKGFF-1fqsT0xSZDrBSGC-zztxayX3xAhFHXP-cKjEthpg@mail.gmail.com>
 <ami6Pbs0oT9gLi4W@devuan>
 <CAMdZqKE-ZkCWhH3yY7200qEYf7xtFQuhxsEi9jiLgnVU4gKoAQ@mail.gmail.com>
 <amo4wqgjuirq_otN@devuan>
 <CAMdZqKEEncWS64BUL1qa0SfcNUaNA9XRBPWTpHPB==N3VV_Nzg@mail.gmail.com>
 <amupqzN_X57Du4AJ@devuan>
MIME-Version: 1.0
In-Reply-To: <amupqzN_X57Du4AJ@devuan>

> Date: 2026-07-30 21:51:16+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> Hi Mark,
>=20
> > Date: 2026-07-30 10:58:26-0700
> > From: Mark Harris <mark.hsj@gmail.com>
> >
> [...]
> > > It would be good to know if those systems that have a larger ptrdiff_t
> > > are still alive or can be ignored/forced to adapt.
> >=20
> > SDCC (https://sdcc.sourceforge.net/), when building for mcs51
> > (-mmcs51) or ds390 (-mds390), uses a 16-bit size_t and 32-bit
> > ptrdiff_t.  It appears that Open Watcom C/16 v2
> > (https://github.com/open-watcom/open-watcom-v2) with the huge memory
> > model also uses a 16-bit size_t and a 32-bit ptrdiff_t, although I
> > haven't verified that one.  Both compilers have active development and
> > support some of the new features in C23, but do not have full C23 or
> > POSIX support.  I don't know about any others with ptrdiff_t larger
> > than size_t.
>=20
> Thanks; I guess that can't be done.
>=20
> [...]
> > > > https://github.com/illumos/illumos-gate/blob/4b44494cae63d4bf0c7d3f=
34828503e68d1c0e69/usr/src/lib/libc/port/stdio/fgets.c#L44
> > >
> > > Thanks!
> > >
> > > Let's now consider an alternative world where there was a function wi=
th
> > > semantics similar to memccpy(3) with one difference: it wouldn't copy
> > > the delimiter.  Let's call such a function memcpyc().  Here's a naive
> > > implementation of memccpy(3):
> > >
> > >         void *
> > >         memccpy(void *dst, const void *src, int c, size_t n)
> > >         {
> > >                 unsigned char  *d =3D dst;
> > >                 unsigned char  *s =3D src;
> > >
> > >                 for (size_t i =3D 0; i < n; i++) {
> > >                         *d++ =3D *s++;
> > >                         if (*s =3D=3D c)
> > >                                 return d;
> > >                 }
> > >                 return NULL;
> > >         }
> > >
> > > Here's a naive implementation of the hypothetical memcpyc():
> > >
> > >         void *
> > >         memcpyc(void *dst, const void *src, int c, size_t n)
> > >         {
> > >                 unsigned char  *d =3D dst;
> > >                 unsigned char  *s =3D src;
> > >
> > >                 for (size_t i =3D 0; i < n; i++) {
> > >                         if (*s =3D=3D c)
> > >                                 return d;
> > >                         *d++ =3D *s++;
> > >                 }
> > >                 return NULL;
> > >         }
> > >
> > > (I've written both of the above quickly, without compiling nor testin=
g;
> > >  I might have made a mistake.)
> > >
> > > With such a function, the fgets(3) implementation from Illumos gate
> > > would change in this manner:
> > >
> > >         diff --git i/usr/src/lib/libc/port/stdio/fgets.c w/usr/src/li=
b/libc/port/stdio/fgets.c
> > >         index 9401217410ca..ac1f330ea46e 100644
> > >         --- i/usr/src/lib/libc/port/stdio/fgets.c
> > >         +++ w/usr/src/lib/libc/port/stdio/fgets.c
> > >         @@ -82,9 +82,12 @@ fgets(char *buf, int size, FILE *iop)
> > >                                         break;          /* nothing le=
ft to read */
> > >                         }
> > >                         n =3D (int)(size < iop->_cnt ? size : iop->_c=
nt);
> > >         -               if ((p =3D memccpy(ptr, (char *)iop->_ptr, '\=
n',
> > >         +               if ((p =3D memcpyc(ptr, (char *)iop->_ptr, '\=
n',
> > >                             (size_t)n)) !=3D NULL)
> > >         +               {
> > >         +                       p =3D stpcpy(p, "\n");
> > >                                 n =3D (int)(p - ptr);
> > >         +               }
> > >                         ptr +=3D n;
> > >                         iop->_cnt -=3D n;
> > >                         iop->_ptr +=3D n;
> > >
> > > IMO, this wouldn't make it more complex.  However, such a hypothetical
> > > memcpyc() would be much more useful elsewhere.  For example, it would
> > > simplify the two unique uses of memccpy(3) in FreeBSD:
> > >
> > >         diff --git i/bin/sh/parser.c w/bin/sh/parser.c
> > >         index 0c1b7a91c257..713a35ad8cd8 100644
> > >         --- i/bin/sh/parser.c
> > >         +++ w/bin/sh/parser.c
> > >         @@ -2116,7 +2116,7 @@ getprompt(void *unused __unused)
> > >                                 if (fmt[0] !=3D '}') {
> > >                                         char *end;
> > >
> > >         -                               end =3D memccpy(tfmt, fmt, '}=
', sizeof(tfmt));
> > >         +                               end =3D memcpyc(tfmt, fmt, '}=
', sizeof(tfmt));
> > >                                         if (end =3D=3D NULL) {
> > >                                                 /*
> > >                                                  * Format too long or=
 no '}', so
> > >         @@ -2129,7 +2129,7 @@ getprompt(void *unused __unused)
> > >                                                 fmt--;
> > >                                                 break;
> > >                                         }
> > >         -                               *--end =3D '\0'; /* Ignore th=
e copy of '}'. */
> > >         +                               *end =3D '\0'; /* Ignore the =
copy of '}'. */
> > >                                         fmt +=3D end - tfmt;
> > >                                 }
> > >                                 now =3D localtime(&(time_t){time(NULL=
)});
> > >         diff --git i/lib/libc/amd64/string/strncat.c w/lib/libc/amd64=
/string/strncat.c
> > >         index 2c63ab50b3c3..4a1e8c0119ac 100644
> > >         --- i/lib/libc/amd64/string/strncat.c
> > >         +++ w/lib/libc/amd64/string/strncat.c
> > >         @@ -19,13 +19,13 @@ strncat(char *dest, const char *src, size=
_t n)
> > >                 char *endptr;
> > >
> > >                 len =3D strlen(dest);
> > >         -       endptr =3D __memccpy(dest + len, src, '\0', n);
> > >         +       endptr =3D memcpyc(dest + len, src, '\0', n);
> > >
> > >                 /* avoid an extra branch */
> > >                 if (endptr =3D=3D NULL)
> > >         -               endptr =3D dest + len + n + 1;
> > >         +               endptr =3D dest + len + n;
> > >
> > >         -       endptr[-1] =3D '\0';
> > >         +       *endptr =3D '\0';
> > >
> > >                 return (dest);
> > >          }
> > >
> > > memccpy(3) is a bad design, which forces complex code, prone to
> > > off-by-one bugs.
> >=20
> > It seems like you've already made up your mind that memccpy() is bad
> > and are now just looking to justify that decision.
>=20
> Not necessarily.  I can be convinced with good arguments.  :-)
>=20
> > Your modification of fgets() is obviously more complex; it adds a
> > whole additional function call, and instead of copying all of the

FWIW, that additional function call is optimized out by GCC even on low
optimization levels, since it's a two-byte copy.  You could perfectly
use a single-byte manual copy:

        diff --git i/usr/src/lib/libc/port/stdio/fgets.c w/usr/src/lib/libc=
/port/stdio/fgets.c
        index 9401217410ca..ac1f330ea46e 100644
        --- i/usr/src/lib/libc/port/stdio/fgets.c
        +++ w/usr/src/lib/libc/port/stdio/fgets.c
        @@ -82,9 +82,12 @@ fgets(char *buf, int size, FILE *iop)
                                        break;          /* nothing left to =
read */
                        }
                        n =3D (int)(size < iop->_cnt ? size : iop->_cnt);
        -               if ((p =3D memccpy(ptr, (char *)iop->_ptr, '\n',
        +               if ((p =3D memcpyc(ptr, (char *)iop->_ptr, '\n',
                            (size_t)n)) !=3D NULL)
        +               {
	+			*p++ =3D '\n';
                                n =3D (int)(p - ptr);
        +               }
                        ptr +=3D n;
                        iop->_cnt -=3D n;
                        iop->_ptr +=3D n;

Nevertheless, with your examples of fgets(3) and strncat(3), I'm now
convinced that memccpy(3) is good for this niche use case.

> > bytes at once from a single source it does two copies from two
> > different sources, specifying the delimiter twice making it more
> > error-prone and difficult to change.

This is true, though.


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--5l4o5tux7x4udrbq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmprrboACgkQ64mZXMKQ
wqlvpxAAicF2FMwaeEoZrU6YVBN1i+BLRYBE+bPP4Md/2ibrXJLvzq3pE1gAalKM
qEsR/QNB7hRhCfpvCf90bxJFc3+TOh80SK+HL4kHdNZgYVLIOLyFqPrK03neel0C
0J0SQbmLcy+ZYG8r3BBI30TKCvzymAFCb9s5YA5bcYPGUFS3yDV+0+GohSlFGPdf
CM+egmF02WaoFG7loc0SBk6nkk/RvAaR1e9S7CXp1n18srbH7FTckPkaRPM1u5fW
Zfz0koBf60WLayZdYeklB9WVlIfXqqToMC7W7UieKLjct1/h/R9eH0ACybxnXxLM
CHy45gRiqqgtxpq89RDqDs2/MJA/LH0YD/T9su18wQJCtIUu2t1LdwwkjDL2wkbD
1dSEw0y2JoeL7xEPzzmiWY3myWjALdeFcnXonzua4Mb4BtCEzIpTwHD3n3cfNPog
8UVfh4eN6JwopuZuLxZFEHytL/v8EI6nSC4kkjuBLBoqOp5kQiKiiO1pNAXklO/e
jPRw2hQC0JpVdoFTvKwNgOhyDd3716wSRJxYmUzX0ynKjW80r8ECLLgwK4B8bHrs
XtUuF+J3BRirCCMgXpzLJWJ2tB0kdzaPGRqfrh10GfdbIJtAxLR/pWES+RPBiXqj
ZmF4byjWmjtqiryaTFb1SDBhWt/NbFA0d0h+LF7yjDyfmrzR9Pk=
=Jzko
-----END PGP SIGNATURE-----

--5l4o5tux7x4udrbq--
