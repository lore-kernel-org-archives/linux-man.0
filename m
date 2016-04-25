From: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] Update the random(4) documentation towards a more accurate
 view on /dev/urandom
Date: Mon, 25 Apr 2016 10:48:10 +0200
Message-ID: <1461574090.32558.45.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

This documents the "property" of /dev/urandom of being able to serve nu=
mbers
prior to pool being initialized, and removes any suggested usages of /d=
ev/random
which are disputable (i.e., one-time pad).
Document the fact /dev/random is only suitable for applications which c=
an afford
indeterminate delays since very few applications can do so.
Smooth the alarming language about a theoretical attack, and mention th=
at its
security depends on the cryptographic primitives used by the kernel, as=
 well
as the total entropy gathered.

Signed-off-by: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
=C2=A0man4/random.4 | 32 +++++++++++++++++---------------
=C2=A01 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/man4/random.4 b/man4/random.4
index b6fdd8c..27a78c6 100644
--- a/man4/random.4
+++ b/man4/random.4
@@ -38,10 +38,10 @@ number of bits of noise in the entropy pool.
=C2=A0From this entropy pool random numbers are created.
=C2=A0.LP
=C2=A0When read, the \fI/dev/random\fP device will return random bytes
-only within the estimated number of bits of noise in the entropy
+only within the estimated number of bits of fresh noise in the entropy
=C2=A0pool.
-\fI/dev/random\fP should be suitable for uses that need very
-high quality randomness such as one-time pad or key generation.
+\fI/dev/random\fP is suitable for uses that need very
+high quality randomness, and can afford indeterminate delays.
=C2=A0When the entropy pool is empty, reads from \fI/dev/random\fP will=
 block
=C2=A0until additional environmental noise is gathered.
=C2=A0If
@@ -63,15 +63,20 @@ will be set to
=C2=A0.LP
=C2=A0A read from the \fI/dev/urandom\fP device will not block
=C2=A0waiting for more entropy.
-If there is not sufficient entropy, a pseudorandom number generator is=
 used
-to create the requested bytes.
-As a result, in this case the returned values are theoretically vulner=
able to a
-cryptographic attack on the algorithms used by the driver.
-Knowledge of how to do this is not available in the current unclassifi=
ed
-literature, but it is theoretically possible that such an attack may
-exist.
-If this is a concern in your application, use \fI/dev/random\fP
-instead.
+If the estimated fresh entropy is not sufficient, a pseudorandom numbe=
r generator is
+used to create the requested bytes. This is typically of no concern to=
 applications,
+except for applications that initialize early at boot time, in systems=
 which cannot
+accumulate sufficient entropy at boot.
+
+As a result, in this case the returned values' security depends on
+the cryptographic primitives used by the driver, and the entropy accum=
ulated
+by the system. An attack on the cryptographic primitives is not availa=
ble in the
+current unclassified literature, but it is theoretically possible that=
 such an attack
+exists.
+
+If these are a concern in your application, use
+.BR getrandom(2)
+or \fI/dev/random\fP instead.
=C2=A0.B O_NONBLOCK
=C2=A0has no effect when opening
=C2=A0.IR /dev/urandom .
@@ -109,9 +114,6 @@ If you are unsure about whether you should use
=C2=A0or
=C2=A0.IR /dev/urandom ,
=C2=A0then probably you want to use the latter.
-As a general rule,
-.IR /dev/urandom
-should be used for everything except long-lived GPG/SSL/SSH keys.
=C2=A0
=C2=A0If a seed file is saved across reboots as recommended below (all =
major
=C2=A0Linux distributions have done this since 2000 at least), the outp=
ut is
--=C2=A0
2.5.5







--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
