From: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] README: Update generally.
Date: Wed, 10 May 2017 18:39:58 -0400
Message-ID: <20170510223955.ehlr4xueethyulyw@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3bplwjl4fcq2y4y3"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--3bplwjl4fcq2y4y3
Content-Type: multipart/mixed; boundary="snmmeq62yxuphfrp"
Content-Disposition: inline


--snmmeq62yxuphfrp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

    README: Update generally.

    * Reflect fact that project ships pages in sections 1-8.

    * Resync documentation of the basic Makefile targets with what they
      actually do at present.  Slighly simplify discussion.

    * Put the man page overlaps into a table.
      + Drop references to overlaps with the old a.out ld.so, long dead.

    * Update reference to Announce file to use current naming convention.
      + Send people looking for copyright information there rather than
        duplicating some of it here.

    * Direct reader to the top-level homepage instead of more deeply to the
      "Contributing" page.

    * Reflow paragraphs to 72 columns.

Regards,
Branden

--snmmeq62yxuphfrp
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="man-pages-README-update.diff"
Content-Transfer-Encoding: quoted-printable

diff --git a/README b/README
index 0ec038fed..b24099f23 100644
--- a/README
+++ b/README
@@ -1,33 +1,37 @@
-This package contains Linux man pages for sections
-2, 3, 4, 5, and 7. Some more information is given in the
-`Announce' file.
+This package contains Linux man pages for sections 1 through 8.  Some
+more information is given in the 'man-pages-x.y.Announce' file.
=20
-Install by copying to your favourite location.
-"make install" will just copy them to /usr/share/man/man[1-8].
-To install to a path different from /usr use
+Installing and uninstalling
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+"make install" will copy these man pages to /usr/share/man/man[1-8].
+
+To install to a path different from /usr, use
 "make install prefix=3D/install/path".
-"make" will move the pages from this package that are older than
-the already installed ones to a subdirectory `not_installed',
-then remove old versions (compressed or not),
-compress the pages, and copy them to /usr/share/man/man[1-8].
-
-
-Note that you may have to remove preformatted pages.
-
-Note that sometimes these pages are duplicates of pages
-also distributed in other packages. This has been reported
-about dlclose.3, dlerror.3, dlopen.3, dlsym.3 (found in ld.so),
-about resolver.3, resolv.conf.5 (found in bind-utils),
-and about passwd.5, and mailaddr.7. Be careful not to
-overwrite more up-to-date versions.
-Reports on further duplicates are welcome.
-Formerly present and now removed duplicates:
- exports.5 (found in nfs-server-2.2*),
- fstab.5, nfs.5 (found in util-linux-2.12*),
- lilo.8, lilo.conf.5 (found in lilo-21.6*).
-
-Copyrights: These man pages come under various copyrights.
-All pages are freely distributable when the nroff source is included.
-
-If you have corrections and additions to suggest, see
-http://www.kernel.org/doc/man-pages/contributing.html
+
+"make remove" or "make uninstall" will remove any man page in this
+distribution from its destination.  Use with caution, and remember to
+use "prefix" if desired, as with the "install" target.
+
+"make" or "make all" will perform "make uninstall" followed by "make
+install".
+
+Man page overlap and duplication
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
+Note that sometimes these pages are duplicates of pages also distributed
+in other packages.  This has been reported about:
+
+man page                also found in
+-------------------------------------
+resolver.3              bind-utils, bind9utils
+resolv.conf.5           "
+passwd.5                shadow, passwd
+mailaddr.7              ?
+
+Copyrights
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+See the 'man-pages-x.y.Announce' file.
+
+Homepage
+=3D=3D=3D=3D=3D=3D=3D=3D
+For much more about the Linux man-pages project, see
+< http://www.kernel.org/doc/man-pages/index.html >.

--snmmeq62yxuphfrp--

--3bplwjl4fcq2y4y3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAlkTlrQACgkQ0Z6cfXEm
bc6gjQ//cau17YD27wtv5ORUhgzTOzxQ0dtUUPbf8XwveGTuM9yqmh/T0KUmWvOC
k7wQyFHuzeedzs9yBne1FZMS1YctXjgTVa8NgGMaGbvcHvs7vRjPWGa4fpB5oHhM
1urr409wSmcpGa1HEey2ElL6ccKnM2A19at50wCAIK81GZ0+5iDn7l1QxHBGTAhc
8iJ8Exeh20X8h/Bx0UM5fZ38VdG2DV1t5o0e3U4o0dsth+ChJ82+QyObPCu9Cffw
JE4rni5wc48cyv/y60InxaW1SXFgfK5+ZQe13JXeQSNubF5uGROUyaZxfODroeoq
pdadYge8NabDPJfmcGdQxnPykbL1ubTolsZc0amH6CMpURPfeRkGPE2gO9Kso6B2
AIVNUIFGlgmh+vm5/ELIj69r/MUowk0UwO0ThoppjVOcZt/t5fYk8Cv+3iJTLrOw
gt3kbBM2MkHP321QHlS605tb4ebV8YouHYhpaT1NvxlRiIe0jZJjIOeAVFMDb8us
wf8DKjfdMmINE8jCRFFBVnLvIgUt0FfBgwyqg7p1nGRQOf3EehBbxx4B5a7wcOXX
UDwnIHzprYoN5k+KTntwKUF9HuOsHwXcQ9Vd6QlBAEh4bmJ8qG22FgGPD5UTxxrQ
8QQ4Q8p3KbBpKyiO6s4WWL5+QGiiaJlxF5biDUKjNYJcZ0GcJTw=
=qqzL
-----END PGP SIGNATURE-----

--3bplwjl4fcq2y4y3--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
