From: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Subject: timerfd_create confusion
Date: Mon, 15 Sep 2008 22:26:14 -0400
Message-ID: <cone.1221531974.45416.7917.500@commodore.email-scan.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
    boundary="=_mimegpg-commodore.email-scan.com-7917-1221531974-0001";
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

--=_mimegpg-commodore.email-scan.com-7917-1221531974-0001
Content-Type: text/plain; format=flowed; charset="US-ASCII"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

The following paragraph in timerfd_create looks confusing to me:

       The   flags   argument   is   either  0,  to  start  a  relative  timer
       (new_value.it_interval specifies a time relative to the  current  value
       of  the  clock specified by clockid), or TFD_TIMER_ABSTIME, to start an
       absolute timer (new_value.it_interval specifies an  absolute  time  for
       the clock specified by clockid; that is, the timer will expire when the
       value of that clock reaches the value specified in  new_value.it_inter-
       val).

The way I parse this, it makes more sense if the flags argument actually 
applies to the it_value field, the field that sets the initial timer 
expiration, rather than it_interval, the periodic timer expiration duration.



--=_mimegpg-commodore.email-scan.com-7917-1221531974-0001
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkjPGUYACgkQx9p3GYHlUOJfDwCfb3TnE94iL09Gm4wVWcT3xMQ1
3TsAn1F+WfXx1xD8sP3JolpUylhQ2uH4
=JlyI
-----END PGP SIGNATURE-----

--=_mimegpg-commodore.email-scan.com-7917-1221531974-0001--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
