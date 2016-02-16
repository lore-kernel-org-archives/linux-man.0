From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: SEE ALSO: func based or man page based?
Date: Tue, 16 Feb 2016 17:26:13 -0500
Message-ID: <20160216222613.GJ7732@vapier.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cQx5fYD6zrLPRXWY"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--cQx5fYD6zrLPRXWY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

i often remember the func name "sigprocmask".  but when i'm in that page,
i have a hard time remembering the exact naming for the set operators.
rather than search, i figure just checking out the SEE ALSO section will
quickly answer me ... except it doesn't (directly).

this is what sigprocmask(2) has:
SEE ALSO
    kill(2), pause(2), sigaction(2), signal(2), sigpending(2),
    sigsuspend(2), pthread_sigmask(3), sigqueue(3), sigsetops(3),
    signal(7)

i read that a few times and then just start picking signal related
pages until i stumble across sigsetops(3).

is there a policy against listing the functions that appear in a
grouped page ?  or would it be ok to add the funcs in the sigsetops
page directly to sigprocmask's SEE ALSO ?  grepping shows that at
least select_tut(2) is out of sync ...
-mike

--cQx5fYD6zrLPRXWY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWw6IFAAoJEEFjO5/oN/WBHXEQANjuFcpJNtEpSvOzBtQVBBxz
rv3XrPmPRyw8IClw3RHcHpWFHr6CVzV32j3yEJwi+uaHI1dVPe3ZBYoexPbPWy+I
+c5l8FjdZen4wNXyQHdl2nsLYZcC3U3AXfYatlX31KonkaqiGfOcVGCd6Ban35Tu
Ts4bF+x/LCAr39J7b2agAgh5Drcm1dHTZs/AqUdYD6nxB6jV7IRI8ZagYZ6mFT8n
IboygUaHf2qpz7d+sefT45ngv/vr9plLI/MX8fM20oTlsOzOYzmMeKrRsWrl3vOG
kQCGcK4STXZx/Ny5t4HJcuoqOoIfX3cqFSOtIlwuSf5ZpvNXLBrf9eTbMDJ3QisR
5X/NNBuBYZK9wFKYY0ogrgd12er1F5QgNy8S06e3pYX0sS7FzEaCgyIdEEpqTACo
rEzWwpXSt4RRlUdFpXyHbAr/V4iRXKHSjlRQtwthAHDuegITbQXQ4Qg0YKwP/Dcy
2f9ZrOpzebucyd99FHwg5KRRXvrsb7fDGetpBzqnhr9pPIDNPSJ9Kxj2JsuZzSu1
JtB9a/5vObgZSTcP9pdiKCH6gSRM8JZy3Rz0lUJCmstIvgRND4GJVC3126U5IlPs
HYhzavTY99m7sXayjiKoQJYTe9VSfL4QXkiCS8554l5jMWkoyNnK9H4zro4QfWmU
0GVZAsfKNkIKco6wgyOQ
=0xXo
-----END PGP SIGNATURE-----

--cQx5fYD6zrLPRXWY--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
