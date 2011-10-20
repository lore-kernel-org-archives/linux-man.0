From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/6] ld.so.8: document $PLATFORM and $LIB expansion
Date: Thu, 20 Oct 2011 14:16:28 -0400
Message-ID: <201110201416.30351.vapier@gentoo.org>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net> <20111020071538.GE11485@elie.hsd1.il.comcast.net>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart10499004.AmgNuJpYSo";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111020071538.GE11485-E4JsH6yu/ca99If2fRKg35Ea+QML8DWm@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>, Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>, Reinhard Tartler <siretart-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--nextPart10499004.AmgNuJpYSo
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday 20 October 2011 03:15:38 Jonathan Nieder wrote:
> +.B LIB
> +The string \fB$LIB\fR (or equivalently \fB${LIB}\fR) represents
> +the system libraries directory, which is /lib for the native architecture
> +on FHS compliant GNU/Linux systems.

a better description might be something like "$LIB expands to the short lib=
dir=20
name that glibc was configured to install into".  and then refer to it usua=
lly=20
being "/lib" for the native ABI (not architecture) on FHS compliant Linux=20
systems.  man-pages does not use the "GNU/" noise qualification.
=2Dmike

--nextPart10499004.AmgNuJpYSo
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJOoGV+AAoJEEFjO5/oN/WBs/8P/3q5B9M15QuvotZzCEFk/fAq
oEwivmb2pO7xeJwE26Zf70Krj5aO5MXlw0dXZIy50F6Kx73nEyYHg+L5yfBbCOrr
WLZSIfR+u1fBXnzHd/Scg3p+yJ5Rd6eB5A8PXn9DkeSRFJq7Zb3n8d7ri3flDzsr
++FlkB0n6z60ZUgo37zX8BwzC1dV5w3GMC6KmlieMlHEKNWs/u5wzsWTG8j+nDHV
ebE9XY7sPBruTqIGNEPjlMrdn/9n0TeBxE9AIvGgDX0Dm18nVUU2WxLYIpvsqWZg
RmhrN1XTWsyUnJ4yIrvyaH36GXOGMIu+nKo7lHCFfY040gpMvdbfi7CM7bezTFKt
Q39W6QrqwDyGOy7JEMrkcMcvbLSgLsJoqDcNAzoOgHcYvtNLMQG3Fqji4Eooc9Dr
Stt5sA5UdQtPWVVtcih2gOLBkDLJZ8beFnJ+fW+F83oLaDSwtHyLqfNAasULp+Yd
NIs6Mu3lzu9BCIjzbkFyHU2yyDwE9bULp0+UtA9rbQ0EeXksPdp5qHCSXT/YG08V
y/LZ/2WylNAenabnFXk2QMKYcN3wz7Xtc4iH3ONzlBOEtmeZT/yKvuqGIx+sLMS3
s24lGKc2XCYjtiREakqMLXvzviN29jMnICgmyaAH4sadbiZwYVTYEdRJECzM2wd1
JyA4gSrJRBGuHoYm72o/
=FmaH
-----END PGP SIGNATURE-----

--nextPart10499004.AmgNuJpYSo--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
