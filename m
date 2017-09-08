From: Jakub =?utf-8?Q?Klinkovsk=C3=BD?= <j.l.k-KK0ffGbhmjU@public.gmane.org>
Subject: Web repository still contains old pages deleted from upstream
Date: Sat, 9 Sep 2017 00:18:50 +0200
Message-ID: <20170908221850.GK3633@jlknb>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VACxsDaSTfeluoxK"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--VACxsDaSTfeluoxK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

For example, console(4) was deleted from upstream in March 2016 [1], but it
is still available [2] and its colophon section says that it comes from
version 4.05 (the last before it was deleted). On the other hand,
console_codes(4) has the same upstream and its colophon section says that
it comes from the 4.12 version. So pages seem to be updated correctly, but
deletions are not propagated to the web repository.

[1] https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit/?id=0f9e6478e403b26c24ecaa6761bc53d05cf04265
[2] http://man7.org/linux/man-pages/man4/console.4.html
[3] http://man7.org/linux/man-pages/man4/console_codes.4.html

--VACxsDaSTfeluoxK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEXsnFg+iaOJ3/jtvhyIm9UrzwVsUFAlmzF0kACgkQyIm9Urzw
VsVXMw/9G39+s1BH9qxuUhmlaZ5fndDx6IzLKEaqrLJB7Tre9zRyGRP1dROunXx3
ZDdymj/z15QeKDfnNjSFyl0CgJe07ixlsg5TgQizcB+oLJt2KknEdf9NWXGXg2CJ
7lcd3HKLZeVmQdflNUreYMeammuddFd/GHcvAl05+wIKbVFCjZ420/PIo1XnHZNA
bEhPcXBLJ/xd854rkw9Blg5avMAuby0pwYvY7dT5r/2y3KpS4XLbU1v6F0tGEpI6
S9UJr5H0vUXlZLKX0Tilrx/pMLCbjtk9IU7+6xAB8a9u8SrpO5PG8LcMpfBy5Kvz
YtlK+5w5LWq3FoekI19iWNIyj4FLi2U+02nrXale/W0wtUjZRZ/mRiZGM5LT485z
xlg3KTckQ+PEPccO3IXdy09agrEJ3sXZqQ7b8iWTMDt50zIXDDDIBVi27sKpqWcl
ieIchkpYUJ7DAYDgF3/DpopzjZsWJgbbBGz3lF6SX00ymi7mEnfHBfyaVJA7nx0A
4AAjLvhaMAHMZRsEEG3qBWMRAZlV+IEMLUpYJTBCMXGoulgcWV2s2qI/zCU+mCLj
+zIit2b8d7U50G/gKJ0lpPEUl/G1wrFjAEdFY3IGeFp83CB4U26nRqhiWuikqf0B
64gPvfg4vJoMacG7CENjnwqbPS1IJUsj1I+TXUMwcneLbvtJQSc=
=Sziq
-----END PGP SIGNATURE-----

--VACxsDaSTfeluoxK--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
