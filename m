From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] elf(5): document notes
Date: Sun, 27 Nov 2016 10:15:02 -0800
Message-ID: <20161127181502.GD20966@vapier.lan>
References: <20161117205939.2295-1-vapier@gentoo.org>
 <20161127033137.31756-1-vapier@gentoo.org>
 <2645467f-09b8-d2c1-b89f-7b5e52d0b233@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vni90+aGYgRvsTuO"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2645467f-09b8-d2c1-b89f-7b5e52d0b233-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--vni90+aGYgRvsTuO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

here's some updates.  i thought i'd done the core parts already, but i
guess i forgot in the interim.
-mike

--- a/man5/elf.5
+++ b/man5/elf.5
@@ -1846,11 +1846,11 @@ This is automatically populated by the linker.
 ELF notes allow for appending arbitrary information for the system to use.
 They are largely used by core files
 .RI ( e_type
-o f
+of
 .BR ET_CORE ),
 but many projects define their own set of extensions.
 For example,
-the GNU tool chain uses ELF notes to information from
+the GNU tool chain uses ELF notes to pass information from
 the linker to the C library.
=20
 Note sections contain a series of notes (see the
@@ -1893,7 +1893,12 @@ Keep in mind that the interpretation of
 depends on the namespace defined by the
 .I n_namesz
 field.
-After, of course, having determined whether the ELF image is a core file.
+If the
+.I n_namesz
+field is not set (e.g., is 0), then there are two sets of notes:
+one for core files and one for all other ELF types.
+If the namespace is unknown, then tools will usually fallback to these sets
+of notes as well.
 .in +4n
 .nf
=20
@@ -1936,6 +1941,9 @@ following values:
 Notes used by all core files.
 These are highly operating system or architecture specific and often requi=
re
 close coordination with kernels, C libraries, and debuggers.
+These are used when the namespace is the default (i.e.,
+.B n_namesz
+will be set to 0), or a fallback when the namespace is unknown.
 .RS
 .TP 21
 .PD 0
@@ -2109,11 +2117,10 @@ The desc consists of any nonzero number of bytes.
 The desc contains the GNU Gold linker version used.
 .RE
 .TP
-.B Unknown system
-The fallback set of note types when the namespace is unknown.
-Usually the name field will be omitted (i.e.,
+.B Default/unknown namespace (e_type !=3D ET_CORE)
+These are used when the namespace is the default (i.e.,
 .B n_namesz
-will be set to 0).
+will be set to 0), or a fallback when the namespace is unknown.
 .RS
 .TP 21
 .PD 0

--vni90+aGYgRvsTuO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYOyKmAAoJEEFjO5/oN/WBtoEP/0AJ7nTz2rdBvip2WdQHgX1J
Hjogj3hIdKPo8fRXxLGLQgaskT62kezu8hM8S91tX4WsiWG4sCvKp72ESjoJQLEm
d/+ewrWYvsIz/opvXB0mErHt1Od8fRupMdRc+DbA3Q30d5pCckxmZ8KlujiLdYIZ
R4FpS+3dT9IQgrQBJizdJCLr2P/kbuJ1tnHFLHXgasAZ/9Qn+e9Dkw6m6NwbRMF4
MTh19rZQfYljr9BKvnzFVIo9TOXTo0q9InzHPzchBP5hWD2yPj+6wGS+NSuO/Ua5
lV3sf5DRoFPv8FBvP/MsYOdQc4wT7kXfCQq5P672jAH4sPygdU25cgSsWxDEzCRR
mkP5PK6Ar1L52y0ZFDMFLOPMOmDTa7DQrmw1sTaAxW2ikrMUkWZGwx1HuXUMVzcU
s2SjKM/I6MmaaOHr09nBHqOzYGYUarZlsQkbXHP9OjTXjnijnD+MSl7eO1OuudnX
eOQQTKmfXpj+sWNKONDyHLtvQoqejtcmNN33Dffkg0Ixw1usnvYmETUve2lcUUKE
mQ0h9N+EFc5iSIqhN3UUA8HD2/TLRWiicRVaYiAd1e4av31BWiapyPv8qTMQGWEa
REVlYQaMbVMB27AnEo+gMnB4iHIESZSJmL1mSR8MYEHIStqByHj7yzG40WZC/tBr
I2nB2bCGz1RAvhNGmKJ0
=gLiQ
-----END PGP SIGNATURE-----

--vni90+aGYgRvsTuO--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
