From: "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] st4: Remove spurious copyright section
Date: Tue, 9 Feb 2016 20:51:05 +0100
Message-ID: <56BA4329.4040402@debian.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="cqWIVH8M6TLVlairUUOKaQa5gmRNcXbCB"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cqWIVH8M6TLVlairUUOKaQa5gmRNcXbCB
Content-Type: multipart/mixed;
 boundary="------------090504060201050707020206"

This is a multi-part message in MIME format.
--------------090504060201050707020206
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

there seems to be a leftover copyright section in st.4.

Regards,
Tobias

--------------090504060201050707020206
Content-Type: text/x-patch;
 name="0001-st4-Remove-spurious-copyright-section.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="0001-st4-Remove-spurious-copyright-section.patch"

=46rom 55a56fb0e353818087bda6229da336ff4828ba98 Mon Sep 17 00:00:00 2001
From: "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Date: Tue, 9 Feb 2016 20:49:19 +0100
Subject: [PATCH] st4: Remove spurious copyright section

---
 man4/st.4 | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/man4/st.4 b/man4/st.4
index f44310b..13e7f8e 100644
--- a/man4/st.4
+++ b/man4/st.4
@@ -941,16 +941,6 @@ kernel.
 The solution is to tell the software to use larger transfers (often
 telling it to use larger blocks).
 If this is not possible, direct transfers can be disabled.
-.\" .SH COPYRIGHT
-.\" Copyright \(co 1995 Robert K. Nichols.
-.\" .br
-.\" Copyright \(co 1999-2005 Kai M\(:akisara.
-.\" .PP
-.\" %%%LICENSE_START(VERBATIM)
-.\" Permission is granted to make and distribute verbatim copies of this=

-.\" manual provided the copyright notice and this permission notice are
-.\" preserved on all copies.
-.\" Additional permissions are contained in the header of the source fil=
e.
 .SH SEE ALSO
 .BR mt (1)
 .PP
--=20
2.5.0


--------------090504060201050707020206--

--cqWIVH8M6TLVlairUUOKaQa5gmRNcXbCB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJWukMuAAoJEBMC8fA26+sZAT8QAI7w5cHcF+1/b+d+VActc1Gv
UgcvYb1Juga5yvyG9NZICKes3i12IWAfqEsR7ZZMkqrwQTWCiVxUo/k/FGIrI0DC
cIlnEsyYeLS2gxvMP4B6/1T7XWyQSwljgXzCwKMtb5sKsaFxQWewRS/VCmcZ+48M
mH/EJXXqqLuPo18q7zJzKTLiH5EQF/E6c6MAXF3cqKT36UJN0UiQ7oPN1Kf6sjq6
irf7YRMLq9WX/JHobFiClnCON5nfksq+ua801LzA+utJa6LvlisrW5brp64PMmcF
X89jn9FF7cpeQCQP34wyP820Ld0q9QB3ORLLFMejMuLn/y6yXP/X/YdRML5iWsgz
lFNT+PHSm+8qVFQ7Zeejeqds2nlIFv5KICJQRd76LPnLOYPPwtSJjLv+al8Rbo4Z
SGK9YZrunecz6axyL2Zmx5CgG94PHszc61vHJozZeJiKCFHVZlrfB3A9fxDFDzyo
16cq+K04IkqWtcGEtZRwml+Ebm46Bc/S+G3qpX0iF1Wr52LP/5L3mErFy2O0TpTM
Fh1hrNX4T5ktM1xcmdOh9L7q20i+mGadRIkCp4JU/9XHVhfQ/WNAUx0FQcwfq10L
wXOlSDL/FbIg36FB/QrqqWkdv0v4SOb2YCcraEpz8yknXkTDKaAOCw34K1/T9JP1
ye8Cvanrt16p3UhsA4lJ
=aXSG
-----END PGP SIGNATURE-----

--cqWIVH8M6TLVlairUUOKaQa5gmRNcXbCB--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
