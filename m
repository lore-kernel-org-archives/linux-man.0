From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] setenv.3, putenv.3: Elaborate on thread (non-)safety
Date: Fri, 5 Mar 2010 14:46:13 -0500
Message-ID: <201003051446.14847.vapier@gentoo.org>
References: <20100224204625.GD19115@machine.or.cz>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1929787.sZeivVGIb8";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100224204625.GD19115-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart1929787.sZeivVGIb8
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 24 February 2010 15:46:25 Petr Baudis wrote:
> +thus consults $TZ deep inside). Thus, modifying environment
> +in multi-threaded applications should be avoided if at all possible,

modifying environment -> modifying the environment

> +or special measures taken so that no non-obvious library functions
> +get called meanwhile.

"no non" is funky.  how about:
	so that non-obvious library functions are not called in the meanwhile.
-mike

--nextPart1929787.sZeivVGIb8
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)

iQIcBAABAgAGBQJLkV+GAAoJEEFjO5/oN/WBB64P/2nwUSx4HeLA4SwXzvdhTv6I
TOHIGJdfrbyFcTb8efTE/h+DPy+Q8IwllZ+9uV3Yqm27NfZnTPSCv0xPFTq/gnNh
Ul3YudFspccx14DBEMm9gm1/HGk46trgfJVbGb+/OeE4EDVgLvxlwRsFN1k72Mws
YDZYMFFFzyXBb7TXws/dzFSiACsYt9mlegpn7F+6xNxM0CDF4Uh8FgSpqp1TCOt7
iHu54dTvtLnq4wDfE49vsTVVcIlDs6oN/4sUVkyXCy9daXX4gSYD8L5sMcxXZ0sr
DmQ4FDMWaTsc1fYTRt8j2fLLDW5DtCkpfl6aIh/eTd48d9muP+uRFTEL8bMrw9Z2
L2GRXkl5muq8IUigSTgfhvmZrZHg65lXFjTOirBlbQRxt9FTF8Z+8I9x0aBjPPfw
z/0PyRmjO6atf0DhLfNq3GA6nzk0hcWfIP/WTZ4YSDX+thjm0yLZDZWKPs9se6rw
F2NMrEMFHsKPxtaBuoNCLBVHEGrvuvGybDcZGvSSJmoIzbG5sS34Y5mACx8Psz+g
9ZEg3bznIoxxAuPfZz20pn/VB3aufmB+XhmiTBuWiXx+009LrPxnLEEprc9ME8PN
mT7ncp3O1qvcYa4OSy+SJpMNfdHMOwkEBNt18tEjkScDt/Yd13XQH4kxsqgh+st7
K3Abwj0OXWwlFDa+SLV9
=OAZK
-----END PGP SIGNATURE-----

--nextPart1929787.sZeivVGIb8--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
