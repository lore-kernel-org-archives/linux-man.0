From: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: hier.7: tfix
Date: Sun, 22 Oct 2017 06:08:33 -0400
Message-ID: <20171022100831.vxwhm47j5ylrvukb@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="j2mkoey3rpu75v6r"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--j2mkoey3rpu75v6r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Escape hyphen in man page cross reference.

diff --git a/man7/hier.7 b/man7/hier.7
index 519debb1f..23a891162 100644
--- a/man7/hier.7
+++ b/man7/hier.7
@@ -645,7 +645,7 @@ differently.
 .BR find (1),
 .BR ln (1),
 .BR proc (5),
-.BR file-hierarchy (7),
+.BR file\-hierarchy (7),
 .BR mount (8)
 .PP
 The Filesystem Hierarchy Standard

--=20
Regards,
Branden

--j2mkoey3rpu75v6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAlnsbh8ACgkQ0Z6cfXEm
bc7BFw//W70I5+QrmbCkJQcosdavzJJH91pPtWpU/iQjZZ2q9hj4wl5pcNXwJSld
Ak2RCF+/O/Dov4tQmlk/6G71MFJvvo60tds2+C8H0D1Xb+46AcRXo6NPTYlaC2d4
DaVz6Tsk5i1z48pjJ25oOncHPINmCvXZ9mjN6CbG6kwL5EpQxKocmyQqbmJdIsD+
Zzj97NYEfLjZx0hIgbqqzfAfncedEOFKE+v9cIOTNSe5n+G6peceaUSyCKOy2GWS
v4rR3nI1ili3uT5aSVWWm3Mhv5kwx/slGFrNO0R8e5ypXLWYJJ121nahw3h32jv3
LcJKNPTL0F7NPTPdpFwXZm6GV/L5AKEv3bZfL3LVMXNsapi9DMUkPn2XpciJ2F3c
TqTrr8K+MZws5EOV3W0BJzetu53oxppp/EPhWwGIEOZFubfDMC0l5DH0WUHHfSdG
RRvxXgnxsVJ337axAATJ/gu0U2IjsDiwlxRFUcN6XRzwLu7eafHoaL0JwoNYlbC9
JTpbeEHN9DfsXu4uyw7MAe2zqphb2q70gxm65eC3dpzerjROQA9fCIIHKSlqFcMv
v5NuD3WGDFu8zNCnlN+fABgNtvtISYugp3lUYAAd7bVU8N+3wAskaHhGBUZzZbMB
eubpxxcJv8pKQKtFYyez7EuV6SiHwu9kV/smYw9LAE1QFabUC00=
=F1QN
-----END PGP SIGNATURE-----

--j2mkoey3rpu75v6r--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
