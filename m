From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: linux strlen man page accepts NULL?
Date: Tue, 22 Sep 2009 02:43:28 -0400
Message-ID: <200909220243.30006.vapier@gentoo.org>
References: <19ac3f7a0908070455s33ecb5efo6810eb7959df1f70@mail.gmail.com> <19ac3f7a0908100506j7ec9933gec944f3b5bb92ef0@mail.gmail.com> <cfd18e0f0909191941s421596b1ne08da9906f4e4d5d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1920191.BWKV07to0c";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0909191941s421596b1ne08da9906f4e4d5d-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Jon Grant <jg-hus3n9K41k0@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart1920191.BWKV07to0c
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Saturday 19 September 2009 22:41:41 Michael Kerrisk wrote:
> On Mon, Aug 10, 2009 at 2:06 PM, Jon Grant wrote:
> > On my embedded
> > platform it is the beginning of the boot ROM. However typically 0x0 is
> > an invalid address, in which case strlen should check for NULL, and
> > return 0
>=20
> I don't think it should check for this. If the addres is invalid, it
> should be treated like any other invalid address -- usually a SIGSEGV
> results.

right.  if 0 is a valid address, then strlen() should work.  if it isnt val=
id=20
and you called strlen() on it anyways, then your code sucks and it should=20
crash.  POSIX does not require special handling of any address, so neither=
=20
should Linux.
=2Dmike

--nextPart1920191.BWKV07to0c
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iQIcBAABAgAGBQJKuHIRAAoJEEFjO5/oN/WBni8P/A+40LJI3MOtaEr0ik8EbiJM
3alZwjkuaw9a2pg5UcSCPCBu6p1B193Yo+4ylrxlYFwxkD3jrxI7mxI1DjNNWR//
MYHe5w7j54Z3whXcyFXZG8eOyp5C4wVprDK0Vh5Jzu2w1pbouth+bTPyC+G8DIBd
v+EcITA8OY6hlEoRBp5hj4116SxrEhTY6ehQ50XocxHzpcrehYiTEEU8Yg6V4I46
WVe0Eq3ugqkiCZheH7B7VzeI/cvk7jjLjz9WNl06kWwu4vZOM/Xe1wCpmtGeFUu8
9U+ozPj2A/EDatt/BYRYLR2dYafznRfkBqp8O94QLdmud+F4iLTFhsOh7DZmQhJz
QxHryB2O8rwvpfqsracGHyNWjrRcIXhQdj4gNU+ufSkEPdzMD0HzSDqrl6lqRzD+
reBzNU22sJhOvFPIlNpC5vwBO1wzWAD3CU7V+tLEWfoXxFLkP2mqZ9Db+Nc5lZKd
eHyqApw6t1XcsoM3p6FFLr0tPC7PIUth1b4phg7D8rT7N+bknnxtQ+R3/weAxlZP
Zag3rOOTKApCVMWynaS7IVu52u73Kv4n7F1bdMOTlqC0E9NZNU8jDttjtzZiOmAo
U1Vj+8BM3g0WkUYRlYVA9SZNQ9CmIWolPy+Qvepvb/ebdUqq4owckB948V/BJYq+
BSr7Yzwxyr9sgR/Ttm7D
=uT7n
-----END PGP SIGNATURE-----

--nextPart1920191.BWKV07to0c--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
