From: =?UTF-8?B?RGF2aWQgUHLDqXZvdA==?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Interrogation about Global fix: use \\ rather than \e for literal
 backslash
Date: Wed, 26 Sep 2012 12:28:18 -0400
Message-ID: <k3vaf6$d0v$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------enigBF74E2B6EC1A32CB0BD45725"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigBF74E2B6EC1A32CB0BD45725
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

The 9f8e673e623d commit seems to brake stuff: =E2=80=9Cman man7/man.7=E2=80=
=9D displays
the page until:

   Predefined Strings
       The man package has the following predefined strings:

I.e. the first occurrence of =E2=80=9C.IP \\*R=E2=80=9D seems to break th=
e page.

Regards

David



--------------enigBF74E2B6EC1A32CB0BD45725
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQYy0mAAoJELgqIXr9/gnyVfEQAJnwH5l3VWv/XXDLazJgJodV
8qEni8h+B1H7fvSp5IPl6Awsa+9Lf3ougO8CxOUvzIkiwTlIiHv6GxX6WgwW75U7
gv4Hwr13xidr63wCBaqE+xQbpQLFn5be9wgrkSTMnSii02Px/JEF+xXS4c1a0RQk
Np+BvGfivu3jlciC5AcHQx6bkt8sP4tSFfHYWCxJndsqb0B/IPfeFDz/+ICUkGiO
fUddBx1s3/NAHVIJZ04veJOCp9UOkS/KH93yMUFAZjzSA7pwVMfAyEz2w5PjB6x/
fCM40PyF1mvKbVP3zkUlpN388f2Pl0G2STdbBJHWV8Z+P8nKT0ErN/I+rqRp7zha
PKKasBGi3e80/eRdqIJAHgcgx6kQ/b4l12smIWYZbTmW8fMO4G0ZWxr+6QxP+qU5
/9GoB/HUt/84N+ffdKSOpfQGBfypb6aVtETpEGppUlt5B8pKnIthM/3DiwzEmfyh
OSgDgkGxnsB7/ZbB5o4+pUeHFls4LQJ3Yv9SqFsr5dN/bqgXBZC1Hm4ALTHOCSXi
cnR5jwRXh/6JT1NjH72lpd+FKq9ZHx5M2+LPUndLTIFdGqJ6qMV/B31dsbfRyBiL
HE94MFS+cvDwL0yTI3VcHTXFkL897fY5Pg5Ci0vfTI0Ci+oOVvGFRnRpQo3u1xo+
6FWFRw42PGrvzdMUYYUS
=bTf2
-----END PGP SIGNATURE-----

--------------enigBF74E2B6EC1A32CB0BD45725--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
