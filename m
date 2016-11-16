From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: elf(5): what is the scope?
Date: Wed, 16 Nov 2016 14:39:05 -0800
Message-ID: <20161116223905.GQ21655@vapier.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4JYkiJ1a9n8r8Bnm"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--4JYkiJ1a9n8r8Bnm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

what is fair game for the elf(5) man page ?

things that i think are missing:
 - Elf##_Lib entries as found in at least SHT_GNU_LIBLIST (prelink)
 - the format of SHT_HASH and SHT_GNU_HASH
 - Elf##_Nhdr notes found in SHT_NOTE
 - Elf##_Chdr for compressed sections
 - Elf##_Syminfo
 - Elf##_Ver{def,need} found in SHT_GNU_ver{def,need}
-mike

--4JYkiJ1a9n8r8Bnm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYLOAJAAoJEEFjO5/oN/WB5CgP/iMlhgaGq+vClqVbuDttQXG+
793wEn8GJFO1Y+57ahHWU4Gnm0Z3Cj99GgxAGvoPOtmYn+gU1hVu+nCMl8gajbaU
qOEODsOZlb1pobmwW9+SDSW7i/wXGPoZukYS4NVgEOa79XodTjRYSl31r7EXtN4C
QuywyTIsnbipFuJUlI2+5mU6aZWmyQM6tmR2ri1N7U7cKprtxXdwcJS2rZ/R3BeC
PrSoz0ya3ma+1kao8EH1u5CIJ/9GPCJXWh1KMniFcxOKkRcYT/1PX0kv9oi0zG+v
4fVJj0f9vJz5MPci3ZyYNdNWhkQCapnYVZH1Ooum5U73z+pjbchPXps7fkR705au
YJCylyI/kPDicQ02vxibDKSFJUDzG3hlSXonvJENdt2r/1rPQ7guHgArEk+sNvxp
znNzU+3qpPKbAaDytnOUA4LkT3xIXR7X6aVdkmr1M/lDrA5pGOLuPTMrufLWokGI
P1l/DYtzcskYDj0ZPBb/SlxH135i7oXTDyGZinYMnHGsqvT9bN/l8azlpQQYhNSw
EL7+69uRn1GrFm/OSqlMvFQhwiaxU1JnqoqCX/589/YJLIOBNquu8F+N/pD/2lqk
a90IwDXnjC9S5aSDlsiRkQk07qewYnx7UNQ3FEQWn85dlr3WVDpBOeTh7ttHgcNh
a6sEohPPAzW5Eh2AA3zB
=NfR4
-----END PGP SIGNATURE-----

--4JYkiJ1a9n8r8Bnm--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
