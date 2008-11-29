From: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Subject: Cannot bind an AF_UNIX socket with large filenames
Date: Sat, 29 Nov 2008 09:34:43 -0500
Message-ID: <cone.1227969283.265765.5728.500@commodore.email-scan.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
    boundary="=_mimegpg-commodore.email-scan.com-5728-1227969283-0001";
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

--=_mimegpg-commodore.email-scan.com-5728-1227969283-0001
Content-Type: text/plain; format=flowed; charset="US-ASCII"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

It looks like the kernel -- at least 2.6.27.5 -- rejects with EINVAL a 
bind() of an AF_UNIX socket whose given size exceeds sizeof(struct 
sockaddr_un).

Even if I make arrangements for a larger structure to accomodate a path that 
exceeds sockaddr_un's 107 bytes + \0, and I specify the actual size of the 
structure, bind() fails for me.

I don't have the details, but I'm pretty sure other unixes accept domain 
sockets with larger filenames. There, the sockaddr_un structure exists for 
historical reasons, and you can pretty much roll your own.

This is perhaps worth mentioning in the description of EINVAL in unix(7).


--=_mimegpg-commodore.email-scan.com-5728-1227969283-0001
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkkxUwMACgkQx9p3GYHlUOKb1wCfVrOOyreCancfgcj59KWRkL2j
k88An25+YPZ76NniM8ZYHt+LB1a5b7bQ
=zRvz
-----END PGP SIGNATURE-----

--=_mimegpg-commodore.email-scan.com-5728-1227969283-0001--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
