From: Jukka Ruohonen <jruohonen-X3B1VOXEql0@public.gmane.org>
Subject: Couple of small issues
Date: Fri, 2 Jul 2010 12:46:56 +0300
Message-ID: <20100702094656.GA3504@marx.bitnet>
Reply-To: jruohonen-X3B1VOXEql0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="VbJkn9YxBvnuCH5J"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

Two small issues:

1. At least FreeBSD and NetBSD define ffs(3) in <strings.h>, as
   mandated/recommended by POSIX.

2. In endian(3) there are some historical notes that are incorrect or at
   least unclear.

I could probably go and audit rest of the manual pages that contains (often
outdated or plain wrong) references to the BSDs and other operating systems.

While reading the changelog, I noticed (an implicit?) trend towards trying
to limit the documentation to Linux only. I think this is a good idea;
surely there is enough work to keep the manual pages updated with respect to
Linux alone.

- Jukka.

--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="ffs.diff"

diff --git a/man3/ffs.3 b/man3/ffs.3
index bc5c2ae..e62f6b2 100644
--- a/man3/ffs.3
+++ b/man3/ffs.3
@@ -28,7 +28,7 @@
 .\"
 .\" Modified 2003 Walter Harms (walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
 .\"
-.TH FFS 3 2009-08-27 "GNU" "Linux Programmer's Manual"
+.TH FFS 3 2010-07-02 "GNU" "Linux Programmer's Manual"
 .SH NAME
 ffs, ffsl, ffsll \- find first bit set in a word
 .SH SYNOPSIS
@@ -69,9 +69,6 @@ The
 and
 .BR ffsll ()
 are glibc extensions.
-.SH NOTES
-BSD systems have a prototype in
-.IR <string.h> .
 .SH "SEE ALSO"
 .BR memchr (3),
 .BR feature_test_macros (7)

--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="endian.diff"

diff --git a/man3/endian.3 b/man3/endian.3
index ee040ff..aea1521 100644
--- a/man3/endian.3
+++ b/man3/endian.3
@@ -23,7 +23,7 @@
 .\" Formatted or processed versions of this manual, if unaccompanied by
 .\" the source, must acknowledge the copyright and authors of this work.
 .\"
-.TH ENDIAN 3  2009-01-19 "GNU" "Linux Programmer's Manual"
+.TH ENDIAN 3  2010-07-02 "GNU" "Linux Programmer's Manual"
 .SH NAME
 htobe16, htole16, be16toh, le16toh, htobe32, htole32, be32toh, le32toh,
 htobe64, htole64, be64toh, le64toh \-
@@ -78,14 +78,6 @@ where the required header file is
 .I <sys/endian.h>
 instead of
 .IR <endian.h> .
-Unfortunately,
-NetBSD, FreeBSD, and glibc haven't followed the original
-OpenBSD naming convention for these functions,
-whereby the
-.I nn
-component always appears at the end of the function name
-(thus, for example, in NetBSD, FreeBSD, and glibc,
-the equivalent of OpenBSDs "betoh32" is "be32toh").
 .SH NOTES
 These functions are similar to the older
 .BR byteorder (3)

--VbJkn9YxBvnuCH5J--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
