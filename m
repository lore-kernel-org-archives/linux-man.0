From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] man2 : syscall.2 : document syscall calling conventions
Date: Thu, 11 Apr 2013 21:40:17 -0400
Message-ID: <201304112140.18506.vapier@gentoo.org>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com> <BLU0-SMTP986B123D17DB8B88214F797C40@phx.gbl> <CAKgNAkhv6tovvnucoofDR-eOe4H7xeFZDam9+iaVVndEqbuoXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart17524485.mrj3Pp0g2F";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhv6tovvnucoofDR-eOe4H7xeFZDam9+iaVVndEqbuoXg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--nextPart17524485.mrj3Pp0g2F
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 08 April 2013 05:20:07 Michael Kerrisk (man-pages) wrote:
>        arch/ABI   instruction          syscall #   retval  Notes

i was thinking it also might be useful to mention the register where the=20
syscall # is kept for syscall_restart, but we can do that in a follow up

>        ia64       break 0x100000       r15         r10/r8C

looks like you added a typo :).  it's "r8", not "r8C".
=2Dmike

--nextPart17524485.mrj3Pp0g2F
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRZ2YCAAoJEEFjO5/oN/WBDoYP/34KGVoaBExMPkoCq5B9wrRd
vnk0PLP8oWfTU5FIig1xUDSuC/XSrKWptgbt6MR0iYDDZGCKRJjoVA7ISPCdCmaY
ZfeF1xWUabe4+iqBXVpiQ5lfVgz7gjNqAoBi14MWZ0ONeUu8ZKpdvkly2QV2mImH
Vyo3hk4Ker73mOdyZRGJQ3XCbkFOSUcGF96DrNt42BhuQZcOKFVIVPQtNIErRTv1
HIEJm9vlXT4WkjHBSMMS8mNxxZWqbwoxldLj14DcmaVieLmWTryFkCte2vLE2IYM
mwQeb1bI6+XAne/nhobUgQU5Z2J5S+3g1MGxHhm7zyGjojs/BqYO3tWYs4SaJEXh
dKxMrv8QNppBIJLglPz0wrV7O56xSpJaeowfMldcnywD/HQ/vHWN7nlx9HrALaqc
C7sRcemfLT8FiYBHtYsG5z3u2kSOSFBIBU0qub8/EuYX6q3JMHPwxU22MSBHlPoe
dd06exnGl0IMJ+2WifqdviEZ4iHCw3t/Hx8yYKmX5DoIo8jWGj0ZG0wAiols3tqy
+77R5XQqAy8rVddQaWnvy8zsiezmp6EI3AhhVS3rb0ADJaGXHFGes52P8HffrzNO
G6J4o0fyw9edWy1tQgVHLB0CMZIbg9759BnElS+DMUHeMdUsBNooUqpo09F24Ucr
CtCChr30Ux3J/p0EHq4a
=Ur9l
-----END PGP SIGNATURE-----

--nextPart17524485.mrj3Pp0g2F--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
