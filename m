From: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: open.2: tfix
Date: Sun, 22 Oct 2017 05:52:00 -0400
Message-ID: <20171022095158.77nf4r7hjhodt5zn@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="artrth3nxfy4yipu"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--artrth3nxfy4yipu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This one crept in during the first bit of the "will fail" -> "fails"
migration.

diff --git a/man2/open.2 b/man2/open.2
index 02a62a255..44bf3d1cb 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -1636,7 +1636,7 @@ a flag of the same name, but without alignment restri=
ctions.
 .B O_DIRECT
 support was added under Linux in kernel version 2.4.10.
 Older Linux kernels simply ignore this flag.
-Some filesystems may not implement the flagC, in which case
+Some filesystems may not implement the flag, in which case
 .BR open ()
 fails with the error
 .B EINVAL

--=20
Regards,
Branden

--artrth3nxfy4yipu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAlnsajUACgkQ0Z6cfXEm
bc7v5g/+Mck+FabKW96/FZnXX4FLrCjrBCE+9ILrMJwhnh08mqw9AVBgRqUUfjSd
/FgnP1KOkYAzkCklDvXLSKnEfSDlSe2UhnXaXM880RpSLbrztXEledmTJuLeqYBT
KSbEInvDSdY/kEkgYLUQ0mB/OEaO0UH4/IDrai6u1lamBnbH4UdVzbk9ur3FpoJH
cy7WIOvMx+dRlhUJFq5+Cy+p2Aoi431L0cwMrKvln6AQ8oM2jaJ/uZCFbwFj9tPP
gSXFi6WlT7WaitY5RsCk2y8Mj2xPTiB8m1hbUy05sy/HyueWnlhddS+cyreFIe+N
8m8mXhiQ3lOWPa4iW5swQOO1/DCB6fGOvu6+h6bHAKEqK9ypukmZ4572vfhPL9mo
7mhuX9/CNyzCEsGaNYVRvjYt8sqfZ9AViOPc/osNVeMJPlXQmSoyhfEHQEJOYwuP
NkRwnC5yj60c7vGtLu5xrIk00gnz2OhzhmHHo+ugFT5MoLeYsn3pyTFF+UQSaMc/
/NzGWLVsdH6fMqP2jIR6sOQg2FGcuTR6ASOlZk+oVpuIJaIfhJIzEGjr++JwhYPQ
57KJ7/t4Gm+uKqWrMtrovcdihVgCtcF5CxHdJBWBeJrlb/C+3qesI5072Iji2Tcc
fFCVZ/L/X5oUHyW9dD7NTz6UGi/aboldP/kIvFh4SRKn97ywDjE=
=uln5
-----END PGP SIGNATURE-----

--artrth3nxfy4yipu--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
