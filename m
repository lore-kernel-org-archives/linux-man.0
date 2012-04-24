From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ptrace(2): note SPARC deviation wrt get/set regs
Date: Mon, 23 Apr 2012 23:55:38 -0400
Message-ID: <201204232355.39879.vapier@gentoo.org>
References: <1256454909-22861-1-git-send-email-vapier@gentoo.org> <CAKgNAkgntJqu4UkeusJV-oak6ksM6_Y4z3GeYTfg0JD2tQ4jww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart4090786.6kh8LK3X5y";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgntJqu4UkeusJV-oak6ksM6_Y4z3GeYTfg0JD2tQ4jww-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--nextPart4090786.6kh8LK3X5y
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sunday 22 April 2012 14:56:14 Michael Kerrisk (man-pages) wrote:
> You long ago sent the patch below, but I didn't respond. I'm just
> pulling up a few old ptrace pieces now for review.
>=20
> Your patch below relates to PTRACE_GETREGS, PTRACE_GETFPREGS,
> PTRACE_SETREGS, PTRACE_SETFPREGS. (The patch below no longer is
> current, but is easy to fix)
>=20
> Looking at arch/sparc/kernel/ptrace_32.c, I think I see what the point
> of the patch is. However, the text is a bit cryptic. Would it not be
> better to say something like

seemed clear to me, but i wrote it ;)

> [[
> Note that SPARC systems have the meaning of \fIdata\fP and \fIaddr\fP
> reversed; that is, \fIdata\fP is ignored and the registers are copied to
> [from] \fIaddr\fP.
> ]]

i'd suggest "via" rather than "to [from]"
=2Dmike

--nextPart4090786.6kh8LK3X5y
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJPliQ7AAoJEEFjO5/oN/WBz5wP/j7kEXP9K6eh2kHHojv2v4i/
PBC3SrxGykHRKH5Ccj1ZiND1ftOsdRJt66tb5dxczExIQNSFXIRVSx+9wlVjqf0e
Aic1M2kXTQ22hH6TS8erbvjj1mbz0wiZLCpqZNuhO1AfKcI2sU9Tzx5vzvxhduMk
63/48Q3ZhPnV5Idc8v2hrdga1O26dSpcme9CrTWBFVWoRa1bwzZer+Am/L+K29bh
Ey3qrzoI/0nhtl3Y42b6AbglTtY5UyG39hMLf3WTBGYPkJQ3B9cSzuH/x3Ks3dYQ
DPNJQ9AZV/HI+gVBSj3Qn59aYi9yUshYroXGYEh07JFNFge76wtCKYxK6Tr/hdxY
KpE2iink0+Mo/nN3pdZxoXj5mMiFbG1aFhHkcnQh9H7OVRqXlNAXGa5iNTEkLC6x
aPPdqCbo47Z6mCwUGjgfnbmo2TpTLJt+604y6PaDJY3OedE4VCDLs58Z2yiCypVQ
GxV/Tk7Y9wBV4n1lZA+EX9xXACJfRw1W1EjmepDiG/rLxo19QG6li+Z5XUQjQURh
jUI3CH2bQxDH0VpklmK9t/f4MzkFkwTik6Rj7G6vkSNTveNbNeyYm1CpSlAXIflQ
5Rnqk4ukCy7oTPN64KvAPzpTG7sG1jRizhAmjlgKl3GxZqI7fsLldbL8sBeGugxV
HdPKfvdmEbs9CcDcOXSl
=e1d7
-----END PGP SIGNATURE-----

--nextPart4090786.6kh8LK3X5y--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
