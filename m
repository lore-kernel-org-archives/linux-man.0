From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] armscii-8.7: charset pages unification, minor cleanups
Date: Tue, 30 Sep 2014 13:29:17 +0300
Message-ID: <542A85FD.4040806@redhat.com>
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
 man7/armscii-8.7 |   13 +++++--------
 1 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/man7/armscii-8.7 b/man7/armscii-8.7
index 027533f..852bed2 100644
--- a/man7/armscii-8.7
+++ b/man7/armscii-8.7
@@ -22,12 +22,10 @@
 .\" <http://www.gnu.org/licenses/>.
 .\" %%%LICENSE_END
 .\"
-.\"
 .TH ARMSCII-8 7 2014-02-16 "Linux" "Linux Programmer's Manual"
-.nh
 .SH NAME
-armscii-8 \- Armenian character set encoded in octal, decimal, and
-hexadecimal
+armscii-8 \- Armenian character set encoded in octal, decimal,
+and hexadecimal
 .SH DESCRIPTION
 The Armenian Standard Code for Information Interchange,
 8-bit coded character set.
@@ -36,8 +34,6 @@ The following table displays the characters in ArmSCI=
I-8, which
 are printable and unlisted in the
 .BR ascii (7)
 manual page.
-.\" The fourth column will only show the proper glyphs
-.\" in an environment configured for ArmSCII-8.
 .TS
 l l l c lp-1.
 Oct	Dec	Hex	Char	Description
@@ -138,5 +134,6 @@ _
 376	254	FE	=D5=9A	ARMENIAN APOSTROPHE
 .TE
 .SH SEE ALSO
-.BR ascii (7)
