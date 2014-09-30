From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] cp1251.7: charset pages unification, minor cleanups
Date: Tue, 30 Sep 2014 13:29:21 +0300
Message-ID: <542A8601.1000200@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lefteris Dimitroulakis <edimitro-6VGm6rrshF0@public.gmane.org>
List-Id: linux-man@vger.kernel.org

- adjust references
- remove stray comments
- cosmetics
---
 man7/cp1251.7 |   25 ++++++++++++++++---------
 1 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/man7/cp1251.7 b/man7/cp1251.7
index de89469..6f8beec 100644
--- a/man7/cp1251.7
+++ b/man7/cp1251.7
@@ -22,24 +22,22 @@
 .\" <http://www.gnu.org/licenses/>.
 .\" %%%LICENSE_END
 .\"
-.TH CP1251 7 2014-02-16 "Linux" "Linux Programmer's Manual"
+.TH CP\ 1251 7 2014-02-16 "Linux" "Linux Programmer's Manual"
 .SH NAME
 cp1251 \- CP\ 1251 character set encoded in octal, decimal,
 and hexadecimal
 .SH DESCRIPTION
 The Windows Code Pages include several 8-bit extensions to the ASCII
 character set (also known as ISO 646-IRV).
-CP\ 1251 encodes the characters used in Cyrillic scripts.
-.\" (In my system with glibc-2.8-20080929
-.\" I found only bg_BG and be_BY locales using this encoding).
+CP\ 1251 encodes the
+characters used in Cyrillic scripts.
+.SS CP\ 1251 characters
 The following table displays the characters in CP\ 1251, which
 are printable and unlisted in the
 .BR ascii (7)
 manual page.
-.\" The fourth column will only show the proper glyphs
-.\" in an environment configured for CP\ 1251.
 .TS
-l2 l2 l2 c2 lp-1.
+l l l c lp-1.
 Oct	Dec	Hex	Char	Description
 _
 200	128	80	=D0=82	CYRILLIC CAPITAL LETTER DJE
@@ -92,7 +90,11 @@ _
 257	175	AF	=D0=87	CYRILLIC CAPITAL LETTER YI
 260	176	B0	=C2=B0	DEGREE SIGN
 261	177	B1	=C2=B1	PLUS-MINUS SIGN
-262	178	B2	=D0=86	CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I
+262	178	B2	=D0=86	T{
+CYRILLIC CAPITAL LETTER
+.br
+BYELORUSSIAN-UKRAINIAN I
+T}
 263	179	B3	=D1=96	CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I
 264	180	B4	=D2=91	CYRILLIC SMALL LETTER GHE WITH UPTURN
 265	181	B5	=C2=B5	MICRO SIGN
@@ -174,4 +176,9 @@ _
 .SH NOTES
 CP\ 1251 is also known as Windows Cyrillic.
 .SH SEE ALSO
-.BR ascii (7)
+.BR ascii (7),
+.BR charsets (7),
+.BR iso_8859-5 (7),
+.BR koi8-r (7),
+.BR koi8-u (7),
+.BR utf-8 (7)
--=20
1.7.1

--=20
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
