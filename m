From: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: ipv6.7: tfix
Date: Sun, 22 Oct 2017 06:06:52 -0400
Message-ID: <20171022100650.az4as6es7s5oqh7y@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="f3vcbxvgts4nflhy"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--f3vcbxvgts4nflhy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Use correct indefinite article before noun beginning with vowel sound.

diff --git a/man7/ipv6.7 b/man7/ipv6.7
index 4fb274f76..2f502923a 100644
--- a/man7/ipv6.7
+++ b/man7/ipv6.7
@@ -137,7 +137,7 @@ handling functions in the C library.
 .PP
 IPv4 and IPv6 share the local port space.
 When you get an IPv4 connection
-or packet to a IPv6 socket, its source address will be mapped
+or packet to an IPv6 socket, its source address will be mapped
 to v6 and it will be mapped to v6.
 .SS Address format
 .in +4n
@@ -180,7 +180,7 @@ IPv6 supports several address types: unicast to address=
 a single
 host, multicast to address a group of hosts,
 anycast to address the nearest member of a group of hosts
 (not implemented in Linux), IPv4-on-IPv6 to
-address a IPv4 host, and other reserved address types.
+address an IPv4 host, and other reserved address types.
 .PP
 The address notation for IPv6 is a group of 8 4-digit hexadecimal
 numbers, separated with a \(aq:\(aq.

--=20
Regards,
Branden

--f3vcbxvgts4nflhy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAlnsbboACgkQ0Z6cfXEm
bc5vYA/+IxumhMcs5vpYVWNJ5X0KcwX8E+05Wh63qDoVo0BmoDLkdr8y9v3lAY61
aiPdyl/mLDdTuQD3p3le7ksFonNMeCahO2UCKpOLY6Ey06HxfAO8T7hnzs3yn2nv
M9FUTZ3ylY6CFhlsYJ378BnggqPeqqZ3W5OCw2S1Na+yLSsvsw+JNNzHeo1iOlNj
u9PHdlE0a5iII41q3ktt8CdBCkX0tDqaelLxkVi1N9RK5lNFNfNE6l8dI6EV2Yiy
ktl+lbNwHibGqPEFGhEkv56ydnWCGVJAInkNETJJhVytYJkxwlyNr/Vkjo8PZ5a8
2TorTRUjuT+/liFuxuvXd/zF8auwiawVLyQKp0jIxbliIHxXb2wtCOv+4xQeiV14
wKnBQk0lqWXVESEgBHYoMBPlqtgNDI6Oc7WyUuuHNN6qFK6WMpGc3Qxmpn8OpbQk
0kfhZOThmVt6JWa6L42pm8cMUa9D01oZvRVsa97Ve0BE7mFdb16btjWZA7X5n6/N
pWTL3eL3PqrcEM5f/LTfkvkKZ4v70d9h0UFfUEgFYWwUN/P1JEbor8DtbCEZqVFG
BW4dUHGWfjRw9MFpykNGpJWt+G4JfIs9mMOvNpj9+0OrpQGfCM3kTwnQrM+aho4h
MzlGvLbHPg7xe9AW3zoxrmdkTnEn2ywDplhzHUih53oZ60Obbio=
=lwng
-----END PGP SIGNATURE-----

--f3vcbxvgts4nflhy--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
