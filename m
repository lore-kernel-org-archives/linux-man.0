From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/6] ld.so.8: document $PLATFORM and $LIB expansion
Date: Sat, 10 Dec 2011 22:16:32 -0500
Message-ID: <201112102216.34565.vapier@gentoo.org>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net> <201110201416.30351.vapier@gentoo.org> <20111021052528.GF23372@elie.hsd1.il.comcast.net>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart11320131.tqExAJSaZ1";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111021052528.GF23372-E4JsH6yu/ca99If2fRKg35Ea+QML8DWm@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>, Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>, Reinhard Tartler <siretart-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--nextPart11320131.tqExAJSaZ1
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Friday 21 October 2011 01:25:28 Jonathan Nieder wrote:
>  - what is $LIB for a non-native ABI?

whatever it's been configured for.  it isn't an env var that is the same ac=
ross=20
all ABIs.  you could configure every ABI to use /lib, but that'd be dumb.

if we look at the 3 ABI's we have on the x86 system and their standard inst=
all=20
paths:
	- 32bit: lives in /lib and has ldso at /lib/ld-linux.so.2
	- 64bit: lives in /lib64 and has ldso at /lib64/ld-linux-x86-64.so.2
	- x32: lives in /libx32 and has ldso at /libx32/ld-linux-x32.so.2

you don't `./configure && make` once to get multiple ABIs.  you have to=20
manually run that per ABI.  so the 32bit ABI gets configured so $LIB is set=
 to=20
/lib, then the 64bit ABI gets configured for /lib64, etc...

the ldso at runtime will replace $LIB with whatever it was configured for

>  - does anyone customize this to point somewhere else and make their
>    machine non-FHS-compliant?  Maybe NixOS and Gentoo Prefix do.

you can't really consider Gentoo Prefix as a being the domain of FHS rule. =
 it=20
is not a distro you boot ... it's a set of packages you build/install into=
=20
your $HOME because your host system is old/broken/whatever.

>    What would a person typically use ${LIB} in an rpath for?

it's useful when you want to preload a library for multiple process types. =
=20
why this would get used in an RPATH tag, i can't really guess since the ELF=
=20
itself is already configured for a specific ABI.  maybe someone more invent=
ive=20
can come up with something ;).
=2Dmike

--nextPart11320131.tqExAJSaZ1
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJO5CCSAAoJEEFjO5/oN/WBLTUP/Rqy8N1/joBFJWDIPozsphFJ
rR87b3+XDEXRJ345SYoOwh3e2lHeluS8+mQN474HIAawLAq6F6R+Of4ohz3SO7Wk
qXz021thNsCNXgItwBmHMTSDkvwIvHgvZV6pedMATsnZIsqoAh+MOSplSm9a+WhD
ZnPQzDJTDFnqe+mh7O5xrYEuTaNaOCvbEjCYdHIlmUgOpXU6hXBUBVrEMnoiqCot
tL8gGVysxVL7cTZ22cMN2F75ZfH1jNmb7xwFsYmFXWm+r9tqVYsfQ9wZXu/NE35W
XNdOfW3QEopHxQNrcSmkLAFHbfOr/wk3x2EEmX3epCzHHJPhMbbYMtpMkMJXy7YD
ySROxw0N8RoqZsvSh86NRFLBfPIm1iuslN1cwfWVJaZ/mzmITpKuAkv4W2jYoXJ6
dJLi0KX0Bi7LLSa3ZlyZbMOIipUmHmsr+I3PEC2CXb5bggsgi1lZrcKkO2VE5By6
Q1u2iDL0X0V2v/F1tBP5vOttzls7WKFtGZ0DF8yIGWMDPtvp2ry/p/gscfe5sox0
oT9BbWtGd2zqzB0Aeb+mFrjh+wK0AQSi9keKSXEk+WvEGJWBxlPfgVidztmM49gf
sIJz5Gyfns7vkxJIXlFWt1tAUSqaVjN9NA4MWO4RGx32DucjKXCORXUV5Rzy2HgI
pIAfLuo69EgnCmIEyBCY
=Ot54
-----END PGP SIGNATURE-----

--nextPart11320131.tqExAJSaZ1--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
