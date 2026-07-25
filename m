Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BE2524F
	for <linux-man@vger.kernel.org>; Sat, 25 Jul 2026 23:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785023412; cv=none; b=lwF3C+HW25HKwmTyb2odnrRQjbkFcA4LvpU9R2K47iabePN7gYyYWd+faASxWrLdJhIrH+YwAYeEDeDi/2Niq8ODFiHm4cQt6JVpLDmTN+pvcogpAxHIzFP4+uY3weo6/qKgRnAR1wubZeAXx2RCCqlcPrBq1NQpa6bu7X6D+Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785023412; c=relaxed/simple;
	bh=FQdmDDyd/r7crvqFeaYyEfChM3TspZgur+xkQfqHx0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ebg5aZ7yMafnSKlEdoDOpeVM8lH1ikk6LqRbP2kQgtCnh82SKxMrUVzh6aCqHDpfQW2Sg4JH0lxQ2XPmNN9kLzXmhn71Bb0pv+9LDqOUGS4oZw8wOUl3E8RbUONCF96v1Lft9TNFbXKA1RZ/jh08nYkGAWbhYa4O3CYzZ2tSsd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2Vtvmnb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2Vtvmnb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F76B1F000E9;
	Sat, 25 Jul 2026 23:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785023410;
	bh=17GNTKowYT3QPvrZzIJZIkmj8aMzT938lwbqRUAGSAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d2VtvmnbZTACCGaT0v/bEgRZPSIR5LkvR+XNJjRqdFnwBbh7DKUs2wPwkXqTkMR1B
	 CjrV8sCEdUP38UuKpQr6tWOls74dyslKbmPYzQNDyqL0Dr9i6oL6iU90THU2fmaBMC
	 U9vCvcWdBDe1n5O5zlx6EJdJPehhzWf8fItATEryJX39W35INqGrlQbu0mZY9kYx98
	 VGyqD4FK59PEWjzzxGRcCZcQUPg9hwcGdx7i3HzkRZnIlpY31i99LNzeNW5fDQPzAY
	 fcUv/G+WRHTYqhOhhmIgrByRfC5kulG2xlhIzWSUp+sL/XQJCiucc/CoK1Sw+tPLXS
	 l6izg3Xo+yVCw==
Date: Sun, 26 Jul 2026 01:50:07 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Mark Harris <mark.hsj@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, 
	Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v3 4/4] man/man3/[b]string.3: Rewrite and merge
Message-ID: <dcd1507df29b94800db01b3ba9e880c02ae4480d.1785023118.git.alx@kernel.org>
X-Mailer: git-send-email 2.53.0
References: <cover.1785023118.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z5vhfpj5fagzzcay"
Content-Disposition: inline
In-Reply-To: <cover.1785023118.git.alx@kernel.org>


--z5vhfpj5fagzzcay
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Mark Harris <mark.hsj@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, 
	Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v3 4/4] man/man3/[b]string.3: Rewrite and merge
Message-ID: <dcd1507df29b94800db01b3ba9e880c02ae4480d.1785023118.git.alx@kernel.org>
References: <cover.1785023118.git.alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1785023118.git.alx@kernel.org>

Let's have a single page with an organized list of functions.

Cc: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Mark Harris <mark.hsj@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Signed-off-by: Alejandro Colomar <alx@kernel.org>
---
 man/man3/bstring.3 |  81 +--------------
 man/man3/string.3  | 238 ++++++++++++++++++++++++++-------------------
 2 files changed, 137 insertions(+), 182 deletions(-)

diff --git a/man/man3/bstring.3 b/man/man3/bstring.3
index c3b5782d3554..f02a9f29817b 100644
--- a/man/man3/bstring.3
+++ b/man/man3/bstring.3
@@ -1,80 +1 @@
-.\" Copyright 1993, David Metcalfe <david@prism.demon.co.uk>
-.\" Copyright, the authors of the Linux man-pages project
-.\"
-.\" SPDX-License-Identifier: Linux-man-pages-copyleft
-.\"
-.TH bstring 3 (date) "Linux man-pages (unreleased)"
-.SH NAME
-bcmp, bcopy, bzero, memccpy, memchr, memcmp, memcpy, memfrob, memmem,
-memmove, memset \- byte string operations
-.SH LIBRARY
-Standard C library
-.RI ( libc ,\~ \-lc )
-.SH SYNOPSIS
-.nf
-.B #include <string.h>
-.P
-.BR "int bcmp(" "size_t n;"
-.BI "         const void " s1 [ n "], const void " s2 [ n "], size_t " n );
-.P
-.BR "void bcopy(" "size_t n;"
-.BI "         const void " src [ n "], void " dest [ n "], size_t " n );
-.P
-.BR "void bzero(" "size_t n;"
-.BI "         void " s [ n "], size_t " n );
-.P
-.BR "void *memccpy(" "size_t n;"
-.BI "         void " dest [ n "], const void " src [ n "], int " c ", size=
_t " n );
-.P
-.BR "void *memchr(" "size_t n;"
-.BI "         const void " s [ n "], int " c ", size_t " n );
-.P
-.BR "int memcmp(" "size_t n;"
-.BI "         const void " s1 [ n "], const void " s2 [ n "], size_t " n );
-.P
-.BR "void *memcpy(" "size_t n;"
-.BI "         void " dest [ n "], const void " src [ n "], size_t " n );
-.P
-.BR "void *memfrob(" "size_t n;"
-.BI "         void " s [ n "], size_t " n );
-.P
-.BR "void *memmem(" "size_t hsize, size_t nsize;"
-.BI "             const void " haystack [ hsize "], size_t " hsize ,
-.BI "             const void " needle [ nsize "], size_t " nsize );
-.P
-.BR "void *memmove(" "size_t n;"
-.BI "         void " dest [ n "], const void " src [ n "], size_t " n );
-.P
-.BR "void *memset(" "size_t n;"
-.BI "         void " s [ n "], int " c ", size_t " n );
-.fi
-.SH DESCRIPTION
-The byte string functions perform operations on strings (byte arrays)
-that are not necessarily null-terminated.
-See the individual man pages
-for descriptions of each function.
-.SH NOTES
-The functions
-.BR bcmp ()
-and
-.BR bcopy ()
-are obsolete.
-Use
-.BR memcmp ()
-and
-.BR memmove ()
-instead.
-.\" The old functions are not even available on some non-GNU+Linux systems.
-.SH SEE ALSO
-.BR bcmp (3),
-.BR bcopy (3),
-.BR bzero (3),
-.BR memccpy (3),
-.BR memchr (3),
-.BR memcmp (3),
-.BR memcpy (3),
-.BR memfrob (3),
-.BR memmem (3),
-.BR memmove (3),
-.BR memset (3),
-.BR string (3)
+.so man3/string.3
diff --git a/man/man3/string.3 b/man/man3/string.3
index 2141822e1fd1..da87799a5e69 100644
--- a/man/man3/string.3
+++ b/man/man3/string.3
@@ -5,7 +5,7 @@
 .\"
 .TH string 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-string \- string operations
+string \- byte operations
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
@@ -15,115 +15,149 @@ .SH SYNOPSIS
 .B #include <strings.h>
 .fi
 .SH DESCRIPTION
-The string functions perform operations on null-terminated
-strings.
-See the individual man pages for descriptions of each function.
+.SS Write
 .TP
-.BR strcasecmp (3)
-Compare two strings,
-ignoring case.
+Write bytes
+.RS
 .TP
-.BR strncasecmp (3)
-Compare the first bytes of two strings,
-ignoring case.
+.BR bzero (3)
+.TQ
+.BR memset (3)
+.RE
+.SS Copy
 .TP
-.BR stpcpy (3)
-Copy a string,
-returning a pointer to the end of the resulting string.
+Copy bytes
+.RS
 .TP
-.BR strcat (3)
-Append a string into an existing string.
+.BR memmove (3)
+.TQ
+.BR memcpy (3)
+.TQ
+.BR mempcpy (3)
+.TQ
+.BR memccpy (3)
+.RE
 .TP
-.BR strchr (3)
-Find the first occurrence of a character
-in a string.
-.TP
-.BR strcmp (3)
-Compare two strings.
-.TP
-.BR strcoll (3)
-Compare two strings,
-using the current locale.
+Copy strings
+.RS
 .TP
 .BR strcpy (3)
-Copy a string.
+.TQ
+.BR stpcpy (3)
+.RE
 .TP
-.BR strcspn (3)
-Calculate the length of the initial segment of a string
-which does not contain any of the rejected bytes.
-.TP
-.BR strdup (3)
-Duplicate a string
-in memory allocated using
-.BR malloc (3).
-.TP
-.BR strfry (3)
-Randomly swap the characters in a string.
-.TP
-.BR strlen (3)
-Return the length of a string.
-.TP
-.BR strncat (3)
-Append non-null bytes from an array
-to a string,
-and null-terminate the result.
-.TP
-.BR strncmp (3)
-Compare the first bytes of two strings.
-.TP
-.BR strpbrk (3)
-Find the first occurrence in a string
-of one of the bytes in the accepted bytes.
-.TP
-.BR strrchr (3)
-Find the last occurrence of a character
-in a string.
-.TP
-.BR strsep (3)
-Extract the initial field in a string
-that is delimited by one of the delimiter bytes.
-.TP
-.BR strspn (3)
-Calculate the length of the initial segment of a string
-that consists entirely of accepted bytes.
-.TP
-.BR strstr (3)
-Find the first occurrence of a substring
-in a string.
-.TP
-.BR strtok (3)
-Extract tokens from a string
-that are delimited by one of the delimiter bytes.
-.TP
-.BR strxfrm (3)
-Transforms a string
-to the current locale
-and copies the first bytes to a buffer.
+Copy nonstrings
+.RS
 .TP
 .BR strncpy (3)
-Fill a fixed-size buffer with leading non-null bytes from a source array,
-padding with null bytes as needed.
-.SH SEE ALSO
-.BR bstring (3),
-.BR stpcpy (3),
-.BR strcasecmp (3),
-.BR strcat (3),
-.BR strchr (3),
-.BR strcmp (3),
-.BR strcoll (3),
-.BR strcpy (3),
-.BR strcspn (3),
-.BR strdup (3),
-.BR strfry (3),
-.BR strlen (3),
-.BR strncasecmp (3),
-.BR strncat (3),
-.BR strncmp (3),
-.BR strncpy (3),
-.BR strpbrk (3),
-.BR strrchr (3),
-.BR strsep (3),
-.BR strspn (3),
-.BR strstr (3),
-.BR strtok (3),
+.RE
+.SS Catenate
+.TP
+Catenate strings
+.RS
+.TP
+.BR strcat (3)
+.RE
+.TP
+Catenate nonstrings
+.RS
+.TP
+.BR strncat (3)
+.RE
+.SS Duplicate
+.TP
+Duplicate strings
+.RS
+.TP
+.BR strdup (3)
+.TQ
+.BR strdupa (3)
+.RE
+.TP
+Duplicate nonstrings
+.RS
+.TP
+.BR strndup (3)
+.TQ
+.BR strndupa (3)
+.RE
+.SS Compare
+.TP
+Compare bytes
+.RS
+.TP
+.BR memeq (3)
+.TQ
+.BR memcmp (3)
+.RE
+.TP
+Compare strings
+.RS
+.TP
+.BR streq (3)
+.TQ
+.BR strcmp (3)
+.TQ
+.BR strcasecmp (3)
+.TQ
+.BR strcoll (3)
+.TQ
+.BR strverscmp (3)
+.RE
+.TP
+Compare nonstrings
+.RS
+.TP
+.BR strncmp (3)
+.TQ
+.BR strncasecmp (3)
+.RE
+.SS Search
+.TP
+Search bytes
+.RS
+.TP
+.BR memchr (3)
+.TQ
+.BR memrchr (3)
+.TQ
+.BR memmem (3)
+.RE
+.TP
+Search strings
+.RS
+.TP
+.BR strlen (3)
+.TQ
+.BR strnul (3)
+.TQ
+.BR strchrnul (3)
+.TQ
+.BR strchr (3)
+.TQ
+.BR strrchr (3)
+.TQ
+.BR strpbrk (3)
+.TQ
+.BR strstr (3)
+.TQ
+.BR strcasestr (3)
+.TQ
+.BR strspn (3)
+.TQ
+.BR strcspn (3)
+.RE
+.SS Separate
+.TP
+Separate strings
+.RS
+.TP
+.BR strsep (3)
+.TQ
+.BR strtok (3)
+.RE
+.SS Others
+.TP
 .BR strxfrm (3)
+.SH SEE ALSO
+.BR string_copying (7)
--=20
2.53.0


--z5vhfpj5fagzzcay
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmplS68ACgkQ64mZXMKQ
wqmDJhAAkPHxf4LBi8Z88kQsmhZr8QjvglNAC3NAYNG2DJAJRUE/r/dEO1llFzn0
CmQPysb4hVWbMRCORCeNfb6phzR850u+WznWBZ+4R158+ObiTS/Aybb0KBvOYHGT
uxRds9oJooXZSTTFluDxH5wjGnL//bPOIquso/qnRlO4eZGcBhQEdm0Vm7aZw72u
VE687mu6UoJx8/UDrLot58YI0MzxrFdcFx3gSWJswKfF8ukNkxAQmqLUx0uaZQKm
sEkl7u4F1JdlWf0V9Z4A4LvFAAb626hCavIx/1q33FvW3xcUUgjGd43YbBFsae+A
ePNUGZoFnss39hgGY7kYvjkxpxqxbuhLmbhupas8DP9Ohv/hJdvaH/4SJZQskZvo
tTwedhF5KW+9SlrKQCl9AIergYWAYe/VsMKfgDnyW7OpfT8htrUw6Ya4q7I7Aj2Z
BVJb5zDzK0/vFBotiGdZ7Xum0lyMU9lJH5/b5TmffW7YdpRk5WS7IfzW4WgGT1iD
Bx7kxyaPdMdIaHBh8Zup9Jq+cmXefKujV+9ftivMsUacJA5+icedAGTc/LxbtnHs
L+BvO5UwYiizzYECVfg0DJUvgHD1Bjb/WGQlKpQjkfUW2x7EwZW2LxfE52nbTpa5
wwAqdFerK/lBbQ1+kVwIMje/zTNwDUcVrrZYYpNdsWYBi3j/uLk=
=BMws
-----END PGP SIGNATURE-----

--z5vhfpj5fagzzcay--
