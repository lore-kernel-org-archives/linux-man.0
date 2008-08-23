From: "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>
Subject: pthread_create manpage
Date: Sat, 23 Aug 2008 20:32:57 +0000
Message-ID: <20080823203257.GB23628@crustytoothpaste.ath.cx>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--xo44VMWPx7vlQ2+2
Content-Type: multipart/mixed; boundary="ZoaI/ZTpAVc4A5k6"
Content-Disposition: inline


--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Attached is a manpage for pthread_create(3).

--=20
brian m. carlson / brian with sandals: Houston, Texas, US
+1 713 440 7475 | http://crustytoothpaste.ath.cx/~bmc | My opinion only
troff on top of XML: http://crustytoothpaste.ath.cx/~bmc/code/thwack
OpenPGP: RSA v4 4096b 88AC E9B2 9196 305B A994 7552 F1BA 225C 0223 B187

--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="pthread_create.3"
Content-Transfer-Encoding: quoted-printable

=2E\"-
=2E\" Copyright =C2=A9 2008 brian m. carlson
=2E\"=20
=2E\" This is free software; you can redistribute it and/or modify
=2E\" it under the terms of the GNU General Public License as published by
=2E\" the Free Software Foundation: version 2 of the License, dated June
=2E\" 1991.
=2E\"=20
=2E\" The GNU General Public License's references to "object code"
=2E\" and "executables" are to be interpreted as the output of any
=2E\" document formatting or typesetting system, including
=2E\" intermediate and printed output.
=2E\"=20
=2E\" This software is distributed in the hope that it will be useful, but
=2E\" WITHOUT ANY WARRANTY; without even the implied warranty of
=2E\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
=2E\" General Public License for more details.
=2E\"=20
=2E\" You should have received a copy of the GNU General Public License
=2E\" along with this program; if not, see
=2E\" <http://creativecommons.org/licenses/GPL/2.0/>
=2E\"
=2E\" References:
=2E\"   SUSv3; FreeBSD 7.0 manpages
=2ETH PTHREAD_CREATE 3 2008-08-23 "GNU" "Linux Programmer's Manual"
=2ESH NAME
pthread_create \- create a thread
=2ESH SYNOPSIS
=2EB "#include <pthread.h>"

=2EBI "int pthread_create(pthread_t *" "thread" ", const pthread_attr_t"
=2EBI "*" "attr" ", void *(*" function ")(void *), void *" arg ");"
=2ESH DESCRIPTION
=2EPP
The
=2EBR pthread_create ()
function creates a new thread using the attributes specified by
=2EIR attr ,
or, if=20
=2EI attr
is NULL, a default set of attributes.
If
=2EBR pthread_create ()
completes successfully, the new thread will start executing
=2EIR function ,
using
=2EIR arg
as its argument.
It will also store the thread ID in
=2EIR *thread .
If
=2EBR pthread_create ()
fails, no thread will be created (and therefore
=2EIR function
will not be executed), and the value of
=2EIR *thread
is undefined.
=2EPP
If
=2EIR function
returns, it will be as if
=2EBR pthread_exit (3)
were called with
=2EIR function 's
return value used as its argument.
This does not apply to the thread in which
=2EBR main ()
was run; if that thread returns from
=2EBR main (),
it will be as if
=2EBR exit (2)
were called with
=2EBR main ()'s
return value as its argument (in other words, this is the standard occurren=
ce
for returning from
=2EBR main ()).
=2EPP
The signal mask and floating-point environment are inherited from the thread
which called this function, although the alternate stack is not.
When it is created, the new thread will have no signals pending.
=2ESH "RETURN VALUE"
=2EPP
Upon successful completion,
=2EBR pthread_create ()
will return 0.
If it fails, it will return an error code.
=2ESH ERRORS
=2ETP
=2EB EAGAIN
There are not enough resources to create a thread, or a system-specific lim=
it on
the number of threads per process would be exceeded.
=2ETP
=2EB EINVAL
The attributes in
=2EIR attr
are invalid.
=2ETP=20
=2EB EPERM
The process does not have privileges to set scheduling parameters or policy.
=2ESH "CONFORMING TO"
=2EPP
POSIX.1-2001.
=2ESH NOTES
=2EPP
Error codes are returned, not placed in
=2EIR errno .
=2EPP
=2EBR pthread_create ()
is guaranteed never to return
=2EIR EINTR .
=2ESH "SEE ALSO"
=2EPP
=2EBR exit (2),
=2EBR pthread_exit (3),
=2EBR pthreads (7)

--ZoaI/ZTpAVc4A5k6--

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iQIcBAEBAgAGBQJIsHPxAAoJEL9TXYEfUvaLaSEQALNVdiIYrwd6t86Gs33nIZ+C
+bhY5LN1vw7Hx7JNih7HUGLFoFiUE+uPIGRNuxAVcWXTorITlGaYDzCuB9q4fwyA
28jieFvCyWaSwDFVk/8lf/D78mmtKKiv5WM3I1fVYzBfBAtbmDdnHZAs57gu2Qe8
xZ7iBiV05nFfEVpId1Fg8FllDDit0AvB3hZHDIIgMcAoYgVZtsCo6dtYEwjmrLou
UiRrUuefmGm8JhidNFWW3QsIwcohbly0Y7og1obxXNDgXlqpIucKYTnn0BF4AuKU
EG9Mc7xfvuefhWiVNxZ+Aopcso2TDys8CV644gedXCTk15zJlxov7Xce9vam4ffC
GQq+jrSp/kq88neOk9ERCl4EBQOe1DUQUU2Hwwj5yRgHnm1RXQNCMYpfk5a/w7tR
RPGdOGOUJLau6YakRFK4MmJXBxzGOeuJzyHDqtmzIstxLAgkT7PXnbbq9N7I41p+
LlpH1ZYtne19a1Ocx23JnyPKdOn3Aqj/MKF14XABSMfk3NKhQVd2jRFP32MLMv42
CM8V7SJR9Bom7j7POeLIVpf6rIrm+ykevLf4LAPEdvrUmumZ6US569WYP3wkYiav
4aX1sD4MsEPcq1QPGdSKZgKe6iidfKOi/UsJ/JbxJSxp3Ae74u1u2QnDcBuac579
QiZHXa0XGyx3okXTCHrV
=78YF
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
