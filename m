From: =?UTF-8?B?RGF2aWQgUHLDqXZvdA==?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: Typo in fallocate.2
Date: Wed, 21 Sep 2011 19:33:15 -0400
Message-ID: <4E7A743B.8090706@debian.org>
References: <CAMqf4EHSHE8T+Rygzm89DCUnbooDgqrzWy-JHunjp3BP8z3xJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMqf4EHSHE8T+Rygzm89DCUnbooDgqrzWy-JHunjp3BP8z3xJQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Michael,

Le 21/09/2011 17:57, D. Barbier a =C3=A9crit :

> Here is a trivial typo fix in man2/fallocate.2

Patch updated to take care of second typo in the same sentence. I'm als=
o
wondering about a third one: this page already refers to =E2=80=9Cpipe =
*or*
=46IFO=E2=80=9D (so does posix_fadvise.2, lseek.2, fpathconf.3 and pipe=
=2E7), so I
have a doubt about the newly added =E2=80=9C*of* FIFO=E2=80=9D.


diff --git a/man2/fallocate.2 b/man2/fallocate.2
index 45b8a21..b8b0ed0 100644
- --- a/man2/fallocate.2
+++ b/man2/fallocate.2
@@ -128,13 +128,13 @@ is not supported by the file system containing th=
e
file referred to by
 .TP
 .B EPERM
 The file referred to by
- -.fd
+I .fd
 is marked immutable (see
- -.BR chattr (1).
+.BR chattr (1)).
 .TP
 .B ESPIPE
 .I fd
- -refers to a pipe of FIFO.
+refers to a pipe or FIFO.
 .SH VERSIONS
 .BR fallocate ()
 is available on Linux since kernel 2.6.23.


Regards

David

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJOenQmAAoJELgqIXr9/gnytvEP/Aqz9bMt6LE2fpXqmq279wLn
KAHh6J6gaApElpWAngqxgfsbs1En/4nVxnD5FUex/wZZWJooCwqpdH9gW1BGRm3T
Z4FsC14jzdffpeVatA2a/bPoHyKM3hUbaUKyeRXfqxLo0HlLgrpC5I9j6WmsJ7Qc
KSgCDvSJDsGmDBSdYcPRsZvCDPYYzmAAorxeOn7p8Maqy9QF/QatR7hMC1LTQC3b
1MFg7u4YQZ/KzI0CZV5yLjsltr0/Xz2RkNtIoyG/rPLj4YsUNdTYF0Z8vGeMOMQ7
oNsjAZiJrCYAC+WiRPfR2OduF+U72x4BAxcDVEdBoBxoEW47zFs+QRCKpMTr31K3
UDLWN13FNN1kaqnRBL5u8RTvyU63RInUPuSZOL4jUocu5YbQzFUdJvrvYu4E75kG
MVRcyXqOjNzHQdeBrB7w6YnX+LcBsGzZZg69pFmgdRq7fY6VmNxRFpLqz2IrVr6V
Q4Fnz7dAo5HEq7i/YUSvJh1i3ODlHg/y1S11Ne/fX351BgTEBiWGvxBY+VIM7hRl
97bj0nKp2XJQAnUz/jdwx7XWOl575GG8dPUlJxJvmATyoI4vNNkA8nVtDc6NAGJy
5vTWIvW3+Y07dOFpYctpjAYDdLogdChmk+3E19yWq5X/jIvmANosqua979URMw61
MP0cLYZjDS6l1HtllE3d
=3D1iNz
-----END PGP SIGNATURE-----
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
