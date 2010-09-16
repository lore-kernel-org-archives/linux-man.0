From: "W. Trevor King" <wking-lbwBIqCsw6A3uPMLIKxrzw@public.gmane.org>
Subject: [patch] random.3: Update initstate() return value description to
 match glibc
Date: Thu, 16 Sep 2010 12:44:15 -0400
Message-ID: <20100916164415.GA5137@thialfi>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The glibc manual section on initstate
  http://www.gnu.org/software/libc/manual/html_node/BSD-Random.html#index-i=
nitstate-2292
makes no mention of NULL on error (which it does mention for setstate).

As proof, the test code

  #include <stdlib.h>
  #include <stdio.h>
  #include <errno.h>
 =20
  int main(int argc, char **argv)
  {
    void *state =3D NULL;
    int arg_state =3D 0;
 =20
    printf("errno before %d\n", errno);
    state =3D (void *) initstate(1, (void *) &arg_state, 7);
    printf("errno after %d (EINVAL is %d)\n", errno, EINVAL);
    printf("state returned from bad initstate call: %p\n", state);
 =20
    return 0;
  }

returns

  errno before 0
  errno after 22 (EINVAL is 22)
  state returned from bad initstate call: 0xb781f040

not

  errno before 0
  errno after 22 (EINVAL is 22)
  state returned from bad initstate call: (nil)

This makes sense because glibc's stdlib/random.c defines __initstate()
to always return ostate (blank lines removed):

  char *
  __initstate (seed, arg_state, n)
       unsigned int seed;
       char *arg_state;
       size_t n;
  {
    int32_t *ostate;
    __libc_lock_lock (lock);
    ostate =3D &unsafe_state.state[-1];
    __initstate_r (seed, arg_state, n, &unsafe_state);
    __libc_lock_unlock (lock);
    return (char *) ostate;
  }

Personally, I think the behavior specified by the old man page makes
more sense, but I don't imagine the glibc folks want to change their
version.

This patch it against the current Git version of man-pages, and was
generated with 'git format-patch -1' before I altered it to include
the extra information the man-pages project suggested:
  http://www.kernel.org/doc/man-pages/patches.html

W. Trevor King

---
 man3/random.3 |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/man3/random.3 b/man3/random.3
index 7568dc1..6845b98 100644
--- a/man3/random.3
+++ b/man3/random.3
@@ -120,9 +120,10 @@ The
 function returns no value.
 The
 .BR initstate ()
-and
+function returns a pointer to the previous state.
+The
 .BR setstate ()
-functions return a pointer to the previous state
+function returns a pointer to the previous state
 array, or NULL on error.
 .SH ERRORS
 .TP
--=20
1.7.2.2.173.g515cc

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkySSV4ACgkQ/Cm9zfFfW+gaOwCgjfUf5QQ8xswnQo6wmRb30fvb
jxMAoKi4wFH51NtYGxtm2QBaVVHxd5Q0
=s1HW
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
