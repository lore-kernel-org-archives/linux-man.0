From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [man-pages PATCH] Add note about calling fclose(NULL)
Date: Sat, 2 Feb 2013 04:35:34 -0500
Message-ID: <201302020435.34996.vapier@gentoo.org>
References: <1695270.M7m4ekngnN@storm> <201301291344.29011.vapier@gentoo.org> <2211833.tieGgo36jp@storm>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart4731191.DKAN2VRUiF";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2211833.tieGgo36jp@storm>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Jarosch <thomas.jarosch-XXsH3GEs1jrby3iVrkZq2A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart4731191.DKAN2VRUiF
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Friday 01 February 2013 04:43:21 Thomas Jarosch wrote:
> On Tuesday, 29. January 2013 13:44:28 you wrote:
> > On Tuesday 29 January 2013 11:24:43 Thomas Jarosch wrote:
> > > --- a/man3/fclose.3
> > > +++ b/man3/fclose.3
> > > @@ -97,6 +97,10 @@ on disk the kernel buffers must be flushed too, for
> > > example, with .BR sync (2)
> > >  or
> > >  .BR fsync (2).
> > > +Also it's undefined behavior to call
> > > +.BR fclose ()
> > > +with a NULL pointer.
> > > +
> > >  .SH "SEE ALSO"
> > >  .BR close (2),
> > >  .BR fcloseall (3),
> >=20
> > i wonder if it'd be better placed in the DESCRIPTION section
>=20
> I first added it there and then thought it's too prominent.
> The "NOTES" section seemed like a better place.

looking at other pages, argument behavior is in the DESCRIPTION rather than=
=20
NOTES, including discussion of undefined behavior.  keeping it higher up is=
=20
probably better too since NOTES tends to get lost by readers while DESCRIPT=
ION=20
is absorbed most frequently.
=2Dmike

--nextPart4731191.DKAN2VRUiF
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRDN3mAAoJEEFjO5/oN/WBOt4P/iP7/QzXkUDOUC1uB2BUefrM
uq0V+uIBj7/ZmEbQmq6fizNjYPd+WaMATU8VhxvPuqFQPjT8IfDgMCq36rWBOexP
t4tmDoiGW6kr7zEzt4GlpEwqpSSwqMChi9L5kO/5CtwKhi0BkCQBj3zDS4Vyo58C
IJdCE+Rr/iQVflsxEVD1kWZeB3XaMGPHkY6XSjsYflcOf3nWEOQcQvPArxk6sJ2x
UVDS9suY3QkX2CGelAO74nTyU2RHw5bg9xBnU+9AGoTfluUeSu05yd2mW3BQmwK2
QNu/x2xS2+O2LVipQPb2RWc4/7GChMcSX957AO3cli4zEuDte4krkR2g4vj8WndM
PuIGonOCnPLB0JxoNeBADQD4/+7RJxc1AenPPdN1JyALtsewulxRR3yx4dxVCAyq
6rtuSBXvIzDjmC08/kuDNtfWamZsUaz8vgOzU8z2+ESx1uyQu8piPP1lr2uSZjUa
LHozPz3V6XVYtsJgZKtM2f1fRm4N5CQ3Qe5erF8i7BOUh0q7InVi77OD3UnX6Ch8
N1MC0TXCZLbeiYCljQfWYfVvOIGH7374Pwj+8WeTQw1meaPFulhL3n7vdvYKvPEd
0ELsgn224FLeql02UDJwU0ramR1du03ql81S2SXe74y2WDOJYJZqGP/51ZaSDVyM
TfBHEfmYKPKoPagNPQa+
=1K+C
-----END PGP SIGNATURE-----

--nextPart4731191.DKAN2VRUiF--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
