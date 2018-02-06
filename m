From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] ld.so.8: make lack of separator escaping explicit
Date: Tue, 6 Feb 2018 13:28:27 -0500
Message-ID: <20180206182827.GH27582@vapier>
References: <20180205161357.8131-1-vapier@gentoo.org>
 <20180205214802.18397-1-vapier@gentoo.org>
 <5A796B65.7070705@bfs.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qoTlaiD+Y2fIM3Ll"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5A796B65.7070705-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--qoTlaiD+Y2fIM3Ll
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06 Feb 2018 09:46, walter harms wrote:
> Am 05.02.2018 22:48, schrieb Mike Frysinger:
> > Make it clear that the delimiters in LD_PRELOAD, LD_LIBRARY_PATH, and
> > LD_AUDIT cannot be escaped so people don't try various methods (such
> > as \:) to workaround it.
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
> > @@ -310,7 +311,8 @@ as shell variables!)
> >  .B LD_PRELOAD
> >  A list of additional, user-specified, ELF shared
> >  objects to be loaded before all others.
> > -The items of the list can be separated by spaces or colons.
> > +The items of the list can be separated by spaces or colons,
> > +and there is no support for escaping either separator.
> >  This can be used to selectively override functions in other shared obj=
ects.
> >  The objects are searched for using the rules given under DESCRIPTION.
> >  .IP
> > @@ -352,7 +354,8 @@ many obsolete or only for internal use.
> >  A colon-separated list of user-specified, ELF shared objects
> >  to be loaded before all others in a separate linker namespace
> >  (i.e., one that does not intrude upon the normal symbol bindings that
> > -would occur in the process).
> > +would occur in the process)
> > +and there is no support for escaping the separator.
> >  These objects can be used to audit the operation of the dynamic linker.
> >  .IP
> >  .B LD_AUDIT
>=20
> Everything is alright. NTL i would suggest to make consequences more clea=
r, e.g.:
>=20
> "There is \fBno way\rR to have libraryname like libfoo-1:2. In this case =
ld.so will
>  always search for \fBibfoo-1\fR and \fB2\fR."

could do.  lets see what Michael thinks.
-mike

--qoTlaiD+Y2fIM3Ll
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEuQK1JxMl+JKsJRrUQWM7n+g39YEFAlp588sACgkQQWM7n+g3
9YGayBAAgvPnWunvKI+7cFCmYXv6S0fvVf9KUfUp0yuVvCLrFs0QkFgtca4133Bp
Iu1i3dtRLq/IBiFeJz+Gpo+NvDkxnM3BqmhwVnumerA0/ouHzP5L78N+Un9ij0rq
rV0erx7nXeUP2D4FIYX6IVE/hqCZaFhzL/Xs3A9bg4bZrictDeG/mWSPBbYtHgh5
+/wBTIehWfD/BrI+7BFzv+Sd4wEAhZ1/fw3ylPPPh6b5MQujjNhXe+u4BvfjVdpN
jRtpsyxwpjvjWawxF9qfaVgw4h8qrF4L2R8hu6WPHFjd59R5c8thoubtczjOF2fU
8YerS9UtWznY/7TZstV3y0T3SoChdYOWQ/qiZ4PBOFgZ/fxTvKK62l6xD6RCheGX
gIro3Nh5cf9oOPByILBEuj62n+Cgvbh0dU0brcF8UsvBXg22oC4Ic0/HNcpUQnXU
hUKFDoQcQ0NxD2rrF4aFE0Od4T7+40oQaRfME+tt99+3HNGJLWFE0XfUB9dbqdul
65OIXdKr9msQEDlf07LHA4SjTnEQfWUX01aGbPGPWopECpG+JegYf8MU+9XH6iNJ
7Voe9LJoUSEoUuZ8PW1xao3KzrB7/uFkvzU0IZIzGp3cMkWxX7cTztG94BHqLITm
Ysz+Vd1OrS16Wc0WUs2YJ3LGkQpAKSCQQRFY7g9rUxWrjt+ergQ=
=oXJE
-----END PGP SIGNATURE-----

--qoTlaiD+Y2fIM3Ll--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
