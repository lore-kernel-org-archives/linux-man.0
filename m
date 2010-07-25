From: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Subject: Description of POLLHUP in poll(2)
Date: Sat, 24 Jul 2010 21:12:38 -0400
Message-ID: <cone.1280020358.708902.17185.500@commodore.email-scan.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
    boundary="=_mimegpg-commodore.email-scan.com-17185-1280020358-0001";
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

--=_mimegpg-commodore.email-scan.com-17185-1280020358-0001
Content-Type: text/plain; format=flowed; charset="US-ASCII"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

I'd like to propose adding the following to the current, somewhat terse, 
description of POLLHUP:

==

For stream sockets, this indicates that the peer closed its side of the 
connection. This does not necessarily imply that there's no more data to be 
read from the socket. POLLHUP may be set even if some unread data remains in 
the socket. Applications that need to process all data sent from their 
socket peer should use read(2) to check for unread data if POLLHUP is set.

==

That's something I didn't know -- I still learn something new every day -- 
When I get a POLLHUP I've assumed that it indicates an end-of-file 
condition, but that's not apparently the case, and having this documented 
would be helpful.


--=_mimegpg-commodore.email-scan.com-17185-1280020358-0001
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)

iEYEABECAAYFAkxLj4YACgkQx9p3GYHlUOJcygCePBZBGYkglmeo8A87zAlyjvwp
S3QAn16BpJDyGtRBbOwBghICRgHYbCWp
=Hyzs
-----END PGP SIGNATURE-----

--=_mimegpg-commodore.email-scan.com-17185-1280020358-0001--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
