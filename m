Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268730;
	b=4TGigm1jmd0xvB0YnwR9RjGsr2DPX6dbawegE2gHczoZSYSljiq6rzAr7s4jbCxUSzML
	 Ld83q8i6txbqgJK3+ukBAnt6Qe/LalnTKeTzHa5AbS64YblrTOh3e4x9A0IqAG6yro4KO
	 QaA6yuP7sJzhYXvnjfRl3Z/Cx7ZFxWM1XKOO/E2af3ZHKz/TO4Yq+Pxp2R4rMfvVvu8xk
	 hndJiuHljf0WmZYL+aTfv4JSrK92C4VbkpcQMGtL4bA9FRSLPPcKKLLI9iJAZzq6DEpQZ
	 I7IskqhMidY7QDTV12u0807AbOJWOP39Fw8bVJXWKJxsfOMMRNG3wu7fy1krjwT1xEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268730;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=ppfkqcQYSy0IR2+uLEbvO1LX11azhCs4mRDG8TwRTiY=;
	b=1r9ndUWMTQvu+NNtasFH7Bo5UXqxO9W7uAyCE3dG5ekcEGdM9Hro/Ws+2aZSGYG532iW
	 pcrgUMHvaolfuqAizG3KXczmRXElTZQp1/4WvY0J5AD7ewFMi6y49S4Hp06RHjkobdbMt
	 03TfIfR+41engb6H9IJtb03TrBEDxmUtkLORQ5H80jpwgA/kApNGHkLm4sQzE11Jnm4YC
	 8naHdxYPS21lZmYPGVJcfekfrOQlet2qoeIPPCCA4PhYlqY9e54a9dcVkB29fFE/KpOjP
	 JHiDxnmyaTM6xxMGxEOlFkQjkwrtGUswtNoBgJGjFiBalMaTh5PN7cu2/awXbSooeoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RFAbVubb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B627E606A31C
	for <linux-man@vger.kernel.org>; Mon,  9 Nov 2026 23:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RFAbVubb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1551F008A1;
	Mon,  9 Nov 2026 23:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794268729;
	bh=ppfkqcQYSy0IR2+uLEbvO1LX11azhCs4mRDG8TwRTiY=;
	h=Date:From:To:Cc:Subject;
	b=RFAbVubbeec5r/oJAYK2L70/RjBXp5nX8CRwDu9NgwDRhbbRqaLEYSr0hnXneQEVC
	 wi7RVxkD1/XW6I4gpYXLHKe33GSfCplKmiyVAqtgTLrRFT1h3hukvNmqGDBt9u3+j1
	 hsyLYu/nU0WLtjuJS2bzfZoN4tj3oH1YghgWRJ10kyFyTQCklNACiIP3YHlqcmVc/1
	 qd6Wi2pQAwbLpMTOzNQ3hco8hDqwlbA7zOi7Cu3QtBf80TsiciwP+VJrQ34YFN/m3n
	 2t2is/twmS1Tec2wFmJO9xCrGCziMeOTncES6eNUmXy8Js+378LOamSUAJdn7OLYeJ
	 xOWB0m9nVn9WQ==
Date: Tue, 10 Nov 2026 00:58:45 +0100
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Alejandro Colomar <alx@kernel.org>, libc-alpha@sourceware.org, 
	Walter Harms <wharms@bfs.de>, Rich Felker <dalias@libc.org>, ~hallyn/shadow@lists.sr.ht, 
	musl@lists.openwall.com
Subject: [PATCH v1] man/man3/crypt.3: These functions accept many algorithms,
 not only DES
Message-ID: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mcspwejeprvjtxot"
Content-Disposition: inline


--mcspwejeprvjtxot
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Alejandro Colomar <alx@kernel.org>, libc-alpha@sourceware.org, 
	Walter Harms <wharms@bfs.de>, Rich Felker <dalias@libc.org>, ~hallyn/shadow@lists.sr.ht, 
	musl@lists.openwall.com
Subject: [PATCH v1] man/man3/crypt.3: These functions accept many algorithms,
 not only DES
Message-ID: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
MIME-Version: 1.0

This page was written as if DES was the only portable algorithm, and
glibc was a weird one supporting other algorithms.  These days (and
since a long time ago), DES has been long deprecated, and crypt(3)
supports many algorithms in all systems.

Signed-off-by: Alejandro Colomar <alx@kernel.org>
---

Hi!

The patch for documenting the detail about "*" will come later.
This was a cleanup that seemed necessary before doing that.
Let me know what you think about it.  I'll reply with a copy of the
formatted page, so you don't need to apply the patch to review it.


Have a lovely night!
Alex

 man/man3/crypt.3 | 84 ++++--------------------------------------------
 1 file changed, 6 insertions(+), 78 deletions(-)

diff --git a/man/man3/crypt.3 b/man/man3/crypt.3
index 7c9a50a534b7..6c0511240898 100644
--- a/man/man3/crypt.3
+++ b/man/man3/crypt.3
@@ -47,56 +47,21 @@ .SH SYNOPSIS
 .SH DESCRIPTION
 .BR crypt ()
 is the password hashing function.
-It is based on the Data Encryption
-Standard algorithm with variations intended (among other things) to
-discourage use of hardware implementations of a key search.
 .P
 .I key
 is a user's typed password.
 .P
 .I salt
-is a two-character string chosen from the set
-.RB [ a\-zA\-Z0\-9./ ].
-This string is used to
-perturb the algorithm in one of 4096 different ways.
+is a string
+used for determining the hasing algorithm
+(possibly including parameters).
+It is also used to perturb the algorithm.
 .P
-By taking the lowest 7 bits of each of the first eight characters of the
-.IR key ,
-a 56-bit key is obtained.
-This 56-bit key is used to encrypt repeatedly a
-constant string (usually a string consisting of all zeros).
 The returned
-value points to the hashed password, a series of 13 printable ASCII
-characters (the first two characters represent the salt itself).
+value points to the hashed password.
 The return value points to static data whose content is
 overwritten by each call.
 .P
-Warning: the key space consists of
-.if t 2\s-2\u56\s0\d
-.if n 2**56
-equal 7.2e16 possible values.
-Exhaustive searches of this key space are
-possible using massively parallel computers.
-Software, such as
-.BR crack (1),
-is available which will search the portion of this key space that is
-generally used by humans for passwords.
-Hence, password selection should,
-at minimum, avoid common words and names.
-The use of a
-.BR passwd (1)
-program that checks for crackable passwords during the selection process is
-recommended.
-.P
-The DES algorithm itself has a few quirks which make the use of the
-.BR crypt ()
-interface a very poor choice for anything other than password
-authentication.
-If you are planning on using the
-.BR crypt ()
-interface for a cryptography project, don't do it: get a good book on
-encryption and one of the widely available DES libraries.
-.P
 .BR crypt_r ()
 is a reentrant version of
 .BR crypt ().
@@ -122,40 +87,6 @@ .SH ERRORS
 .BR crypt ()
 function was not implemented,
 probably because of U.S.A.\& export restrictions.
-.\" The following level of detail is not necessary in this man page.
-.\" .P
-.\" When encrypting a plain text P using DES with the key K results in the
-.\" encrypted text C, then the complementary plain text P' being encrypted
-.\" using the complementary key K' will result in the complementary encryp=
ted
-.\" text C'.
-.\" .P
-.\" Weak keys are keys which stay invariant under the DES key transformati=
on.
-.\" The four known weak keys 0101010101010101, fefefefefefefefe,
-.\" 1f1f1f1f0e0e0e0e and e0e0e0e0f1f1f1f1 must be avoided.
-.\" .P
-.\" There are six known half weak key pairs, which keys lead to the same
-.\" encrypted data.  Keys which are part of such key clusters should be
-.\" avoided.
-.\" Sorry, I could not find out what they are.
-.\""
-.\" .P
-.\" Heavily redundant data causes trouble with DES encryption, when used i=
n the
-.\" .I codebook
-.\" mode that
-.\" .BR crypt ()
-.\" implements.  The
-.\" .BR crypt ()
-.\" interface should be used only for its intended purpose of password
-.\" verification, and should not be used as part of a data encryption tool.
-.\" .P
-.\" The first and last three output bits of the fourth S-box can be
-.\" represented as function of their input bits.  Empiric studies have
-.\" shown that S-boxes partially compute the same output for similar input.
-.\" It is suspected that this may contain a back door which could allow the
-.\" NSA to decrypt DES encrypted data.
-.\" .P
-.\" Making encrypted data computed using crypt() publicly available has
-.\" to be considered insecure for the given reasons.
 .TP
 .B EPERM
 .I /proc/sys/crypto/fips_enabled
@@ -217,10 +148,7 @@ .SS Availability in glibc
 .I libxcrypt
 is an ABI-compatible drop-in replacement.
 .SH NOTES
-.SS Features in glibc
-The glibc version of this function supports additional
-hashing algorithms.
-.P
+.SS salt
 If
 .I salt
 is a character string starting with the characters

base-commit: b951aa8a5356e12f635650d0136abed715e0d607
--=20
2.55.0


--mcspwejeprvjtxot
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmryXjUACgkQ64mZXMKQ
wqms9BAAmTCfOjlAvujzL+686zbs1yUuDJzOzt96X9YjcgsMlkw45/F+nux29SVb
X+sRvlHka+o+frKxlMT7CrH/X56oFE8XemBucwpjk6LCBwuYyKubC+e+XTVE/gQE
LptFwQAC3fOBuOlGeN22eS/3XJItuGoJ9SsdENWVJ4qqfFx8ZZ/Y98Cd/RaBmd6n
xNgd+HP3OnSuc4SO53gXSUxRIPSpYWysMiVoedfGRMfEubwDva0dSeJsS0T1psSy
5P3wq6IJIayNrTldartnxcdvBKzcpjo0oSRooyOWA8bUVThAqQP7Kz4Wp0l/MZ4p
vrBeuKhvI79wc+SnEa3j8ade88lc4k6pYHrRZYIToAg7H14emhBUIEsDEQijMi7W
Vx95KTv5GzG0NH8ivo93TDsnJkdE0wvLwS6K6jPv5bcrMhN7D4al65/zF7rpF2VQ
aPZxwuWkT+oAn1Ul50SN6+3B8MM3RCneS1g90aZ4I0QmW4mkLxCMUaRF+Z4z7I3M
HBT7fwXEvd0W4atpTM9f4bnQzZuaZthc+6uqLkPo/kNBX44kG4Vgz1ARyCaGnJLz
4dI6YwJ+2Jm6GHHv++IfABLGPlUCVR3/oikZ28V1Fszfvc2ja3F+ZxMh2G8cDFyX
IcUAJufy831FckoIBb8CmDZ3uPu/stlPlsx/VBf2Prvjq8GMI7o=
=GZIn
-----END PGP SIGNATURE-----

--mcspwejeprvjtxot--
