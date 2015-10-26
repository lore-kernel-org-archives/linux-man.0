From: Thomas Schwinge <thomas@codesourcery.com>
Subject: Re: abort might not flush all open streams before process termination (was: aarch64-suse-linux-gnu: libgomp.oacc-c-c++-common/abort-1.c, libgomp.oacc-c-c++-common/abort-3.c FAILs)
Date: Mon, 26 Oct 2015 17:28:46 +0100
Message-ID: <87pp017fwh.fsf@kepler.schwinge.homeip.net>
References: <560e717f.+EOSyvrXa02mQ6Bg%schwab@linux-m68k.org> <87twq4p9f4.fsf@kepler.schwinge.homeip.net> <mvmlhbg8e0g.fsf@hawking.suse.de> <87oagcp6kc.fsf@kepler.schwinge.homeip.net> <mvm612k8b57.fsf@hawking.suse.de> <871td7ouju.fsf@kepler.schwinge.homeip.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg=pgp-sha1;	protocol="application/pgp-signature"
Return-path: <gcc-return-189156-gcg-devel-2=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcg-devel-2=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
In-Reply-To: <871td7ouju.fsf@kepler.schwinge.homeip.net>
To: gcc-patches@gcc.gnu.org, mtk.manpages@gmail.com
Cc: gcc@gcc.gnu.org, linux-man@vger.kernel.org, libc-alpha@sourceware.org, Andreas Schwab <schwab@linux-m68k.org>, Jakub Jelinek <jakub@redhat.com>
List-Id: linux-man@vger.kernel.org


--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi!

On Wed, 7 Oct 2015 12:13:41 +0200, I wrote:
> Copying glibc for your information/in case anyone has any further
> comments, and the man-pages maintainer, Michael Kerrisk.  The issue is
> that abort might not flush all open streams before process termination;
> original thread starting at
> <http://news.gmane.org/find-root.php?message_id=3D%3C87twq4p9f4.fsf%40kep=
ler.schwinge.homeip.net%3E>.
>=20
> On Tue, 06 Oct 2015 13:55:00 +0200, Andreas Schwab <schwab@linux-m68k.org=
> wrote:
> > Thomas Schwinge <thomas@codesourcery.com> writes:
> >=20
> > > | The two regressed test cases use __builtin_printf instead of fprint=
f to
> > > | stderr, but as far as I know, abort is to flush all open streams be=
fore
> > > | process termination?
> >=20
> > It can't, since abort must be async-signal-safe.
>=20
> It's still surprising to me that the message written to stderr is lost in
> your aarch64-suse-linux-gnu configuration (only): from a quick look,
> (current) glibc's stdlib/abort.c tries to actually close/flush all open
> streams before process termination.

That's <https://sourceware.org/PR15436>, Andreas told us.

> This is also what's documented on
> <http://man7.org/linux/man-pages/man3/abort.3.html>: "all open streams
> are closed and flushed".
> <http://pubs.opengroup.org/onlinepubs/9699919799/functions/abort.html>
> does sound more "conservative": "[abort] may include an attempt to effect
> fclose() on all open streams".  Should the man-page be edited to that
> effect?  And, the following patch be applied to GCC?

I convince myself that the GCC patch was obvious enough; committed in
r229382:

commit 005c2a97673312fa25486a70bd810b9a1b37d367
Author: tschwinge <tschwinge@138bc75d-0d04-0410-961f-82ee72b054a4>
Date:   Mon Oct 26 16:25:04 2015 +0000

    abort might not flush all open streams before process termination
=20=20=20=20
    	libgomp/
    	* testsuite/libgomp.oacc-c-c++-common/abort-1.c: Print to stderr.
    	* testsuite/libgomp.oacc-c-c++-common/abort-3.c: Likewise.
=20=20=20=20
    git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@229382 138bc75d-0d04-04=
10-961f-82ee72b054a4
---
 libgomp/ChangeLog                                     | 3 +++
 libgomp/testsuite/libgomp.oacc-c-c++-common/abort-1.c | 3 ++-
 libgomp/testsuite/libgomp.oacc-c-c++-common/abort-3.c | 3 ++-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git libgomp/ChangeLog libgomp/ChangeLog
index fa9027b..afc49ae 100644
--- libgomp/ChangeLog
+++ libgomp/ChangeLog
@@ -1,5 +1,8 @@
 2015-10-26  Thomas Schwinge  <thomas@codesourcery.com>
=20
+	* testsuite/libgomp.oacc-c-c++-common/abort-1.c: Print to stderr.
+	* testsuite/libgomp.oacc-c-c++-common/abort-3.c: Likewise.
+
 	* testsuite/libgomp.oacc-c-c++-common/lib-1.c: Remove explicit
 	acc_device_nvidia usage.
 	* testsuite/libgomp.oacc-c-c++-common/lib-10.c: Likewise.
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


Gr=C3=BC=C3=9Fe
 Thomas

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJWLlS+AAoJEK3/DN1sMFFt/DMH+wQ8OPGx5snMRrWT/7byXrTY
O1HpUJUh90JTQX/w/6EWmKP7LJnClmrgmaZNRRP7iGUvrFb3+PwZURizkBgvub3s
G71ESW5LyNNax9KuwUelFOgXGFqmFBEgxCepKhM9QoH/3qrKoSKmemaRWZFInM1h
6jCb5CohN3oc1dQdCs7ANPdPi+PSLbYk4rK717Uxmty3CUGCeJWH+5Xwt3hpKGSt
PlDHsrc5UX6AfyiMevRFgSqlQ6APk6CEaZ4ImVBiAomHbtt/A9IT9dhQvmWNbkMg
DdFnTp1bVyvD2p6Nz+itwvvZN9N3dGAdnbj5ad8wrgeOwSf5K4A1Bc+L3mSMHV8=
=gQT0
-----END PGP SIGNATURE-----
--=-=-=--
