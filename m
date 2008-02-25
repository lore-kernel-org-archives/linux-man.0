From: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Subject: Duplicated text in getaddrinfo(3)
Date: Sun, 24 Feb 2008 19:46:26 -0500
Message-ID: <cone.1203900386.880941.11463.500@commodore.email-scan.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
    boundary="=_mimegpg-commodore.email-scan.com-11463-1203900386-0002";
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

--=_mimegpg-commodore.email-scan.com-11463-1203900386-0002
Content-Type: text/plain; format=flowed; charset="US-ASCII"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

The current version of getaddrinfo(3) seems to have some a small amount of 
duplicative text, possibly a small cut-paste fudge.

Describing the results placed into the returned addrinfo struct:

The members
.IR ai_family ,
.IR ai_socktype ,
and
.I ai_protocol
have the same meaning as the corresponding parameters in the
.BR socket (2)
system call.


Then, two paragraphs later:

.IR ai_family ,
.IR ai_socktype ,
and
.I ai_protocol
specify the socket creation parameters.

Even those the immediately preceding sentence refers to the hints input 
parameter, this sentence seems to refer to the output addrinfo struct again, 
and just restates the description given two paragraphs earlier.

--=_mimegpg-commodore.email-scan.com-11463-1203900386-0002
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQBHwg/ix9p3GYHlUOIRAtvZAJ9tGKP0M56kJ9g6YCcrsH0TuPrwDgCfQ03f
bWq07j5sQQj1d/xH8Zzw+Hw=
=mhRO
-----END PGP SIGNATURE-----

--=_mimegpg-commodore.email-scan.com-11463-1203900386-0002--
