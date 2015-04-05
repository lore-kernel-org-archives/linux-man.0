From: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] getcwd.3: behavior for unreachable cwd
Date: Sun, 5 Apr 2015 17:44:48 +0200
Message-ID: <20150405154448.GA18678@pc.thejh.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

For the code that does this, see fs/dcache.c, search for
"prepend_unreachable".

repro testcase:

$ cat getcwd.c
#define _GNU_SOURCE
#include <sched.h>
#include <unistd.h>
#include <stdio.h>
#include <limits.h>
#include <stdlib.h>

int main(void) {
  unshare(CLONE_NEWUSER | CLONE_NEWNS);
  chdir("/usr");
  chroot("bin");

  printf("current directory: \"%s\"\n", get_current_dir_name());

  char *real =3D realpath(".", NULL);
  printf("realpath of .: \"%s\"\n", real ? real : "{none}");
  real =3D realpath("../home/jann/.ssh", NULL);
  printf("realpath of path: \"%s\"\n", real ? real : "{none}");

  return 0;
}
$ cat getcwd_test.c
#define _GNU_SOURCE
#include <sched.h>
#include <unistd.h>
#include <stdio.h>

int main(void) {
  unshare(CLONE_NEWUSER | CLONE_NEWNS);
  chdir("/usr");
  chroot("bin");
  printf("current directory: \"%s\"\n", get_current_dir_name());
  return 0;
}
$ gcc -o getcwd_test getcwd_test.c -Wall
$ ./getcwd_test
current directory: "(unreachable)/usr"

realpath.3 doesn't currently seem to handle this
case in a sane way, so I'm not going to document
its behavior yet. I'll report that as a bug instead.
---
 man3/getcwd.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/getcwd.3 b/man3/getcwd.3
index a1f7e2a..6a98b82 100644
--- a/man3/getcwd.3
+++ b/man3/getcwd.3
@@ -80,6 +80,19 @@ The pathname is returned as the function result and via =
the argument
 .IR buf ,
 if present.
=20
+If the current directory is not below the root directory of the current
+process (e.g. because the process set a new filesystem root
+using
+.BR chroot (2)
+without changing its current directory into the new root), the returned
+path will be prefixed with the string "(unreachable)". Such behavior can
+also be caused by an unprivileged user by changing the current directory
+into another mount namespace.
+When dealing with paths from untrusted sources, callers of these
+functions should consider checking whether the returned path starts
+with '/' or '(' to avoid misinterpreting an unreachable path
+as a relative path.
+
 The
 .BR getcwd ()
 function copies an absolute pathname of the current working directory
--=20
2.1.4

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVIVhwAAoJED4KNFJOeCOoxfMP/3Je1fZlkVOaClwuPPNAN+HB
e3/NEcjujn3nI1zOIk8/fDBiEzlT/9zUIr+JpRukOP1QI2BwdGlk9G/ir2ZMiRZG
gMy+cPS2sWZSpgDxDULRgh5iP5NjYDtHrIOEvynt4jgS5Ni9IQR4fvjpX5FQP6RI
WxEEqKs5wbSqDb44BN40AnTOAy9I68EGQPaeVqnXXuXCpmWIHBR/2H1u6BOu0+Ea
0E0Jbzkq3f1lRti3EZN9mxiC14xlQuk6E5UIi6lQvgQ6/Ex5J1J9/7PufBGEOhFv
FkoGOyted/HfUEmqxL9+5sx2766qE0JoXD9u67l1DOuE0imQ3EfGAGbeLNN1rXe8
03JM62JtysI2SfnG/rStmq3YzfG2oTVc/tDCSZInsNY93hqyoA/8z/UOPxvoOHqv
dx3fL8sbD7ZJrhRXxgUWGPIZbHlohgU7BSMTxATnr54EY7hnTUTkn5o7PyyS/BVv
28THayfQyCdCefXkKCAqxSBSxutpP10kic1D0ah5kv9U3aQ/esAeFTpa+q0XEQO4
/KmdTnSR9Ha3yaPnVLxR3v02LH+aLgkXtQerw/t8DLDv9OIYWzgKEKp10x1Ctkr4
WGp9nzlw4buZk1LdqFhKf8TAikxWPWnjOSTeTnZ7H+o06n/Ey0RJO0HWFMRjaUmO
0kXsffm2rVxrD3KaqLbq
=fOA3
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
