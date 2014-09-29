From: Ben Hutchings <ben-/+tVBieCtBitmTQ+vhA3Yw@public.gmane.org>
Subject: readlink(2) handling of empty strings
Date: Tue, 30 Sep 2014 00:33:23 +0100
Message-ID: <1412033603.9388.68.camel@decadent.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ov+Js1yvTX9Og1xmA7Jg"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--=-ov+Js1yvTX9Og1xmA7Jg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

readlink(2) claims:

       Since  Linux 2.6.39, pathname can be an empty string, in which case =
the
       call operates on the file referred to by dirfd  (which  may  have  b=
een
       obtained using the open(2) O_PATH flag).  In this case, dirfd can re=
fer
       to any type of file, not just a directory.

The last sentence seems to be incorrect.  dirfd must refer to a symlink
that has been opened using the O_PATH flag.  (The symlink could refer to
a file, directory, or nothing, but opening with O_PATH doesn't resolve
it.)

Ben.

--=20
Ben Hutchings
The two most common things in the universe are hydrogen and stupidity.

--=-ov+Js1yvTX9Og1xmA7Jg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVCnsSOe/yOyVhhEJAQoTTRAAwE65yUqj+E+QendYlF0tvgLKe+bXJnN0
xtYYkGeiELiBqlIcVXrrqhSHpPz34pv0xFBe/CpLdb5qiQIpnE0zrm+8/ybleL4m
TM8diAiuOmmbc1MYfPjHJUueGn56mnnkeiskS64EAOBSjUK48gbyS0t/DXRYDsAl
s0t4CA+kWFcag0D4p/6RiLMXWuYdYNBWzzNqRRfKZmZsVMUUKcm6pa/KOpcAEZp7
NtFP3/cA6JweIG1EaFXtFN84pN8JjnWmZRjh8kdTBQE3AjTHp5UCifMCcz1aiC7J
unUR3kj+92ZrJnVkBjhgSney8PNCcHjJslsxY8tgk6ZTe90Nbfeec8suUS3MUXzV
k/kKkHrSC8Bae+QqQOizq4C/6+o/2zng88P1IzyhgysFF1BIsErifx0LwdJ9rDp6
/5MtCdPgBlLs5/1LJ4IHLmtX2fCZZ+PQ4hGjqzb+xoYFXb6NdbGgWiNyLqjGo6yO
2AcFCJ1bMFIzmKdzkbtx6eATEAl6RuzyCk8qv8IZzZIU9zjwmoSgMTXZ1KXSADsQ
LtoEHjAr4X3iEVMgnD0SwZKZiZUOGGzy4dNEgmdLUGC2Gcqk6AKQ+UmqnD9e67g+
QawQQiXpzuQHz5VpA84PVXQKSuopbYgvrMBlpS/06666z1Kb2SzKjm8PGurE8Ug5
HPj45mYnAPM=
=0fwW
-----END PGP SIGNATURE-----

--=-ov+Js1yvTX9Og1xmA7Jg--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
