From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] elf(5): document notes
Date: Sat, 26 Nov 2016 19:32:25 -0800
Message-ID: <20161127033225.GU21655@vapier.lan>
References: <20161117205939.2295-1-vapier@gentoo.org>
 <2dbf5664-524e-9411-16f4-2a84e6395c82@gmail.com>
 <20161118182547.GY21655@vapier.lan>
 <CAKgNAkgqWayEyq5iej=+2y+uyD9BsLNDNHhAC539L955aet56w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="T3szOYASPyCoAfS0"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkgqWayEyq5iej=+2y+uyD9BsLNDNHhAC539L955aet56w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--T3szOYASPyCoAfS0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 19 Nov 2016 11:13, Michael Kerrisk (man-pages) wrote:
> On 18 November 2016 at 19:25, Mike Frysinger wrote:
> > On 18 Nov 2016 08:25, Michael Kerrisk (man-pages) wrote:
> >> On 11/17/2016 09:59 PM, Mike Frysinger wrote:
> >> > for documenting the Elf{32,64}_Nhdr structure,
> >> > the sections/segments that contain notes, and how to interpret them.=
  I've
> >> > been lazy and only included the GNU extensions here,
> >>
> >> Any chance you include the non-GNU stuff also? Or, failing that,
> >> some clear statements at appropriate points about what is not
> >> documented.
> >
> > the trouble i was running into is that the man pages says it documents
> > the elf.h header, but the one installed by glibc doesn't have defines
> > for all the non-GNU stuff.  so if i put in details about the FreeBSD
> > namespace, it'll have defines like NT_FREEBSD_THRMISC.  none of those
> > show up in the current elf.h though so people will get errors.
> >
> > i'm fine with that though if you are.
>=20
> Actually, it sounds like your original approach is best then.

i'll send some patches to glibc and see if i can't get the defines merged.
if so, i'll update the man page.
-mike

--T3szOYASPyCoAfS0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYOlPJAAoJEEFjO5/oN/WB3foP/2lmH5qBAYK0Wiq8mClOJtQb
EmtoiN3Z04Tv9rUNplPiYGEkReG+aoFtapgLHu95rFTJzJ0gATea9n1g6BudJGkE
eEiW5x2jo7Q/lb00/MJwlB+pcES7AnRvr0aN4clS9XqbWzxEV7O/RfpBJ68j8s/Q
WWWIS6vomy3o7oe3tR4xm+0N9XOE2jq69IFkeoKWGePD14VgpCG8S/mCs/5uzYP3
8q/zBdRvyelIyknCFjSj0tpr5oV5KTzzcvtnlobUzGLgYsweIVBYFs77xcfrqnsp
Y1bsliNetLX4++7vt463JRsKCG58AVgLjb6Da2PbzL574DFJFqhCjbQ1iJjYHSWG
uDnLZwGi/VCErBoEtQt+dzKeT453NbGc4if4HU1bdUeIA8ldBvEwgE61im94dgzy
ktulj2i4znezDRoTWa9c9maSJ5HFLMAA8q1pjj5sK8aXD1JanKTzi9PlMprInn2h
DJswuzltZ2lEwUhc/Z++e0jM+8sXS0qKdhMsKjGQ+DHakvqdIbxQrHwz8q31LlVv
qpqG+TmCWV8J9zpPKFy3nKlSYO8r8CvMCRedZP8lBYyIeFHWMcgdUgeSNjrVrCaF
hsIG0HrpCRPudG7Jdeh4GFl2w7m0V8Y/1h70HXQuHT1dGW4IfUadJK/ScRopoaA5
hkYaCoLy31LYXl49sWM1
=0kNm
-----END PGP SIGNATURE-----

--T3szOYASPyCoAfS0--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
