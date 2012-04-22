From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] fchmodat: split kernel/C library documents
Date: Sun, 22 Apr 2012 11:20:36 -0400
Message-ID: <201204221120.37685.vapier@gentoo.org>
References: <1331692947-15879-1-git-send-email-vapier@gentoo.org> <201204211401.02304.vapier@gentoo.org> <CAKgNAkiUxv7_xFv3FzbYNeHagUrC3LZXbZTz-k5sWip_NO2hsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart7827583.Z1MYkZZIa2";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkiUxv7_xFv3FzbYNeHagUrC3LZXbZTz-k5sWip_NO2hsw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart7827583.Z1MYkZZIa2
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Saturday 21 April 2012 15:09:13 Michael Kerrisk wrote:
> On Sun, Apr 22, 2012 at 6:01 AM, Mike Frysinger wrote:
> > On Sunday 15 April 2012 07:15:27 Michael Kerrisk wrote:
> >> --- a/man2/fchmodat.2
> >> +++ b/man2/fchmodat.2
> >>=20
> >> +This page documents the interface provided by the
> >> +glibc wrapper function for the
> >=20
> > not to be pedantic, but this isn't glibc specific.  fchmodat() is a POS=
IX
> > interface, so every C library will have this difference.
>=20
> Yes, it's worth being clearer on that. I applied the patch below.
>=20
> --- a/man2/fchmodat.2
> +++ b/man2/fchmodat.2
> @@ -143,11 +143,9 @@ See
>  for an explanation of the need for
>  .BR fchmodat ().
>=20
> -This page documents the interface provided by the
> -glibc wrapper function for the
> -.BR fchmodat ()
> -system call.
> -The underlying system call does
> +The GNU C library wrapper function implements the POSIX-specified

"glibc" and "GNU C library" are the same thing :).  i'd just drop "GNU" her=
e.
=2Dmike

--nextPart7827583.Z1MYkZZIa2
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJPlCHFAAoJEEFjO5/oN/WBKc0P/0fIbqMccvtOMC+7h8Hl2liq
0cpkv6uV2II75j3RpVgKX6bWyjakrB4XZT4QPRmXXIrZw3nZ9SIKpgPRvSKMyjn+
L1nMxwyQ/If1iXs1zlNv5SZVdixtmETX/Ww5ooKyw4wPweMoKwgYdAiBjK0lVy75
ODyrA4xVfafb3CvkuxYh/ZrjDmzwCkLjGdlg4wLq/VfhTlHMuRmNag94qdenuwKh
h2wBHKJbFGap9qUJK89XkE3FzfRhWbWFXoqjr3bU3+hdHMvlQxvTAhTO71PxsoQc
3e7zLcomI2zV23BFOarT4FpSal1CNLer6n8RlorhnDwmCey8GlBLFrFJTWmBcfad
lNg1SZ5ar+f/0/nd8jILIlnTCvLAA9XPNJSUuwB+ST3sbgIlbivQdFcRvEUf+Ay+
RTZmtFPr34DpwAROcc4A0s3nYU5weYbi0mfJJCjdx7GXI+dVXYgLVBti8HR8jN2p
IR3IFhHvCAT2hCty7npcevuWOdA01omOB6Rc1MUR/LcYFDwiLF0aFT5BwWI5r1fm
ago9Fjwl6N8IPoAwHnRI2Zsix6F3UKAujKQzYN1ocULv9AvA8hNj8Awe4h9sk0V2
OjEFuoj+WMkGqXPyCTVGK3+5NpRLkCUrAU3MjRxiA3vFbcMXbRUEwMfYdJSRAUN0
DDzh+ibTd13skOWIibgz
=QKcb
-----END PGP SIGNATURE-----

--nextPart7827583.Z1MYkZZIa2--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
