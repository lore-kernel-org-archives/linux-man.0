From: Thomas Schwinge <thomas@codesourcery.com>
Subject: abort might not flush all open streams before process termination (was: aarch64-suse-linux-gnu: libgomp.oacc-c-c++-common/abort-1.c, libgomp.oacc-c-c++-common/abort-3.c FAILs)
Date: Wed, 7 Oct 2015 12:13:41 +0200
Message-ID: <871td7ouju.fsf@kepler.schwinge.homeip.net>
References: <560e717f.+EOSyvrXa02mQ6Bg%schwab@linux-m68k.org> <87twq4p9f4.fsf@kepler.schwinge.homeip.net> <mvmlhbg8e0g.fsf@hawking.suse.de> <87oagcp6kc.fsf@kepler.schwinge.homeip.net> <mvm612k8b57.fsf@hawking.suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg=pgp-sha1;	protocol="application/pgp-signature"
Return-path: <gcc-patches-return-409471-gcc-patches=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-patches-unsubscribe-gcc-patches=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc-patches/>
List-Post: <mailto:gcc-patches@gcc.gnu.org>
List-Help: <mailto:gcc-patches-help@gcc.gnu.org>
Sender: gcc-patches-owner@gcc.gnu.org
In-Reply-To: <mvm612k8b57.fsf@hawking.suse.de>
To: Andreas Schwab <schwab@linux-m68k.org>, mtk.manpages@gmail.com, Jakub Jelinek <jakub@redhat.com>
Cc: gcc@gcc.gnu.org, linux-man@vger.kernel.org, gcc-patches@gcc.gnu.org, libc-alpha@sourceware.org
List-Id: linux-man@vger.kernel.org


--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi!

Copying glibc for your information/in case anyone has any further
comments, and the man-pages maintainer, Michael Kerrisk.  The issue is
that abort might not flush all open streams before process termination;
original thread starting at
<http://news.gmane.org/find-root.php?message_id=3D%3C87twq4p9f4.fsf%40keple=
r.schwinge.homeip.net%3E>.

On Tue, 06 Oct 2015 13:55:00 +0200, Andreas Schwab <schwab@linux-m68k.org> =
wrote:
> Thomas Schwinge <thomas@codesourcery.com> writes:
>=20
> > | The two regressed test cases use __builtin_printf instead of fprintf =
to
> > | stderr, but as far as I know, abort is to flush all open streams befo=
re
> > | process termination?
>=20
> It can't, since abort must be async-signal-safe.

It's still surprising to me that the message written to stderr is lost in
your aarch64-suse-linux-gnu configuration (only): from a quick look,
(current) glibc's stdlib/abort.c tries to actually close/flush all open
streams before process termination.  This is also what's documented on
<http://man7.org/linux/man-pages/man3/abort.3.html>: "all open streams
are closed and flushed".
<http://pubs.opengroup.org/onlinepubs/9699919799/functions/abort.html>
does sound more "conservative": "[abort] may include an attempt to effect
fclose() on all open streams".  Should the man-page be edited to that
effect?  And, the following patch be applied to GCC?

commit e270bce5dadf61b838706c4cfb824fa9dd22fb93
Author: Thomas Schwinge <thomas@codesourcery.com>
Date:   Wed Oct 7 11:52:15 2015 +0200

    abort might not flush all open streams before process termination
=20=20=20=20
    	libgomp/
    	* testsuite/libgomp.oacc-c-c++-common/abort-1.c: Print to stderr.
    	* testsuite/libgomp.oacc-c-c++-common/abort-3.c: Likewise.
---
 libgomp/testsuite/libgomp.oacc-c-c++-common/abort-1.c | 3 ++-
 libgomp/testsuite/libgomp.oacc-c-c++-common/abort-3.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git libgomp/testsuite/libgomp.oacc-c-c++-common/abort-1.c libgomp/te=
stsuite/libgomp.oacc-c-c++-common/abort-1.c
index 6a9b1df..296708f 100644
--- libgomp/testsuite/libgomp.oacc-c-c++-common/abort-1.c
+++ libgomp/testsuite/libgomp.oacc-c-c++-common/abort-1.c
@@ -1,11 +1,12 @@
 /* { dg-do run } */
=20
+#include <stdio.h>
 #include <stdlib.h>
=20
 int
 main (void)
 {
-  __builtin_printf ("CheCKpOInT\n");
+  fprintf (stderr, "CheCKpOInT\n");
 #pragma acc parallel
   {
     abort ();
diff --git libgomp/testsuite/libgomp.oacc-c-c++-common/abort-3.c libgomp/te=
stsuite/libgomp.oacc-c-c++-common/abort-3.c
index 2c8f347..bca425e 100644
--- libgomp/testsuite/libgomp.oacc-c-c++-common/abort-3.c
+++ libgomp/testsuite/libgomp.oacc-c-c++-common/abort-3.c
@@ -1,11 +1,12 @@
 /* { dg-do run } */
=20
+#include <stdio.h>
 #include <stdlib.h>
=20
 int
 main (void)
 {
-  __builtin_printf ("CheCKpOInT\n");
+  fprintf (stderr, "CheCKpOInT\n");
 #pragma acc kernels
   {
     abort ();


Gr=C3=BC=C3=9Fe,
 Thomas

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJWFPBVAAoJEK3/DN1sMFFt1CMH/RYC6AHsK0cg3vHRJQHQ0xxb
JcE+kzy9Ufo3rLrcjrNSPbOXnqearCA3zOHLH/3cCGj59f2vALh/vojpbB2YcyBZ
w5ke4ozYdF2ikuoJJZcALz4oMpEhagJlS6+oZydKZTa8PVUqP8J1frMM9DjxvXZl
IwN/CMw406vtYU4fXEnBWh9vNXltZqv5AgwLg8bgsGmMeYEFQ2Z4G4eXfSlVnKIA
JsBJJoM8XUVi3PVpmPPOYWOr+sUwLv0Gas+zM3MpuD/4r6iPox5R8IkrPw8J7WSZ
s/AaICkk0OCJvLpJb+YdgBTokAJgq5GvawWH7iAkv2uBQAnygGxfNutPRMUOzZk=
=OMAy
-----END PGP SIGNATURE-----
--=-=-=--
