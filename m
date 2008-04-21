From: Ulrich Drepper <drepper@redhat.com>
Subject: Re: [PATCH] utimensat() non-conformances and fixes
Date: Sun, 20 Apr 2008 23:20:43 -0700
Message-ID: <480C323B.3060608@redhat.com>
References: <47FA9DA1.8040508@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756577AbYDUGYP@vger.kernel.org>
In-Reply-To: <47FA9DA1.8040508@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Kerrisk <mtk.manpages@googlemail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, lkml <linux-kernel@vger.kernel.org>, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael Kerrisk wrote:
> 1. The draft POSIX.1-200x specification for utimensat() says that if =
a
> times[n].tv_nsec field is UTIME_OMIT or UTIME_NOW, then the value in =
the
> corresponding tv_sec field is ignored.  However the current Linux
> implementation requires the tv_sec value to be zero (or the EINVAL er=
ror
> results).  This requirement should be removed.

OK, for now.  I think the implemented behavior is better, though.


> However, the current implementation does not generate
> EPERM if one tv_nsec field is UTIME_NOW while the other is UTIME_OMIT=
 -- it
> should give this error for that case.

This is probably a necessary change.  Non-synchronized changes might be
a security problem.


> However, in
> the same circumstances, when utimensat() is given a 'times' array in =
which
> both tv_nsec fields are UTIME_NOW, which provides equivalent function=
ality
> to specifying 'times' as NULL, the call succeeds.  I think that it sh=
ould fail
> with the error EACCES in this case.

I guess so.


> (times =3D=3D NULL && times[0].tv_nsec =3D=3D UTIME_NOW && times[1].t=
v_nsec =3D=3D
> UTIME_NOW)
>=20
> case should be treated like the traditional utimes() case where 'time=
s'
> is NULL.  That is, the call should succeed for a file marked append-o=
nly
> and should give the error EACCES if the file is marked as immutable.

Is this something I changed?  I doubt I added this.

- --
=E2=9E=A7 Ulrich Drepper =E2=9E=A7 Red Hat, Inc. =E2=9E=A7 444 Castro S=
t =E2=9E=A7 Mountain View, CA =E2=9D=96
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iEYEARECAAYFAkgMMjsACgkQ2ijCOnn/RHT9dwCgxhprkeAg86sW11ilKtHaVYtO
Ae0An18utIREI/MnfwPO5HixxZbJz7zD
=3DhrvK
-----END PGP SIGNATURE-----
