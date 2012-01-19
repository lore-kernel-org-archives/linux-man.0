From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: suggestion for improvement to vfork() man page
Date: Thu, 19 Jan 2012 13:36:53 -0500
Message-ID: <201201191336.54114.vapier@gentoo.org>
References: <6.2.5.6.2.20120118221253.03aad598@binnacle.cx>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3315192.OePprX9DYQ";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6.2.5.6.2.20120118221253.03aad598-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: starlight-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart3315192.OePprX9DYQ
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wednesday 18 January 2012 22:16:28 starlight-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org wrote:
> Also I don't think it is unfortunate (or a bug)
> that vfork() continues to exist in Linux aside
> from the fact that the semantics differ from
> other *nixes in subtle and potentially
> confusing ways.
>=20
> As implemented in Linux vfork() is quite useful
> and with the aforementioned clarifications to
> the documentation, worth retaining.

it also most likely won't ever be going away.  a few reasons:
	- vfork() is really just a clone() with certain flags
	- clone() is never going away as it is used to create threads
	- vfork() is required for no-mmu systems (can't implement fork())
=2Dmike

--nextPart3315192.OePprX9DYQ
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJPGGLGAAoJEEFjO5/oN/WB5bkP/jEPQiGW7UnkM8zE9dDHD7Zg
Yhx22wJE8bz8oAhA7rTH8BsmkTv9UHmT79l2ONvwbfYRRffzYhqQ8oPgQ3I3QuVm
m+Z88x822GIB7Q6yn2H6sYhMN/Z827XhWRTkWa/pbzxXOk0qxTX7n3fvwkUdvif+
1AAVVZqlMnrzwcLCOp45+Pl9vcZjU3wBAqqo+juIVH8YrI3044ljKnhsjMLulwAn
AvFH8f1ByV6NEdAA3xhMxuNjt9CQtB9lrVKkyRCh+Kc+aLeWLtjub9fzBaO41iY0
AakuDdYcRcGywhR6ng+E5nfuTYmSPeEBZ/QBBMphVX/LeOJT1dkiNiHTGtNaGaDJ
WN7kbjBCBU338WqGRnYUUGLRCLFZSt15PJwZHHE5qPqqS4u4Y5tU2VaP87LMDTBe
vhf5I2DZUINN1oSnlv9PrHVAjWNm0/wDovcQytzrJ0patslg/hs9Tlk757wV3oDk
L3NFlFMkaAY4hlfjeQSPfpTUKRiByvTnqU0M8w/8/sX4by3r5wtEZSMkoBCg3bQT
VRwAFQIUk5BuEVvjVpet6JYvzxfa2R6Dl+CrqhemnRvXnHqPAzf9Nz/l5pGpeQb8
dkfGugugbESsnsNMXBGNW/si2wZ5znZsT8QVvXBLPE/cMSrkamvlBeWyqanERtsp
WHQRnJwM8oeBAc5qFWEH
=T3NH
-----END PGP SIGNATURE-----

--nextPart3315192.OePprX9DYQ--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
