From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] vdso(7): add new i386 vdso symbols in linux-3.15
Date: Sat, 16 Aug 2014 01:28 -0400
Message-ID: <3845787.Mixr4J3axB@vapier>
References: <1406997983-23266-1-git-send-email-vapier@gentoo.org> <53EE5D6A.20104@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart93897039.vQ5TdGhL6W"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53EE5D6A.20104-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--nextPart93897039.vQ5TdGhL6W
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Fri 15 Aug 2014 21:20:10 Michael Kerrisk wrote:
> Thanks. I've applied this patch, but I want to check a point.
> The subject line mentions Linux 3.15, but the version symbols
> in the patch say, LINUX_2.6. Is that correct?

i thought it weird too, but it's what the kernel is doing:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/=
?id=3D37c975545ec63320789962bf307f000f08fabd48
=2Dmike
--nextPart93897039.vQ5TdGhL6W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABAgAGBQJT7uvgAAoJEEFjO5/oN/WB3FgQAKYj35eG7SJBNRJLjYd7Lma7
+dA2o1aKju4r1TOtQoNE4WYYp7/rOgSvdhxP8rL9B1b1/0ToOhLy9aIbwkA3KX4a
T8qNy6eRw/eZtuySMmSHHsBOZteKqMCmKLSLka4MfKWYveRxPFnMTkEDTfXgo5ck
5iTqS9ZB0escmPN7IQQRHi2vTZCNe/22jJkag57B7bz14/kg5kHwKGlQwCPv85fB
OkpkLVV8KL5mncwsPUQiGwZqg9Jsno3IwbO4En2yDnQ9KmOuOKqb0+jykWV5L5an
fqNhmpzjkvj/wtbpGY/HIPqXJfTBqhTqIq1y1tGRg2qhfxv79t2/XfeaisYvSZbZ
Ij9RlIF3BwVPAmXH/92auLvZQTGAuF2ksPU0T/W9uERPBtv07paGsaNJ2XC6snkD
idpgXrCeP4s1ql1Ik0zCKWbpr7QI2ChFbVc3MhyYAOGPNLZ8GilLyadqPK+nKs7B
vS8fSOt0cBW0Fo9Uk20g6YejS/AGs3G9TtEs72sKvmFqEjgN8d4xw2M7QyNWt6Am
Ft5Dq9QF7rQMO0R3lm2ArbuJH1rZ5+GLkXXHTqSAT6zO/MwqG9wkPCsMXK+0T46y
p16rbgnMgbEvbG0M4XGB++GYiBznDukE5WJ9uQS7d6QN5TeWJB2n/01GqCzCgjkv
jxnG4Z9epIPEKfW0zdzE
=TiUD
-----END PGP SIGNATURE-----

--nextPart93897039.vQ5TdGhL6W--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
