From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] fts.3 is not available in LFS builds
Date: Tue, 18 Mar 2014 23:12:45 -0400
Message-ID: <10506751.CXtlUKOUPc@vapier>
References: <20140315135416.GA10430@infradead.org> <20140317140616.GA15958@infradead.org> <CAKgNAkinnsvoXT_FNxaS7L5Umo6va8OCVnTv-gZ5vvVSFi2--w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart82087050.spNOAeB9Wc"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkinnsvoXT_FNxaS7L5Umo6va8OCVnTv-gZ5vvVSFi2--w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--nextPart82087050.spNOAeB9Wc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Mon 17 Mar 2014 15:11:18 Michael Kerrisk wrote:
> On Mon, Mar 17, 2014 at 3:06 PM, Christoph Hellwig wrote:
> > On Mon, Mar 17, 2014 at 03:02:53PM +0100, Michael Kerrisk wrote:
> >> Oh! I thought most distributors built their 32-bit distros with
> >> -D_FILE_OFFSET_BITS=3D64 these days? Am I wrong? (I don't have any=

> >> 32-bit systems handy to sample from.)
> >=20
> > I think some build systems try to enforce it, but last time Eric Sa=
ndeen
> > checked we still had lots of packages not picking it up.
>=20
> Okay. I trimmed it back close to your original text:
>=20
>     BUGS
>        All  of  the  APIs described in this man page are not safe whe=
n
>        compiling a program using the LFS APIs on 32-bit systems (e.g.=
,
>        when compiling with -D_FILE_OFFSET_BITS=3D64).
>=20
> (Okay?)

not to throw a wrench in there as a pedantic a$$hole, but i find the cl=
assic=20
concept of "32-bit and 64-bit systems" to not really fit into modern wo=
rld=20
(well, it's been this way for much longer, so let's say "mainstream").

would you call all ILP32 ABIs 32-bit ?  e.g. mips' n32 or x86's x32. =20=

sizeof(long) =3D=3D 4, but sizeof(off_t) =3D=3D 8.  POSIX describes the=
se as "ILP32=20
OFF64" while the classic 32-bit systems are "ILP32 OFF".

you can (afaik) use -D_FILE_OFFSET_BITS=3D64 w/x32 and fts.h and have i=
t work. =20
maybe we just ignore the issue since fts.h is dead anyways ?  just add =
a=20
section to the fts(3) page recommending people use ftw(3) instead ?
=2Dmike
--nextPart82087050.spNOAeB9Wc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABAgAGBQJTKQstAAoJEEFjO5/oN/WBR/YQANpXJNnJqnS2BuvGthunE/JU
8pN6TJeB0tdYO9qnLT/bDG1QLcp9SSXAEg+ckDfaW7XIxJERDIsBbCGsXZlzB0bN
ubKX0stehjMrDTc6GR5Ho9ITU3Mh2RkDom922pV0Tr/5N0XE0M+6SJqY7MysX6Q4
HPKZT74PC0myrIalEuPq/mBZGayHxui4DqQqf6ZCxRnfeACwpKnIOzdI73mhp++t
lcO+PW70kyXw7jIH0YSEFBrJw0fPCPGs589mKVDx2zimSNb+OBArI8Lj6ydG5/SK
VZGuwG0diOECgPDIW6udCmhpg1AJckzra6JYHEvH5NDELh4JOfGuUGk8956VTdiO
T4MD+44diag9RWnzFaNaWISW8StUGisz+OAgnil9pc9Ob+bLN9b5+HBxJPDfjMrd
e5SRrSevCOGMdhlCuIiOL6/+jmKUSjZWiyAV/Y2kAA0zWLe0Cf5TFRl5kymBJtdK
SsyNUG+F0LXk+f1kJNrBQD868AFjrTEfzlPH3BvsV6oK5Gvzj9N8uTL+DfDHlIzx
MQqkpRPoTrL2amT9umeG3chtg6T0ecTZBY5Ll3lCjlTEmsEDsWXv+oz1/4sgLaG7
ICeyviiO6K0o1JjmmtIRErr/rmMpJ0XhsDPqecqMn4cBpeypWL7f9FYASzr/PslS
kQ21nn1YuBCsH7EFtYS4
=+ETG
-----END PGP SIGNATURE-----

--nextPart82087050.spNOAeB9Wc--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
