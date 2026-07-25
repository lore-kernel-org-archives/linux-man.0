Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6B86BB5B
	for <linux-man@vger.kernel.org>; Sat, 25 Jul 2026 23:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785023401; cv=none; b=EodVCBu675W5IIbkn2JBvCpB21BovgIydznp21534MuAriJLmfokueFUhVo/NxjYJzZGZIA1EW7jSTC8yoN96L+WffGfttzPdaRIMczzevX/eff4tG8gu/21WSZB+IQFHjnyoqdPh3uD71J/Wd44+4n8xKSNlhckT/CfwZ06kSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785023401; c=relaxed/simple;
	bh=vz03OvCrc3vuemKRZNYJwSBA9wBgyREe9X2tHXbRhmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FB9pOIjrSknaPJOUbBkY8Fbsg2dYxccDzbArxn/6qddFFJnhv5VE7E8H/mPWCOmenDOxK9pJxKACTVEcNqkvE3xVYYTh7Z9JXZuCzrDf18YbOk2nEZkhQpHRU4rnKEIgwhBqlTeKD09JVORFzfHBhQrlyx+hs+tLfKa9smtnpf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YrZwnvk8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YrZwnvk8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14BBF1F000E9;
	Sat, 25 Jul 2026 23:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785023399;
	bh=kKCCsNceEx2arZ75GJW2q0megDxQ9UrEAz8FX8Gy5aI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YrZwnvk8dpSFag7K8IWGASqcLl6g3/8drZMLXj9nnNN0jlOcXoZMlM/sv3XWihErU
	 prw8TLfjsmGmoWzJmp5R2biY6I4E0D0i0qStWIBqVMkxi90BsiGZyJhYn5zp3o54IH
	 qPSAWMCUMoLRzlacK6NMZEi40WzaYhbiS8IpCnsM48cfpbpQDmcrFOmLFb5RiUQ7Zr
	 jOEVGgokaZkxAeZ09eR6dS5SRGVlZRcJfrTZ1epVFEO2pT7StdvposAew/zXAdtUcD
	 xGWoKTF8uc6WuSuEG7RygPmh5X2Jire3VmKG+cGwvyu8eqfn+6CfMmmIKa1mOrgDoT
	 6Y4y4/1aS1MtQ==
Date: Sun, 26 Jul 2026 01:49:56 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Mark Harris <mark.hsj@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, 
	Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v3 1/4] man/man3/str*.3: NAME: Explain the names
Message-ID: <b3feb733f5fde4b9fd14d61c0736d053e1b54efe.1785023118.git.alx@kernel.org>
X-Mailer: git-send-email 2.53.0
References: <cover.1785023118.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zmp26m64w5cxafnv"
Content-Disposition: inline
In-Reply-To: <cover.1785023118.git.alx@kernel.org>


--zmp26m64w5cxafnv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Mark Harris <mark.hsj@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, 
	Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v3 1/4] man/man3/str*.3: NAME: Explain the names
Message-ID: <b3feb733f5fde4b9fd14d61c0736d053e1b54efe.1785023118.git.alx@kernel.org>
References: <cover.1785023118.git.alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1785023118.git.alx@kernel.org>

Reported-by: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Mark Harris <mark.hsj@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Signed-off-by: Alejandro Colomar <alx@kernel.org>
---
 man/man3/strcasecmp.3 | 2 +-
 man/man3/strchr.3     | 2 +-
 man/man3/strcmp.3     | 2 +-
 man/man3/strcoll.3    | 2 +-
 man/man3/strcpy.3     | 2 +-
 man/man3/strdup.3     | 2 +-
 man/man3/strerror.3   | 5 +++--
 man/man3/strfmon.3    | 2 +-
 man/man3/strfromd.3   | 3 +--
 man/man3/strfry.3     | 2 +-
 man/man3/strftime.3   | 2 +-
 man/man3/string.3     | 5 +----
 man/man3/strlen.3     | 2 +-
 man/man3/strncat.3    | 5 +----
 man/man3/strnlen.3    | 2 +-
 man/man3/strpbrk.3    | 2 +-
 man/man3/strptime.3   | 2 +-
 man/man3/strsep.3     | 2 +-
 man/man3/strsignal.3  | 2 +-
 man/man3/strspn.3     | 2 +-
 man/man3/strtod.3     | 2 +-
 man/man3/strtoimax.3  | 2 +-
 man/man3/strtok.3     | 2 +-
 man/man3/strtol.3     | 2 +-
 man/man3/strtoul.3    | 2 +-
 man/man3/strverscmp.3 | 2 +-
 man/man3/strxfrm.3    | 2 +-
 27 files changed, 29 insertions(+), 35 deletions(-)

diff --git a/man/man3/strcasecmp.3 b/man/man3/strcasecmp.3
index aa554341da4c..65941ddf6524 100644
--- a/man/man3/strcasecmp.3
+++ b/man/man3/strcasecmp.3
@@ -6,7 +6,7 @@
 .\"
 .TH strcasecmp 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strcasecmp, strncasecmp \- compare two strings ignoring case
+strcasecmp, strncasecmp \- strings case-insensitive compare
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strchr.3 b/man/man3/strchr.3
index 4e6a96d8cde6..12d08f63ddbb 100644
--- a/man/man3/strchr.3
+++ b/man/man3/strchr.3
@@ -6,7 +6,7 @@
 .\"
 .TH strchr 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strchr \- locate character in string
+strchr \- string search character
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strcmp.3 b/man/man3/strcmp.3
index a088412917d2..0a573e52d936 100644
--- a/man/man3/strcmp.3
+++ b/man/man3/strcmp.3
@@ -7,7 +7,7 @@
 .\"
 .TH strcmp 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strcmp, strncmp \- compare two strings
+strcmp, strncmp \- strings compare
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strcoll.3 b/man/man3/strcoll.3
index 32d620f52c51..1f9eb2441b13 100644
--- a/man/man3/strcoll.3
+++ b/man/man3/strcoll.3
@@ -6,7 +6,7 @@
 .\"
 .TH strcoll 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strcoll \- compare two strings using the current locale
+strcoll \- strings LC_COLLATE compare
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strcpy.3 b/man/man3/strcpy.3
index cea24ff04020..d4d0e4246545 100644
--- a/man/man3/strcpy.3
+++ b/man/man3/strcpy.3
@@ -5,7 +5,7 @@
 .\"
 .TH strcpy 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strcpy, strcat \- copy or catenate a string
+strcpy, strcat \- string copy/catenate
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strdup.3 b/man/man3/strdup.3
index b4026ed41b4a..f3ab0611a323 100644
--- a/man/man3/strdup.3
+++ b/man/man3/strdup.3
@@ -6,7 +6,7 @@
 .\"
 .TH strdup 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strdup, strndup \- duplicate a string
+strdup, strndup \- string/nonstring duplicate
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strerror.3 b/man/man3/strerror.3
index e3306c7e1608..637d1d812d52 100644
--- a/man/man3/strerror.3
+++ b/man/man3/strerror.3
@@ -7,8 +7,9 @@
 .\"
 .TH strerror 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strerror, strerrorname_np, strerrordesc_np, strerror_r, strerror_l \-
-return string describing error number
+strerror, strerrorname_np, strerrordesc_np, strerror_r, strerror_l
+\-
+string error-string
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strfmon.3 b/man/man3/strfmon.3
index e0d9790395cb..dee915c8a9f4 100644
--- a/man/man3/strfmon.3
+++ b/man/man3/strfmon.3
@@ -6,7 +6,7 @@
 .\"
 .TH strfmon 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strfmon, strfmon_l \- convert monetary value to a string
+strfmon, strfmon_l \- string format monetary value
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strfromd.3 b/man/man3/strfromd.3
index c221f82df0a8..fa8a10feec01 100644
--- a/man/man3/strfromd.3
+++ b/man/man3/strfromd.3
@@ -6,8 +6,7 @@
 .\"
 .TH strfromd 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strfromd, strfromf, strfroml \- convert a floating-point value into
-a string
+strfromd, strfromf, strfroml \- string from float
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strfry.3 b/man/man3/strfry.3
index 99917e4a6261..a65603af918a 100644
--- a/man/man3/strfry.3
+++ b/man/man3/strfry.3
@@ -6,7 +6,7 @@
 .\"
 .TH strfry 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strfry \- randomize a string
+strfry \- string fry (obfuscate)
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strftime.3 b/man/man3/strftime.3
index 66351f6bd43a..bdba4089b934 100644
--- a/man/man3/strftime.3
+++ b/man/man3/strftime.3
@@ -6,7 +6,7 @@
 .\"
 .TH strftime 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strftime \- format date and time
+strftime \- string format date and time
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/string.3 b/man/man3/string.3
index 89fe51fba609..2141822e1fd1 100644
--- a/man/man3/string.3
+++ b/man/man3/string.3
@@ -5,10 +5,7 @@
 .\"
 .TH string 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-stpcpy, strcasecmp, strcat, strchr, strcmp, strcoll, strcpy, strcspn,
-strdup, strfry, strlen, strncat, strncmp, strncpy, strncasecmp, strpbrk,
-strrchr, strsep, strspn, strstr, strtok, strxfrm
-\- string operations
+string \- string operations
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strlen.3 b/man/man3/strlen.3
index 1dd99bd8e250..639bdd6ac2d2 100644
--- a/man/man3/strlen.3
+++ b/man/man3/strlen.3
@@ -6,7 +6,7 @@
 .\"
 .TH strlen 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strlen \- calculate the length of a string
+strlen \- string length
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strncat.3 b/man/man3/strncat.3
index 4b0217b02673..dd39d54939d9 100644
--- a/man/man3/strncat.3
+++ b/man/man3/strncat.3
@@ -5,10 +5,7 @@
 .\"
 .TH strncat 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strncat
-\-
-append non-null bytes from a source array to a string,
-and null-terminate the result
+strncat \- nonstring catenate
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strnlen.3 b/man/man3/strnlen.3
index fbd719ee4888..553a39a9ec7a 100644
--- a/man/man3/strnlen.3
+++ b/man/man3/strnlen.3
@@ -6,7 +6,7 @@
 .\"
 .TH strnlen 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strnlen \- determine the length of a fixed-size string
+strnlen \- nonstring length
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strpbrk.3 b/man/man3/strpbrk.3
index 1f56cf18dbac..6e5b79a48bbe 100644
--- a/man/man3/strpbrk.3
+++ b/man/man3/strpbrk.3
@@ -6,7 +6,7 @@
 .\"
 .TH strpbrk 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strpbrk \- search a string for any of a set of bytes
+strpbrk \- string search characters
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strptime.3 b/man/man3/strptime.3
index 979bffea7bf8..4502acfe6d1e 100644
--- a/man/man3/strptime.3
+++ b/man/man3/strptime.3
@@ -6,7 +6,7 @@
 .\"
 .TH strptime 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strptime \- convert a string representation of time to a time tm structure
+strptime \- string parse time
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strsep.3 b/man/man3/strsep.3
index 46ba6c5819bd..98859f64909f 100644
--- a/man/man3/strsep.3
+++ b/man/man3/strsep.3
@@ -6,7 +6,7 @@
 .\"
 .TH strsep 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strsep \- extract token from string
+strsep \- string separate
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strsignal.3 b/man/man3/strsignal.3
index 4a4e8c86e71d..964a5e5aacaf 100644
--- a/man/man3/strsignal.3
+++ b/man/man3/strsignal.3
@@ -8,7 +8,7 @@
 .TH strsignal 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
 strsignal, sigabbrev_np, sigdescr_np, sys_siglist \-
-return string describing signal
+string signal description
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strspn.3 b/man/man3/strspn.3
index fe4414317df6..7c85d209c59d 100644
--- a/man/man3/strspn.3
+++ b/man/man3/strspn.3
@@ -6,7 +6,7 @@
 .\"
 .TH strspn 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strspn, strcspn \- get length of a prefix substring
+strspn, strcspn \- string [complementary] span
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strtod.3 b/man/man3/strtod.3
index 15147ee51006..84a9934ba267 100644
--- a/man/man3/strtod.3
+++ b/man/man3/strtod.3
@@ -6,7 +6,7 @@
 .\"
 .TH strtod 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strtod, strtof, strtold \- convert ASCII string to floating-point number
+strtod, strtof, strtold \- string to float
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strtoimax.3 b/man/man3/strtoimax.3
index 71267754ed7a..08413a9f8101 100644
--- a/man/man3/strtoimax.3
+++ b/man/man3/strtoimax.3
@@ -6,7 +6,7 @@
 .\"
 .TH strtoimax 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strtoimax, strtoumax \- convert string to integer
+strtoimax, strtoumax \- string to [u]intmax_t
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strtok.3 b/man/man3/strtok.3
index 2d733e886086..4ce708ecbcb4 100644
--- a/man/man3/strtok.3
+++ b/man/man3/strtok.3
@@ -6,7 +6,7 @@
 .\"
 .TH strtok 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strtok \- extract tokens from strings
+strtok \- string tokenize
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strtol.3 b/man/man3/strtol.3
index f88b717780f3..4d9c49eaf28a 100644
--- a/man/man3/strtol.3
+++ b/man/man3/strtol.3
@@ -7,7 +7,7 @@
 .\"
 .TH strtol 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strtol, strtoll, strtoq \- convert a string to a long integer
+strtol, strtoll, strtoq \- string to long int
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strtoul.3 b/man/man3/strtoul.3
index a6f6fd4a8ada..670fcb3868a1 100644
--- a/man/man3/strtoul.3
+++ b/man/man3/strtoul.3
@@ -6,7 +6,7 @@
 .\"
 .TH strtoul 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strtoul, strtoull, strtouq \- convert a string to an unsigned long integer
+strtoul, strtoull, strtouq \- string to unsigned long int
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strverscmp.3 b/man/man3/strverscmp.3
index d072471b1431..caadb9717a3b 100644
--- a/man/man3/strverscmp.3
+++ b/man/man3/strverscmp.3
@@ -7,7 +7,7 @@
 .\"
 .TH strverscmp 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strverscmp \- compare two version strings
+strverscmp \- strings version compare
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/strxfrm.3 b/man/man3/strxfrm.3
index d4ac57006eb0..a892bf4c813b 100644
--- a/man/man3/strxfrm.3
+++ b/man/man3/strxfrm.3
@@ -6,7 +6,7 @@
 .\"
 .TH strxfrm 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-strxfrm \- string transformation
+strxfrm \- string transform
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
--=20
2.53.0


--zmp26m64w5cxafnv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmplS6QACgkQ64mZXMKQ
wqlHqRAAuYQ4sszLKwD7xsRege5SFUFBzc5lX7nzk8ZHidU79ubwPXcQUO6FhI5Z
ErZkenblyfE120W+OF+GOHomDe+UZbmcY3QTftZuM5mtN+TefuweLQYizVecBmq6
D8Fu3kd2E8aF6Aay1LB0EtxNhAt65eOZE90l0+Hm1/sGq2GJQRgeSdwgyBK3EhGQ
GLAb1xn87O4SEvgi2lRk5dguEy1/QgZBv+F77v3ZALP5dvqUu9wRIJjyZvpadO6i
6zC8GZW0CibHC0QOfxFPDwc7wANF0kGP1hbwCOMfc38vy2GInWKlwbj7FkulPS/v
u1M8lhh6ezAPw7V/hco8qQLmLZnAVz0qbh6y+rUcVaF0bUxL5udGthZpN3dDLG1w
xuOWmNejprUUCCOy8GUSrBfdOfcoGbk5Rp67/OF9KsOsGDBvJalBn0xY+5roI3nC
gAQufL8BCSf2Vfd55DiQS6VBC36BcoGcUgwuyZZAiTwRv1ZNx11WsotYRQs3DkM3
BXiN52CiGa8M8wpna5VEgN2DgAbEhyP+37PZXUpYoTnUikmiOlRNl01SHAea4VNH
Z1PneNyGjtrxYKscN2itFbbaclnq/2rnZixAwy06W7hc+x2AC3k6Y5I3RuxWkr8N
BePqg2zgdzADVNaRGX9sSNIJTV+UmSHosMqApOJeJKQwyYt9Vy8=
=ABYd
-----END PGP SIGNATURE-----

--zmp26m64w5cxafnv--
