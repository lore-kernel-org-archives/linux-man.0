From: "Michael B. Trausch" <mike-cRPrJ27hGUicqzYg7KEe8g@public.gmane.org>
Subject: Apparent bug in dlopen(3) documentation
Date: Tue, 21 Oct 2008 16:53:34 -0400
Message-ID: <20081021165334.02caa540@zest>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Sdvc6eRb703xK2189wWFHqR";
 protocol="application/pgp-signature"; micalg=PGP-RIPEMD160
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--Sig_/Sdvc6eRb703xK2189wWFHqR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The documentation says:

       o   If  the  environment  variable  LD_LIBRARY_PATH  is
           defined to contain a colon-separated list of direc=E2=80=90
           tories, then these are searched.   (As  a  security
           measure  this  variable  is ignored for set-user-ID
           and set-group-ID programs.)

However, this is not (completely) the case, as demonstrable by:

Tuesday, 2008-Oct-21 at 16:50:55 - mbt@zest - Linux v2.6.27
Ubuntu Intrepid:[1-59/7133-0]:dl-test> ./dlc dl1.so
LD_LIBRARY_PATH=3D(null)
LD_LIBRARY_PATH=3D.
dlc: dl-caller.c:46: main: Assertion `module !=3D ((void *)0)' failed.
zsh: abort (core dumped)  ./dlc dl1.so

Tuesday, 2008-Oct-21 at 16:50:57 - mbt@zest - Linux v2.6.27
Ubuntu Intrepid:[1-60/7134-134]:dl-test> LD_LIBRARY_PATH=3D. ./dlc dl1.so
LD_LIBRARY_PATH=3D.
LD_LIBRARY_PATH=3D.
entrypoint_1() has been called.
entrypoint_2() has been called.
1

It would appear that dlopen(3) only considers LD_LIBRARY_PATH at the
time the executable was run, not after the executable alters its own
environment.  Either that, or it uses the LD_LIBRARY_PATH from the
process' parent, not its own environment.  Not sure which, but the
documentation should probably be updated to reflect this fact.  The way
it is written now would indicate that you could modify LD_LIBRARY_PATH
from within the program and load libraries in different locations.  I
suspect this is done for reasons of security, but it'd still be good to
be documented.

	Thanks,
	Mike

--=20
My sigfile ran away and is on hiatus.

--Sig_/Sdvc6eRb703xK2189wWFHqR
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEAREDAAYFAkj+QU4ACgkQ0kE/IBnFmjA4XwCdHwFviGxMMZ0EtT+ynCj4a3zv
yWkAoI2/L6jf9n59sjr85VIKYrf3755v
=52GT
-----END PGP SIGNATURE-----

--Sig_/Sdvc6eRb703xK2189wWFHqR--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
