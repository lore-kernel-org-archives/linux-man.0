From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: should "man feature_test_macros" mention _LARGEFILE_SOURCE?
Date: Tue, 18 Mar 2014 22:48:56 -0400
Message-ID: <4257256.dYt9XWSnPY@vapier>
References: <alpine.LFD.2.11.1403181544010.5574@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6301207.ndIlnE8PRN"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.11.1403181544010.5574@localhost>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--nextPart6301207.ndIlnE8PRN
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Tue 18 Mar 2014 15:46:43 Robert P. J. Day wrote:
>   just noticed under /usr/include on my fedora rawhide system the
> following:
>=20
> /usr/include/bits/environments.h:# define __ILP32_OFFBIG_CFLAGS=09"-m=
32
> -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64"
> /usr/include/python3.3m/pyconfig-64.h:#define _LARGEFILE_SOURCE 1
> /usr/include/features.h:   _LARGEFILE_SOURCE=09Some more functions fo=
r=20
correct
> standard I/O. /usr/include/features.h:#  undef _LARGEFILE_SOURCE
> /usr/include/features.h:#  define _LARGEFILE_SOURCE=091
> /usr/include/features.h:#ifdef _LARGEFILE_SOURCE
> /usr/include/python2.7/pyconfig-64.h:#define _LARGEFILE_SOURCE 1
>=20
> but there's no mention of "_LARGEFILE_SOURCE" in "man
> feature_test_macros". is that assumed to be implied by
> _LARGEFILE64_SOURCE? it's not clear.

nope, none of the three LFS flags imply each other, nor should they.  t=
hey're=20
related, but orthogonal by design.

i could have sworn i saw a description of them in POSIX, but i can't fi=
nd it=20
now.  the GNU C library manual covers it though:
https://www.gnu.org/software/libc/manual/html_node/Feature-Test-Macros.=
html

here's a terse summary off the top of my head:

_LARGEFILE_SOURCE: expose prototypes for new funcs which POSIX got wron=
g=20
originally.  e.g. fseek & ftell utilize "long", so fseeko & ftello were=
 added=20
which use "off_t".

_LARGEFILE64_SOURCE: expose prototypes for 64-bit variant funcs w/out=20=

affecting any existing funcs.  e.g. you now have fseeko64 & ftello64 wh=
ich=20
take explicit off64_t types while fseeko and ftello are unchanged.  mak=
es=20
sense when sizeof(off_t) =3D=3D 4 && sizeof(off64_t) =3D=3D 8.

_FILE_OFFSET_BITS: explicitly set the off_t size.  set it to 32 if you =
want=20
sizeof(off_t) =3D=3D 4, or set it to 64 if you want sizeof(off_t) =3D=3D=
 8.

in the ideal world, _FILE_OFFSET_BITS should default to 64 and=20
_LARGEFILE_SOURCE should default to defined.  in our crap world, apps s=
hould=20
be always building with these in their CPPFLAGS.
=2Dmike
--nextPart6301207.ndIlnE8PRN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABAgAGBQJTKQWYAAoJEEFjO5/oN/WBF7AP/iGfJo8QhEv2V5VYiITmsy0x
yz9FVjmba/Svfs3PYg6nXxIdl71RKpU9451k9n9I/qsutV1ni2BnL1PsrXH+Ibg+
8H/RPKypmc3k37urCc+htxY3N2Fc2YwlmKQVAN1GzDhX8b1mf/3PG7XZOnzW1BKg
kfsqN4ATHjZEXI3drKEAyHhvz3Vqe/aNUOaCLor18Y98RnaCPZdRliNbmx6Z5a7Q
FW4kEgQehQ0MXGrjfByxgNzSvPUCvK5WFXBGPoTm2UuI/w7yb/h2YRqDGvzQm/qP
nfUunZ7m5UCtd2jZQviESecYB3AGz0pJSjnFQt07As3ZmUDpc3+lJvtcqorwMwuf
19hjI35dpJ2q+4zilmDwP1VnBEf2b/aUcVsmAQZ1d5ExDYcQcWyeq0g0pld4ScBi
V+JLTpGJ8CwSSh1bdrNsFflVM2I1skdeO0mDbdLA9l5DgQx7DKM0J0JhzpPipcny
FYrdFKIJFz9YeqJp4Lc72ANl/ZMKshdmNwVCnFlch/14p13cLNPBT5F/AIQ6vOwY
7NMhCvTnBSqJHWeItIXtYr6eYbH9nOGHdbGZ1J+Evx8rQrhuBdm1zNrwVMi7U1ZK
lw0kyn4rCxx6sXaasL0b0zb66OOcwxUDm+oGONyae+V7N93qROLurNdhReXx6PdQ
xhW/XSrN1sTZABXXMK6e
=Mp7L
-----END PGP SIGNATURE-----

--nextPart6301207.ndIlnE8PRN--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
