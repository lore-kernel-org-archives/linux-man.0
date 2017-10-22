From: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages.7: add use case for real minus character
Date: Sun, 22 Oct 2017 06:11:28 -0400
Message-ID: <20171022101127.lxygv747m6ignifk@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jiahrevu2w6lgpca"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--jiahrevu2w6lgpca
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

diff --git a/man7/man-pages.7 b/man7/man-pages.7
index 674762723..0b4647a79 100644
--- a/man7/man-pages.7
+++ b/man7/man-pages.7
@@ -868,6 +868,8 @@ Finally, note that "re-create" and "recreate" are two d=
ifferent verbs,
 and the former is probably what you want.
 .SS Real minus character
 Where a real minus character is required (e.g., for numbers such as \-1,
+for man page cross references such as
+.BR utf\-8 (7),
 or when writing options that have a leading dash, such as in
 .IR "ls\ \-l"),
 use the following form in the man page source:

--=20
Regards,
Branden

--jiahrevu2w6lgpca
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAlnsbs8ACgkQ0Z6cfXEm
bc65Vg/9Ge/ZJ80tQGwzUs5F/YZd60b4u+kQItm6lJK5UCP8gKH0ID/jj3c2Rl4M
7eekI+bifAkNxRaed4Aj9t1bP1gt+NiWBwA/5z0Nogf8eKjF/rILucMuXIIkmcGX
jdCEUNw53giIeZUXwgK6GXS2uab0UUUYIkc7CduL3cKdRwsnviBeHAV1UWwfJV22
SCAPBbfzFPz0vcftiv5789H8hBsp4ujOjOaLDOaAYpB8ZFMzGQWxSLcwdAAgitxr
KT1kCiHct4hK6j+xULa2ebTddtX9pBqqQFFUJ5/VlFvYOOlKLr5yrRZLrz/ThY9p
Q4frQ+2ocoFhn05XStfgIvbewL+ibdnmQW2jFHhI/PoJFaxmmPyAvwN+BNJ56LpZ
5W6b7urAiujQ2q6aZgAQhaH3J4OCxmL2/H1n850cEIX24vuXOxTny3BsbkwMuN7Y
FbUoiPFsMJ0+hY93h12W6PCs9StPha1wGXg/AYvqq5EGTFwtXphaVylN5v6idc+6
5KH4IAmefC/TPhreFTioCdrV6eoH0fbhF7WLIP2lwAhNw9adiIAB6+lmYRyS+y8O
cET4jo1IuGqD6kHBWGzpWDSYRIB/aA0UwfEGwtDwkDDYAtUDcK5DEXq8vJYXuymB
t9Dd5M25VjJhkwcef5WwXkaCB51KFe/r+1WXd0Uwcij0mRiFztY=
=sEVS
-----END PGP SIGNATURE-----

--jiahrevu2w6lgpca--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
