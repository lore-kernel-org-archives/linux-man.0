From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/6] ld.so.8: clarify synopsis
Date: Thu, 20 Oct 2011 14:08:33 -0400
Message-ID: <201110201408.34778.vapier@gentoo.org>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net> <20111020070412.GA11485@elie.hsd1.il.comcast.net>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1807490.vkGU7kutTe";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111020070412.GA11485-E4JsH6yu/ca99If2fRKg35Ea+QML8DWm@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>, Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--nextPart1807490.vkGU7kutTe
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 20 October 2011 03:04:12 Jonathan Nieder wrote:
> +.RB \*(lq /lib/ld-linux.so.*
> +.RI [ options ]
> +.I program
> +.RI [ arguments ]\*(rq.

can we avoid lq/rq ?  it's pretty uncommon and imo, just useless noise.

the rest looks fine to me.
-mike

--nextPart1807490.vkGU7kutTe
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJOoGOiAAoJEEFjO5/oN/WBRjIP/3hbsyKZY44RHxi7eAUpNC9o
/XY6G2ROp7OEZVzR6k88CeEY95CqKMzgViAyuBHT3JmcLKK5oostQM+X1E1jPcd1
/ZKdd2m3vmnclRTeqH9mZlX9TOAIbJcIy8JpJR/kuMeHeOeEGBeH1/vAZRYdgpMW
gSb+VuoP+HwTx6brH7UfM1ZDdVhfWLW/wqhA5FpzJhY6byjIB7A3kVzcOvHPzcu2
LmtkDUbp3n74Zebe6HOPzhJyLwJ2B0yjF3cCcKgeFDbDOFVMvUsc3PfsoDa0w4vR
1fiPvcDdY1lCDCFjrsuLjGXZ5KmiozXThAO9KEmB2AQY287WTTKaU8Pz2GZjX4F5
aJIR9AtzVGo1KH10YvVfADuo4odHpnMoBs7CTcRynQY5ndTcdSvCRjbn+p4z0r6j
p2c3eTrUkPZzB3Dac5K/tgTrUAXUrszqlaMYStC/4rKFX1p9OQTSFiuepTNTisqX
ndYw/5Ong8dHNuxk+RjKh6nlgY8Sn2pK0nuk/xfCqiMrkoPQmNy8WilA6GUUDNUk
v4okHhPbsveih+TVyCxGA5xWRFjUyxjw9ubrFvOyCrTKEtN98BF0EkrCT5W4mdJ3
84BiAhh3KdhERnd7ftiO3aC/xrOzU2Pmxn7ze0Lndt2J5A5BK3M5ny4Uo3DGpNy2
DlBp99HVNemQNpdnD6uK
=N3Eb
-----END PGP SIGNATURE-----

--nextPart1807490.vkGU7kutTe--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
