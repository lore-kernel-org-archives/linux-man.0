From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: should strstr    return const char*  ?
Date: Fri, 5 Mar 2010 15:08:17 -0500
Message-ID: <201003051508.18959.vapier@gentoo.org>
References: <4B8AE057.7000000@jguk.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart13354321.DvvRFS6uBz";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4B8AE057.7000000-hus3n9K41k0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon <jg-hus3n9K41k0@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart13354321.DvvRFS6uBz
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday 28 February 2010 16:29:59 Jon wrote:
> I see this function on Ubuntu 9.10:
>=20
>       char *strstr(const char *haystack, const char *needle);
>=20
> Should it not return as const char * though?

man pages document the API only.  if you want to propose changing a functio=
n,=20
you'd have to ask the glibc mainling lists and/or more likely the POSIX=20
mailing lists.
=2Dmike

--nextPart13354321.DvvRFS6uBz
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)

iQIcBAABAgAGBQJLkWSyAAoJEEFjO5/oN/WBcFgP/2opxMbIeDbrLZe7fbllStUr
ApxcdYXbCb+93FkoviW8Eafv7hIAgrq30Vrvfq10x8f4YYgYFEJ8tkvhU+Ajat7K
csj8aGY9B2J5422hKCQN4PyAO/k33psUiLXHYdWoAmsAikz9yWrTHOLpJTDADvDH
jGmE2LIPUH3DGnaMXtWZDPQP/paBC63CBz3eozsYeIkAmXC14mBhNBL0ewcHhWBQ
6io4iq+LmYcgxNDVSxFCZ8CjsifvjpZ8n2JtjgMAFX+KVQTHxvHnfMgMKTXjTZ4o
J2aP6s5kgYjopHzxYpSnhDV9fQxNEquOWo0G5SkR0Afl4P4rcwKsAX7bkCK5Id3a
Ny5PtW2hS53+wIQrpyNxRBlkHUp3XLrSKSNHJjhCIxMXF8wILPuUMoVgaYdC73Ra
lXMgISFJ85kxw6/zX/TzX3GQ3szi0+FwvQjJEIdWO/gXAtD8dCpca8BLScfACxms
vKWkH07CkReuKoBNnRNV2zF8uNbZzoqPVQwuUzrAYL9OKIa7o/LIL75WtJw0Ycc5
vk3NpLFC+Dg6S0gMi4oEcPV3VdzPD4R10iHjeF6wT6314799xdY0XW2zWthhBBKU
wmAVAT5Pk/5PbBKVG6kPSXi1MxsuQ5XAyksNeffyvBWRINI40dvOeySPQHciO59K
tyD++v0NCFqFbglam3zE
=x/K+
-----END PGP SIGNATURE-----

--nextPart13354321.DvvRFS6uBz--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
