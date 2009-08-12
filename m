From: Eric B Munson <ebmunson@us.ibm.com>
Subject: Re: [PATCH 2/3] Add MAP_LARGEPAGE for mmaping pseudo-anonymous
	huge page regions
Date: Wed, 12 Aug 2009 10:08:11 +0100
Message-ID: <20090812090811.GA5404@us.ibm.com>
References: <cover.1249999949.git.ebmunson@us.ibm.com> <2154e5ac91c7acd5505c5fc6c55665980cbc1bf8.1249999949.git.ebmunson@us.ibm.com> <a45eb555ca7d9e23e5eb051e27f757ae70a6b0c5.1249999949.git.ebmunson@us.ibm.com> <cfd18e0f0908112207y186d0aav6e0e55ce070778cf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0908112207y186d0aav6e0e55ce070778cf@mail.gmail.com>
Sender: owner-linux-mm@kvack.org
To: mtk.manpages@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 12 Aug 2009, Michael Kerrisk wrote:

> Eric,
>=20
> On Wed, Aug 12, 2009 at 12:13 AM, Eric B Munson<ebmunson@us.ibm.com> wrot=
e:
> > This patch adds a flag for mmap that will be used to request a huge
> > page region that will look like anonymous memory to user space. =A0This
> > is accomplished by using a file on the internal vfsmount. =A0MAP_LARGEP=
AGE
> > is a modifier of MAP_ANONYMOUS and so must be specified with it. =A0The
> > region will behave the same as a MAP_ANONYMOUS region using small pages.
>=20
> Does this flag provide functionality analogous to shmget(SHM_HUGETLB)?
> If so, would iot not make sense to name it similarly (i.e.,
> MAP_HUGETLB)?
>=20
> Cheers,
>=20
> Michael
>=20
> --=20
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Watch my Linux system programming book progress to publication!
> http://blog.man7.org/
>=20

I have no particular attachment to MAP_LARGEPAGE, I will make this chage fo=
r V2.

--=20
Eric B Munson
IBM Linux Technology Center
ebmunson@us.ibm.com


--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqChnsACgkQsnv9E83jkzoGOwCgupx9EC5bYI7GrnwhMH8tcpVW
sh4AoK6AAeN4exv9gK+V7d5Qu8+/TBeK
=1Il2
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
