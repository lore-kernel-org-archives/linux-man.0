Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D4C48986D
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 21:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785532749; cv=none; b=HD+SzcneLA5QgDHket4qQkPgqFZB8Kz3jfXDeKl4uWy8lgJ97g9g/rFAPjW4GNWb5rlJbF2OEuJDiLJU2sAkIvslu7zXVKbainP6OP0EpcRyu0kqCNiD/EscFGvEZV6S2afJSnOaE9ZVWZJhJnCghIDpHNqAVgIt8POVb0M4zdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785532749; c=relaxed/simple;
	bh=Rl3c3bKWk+N2PD/XEa4I68Xmw7nDbdlJ79lvi/7oN5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9kRR3kMEUjI31uR9UqdKUH2rkdXV9V9F2di+IkNFBvwesTwC+BCCEm+F/66XwUeAgeWiA+bxJBNJEybvQw0QmCyQAUJpuvhTbzz9F+mvweEx26O5TQk9iZ/08eg4NYoOLXHHtmJNGkmE4Gf1FUAGvSJTzo9o+DoeMuJyElK0qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JibLHXWX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JibLHXWX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88D81F00AC4;
	Fri, 31 Jul 2026 21:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785532748;
	bh=43qPhYPqsSStV86E3wKbKN/WGo9NoyHcGxMmgYLG2Ww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JibLHXWXAXMYu2bL42loAfmBCJt5LimAaotW14Fg4u19vFevGvOnmPCaMlC1dfdYK
	 ZAFZlaetX1NalbSduLAJLK/CEgP3i4/19ZnkwNsZFK1ENVoUVRnBtq7wHHgHmZ5dB2
	 L2PqoJsrrQ3loCGxUkxRKar/ZJVleMtZYwsKtuRcIRmLUuS1GXrkUWMZxv48SFpZHN
	 1091LMhVvj6CF8iga6t3V34OYSoCM1Q7lG3DSn2JOy8MKNVqo/CWbzIaKOFXZIkUSo
	 lbV2UKbfTVvGxU1mPQIXmi6gT9xzLMhVhIIxRmZbTgWlScEM2PTDhujQ7J67TwfWZX
	 i6p7IgJ7fZQ0g==
Date: Fri, 31 Jul 2026 23:19:04 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Keith Bostic <keith@bostic.com>, Joseph Myers <josmyers@redhat.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Alejandro Colomar <alx@kernel.org>
Subject: [PATCH 2/2] man/man*/{string.3,memory.h.3head}: Move functions to a
 new page memory.h(3head)
Message-ID: <668ab8c64821ef8c08a93e6799e384f5cac3e97f.1785532392.git.alx@kernel.org>
X-Mailer: git-send-email 2.53.0
References: <cover.1785532392.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s3wp6obk3vhvf5ak"
Content-Disposition: inline
In-Reply-To: <cover.1785532392.git.alx@kernel.org>


--s3wp6obk3vhvf5ak
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Keith Bostic <keith@bostic.com>, Joseph Myers <josmyers@redhat.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Alejandro Colomar <alx@kernel.org>
Subject: [PATCH 2/2] man/man*/{string.3,memory.h.3head}: Move functions to a
 new page memory.h(3head)
Message-ID: <668ab8c64821ef8c08a93e6799e384f5cac3e97f.1785532392.git.alx@kernel.org>
References: <cover.1785532392.git.alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1785532392.git.alx@kernel.org>

See previous commit.

Signed-off-by: Alejandro Colomar <alx@kernel.org>
---
 man/man3/string.3       | 95 +++--------------------------------------
 man/man3head/memory.h.3 | 57 +++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 90 deletions(-)
 create mode 100644 man/man3head/memory.h.3

diff --git a/man/man3/string.3 b/man/man3/string.3
index da87799a5e69..02c9897d8771 100644
--- a/man/man3/string.3
+++ b/man/man3/string.3
@@ -5,7 +5,7 @@
 .\"
 .TH string 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-string \- byte operations
+string \- string operations
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
@@ -15,84 +15,25 @@ .SH SYNOPSIS
 .B #include <strings.h>
 .fi
 .SH DESCRIPTION
-.SS Write
-.TP
-Write bytes
-.RS
-.TP
-.BR bzero (3)
-.TQ
-.BR memset (3)
-.RE
 .SS Copy
 .TP
-Copy bytes
-.RS
-.TP
-.BR memmove (3)
-.TQ
-.BR memcpy (3)
-.TQ
-.BR mempcpy (3)
-.TQ
-.BR memccpy (3)
-.RE
-.TP
-Copy strings
-.RS
-.TP
 .BR strcpy (3)
 .TQ
 .BR stpcpy (3)
-.RE
-.TP
-Copy nonstrings
-.RS
-.TP
-.BR strncpy (3)
-.RE
 .SS Catenate
 .TP
-Catenate strings
-.RS
-.TP
 .BR strcat (3)
-.RE
-.TP
-Catenate nonstrings
-.RS
-.TP
-.BR strncat (3)
-.RE
 .SS Duplicate
 .TP
-Duplicate strings
-.RS
-.TP
 .BR strdup (3)
 .TQ
 .BR strdupa (3)
-.RE
-.TP
-Duplicate nonstrings
-.RS
-.TP
-.BR strndup (3)
-.TQ
-.BR strndupa (3)
-.RE
 .SS Compare
 .TP
-Compare bytes
-.RS
-.TP
 .BR memeq (3)
-.TQ
-.BR memcmp (3)
-.RE
-.TP
-Compare strings
-.RS
+.IP
+This function should be in
+.IR <memory.h> .
 .TP
 .BR streq (3)
 .TQ
@@ -103,30 +44,8 @@ .SS Compare
 .BR strcoll (3)
 .TQ
 .BR strverscmp (3)
-.RE
-.TP
-Compare nonstrings
-.RS
-.TP
-.BR strncmp (3)
-.TQ
-.BR strncasecmp (3)
-.RE
 .SS Search
 .TP
-Search bytes
-.RS
-.TP
-.BR memchr (3)
-.TQ
-.BR memrchr (3)
-.TQ
-.BR memmem (3)
-.RE
-.TP
-Search strings
-.RS
-.TP
 .BR strlen (3)
 .TQ
 .BR strnul (3)
@@ -146,18 +65,14 @@ .SS Search
 .BR strspn (3)
 .TQ
 .BR strcspn (3)
-.RE
 .SS Separate
 .TP
-Separate strings
-.RS
-.TP
 .BR strsep (3)
 .TQ
 .BR strtok (3)
-.RE
 .SS Others
 .TP
 .BR strxfrm (3)
 .SH SEE ALSO
+.BR memory.h (3head),
 .BR string_copying (7)
diff --git a/man/man3head/memory.h.3 b/man/man3head/memory.h.3
new file mode 100644
index 000000000000..786da968f9fd
--- /dev/null
+++ b/man/man3head/memory.h.3
@@ -0,0 +1,57 @@
+.\" Copyright 1993, David Metcalfe <david@prism.demon.co.uk>
+.\" Copyright, the authors of the Linux man-pages project
+.\"
+.\" SPDX-License-Identifier: Linux-man-pages-copyleft
+.\"
+.TH memory.h 3head (date) "Linux man-pages (unreleased)"
+.SH NAME
+memory.h \- memory operations
+.SH LIBRARY
+Standard C library
+.RI ( libc ,\~ \-lc )
+.SH SYNOPSIS
+.nf
+.B #include <memory.h>
+.fi
+.SH DESCRIPTION
+.SS Write
+.TP
+.BR bzero (3)
+.TQ
+.BR memset (3)
+.SS Copy
+.TP
+.BR memmove (3)
+.TQ
+.BR memcpy (3)
+.TQ
+.BR mempcpy (3)
+.TQ
+.BR memccpy (3)
+.TQ
+.BR strncpy (3)
+.SS Catenate
+.TP
+.BR strncat (3)
+.SS Duplicate
+.TP
+.BR strndup (3)
+.TQ
+.BR strndupa (3)
+.SS Compare
+.TP
+.BR memcmp (3)
+.TQ
+.BR strncmp (3)
+.TQ
+.BR strncasecmp (3)
+.SS Search
+.TP
+.BR memchr (3)
+.TQ
+.BR memrchr (3)
+.TQ
+.BR memmem (3)
+.SH SEE ALSO
+.BR string (3),
+.BR string_copying (7)
--=20
2.53.0


--s3wp6obk3vhvf5ak
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmptEUcACgkQ64mZXMKQ
wqmdChAAk/zR9O4t2vnn1tZBEjFItA0AdIEj7NzzTEztOZ+Ssl1yqX7Lo3PP7biT
tGJ5xAiNBWoNLAMR9jlAX4F6We47bNN2+3rZutNjd8rID2pOqBIdiDRGqt2bCa+7
ZF6T9iygoFvKOZWx18tU2BekWXKLu1fuDHvoN2m5evoDzLMnZOoKQ/BmMN4nUIi0
hrKunL1JYQtV1FAk0Cn7kiDA51KlXushQIrLspPoBQxirTgHNSNxGiS3L6bD8aQW
vujSwawRcyc94nJgu/LT2VKVIMTs2wHXe7yJW8y3rTSezfr8iV08hbtsh2+7FvUS
zc5n9ZDzd6RYB+vQJ61mITZkKR7943ZreuxYi7HkFyeok28GsmrKF3MVJytVa98q
qPSpVpeNxwuM4lXUQJYvcV7/y64YUsuMW0DJGZnEAakh5DjfHEsfyl/AW66abGdx
XOrJns2jeysFkCZpXp7MljOcADpLccq9rEeoRDnY/FF3LZiDR1OWRQSI8x88sMnw
KBnbpy7wm5jcsXF+bLa27P5WadsdmRjNEuBzryfXzvT3BvU8pPvsp3/2fBj/U/Xj
dUMg5sFsGlxQc87kYDAxZ6LI7CvpjhFmAOOqq6+PMy89WSTAwp8vYdaLCPxivf46
j8vTrIxfIWtCiVnb/B4+EjvcF4bOTFjdn7AUfAYKhSreLrohoUA=
=Jkp3
-----END PGP SIGNATURE-----

--s3wp6obk3vhvf5ak--
