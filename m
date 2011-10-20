From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/6] ld.so.8: document Debian's /etc/ld.so.nohwcap extension
Date: Thu, 20 Oct 2011 14:11:02 -0400
Message-ID: <201110201411.03656.vapier@gentoo.org>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net> <20111020071424.GD11485@elie.hsd1.il.comcast.net>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart16315290.g1BrEuImIf";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111020071424.GD11485-E4JsH6yu/ca99If2fRKg35Ea+QML8DWm@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>, Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--nextPart16315290.g1BrEuImIf
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 20 October 2011 03:14:24 Jonathan Nieder wrote:
> Incidentally, is there some upstream-supported way to do this
> (override LD_HWCAP_MASK using a file on the filesystem)?  How do other
> distros address this problem (e.g., ABI mismatches between out-of-date
> hwcap libs and the updated libnss) during upgrades?

use IFUNC and then there's usually no need for hwcap alternatives

> --- a/man8/ld.so.8
> +++ b/man8/ld.so.8
>
> +.I /etc/ld.so.nohwcap
> +(Debian only, since glibc 2.2.93-1)

i think this belongs in Debian's man-page patchset
-mike

--nextPart16315290.g1BrEuImIf
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJOoGQ3AAoJEEFjO5/oN/WB/WkP/jweBgnjfn9Mh1NNBk1seEYU
VYl5X58tBcuh6Swt3a+mf8zsxnvl16tjNUybuFI+6OC4WibcNeUN4aiXsxHyZGE2
ORZZd7C2wfsSnscJNQ+1GjiWQ2BSoTrUsCMGpt7ofSrm/QDNUK5iPeBNAuRqREWV
WdC9MMv0S3X0zB2FkKENhUgd/WhZZ2rUlBg1w0U0MxOMoIEfM2slXsQlS9CFUhR+
ihIUbXRLRI4lzg0cQmgtpq3bGEjZT20HGNIn5KI51seZb+hoLFvO7rQp+j4/Vdh2
zbqlEGuFLg8gQ/iKB5H7mPNObFmXA8I36XdWmAZe0LkQfPSKxK29gU93G5F0iiUU
Avpxblkz2X0FdsiYpVo/Gz1BZ4n9Bfxo1mjhS4v5GV6phGOXXRlaajuT/miXF7Po
y0o34aRV0IUxQ21HAAMeFHY9HmuXWqeADcp/I4uzal+YC8rGfy8UKcxGjsOYy4qZ
qtTvkCPj6fGSW54oja1Na/QlykfHgo96/vdw1WdQE2pIA+WT4XyW/gtRAoQHOc9h
FYEPBmbsIHfpL8KAv4dr1wlwUqf4SJQggpcSDEROa/8FKG//H3Aczhaqw1tLw1yV
cnjY55jT3wbXwOq9Jg95vUk0Bdn5vRZ4bcoIO7G9kjkPcemv5Q0Iwl8YQjGUcKNb
LZTw2dz+tMHjLa/16ztf
=KdSi
-----END PGP SIGNATURE-----

--nextPart16315290.g1BrEuImIf--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
