From: Miroslav Koskar <mk-B9lWeqBdd0FBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] console_ioctl.4: Add K_OFF keyboard mode
Date: Mon, 10 Oct 2016 22:47:00 +0200
Message-ID: <20161010204700.GA2111@mkoskar.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In addition to the already documented keyboard modes (K_RAW, K_XLATE,
K_MEDIUMRAW, and K_UNICODE) there is also K_OFF one, defined for
KDGKBMODE and KDSKBMODE ioctl requests in <linux/kd.h>.
---
 man4/console_ioctl.4 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/man4/console_ioctl.4 b/man4/console_ioctl.4
index bb138ea..7f2e12b 100644
--- a/man4/console_ioctl.4
+++ b/man4/console_ioctl.4
@@ -371,6 +371,7 @@ K_RAW	0x00
 K_XLATE	0x01
 K_MEDIUMRAW	0x02
 K_UNICODE	0x03
+K_OFF	0x04
 .TE
 .TP
 .B KDSKBMODE

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJX+/5DAAoJEIjQt0Ro68UVkMUQAJku3Ch32S8covSqQH0Ud5xe
uHg024Tke5fByvhyLHpwgDMZ6xDUrKc0YU+16RX9Tal7edsQqd0jqmOo6nQPLn/7
w0frYnvKXYcC2kOqcsjUNZXuBeZW+XBSpJfYJlCGtf9o09X7vDWN6xhbqbgedf7c
WaAPftdzu7FRoY9dgl3heCo2DjImZH5M6IJ19N7Buy+NSByFA4JsjGNCTTD2pQF0
EGa4WNTRglz/VPA71zH72iH6fQMXQ/X7rDczJblfZ1kPPveCf/OLmaoiiaPDruWK
Z9nN7Af60CvV9RzEn7ZMiIT7jQ2OE5ZcuzTYS+bPc3bRVYJNT6KhzNlRjWGmjE5A
BNr+oOGqjUijGedGJS4RzcxTQiJwUBn49RYzUSPYdYgr3Zu1rWXmo457c2w2pVTy
Sn5vnPw6s2PSRrvoI+CJy4uqIRRQXPjozdnbYBA6MltX0Ca2nACUEGLFiAPaKJZ/
n1khT02Xf/yBysifqAH5piKzRzh1KrFGnUNHT9dpv/AJGwvmCThv4wfk3eoPQQTc
OGfCG3GVWLB3Pk9KJI3+exRZTUZ652w4mi6IC2bBRewtX9hpHUCgScsQwQtjkASG
P0lc94T6rOiuhDxY1CDzky6T/3IchGa6nlRMjCgezGS+Soc4Tu8QFpcV2EB0aHWf
zF2YvmXA6IQa2JewrP+I
=N6rn
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
