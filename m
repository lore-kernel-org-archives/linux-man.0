From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: ptrace(PTRACE_SYSCALL) and data field
Date: Tue, 17 Mar 2009 23:46:31 -0400
Message-ID: <200903172346.32372.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2412270.JBDIXv9glN";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart2412270.JBDIXv9glN
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

the ptrace(2) page doesnt say anything about the data field (ignored or=20
otherwise).  it seems to be ignored, but i didnt trace the kernel=20
exhaustively.  the examples found via google shows that it's ignored.  stra=
ce=20
usage seems odd (it passes in an irrelevant pointer), which would indicate=
=20
it's ignored as well ...
=2Dmike

--nextPart2412270.JBDIXv9glN
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.10 (GNU/Linux)

iQIcBAABAgAGBQJJwG6YAAoJEEFjO5/oN/WBopUQAIzI6dQechGeSmWDAGmd45Ld
O7opgJkpgQpIj/pDsub0zltFov8HAmpPfVsbPCV3L9tK17zAPg6V0zxBRawPD923
f3q0kq237laNyou4IsOpKkmsjfOnCpAVN/1BXrWbpatgSek4vViRBZ5MOazijIyv
6Kv7gfJthVl34+W3bnZDW5zEc6GEyK7dBSwqmRzwXzz+L8YMZUuWPSkt4LBpZgmB
ihOY7fm3dO/eBf4n5OEVdr5tOdtNK0uGxuwQMSYHbMcCmFxXqWwPVyppAeo4SyCq
wePcVR4NKDOOj+wMoOFsRJ8RCO7af33YFVreMkNzxeLJuHFQbGTVQwuIVGcLsCUY
vsZ7yRdzxVWc3G9TV+ah/OokWConaixXS+JKl6d97ch5hAtJ1S/rjXpe9cUY5H3i
4I/70hT3rzB06zqrm8396cvuFnd3MJi7PS8Z7spgYAN7ssSAm4qa7VOH6uxEVD/F
GiGBKlkmJHfuuRhDuOa8XPwp1AsipLjgqP9EI5J0TIgj9SveK8BgczpXtyruP2n3
ZLmhl5Mi4qGjKDPi61n1LEr1I4PGRZyN3nJyyB/SH+sJ7Vcrla1z8tJMWtTLLrkZ
GHS3LsnNy539w7B8IB8CxzMd98lpErV6PhCWMXk8lvYZopgij8GX5HxrS5dquEQf
aUqVFAfN6LYcah69oXpN
=3jw3
-----END PGP SIGNATURE-----

--nextPart2412270.JBDIXv9glN--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
