From: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Subject: Maximum number of file descriptors that may be passed via
         =?UTF-8?Q?SCM=5FRIGHTS?=
Date: Wed, 25 May 2011 19:57:09 -0400
Message-ID: <cone.1306367829.726700.9970.500@monster.email-scan.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
    boundary="=_mimegpg-monster.email-scan.com-9970-1306367829-0001";
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

--=_mimegpg-monster.email-scan.com-9970-1306367829-0001
Content-Type: text/plain; format=flowed; delsp=yes; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Anyone knows if the maximum number of file descriptors that can be passed  
via SCM_RIGHTS is documented anywhere?

Up to at least 2.6.35, I could stuff as many as 255 file descriptors. Which  
sort of made sense.

I updated to Fedora 15, which is based on 2.6.38, and the maximum number of  
file descriptors I can stuff into a message seems to be 253. With 254,  
strace tells me that the kernel refuses with EINVAL.



--=_mimegpg-monster.email-scan.com-9970-1306367829-0001
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3dl1UACgkQx9p3GYHlUOLaLACfcfBnTRLGfxoeh5yDKWmHCqap
tNMAn3Aj04T/r3k/BZEt4AxPGaEOOhxJ
=Ki1z
-----END PGP SIGNATURE-----

--=_mimegpg-monster.email-scan.com-9970-1306367829-0001--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
