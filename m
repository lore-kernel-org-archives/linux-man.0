From: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Subject: Re: What's the equivalent of readdirat()?
Date: Mon, 18 Feb 2008 17:00:21 -0500
Message-ID: <cone.1203372021.37933.7234.500@commodore.email-scan.com>
References: <200802181426.44768.rob@landley.net>
Mime-Version: 1.0
Content-Type: multipart/signed;
    boundary="=_mimegpg-commodore.email-scan.com-7234-1203372021-0001";
    micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a MIME GnuPG-signed message.  If you see this text, it means that
your E-mail or Usenet software does not support MIME signed messages.
The Internet standard for MIME PGP messages, RFC 2015, was published in 1996.
To open this message correctly you will need to install E-mail or Usenet
software that supports modern Internet standards.

--=_mimegpg-commodore.email-scan.com-7234-1203372021-0001
Content-Type: text/plain; format=flowed; charset="US-ASCII"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Rob Landley writes:

> I'm moving some code to use openat() and friends, but there doesn't appear to 
> be a readdirat().
> 
> The problem is that readdir(3) takes a path from cwd.

No, it doesn't. readdir() takes an existing DIR pointer, that was previously 
returned by opendir(3).

You will note that the opendir(3) man page also described an alternative 
fdopendir() function, which in conjunction with openat(3) will do what you 
want.


--=_mimegpg-commodore.email-scan.com-7234-1203372021-0001
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQBHuf/1x9p3GYHlUOIRAo0XAJ45jktDYz9R01PFiaXR9jOuu+2vQgCaAuHN
LtVBww80Ofn3P3T9Yyf7A88=
=wN1S
-----END PGP SIGNATURE-----

--=_mimegpg-commodore.email-scan.com-7234-1203372021-0001--
