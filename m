From: Eric B Munson <ebmunson@us.ibm.com>
Subject: Re: [PATCH 3/3] Add MAP_HUGETLB example to vm/hugetlbpage.txt V2
Date: Fri, 14 Aug 2009 13:39:23 +0100
Message-ID: <20090814123923.GA6180@us.ibm.com>
References: <cover.1250156841.git.ebmunson@us.ibm.com> <e9b02974a0cca308927ff3a4a0765b93faa6d12f.1250156841.git.ebmunson@us.ibm.com> <83949d066e2a7221a25dd74d12d6dcf7e8b4e9ba.1250156841.git.ebmunson@us.ibm.com> <617054c59f53f43f6fecfd6908cfb86ea1dd6f72.1250156841.git.ebmunson@us.ibm.com> <alpine.DEB.2.00.0908131449270.9805@chino.kir.corp.google.com> <4A84B3F0.80009@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <4A84B3F0.80009@oracle.com>
Sender: owner-linux-mm@kvack.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org, akpm@linux-foundation.org, mtk.manpages@gmail.com
List-Id: linux-man@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Aug 2009, Randy Dunlap wrote:

> David Rientjes wrote:
> > On Thu, 13 Aug 2009, Eric B Munson wrote:
> >=20
> >> This patch adds an example of how to use the MAP_HUGETLB flag to
> >> the vm documentation.
> >>
> >> Signed-off-by: Eric B Munson <ebmunson@us.ibm.com>
> >> ---
> >> Changes from V1:
> >>  Rebase to newest linux-2.6 tree
> >>  Change MAP_LARGEPAGE to MAP_HUGETLB to match flag name in huge page s=
hm
> >>
> >>  Documentation/vm/hugetlbpage.txt |   80 +++++++++++++++++++++++++++++=
+++++++++
> >>  1 files changed, 80 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/Documentation/vm/hugetlbpage.txt b/Documentation/vm/huget=
lbpage.txt
> >> index ea8714f..d30fa1a 100644
> >> --- a/Documentation/vm/hugetlbpage.txt
> >> +++ b/Documentation/vm/hugetlbpage.txt
> >> @@ -337,3 +337,83 @@ int main(void)
> >> =20
> >>  	return 0;
> >>  }
> >> +
> >> +*******************************************************************
> >> +
> >> +/*
> >> + * Example of using hugepage memory in a user application using the m=
map
> >> + * system call with MAP_LARGEPAGE flag.  Before running this program =
make
> >=20
> > s/MAP_LARGEPAGE/MAP_HUGETLB/
>=20
> I'm (slowly) making source code examples in Documentation/ buildable,
> as this one should be, please.
>=20
> I.e., put it in a separate source file (hugetlbpage.txt can refer to the
> source file if you want it to) and add a Makefile similar to other
> Makefiles in the Documentation/ tree.
>=20
> ~Randy
>=20

I will make these changes for V3, thanks for the reviews.

--=20
Eric B Munson
IBM Linux Technology Center
ebmunson@us.ibm.com


--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqFWvsACgkQsnv9E83jkzpEQQCeL3/EAoDwsBTn+BqKZKL6NYOZ
LjsAoNnfVSmi4roOoiMK/h/ntwF5D2fL
=8ygH
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
