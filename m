From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ld.so(8): make lack of separator escaping explicit
Date: Mon, 5 Feb 2018 16:44:55 -0500
Message-ID: <20180205214455.GF27582@vapier>
References: <20180205161357.8131-1-vapier@gentoo.org>
 <5A78842E.2060402@bfs.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nHwqXXcoX0o6fKCv"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5A78842E.2060402-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--nHwqXXcoX0o6fKCv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05 Feb 2018 17:19, walter harms wrote:
> Am 05.02.2018 17:13, schrieb Mike Frysinger:
> > Make it clear that the delimiters in LD_LIBRARY_PATH cannot be escaped
> > so people don't try various methods (like \:) to workaround it.
> >=20
> > --- a/man8/ld.so.8
> > +++ b/man8/ld.so.8
> > @@ -271,7 +271,8 @@ This is useful when using a debugger.
> >  .B LD_LIBRARY_PATH
> >  A list of directories in which to search for
> >  ELF libraries at execution time.
> > -The items in the list are separated by either colons or semicolons.
> > +The items in the list are separated by either colons or semicolons,
> > +and there is no support for escaping either separator.
> >  Similar to the
> >  .B PATH
> >  environment variable.
>=20
> I am not sure that i understand that. You say that a libname like
> libfoo.1.2:3 is unparseable ?

i think you're confusing LD_LIBRARY_PATH with other variables like
LD_PRELOAD.  my patch here is for the former, and that only loads
search paths (i.e. directories), not files.

however, you're correct in that LD_PRELOAD=3D"libfoo.1.2:3" would not
work if the file was literally named "libfoo.1.2:3".  it would search
for "libfoo.1.2" and "3", and there is no way to change that behavior.

i'll send another patch.
-mike

--nHwqXXcoX0o6fKCv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEuQK1JxMl+JKsJRrUQWM7n+g39YEFAlp40FcACgkQQWM7n+g3
9YH5sw//YYJLUfLYae7ya56nUziqzmfR9+67lk6tjnwZNTPHCmPVO44q7Eolx27T
oHhV58nB2A87Bwp+jMnJB72hKyeOmioc/9+IOqJsRlrLLs6tLz+kyf/RmxJtZVxw
y+dfylrTXM17O0DSvRh2cjQdDwcCUYCw9a/sajFskK6Hg0Wb1oIW9O3RQoe+8psG
S2rN4us3qLro4I9IxKXfj2RW4fXbp+gKBOPyIyq1wzbLXy2gRPcCfoUQbT7piqj6
t1DpftY+q02Q0JUFz7U0niucwR/0AF2/yte/Y1I/vQXTPJNU+/tY+E+IeSqwmX7L
GM6AQ5OF93GGdlzgs6ppUh1RJygfwoRhmSK8Rg6q8QkDZWfRjfVhqn3wUFJEEnQV
3/8S1+FlRiGNPzLed94ENVnW8bdVc+N2s52f/15nsUjEXAlP5lxK4+uxSSPP6fhG
K8dKpeKNjZkIiHAz8TI3I0c6Y7Q0JCBv9OTVqxkgPoZgxDUTWP5bemXSIRACiY+2
Crnym5F7sz64JnSG+tIug1816V5AVx432e9Wc4rurSBFQa8xUyB6YQMdHM0Dg8+f
lKxfcnhYni+7SL9c/42tRVrZ1101zuGZLAbwz5kZv+R1spmL5ryHr4LABtRLVd2m
ee+KZ9V+S7r2iy5TAXC3jbSOqtQCH6Cvx67xyQWUT7DD9Cv3PT0=
=SIkL
-----END PGP SIGNATURE-----

--nHwqXXcoX0o6fKCv--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
