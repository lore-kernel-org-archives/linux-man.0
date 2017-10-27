From: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Replace Latin abbreviation "cf.".
Date: Thu, 26 Oct 2017 22:05:44 -0400
Message-ID: <20171027020542.s6gipah6bodf6wsp@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="x76elseys4jl5tof"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--x76elseys4jl5tof
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

People seem to be using "cf." ("confere"), which means "compare", to
mean "see" instead, for which the Latin abbreviation would be "q.v."
("quod vide" -> "which see").

In some cases "cf." might actually be the correct term but it's still
not clear what specific aspects of a function/system call one is
supposed to be comparing.

I left one use in place in hope of obtaining clarification, because it
looks like it might be useful there, if contextualized.

Migrate these uses to English and add them to the list of abbreviations
to be avoided.

If the patch to vfork(2) is not accepted, then the cf. still needs an \&
after it because it is at the end of the line but not the end of a
sentence.

Signed-off-by: G. Branden Robinson <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/vfork.2           | 4 ++--
 man3/clearenv.3        | 2 +-
 man3/nl_langinfo.3     | 4 ++--
 man3/setlocale.3       | 4 ++--
 man7/man-pages.7       | 7 ++++---
 man7/mq_overview.7     | 6 +++++-
 man7/path_resolution.7 | 2 +-
 7 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/man2/vfork.2 b/man2/vfork.2
index c8c3141d8..eddce6a5a 100644
--- a/man2/vfork.2
+++ b/man2/vfork.2
@@ -297,8 +297,8 @@ system call appeared in 3.0BSD.
 .\" present, but definitely on its way out'.
 In 4.4BSD it was made synonymous to
 .BR fork (2)
-but NetBSD introduced it again,
-cf.
+but NetBSD introduced it again;
+see
 .UR http://www.netbsd.org\:/Documentation\:/kernel\:/vfork.html
 .UE .
 In Linux, it has been equivalent to
diff --git a/man3/clearenv.3 b/man3/clearenv.3
index 314092cb6..9ae051959 100644
--- a/man3/clearenv.3
+++ b/man3/clearenv.3
@@ -82,7 +82,7 @@ POSIX.1-1996 did not accept
 and
 .BR putenv (3),
 but changed its mind and scheduled these functions for some
-later issue of this standard (cf. B.4.6.1).
+later issue of this standard (see \[sc]B.4.6.1).
 However, POSIX.1-2001
 adds only
 .BR putenv (3),
diff --git a/man3/nl_langinfo.3 b/man3/nl_langinfo.3
index 23bcc5dc0..d8b24d233 100644
--- a/man3/nl_langinfo.3
+++ b/man3/nl_langinfo.3
@@ -72,8 +72,8 @@ selected locale, such as "UTF-8", "ISO-8859-1", or "ANSI_=
X3.4-1968"
 This is the same string that you get with
 "locale charmap".
 For a list of character encoding names,
-try "locale \-m", cf.\&
-.BR locale (1).
+try "locale \-m" (see
+.BR locale (1)).
 .TP
 .BR D_T_FMT \ (LC_TIME)
 Return a string that can be used as a format string for
diff --git a/man3/setlocale.3 b/man3/setlocale.3
index 1bf7b501b..fdfb21202 100644
--- a/man3/setlocale.3
+++ b/man3/setlocale.3
@@ -132,8 +132,8 @@ is a character set or encoding identifier like
 .B "ISO-8859-1"
 or
 .BR "UTF-8" .
-For a list of all supported locales, try "locale \-a", cf.\&
-.BR locale (1).
+For a list of all supported locales, try "locale \-a" (see
+.BR locale (1)).
 .PP
 If
 .I locale
diff --git a/man7/man-pages.7 b/man7/man-pages.7
index 0b4647a79..cf6727af9 100644
--- a/man7/man-pages.7
+++ b/man7/man-pages.7
@@ -799,9 +799,10 @@ when rendering a page with, say:
 .PP
      BROWSER=3Dfirefox man -H pagename
 .SS Use of e.g., i.e., etc., a.k.a., and similar
-In general, the use of abbreviations such as "e.g.", "i.e.", "etc.", "a.k.=
a."
-should be avoided, in favor of suitable full wordings
-("for example", "that is", "and so on", "also known as").
+In general, the use of abbreviations such as "e.g.", "i.e.", "etc.",
+"cf.", and "a.k.a." should be avoided,
+in favor of suitable full wordings
+("for example", "that is", "compare to", "and so on", "also known as").
 .PP
 The only place where such abbreviations may be acceptable is in
 .I short
diff --git a/man7/mq_overview.7 b/man7/mq_overview.7
index 2c3ebbc1d..3f9267d2a 100644
--- a/man7/mq_overview.7
+++ b/man7/mq_overview.7
@@ -68,7 +68,11 @@ of the arrival of a message on a previously empty queue =
using
 .PP
 A message queue descriptor is a reference to an
 .I "open message queue description"
-(cf.
+.\" FIXME: "cf." means "compare".  What is we're supposed to be
+.\" comparing?  open(2) is a big page and nowhere mentions message
+.\" queues.  Aren't the relevant differences between messages queues
+.\" and files already described here, and isn't that the place for them?
+(cf.\&
 .BR open (2)).
 After a
 .BR fork (2),
diff --git a/man7/path_resolution.7 b/man7/path_resolution.7
index 9edcc2b97..50fae5467 100644
--- a/man7/path_resolution.7
+++ b/man7/path_resolution.7
@@ -184,7 +184,7 @@ Linux returns
 .B ENOENT
 in this case.
 .SS Permissions
-The permission bits of a file consist of three groups of three bits, cf.\&
+The permission bits of a file consist of three groups of three bits; see
 .BR chmod (1)
 and
 .BR stat (2).
--=20
2.11.0


--=20
Regards,
Branden

--x76elseys4jl5tof
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAlnylF0ACgkQ0Z6cfXEm
bc6uVw//RSg72nA0rkczcB+p5k8QIATfLlZ5c8dywvXwqHIr2m0esBVSTIJgFwqf
tGUAMb7yukvvXfJgvXcnZ9161CdNCqLxOsEf1zraFwXOe/yu89MM8Sas7iibh3JS
PMH1mANbHdKHtTiCHCUxzV+4p+6dJILJuuVbym7SzcP0vQxp8KFdwZEJGRpAJQaD
WHs4xVUCqcEyebvI6Umq2Ba1dEcSMspSwyxcSW3hCD1q0MC9Jr6lb12It5nXYlKt
oqkLYTH+FeH5Zq15AMIC4EFx0YKS0Bwj5fajACsrFNesGpQIYN3NFDsaEUjvcFMK
cnL0I+k8bV9GIMi+sDk0Pfjqv2PkV9/lATMM9bWPNm5CvfDg9lceIQoh4SYZuLBp
dAJ5xetgua4s2MO2PrvOObYY9yD8698dbS28ZQ7CL+bMb7xA82fNZfG6Cr8rXbc/
8uXd2lrorAeXKUsibyFkObT5yRHYU70pf6orv9fwf2/1+tIkNUllqcRZlvIvjSS3
OJX1ciVhXhgb6Z67RC1QY+kP728fEUBqBI0WlfAmTrh9ILfUqIEc+3wfnNgfVmUT
jtG9h0ATlmsw13qwVtlJcDLhiXiTrZu9BCNMfzrQHQPsRoiV16AvoduiWGRjP45q
WV2zNiMO1FVg8v9vFUlbv/eAKLtVL7ZfVj0/zsmAOkc/G895/38=
=vToZ
-----END PGP SIGNATURE-----

--x76elseys4jl5tof--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
