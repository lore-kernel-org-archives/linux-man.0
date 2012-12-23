From: =?utf-8?Q?C=C3=A9dric?= Boutillier <cedric.boutillier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages 3.45, if_nameindex(3): double negation
Date: Sun, 23 Dec 2012 23:44:39 +0100
Message-ID: <20121223224439.GA8129@spin>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5I6of5zJg18YgZEa"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--5I6of5zJg18YgZEa
Content-Type: multipart/mixed; boundary="DocE+STaALJfprDB"
Content-Disposition: inline


--DocE+STaALJfprDB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I noticed a double negation in the man page of if_nameindex(3) (present
in 3.45 and online version dating from 2012-12-20):

ERRORS         top

       if_nameindex() may fail and set errno if:

       ENOBUFS
              Insufficient resources unavailable.
              ^^^^^^^^^^^^           ^^^^^^^^^^^

Patch attached replacing unavailable into available.

Cheers,

C=C3=A9dric


--DocE+STaALJfprDB
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="if_nameindex.3_double_neg.patch"

diff --git a/man3/if_nameindex.3 b/man3/if_nameindex.3
index 36ffc80..f9480e6 100644
--- a/man3/if_nameindex.3
+++ b/man3/if_nameindex.3
@@ -80,7 +80,7 @@ may fail and set
 if:
 .TP
 .B ENOBUFS
-Insufficient resources unavailable.
+Insufficient resources available.
 .PP
 .BR if_nameindex ()
 may also fail for any of the errors specified for

--DocE+STaALJfprDB--

--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQ14lRAAoJENpJWPYR4Unp/7gP+QEr3DK1tmfvB0ks33c+bEJL
C42RfA6doIGBu7s+0UFRDTFWEWyQ7XdDmMm5yJXPWQ3dRe60nIug1QiG1wJMJ0Ot
eOw0HM9dJ74/pVgqQTYLXJ07Z/18gxiraUirhSKCf5bh2UJB17mTZGzpcFBS93GQ
U8eP4e4LhTpxihqpDhZ5vlTAZIQRq558renG0jq6Nu53p1o1ZdsvhKs+1RMPRTKi
EbU2vsez85d3cvYAWr0ZVenv1pBNOyr2SEIwPfwAS2NbXPx0ZK29oSftE4LByFjc
V+Rf/mKB9BdfIl8ZD1znqBGWXW7QPgwjIpZXIfFZKuqotAFiO4+2/m0tRmrzwC9w
A3GLH+VRdkjxBgZ9Xh6zypcnigjVAiNbWQzsW1bvPTinUWUlLTm/qW4ZtirlkFwy
t9jF33iI+NE+bmdvXUG3uxWkA0tMA743VxGd3AEq4RYTw7e+kSMluzvjnNou9nzm
fHlbQ+k/3e+2HKuHMfKSGHtCnd+fA0s36xF1Zj0TNe2NNlPnAmejGdGhy2Jw8l3p
gVlXoOyox0PYy0UupEGQoV8x6KS53XqgZc/hpPWIwodsxIYXndP0v4bp6vZpYhbf
3u9K0FSd0dIG58yctpywmnueZcmdl0amyxsUgbNBT0JgV2EbQaWzd5VsYlvPWpeI
WZGXBtW/gvXxbg1z+lKM
=DleG
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
