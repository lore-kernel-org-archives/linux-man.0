From: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Subject: epoll(7) redux
Date: Wed, 09 Apr 2008 07:07:23 -0400
Message-ID: <cone.1207739243.602382.23947.500@commodore.email-scan.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
    boundary="=_mimegpg-commodore.email-scan.com-23947-1207739243-0001";
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

--=_mimegpg-commodore.email-scan.com-23947-1207739243-0001
Content-Type: text/plain; format=flowed; charset="US-ASCII"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Q2

    Can two epoll sets wait for the same file descriptor? If so, are events 
reported to both epoll file descriptors?

A2

    Yes, and events would be reported to both. However, it is not 
recommended.

=========

It's not clear what "not recommended" means. Furthermore, I don't think 
there's anything wrong with two epoll file descriptors waiting for different 
events on the same file descriptor. One's waiting for POLLIN, the other for 
POLLOUT. What's wrong with that?


--=_mimegpg-commodore.email-scan.com-23947-1207739243-0001
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQBH/KNrx9p3GYHlUOIRAm+vAJ45yuTImfeNvcjFqbkxgDCB6n9SOwCeLbgY
onRydr50VYzptCTpwxZx9ng=
=X7jd
-----END PGP SIGNATURE-----

--=_mimegpg-commodore.email-scan.com-23947-1207739243-0001--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
