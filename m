From: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Subject: [patch] times.2: spfix
Date: Thu, 12 Jun 2014 21:43:22 +1000
Message-ID: <20140612214322.6b9184d6@notabene.brown>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/aVe6rr8=fgXbRDb0V_ArrHL"; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--Sig_/aVe6rr8=fgXbRDb0V_ArrHL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable


"passed" is a verb (in past tense), but the verb in this sentence (or claus=
e,
as "occur" is also a verb in a different clause of the sentence) is "wraps".
"past" is, among other things, a preposition and it tells the position, with
respect to the object ("the maximum value"), where the verb (wrapping)
happens.

So "past" is correct, not "passed".


diff --git a/man2/times.2 b/man2/times.2
index e605feb6aae2..8d68efc4358c 100644
--- a/man2/times.2
+++ b/man2/times.2
@@ -196,7 +196,7 @@ A limitation of the Linux system call conventions on so=
me architectures
 (41 seconds) soon after boot when
 .BR times ()
 can return \-1, falsely indicating that an error occurred.
-The same problem can occur when the return value wraps passed
+The same problem can occur when the return value wraps past
 the maximum value that can be stored in
 .BR clock_t .
 .\" The problem is that a syscall return of -4095 to -1

--Sig_/aVe6rr8=fgXbRDb0V_ArrHL
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIVAwUBU5mSWjnsnt1WYoG5AQIqCg//QEXmRiHklHFerbJH0EN6AtlAGRtEE5t7
oYNLhUdyx0QXcUQh5buidkrByasVO7A9kEUrXIWrq46cAEBn2cBBolGTc4dA/rFf
fyUP/PEAyoW2fDEZcs3ox1YGVyFudwtz3pj2K7yZTZ2GYGLEu91BbZXOBu7vGp0w
k8Pl1DTkTei+HyWs/eZO7KTKV9NAZKdgPshlR4Yg8I5fCTYHFeA72KGWrzanJZqJ
Mb9z9rMgelpwZ8zCRK6CBAIzPByw6+NNS1FdghDBJ1fATo4SPbKIt08AF93BUeZP
B2W1UWiolIjzrMgomZVs0pIOUMnfQ7ItM2R2vr/4muagQB95vHVQfKL+4Nvhrvtp
k9WAqNOBkDEDLkZ+mlV1R7oDuCfGXcvspxxBJvmj+Z9xXY4cH01pkvEa5VVXvWy/
0vQ1fC5VjAnF3nJ4tVXz/c4qQeuvY/DOB7jJfeUxaS9yyHwE8gVmEwEaHLKn5eFz
4N9ZWACVoHkVVqDLpd7AsG03DLRfeq+6R/qO6eFO2uVgKTmWpcIyuuUpv5hPESxx
z8KidSQsnVsYo7tIr+nICA2CkQwfwKWcUtJ5xUNvV2PBmr8x0686pFjCLoSDhFJ5
RRjvOL7QKn6Jyb6mPVACeIAAsFviqb2Y3ql0lH2NZTft5ZlsigaZNt0F+qbqLHeZ
vu8P90kuYR8=
=lNgE
-----END PGP SIGNATURE-----

--Sig_/aVe6rr8=fgXbRDb0V_ArrHL--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
