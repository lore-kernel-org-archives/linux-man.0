From: =?UTF-8?B?RGF2aWQgUHLDqXZvdA==?= <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org>
Subject: [patch] armscii-8.7, koi8-r.7, koi8-u.7, unicode.7: Uniform description
Date: Sun, 24 Oct 2010 18:24:00 -0400
Message-ID: <ia2bm0$2lt$1@dough.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

Please find inline a patch to address some consistency among
character set manual page descriptions. If you prefer to
shrink =E2=80=9Cthe=E2=80=9D from other manual page descriptions (ascii=
=2E7,
cp1251.7 and iso_8859-*.7 ones), I volunteer to provide the
(trivial) patch instead.


diff --git a/man7/armscii-8.7 b/man7/armscii-8.7
index 9cd8bd1..597f0a8 100644
--- a/man7/armscii-8.7
+++ b/man7/armscii-8.7
@@ -25,7 +25,7 @@
 .TH ARMSCII-8 7 2010-09-20 "Linux" "Linux Programmer's Manual"
 .nh
 .SH NAME
-armscii-8 \- Armenian Character Set encoded in octal, decimal, and
+armscii-8 \- the Armenian character set encoded in octal, decimal, and
 hexadecimal
 .SH DESCRIPTION
 The Armenian Standard Code for Information Interchange,
diff --git a/man7/koi8-r.7 b/man7/koi8-r.7
index 509adac..bb08d8b 100644
--- a/man7/koi8-r.7
+++ b/man7/koi8-r.7
@@ -25,7 +25,7 @@
 .TH KOI8-R 7 2010-10-24 "Linux" "Linux Programmer's Manual"
 .nh
 .SH NAME
-koi8-r \- Russian Net Character Set encoded in octal, decimal, and
+koi8-r \- the Russian character set encoded in octal, decimal, and
 hexadecimal
 .SH DESCRIPTION
 KOI8-R is the character set of choice for encoding Russian texts for
diff --git a/man7/koi8-u.7 b/man7/koi8-u.7
index 5d30bb8..d59cb52 100644
--- a/man7/koi8-u.7
+++ b/man7/koi8-u.7
@@ -26,7 +26,7 @@
 .TH KOI8-U 7 2010-09-20 "Linux" "Linux Programmer's Manual"
 .nh
 .SH NAME
-koi8-u \- Ukrainian Net Character Set encoded in octal, decimal, and
+koi8-u \- the Ukrainian character set encoded in octal, decimal, and
 hexadecimal
 .SH DESCRIPTION
 KOI8-U (KOI8 Ukrainian, described in RFC\ 2310)
diff --git a/man7/unicode.7 b/man7/unicode.7
index ee4c4bc..b8a8948 100644
--- a/man7/unicode.7
+++ b/man7/unicode.7
@@ -29,7 +29,7 @@
 .\"
 .TH UNICODE 7 2001-05-11 "GNU" "Linux Programmer's Manual"
 .SH NAME
-Unicode \- the Universal Character Set
+Unicode \- the universal character set
 .SH DESCRIPTION
 The international standard
 .B ISO 10646


Regards

David

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
