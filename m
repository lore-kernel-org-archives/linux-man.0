Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BF62DF68
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 00:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785543908; cv=none; b=bzo/P1B82dfJ8Li7Czi/AmCMxiF/AQ0Ova5atLjKb3q6fpye4VZU0cv80frfcN/8UBxKI9wWYtyMAamWRjCdrs1q59n9M9y/M9qxiTd+FGrR5AGogMjqb15A5IIUIi6UdDey+mvc0Z+LqpdMaHNoNqt981lbhOM6+lm86i39zrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785543908; c=relaxed/simple;
	bh=2nkS5sQTabAKF899HfLn1waljZ/332hQO9lvr+vlDUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qD565cpdbCQ/JLB7K9N6AKGY4y5konDxa8q/Bb/uPhjsvzzoeILMxJz779Di6e4rmvaeElqGHl5+bLfRbubYWAUJHlCbbVon27uABUeUnuUZCXPC5Pz+xDJoybUWZ6oF0yyKU8MVU3aXlzAQpXzaeSM4myKrsHXrPWrQi/gUjxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FcFQoVtE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FcFQoVtE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079A31F00AC4;
	Sat,  1 Aug 2026 00:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785543907;
	bh=nUEsJkcwyAXI+NPuXwUtNxZt2Q91DG6hrmWhoestEV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FcFQoVtEDwPK7uz+yXu3TdgwborqegUAz3lvDIJ3sQkcAdBxWdjlRAB3UMemZb1jp
	 XcemD65QCgxjo9L2AbzM6uSULfWQqfkgXzfwJaSS28RX+gsxuttN4mvX/F6NOoXFKq
	 86E9LMb59A25gsWbt2kiX816JpA9Qs913LLKConxSB8GP5wMuBnKXjX+kDLKKccvEr
	 d5vWoHTI3+4voHZdxLAV98+WZ6XvkFUmB88BDW2GpakoBoOb0IaMzLoaxkbE7unQvH
	 PPnjAByjznLGA98hspR4MtJ32x3m+Filf3YJ0nYkVfZvA36JtDWMG6KnboYw4Ub4tM
	 u8l6e0LBmLFJQ==
Date: Sat, 1 Aug 2026 02:25:02 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Alejandro Colomar <alx@kernel.org>, Sam James <sam@gentoo.org>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Joseph Myers <josmyers@redhat.com>, 
	Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>, 
	Nevin Liber <nevin@cplusplusguy.com>, Collin Funk <collin.funk1@gmail.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	Serge Hallyn <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, Evgeny Grin <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: [PATCH v2] man/man3/mem*(): SYNOPSIS: Document non-standard mem*()
 functions as provided by <memory.h>
Message-ID: <c5bad3a80de2feaf3838cb302eeaea1dcc4ba672.1785543779.git.alx@kernel.org>
X-Mailer: git-send-email 2.53.0
References: <cover.1785532392.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i64vkpko4v6wf3lj"
Content-Disposition: inline
In-Reply-To: <cover.1785532392.git.alx@kernel.org>


--i64vkpko4v6wf3lj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Alejandro Colomar <alx@kernel.org>, Sam James <sam@gentoo.org>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Joseph Myers <josmyers@redhat.com>, 
	Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>, 
	Nevin Liber <nevin@cplusplusguy.com>, Collin Funk <collin.funk1@gmail.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	Serge Hallyn <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, Evgeny Grin <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: [PATCH v2] man/man3/mem*(): SYNOPSIS: Document non-standard mem*()
 functions as provided by <memory.h>
Message-ID: <c5bad3a80de2feaf3838cb302eeaea1dcc4ba672.1785543779.git.alx@kernel.org>
References: <cover.1785532392.git.alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1785532392.git.alx@kernel.org>

They've been provided there since forever, and that's a more appropriate
header.

While it would be good to document the standard functions also as
provided by <memory.h>, that's more controversial, and is still being
litigated.

Link: <https://lore.kernel.org/linux-man/am0RdPxvbIYUKAL-@devuan/T/#t>
Cc: Sam James <sam@gentoo.org>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Joseph Myers <josmyers@redhat.com>
Cc: Keith Bostic <keith@bostic.com>
Cc: Mark Harris <mark.hsj@gmail.com>
Cc: Nevin Liber <nevin@cplusplusguy.com>
Cc: Collin Funk <collin.funk1@gmail.com>
Cc: JeanHeyd Meneide <phdofthehouse@gmail.com>
Cc: Christopher Bazley <chris.bazley.wg14@gmail.com>
Cc: Serge Hallyn <serge@hallyn.com>
Cc: Iker Pedrosa <ipedrosa@redhat.com>
Cc: Evgeny Grin <k2k@drgrin.dev>
Cc: Kees Cook <keescook@chromium.org>
Cc: bug-gnulib@gnu.org
Cc: libc-alpha@sourceware.org
Signed-off-by: Alejandro Colomar <alx@kernel.org>
---

Hi!

Here's a less ambitious change.  It's not that I don't want to pursue
the other one, but that this one will likely pass more quickly.

This only changes documentation for non-standard functions, where the
argument that the standard says XXX is now irrelevant.


Have a lovely night!
Alex

 man/man3/memfrob.3 | 2 +-
 man/man3/memmem.3  | 2 +-
 man/man3/mempcpy.3 | 2 +-
 man/man3/memrchr.3 | 2 +-
 man/man3/strdupa.3 | 4 ++++
 5 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/man/man3/memfrob.3 b/man/man3/memfrob.3
index ee41da0ced7b..ad736949002c 100644
--- a/man/man3/memfrob.3
+++ b/man/man3/memfrob.3
@@ -13,7 +13,7 @@ .SH LIBRARY
 .SH SYNOPSIS
 .nf
 .BR "#define _GNU_SOURCE" "             /* See feature_test_macros(7) */"
-.B #include <string.h>
+.B #include <memory.h>
 .P
 .BR "void *memfrob(" "size_t n;"
 .BI "              void " s [ n "], size_t " n );
diff --git a/man/man3/memmem.3 b/man/man3/memmem.3
index 13fd8b7cea7b..d0f99e6d577d 100644
--- a/man/man3/memmem.3
+++ b/man/man3/memmem.3
@@ -13,7 +13,7 @@ .SH LIBRARY
 .SH SYNOPSIS
 .nf
 .BR "#define _GNU_SOURCE" "         /* See feature_test_macros(7) */"
-.B #include <string.h>
+.B #include <memory.h>
 .P
 .BR "void *memmem(" "size_t hsize, size_t nsize;"
 .BI "             const void " haystack [ hsize "], size_t " hsize ,
diff --git a/man/man3/mempcpy.3 b/man/man3/mempcpy.3
index 012e6326dd00..4598be5d7bc2 100644
--- a/man/man3/mempcpy.3
+++ b/man/man3/mempcpy.3
@@ -14,7 +14,7 @@ .SH LIBRARY
 .SH SYNOPSIS
 .nf
 .BR "#define _GNU_SOURCE" "         /* See feature_test_macros(7) */"
-.B #include <string.h>
+.B #include <memory.h>
 .P
 .BR "void *mempcpy(" "size_t n;"
 .BI "              void " dest "[restrict " n "], const void " src "[restr=
ict " n ],
diff --git a/man/man3/memrchr.3 b/man/man3/memrchr.3
index 6e49defc5e4a..fe2841147f05 100644
--- a/man/man3/memrchr.3
+++ b/man/man3/memrchr.3
@@ -13,7 +13,7 @@ .SH LIBRARY
 .SH SYNOPSIS
 .nf
 .BR #define\~_GNU_SOURCE "  // See feature_test_macros(7)"
-.B #include <string.h>
+.B #include <memory.h>
 .P
 .BR void\~*memrchr( size_t\~n;
 .BI "              const void " s [ n "], int " c ", size_t " n );
diff --git a/man/man3/strdupa.3 b/man/man3/strdupa.3
index 63b12c83e9ec..412eec9f3491 100644
--- a/man/man3/strdupa.3
+++ b/man/man3/strdupa.3
@@ -16,6 +16,10 @@ .SH SYNOPSIS
 .B #include <string.h>
 .P
 .BI "char *strdupa(const char *" s );
+.P
+.BR "#define _GNU_SOURCE" "  /* See feature_test_macros(7) */"
+.B #include <memory.h>
+.P
 .BR "char *strndupa(" "size_t n;"
 .BI "              const char " s [ n "], size_t " n );
 .fi

base-commit: 8152eb52d9a92f02c14e843545acec7ee1946479
--=20
2.53.0


--i64vkpko4v6wf3lj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmptPN4ACgkQ64mZXMKQ
wqny7g/7BO+QUrK+T5Ol1EsyVckqIRo+MZI9XaKb/l97Xxtsn2ec3lQFs7vPHYc+
vbG4fq9amGW2F1fazvBA6bfFvkCZtAtdVWsSzaNUaxsjL3J6HWzMlrKTIZiKdQpa
yfHMFlVTE9EmuNx6VQCDmD1FihL2sCUnshIVnjOt4067MVnJwaX/gruis8pipQ01
Hb2H0vyqtThSyGmsAynsWNeDejv0c4LP/s+TdEAVYHJygfn4WNVc9fEo8zJLxpwX
glCkKPAvfCRP/Yz0SEcW/ZKAIddzwsMqAuWF9ECvS7oAP5EhMQiwc+0hNlalt3hY
0jd5qCMMJCyOvrrniclWKVAGBDid0ITFMAtdNFcpt8d6nSVfGep8AURhlkBSgKev
TQEgz6vAEYuLU2Fmeo9sDkkyO6vh8jyY3/5g9vgm6Rxsf2E4pxWFrs7KC5kFgFWV
TTxp6uF8eTnnMvzQ8LFADBB/sU8MI2K1IR/MSFdnIIfJAQaq359iJL5boKuHI8e+
1Hzm8TehhLzkiwAOaWNCWBEm9+ksfndOLClvBSX1aSaRr+tMIuDzcblu/ZacVCdN
LyNW0xRhLTF0erpAtmTbhS1f6748Nqxq4thgbQidAJ9T6yC3AkZY1zu6GXl2qq3/
QFKh5HWTdf0nAtXi4vZ5+HIYRZUHlA3kizzZp/pJhSYomNDAD3Y=
=2sdl
-----END PGP SIGNATURE-----

--i64vkpko4v6wf3lj--
