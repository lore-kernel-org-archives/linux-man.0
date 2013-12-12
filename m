From: James Smith <james-rDlnuv1X39s@public.gmane.org>
Subject: [patch] man7/boot.7 fix typo, do -> to
Date: Thu, 12 Dec 2013 12:02:02 -0600
Message-ID: <52A9FA1A.10201@theta.pw>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="Cd8CXa9wq2IBrBIm8cdVBBrPRdDD0Ir5F"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Cd8CXa9wq2IBrBIm8cdVBBrPRdDD0Ir5F
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

--- boot.7	2013-12-12 11:58:38.313526985 -0600
+++ boot.7.new	2013-12-12 11:59:21.840196174 -0600
@@ -143,7 +143,7 @@
 \&"stop" \-\- causing it to stop the service.
 The script may optionally
 accept other "convenience" parameters (e.g: "restart", to stop and then
-start, "status" do display the service status).
+start, "status" to display the service status).
 Running the script
 without parameters displays the possible arguments.
 .SS Sequencing directories

--=20
James Smith


--Cd8CXa9wq2IBrBIm8cdVBBrPRdDD0Ir5F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJSqfoqAAoJEGzq3Mwj0kIqNXkH/3Kt7tDIy285yzKi3VJJQccY
Oe9CkRAO26uicC04z2Gp6Nx7/s0la90FGaKtbf7DphboVGPJ7gTM51JW33JE22xX
SoHAHEW3bUe4xNOLEmpxGwx7liAPEk3bRckN9rXiPy1HuJ6TmkZ/MdFkFINByqpy
aKUZqwLAGx+ZpAM3CbAAC9Xiw9ncwEajGIG6xio3A1EMs7q3gXOe7Gd8voV7NidG
keVVGhNaXyPgLqxH0oQNrHsr97P2RP8LrD6tYliLCUj5G/ZFMkokx/mNx2Mb2eS/
QsaNkfhgjtTzXc2RwAiDyGcaRN63xk4Wk4c2cJDWDYjlhlQN+tsoy1gJjiJYA1s=
=+wxq
-----END PGP SIGNATURE-----

--Cd8CXa9wq2IBrBIm8cdVBBrPRdDD0Ir5F--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
