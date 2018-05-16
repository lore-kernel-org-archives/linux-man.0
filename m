From: "Dmitry V. Levin" <ldv@altlinux.org>
Subject: Re: glibc and linux-man disagrees about pkey_alloc
Date: Wed, 16 May 2018 14:19:10 +0300
Message-ID: <20180516111910.GB19883@altlinux.org>
References: <adae131e-c782-9508-808f-9cbea92ef694@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Return-path: <libc-alpha-return-92553-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
Content-Disposition: inline
In-Reply-To: <adae131e-c782-9508-808f-9cbea92ef694@arm.com>
To: Szabolcs Nagy <szabolcs.nagy@arm.com>
Cc: mtk.manpages@gmail.com, nd@arm.com, linux-man@vger.kernel.org, GNU C Library <libc-alpha@sourceware.org>, Rich Felker <dalias@libc.org>
List-Id: linux-man@vger.kernel.org


--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 16, 2018 at 12:10:40PM +0100, Szabolcs Nagy wrote:
> glibc sysdeps/unix/sysv/linux/bits/mman-shared.h:
>=20
> int pkey_alloc (unsigned int __flags, unsigned int __access_rights) __THR=
OW;
>=20
> linux-man http://man7.org/linux/man-pages/man2/pkey_alloc.2.html :
>=20
> int pkey_alloc(unsigned long flags, unsigned long access_rights);
>=20
> i assume the documentation should be fixed (as the glibc
> code is already in use)

Note that pkey_alloc syscall takes arguments of type "unsigned long"
and explicitly tests them for unsupported bits.


--=20
ldv

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJa/BOuAAoJEAVFT+BVnCUIjQMQAOKlOwE/uzOVapmR6KRN1d71
9YxDufiABxnZ7NnCU5JfT/dDvuYiGXuWHd0dHi60q35x2/a8lCt92ukURiT3NWYV
M/AoitkRKKAmknyFfIrssYyecR1Q61fc+HIF60kcR0H5o47S6ubZCXYYresMzOd1
6aReEPXI6GbMa4+bjTREYpZWsImLd7UaG1OdlCexZDy4LnN/LToCmaCYCyuFWQ1F
i7omYOsHs9b/X0dV9ydiB+8hEYlJpST2kcBqVnL64BV7SI4EeyZdlgwpBC932uun
DaTYAVDbzvZgcFgXlNS3TDwkbpnNYwqdnMpzyJEjWkhHlTJY1M5+3Vo1PzHhWM1g
wK+AFznWyqjaHLUW3MlUSGmUEDcAlWKTneUzJqaObzhVczjL4m+WTfXEG4s6u5ZJ
z7p967lBJKouf5tcbJ5bfWswnXAoCAHSGXNRY09hVJBZEWWqzr73CVWhVZAXXoNK
5EEGkNx+Xm+pjv+2CkyVUOYNu64cVTMYBA4BpJzaHl4J7WNJ95IJ0oHLiugV8eQM
/aPHr6KQgtIKmfs5vjUcP4+g3PrK/m/jwmvhkcuQ+ylHV7DxE2NJh2xASW+6ZaTO
mR+OGwXD+cJe4OxCN3pOx6Gee0D9L3FQOHF3+M5pNFTxIQksXWDBQgVO+XT1uNPI
cDenedn8rjn6R8nvlbI9
=PYUA
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--
