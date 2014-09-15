From: Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] getgrent.3: Add ENOENT to error list.
Date: Mon, 15 Sep 2014 06:34:52 +0530
Message-ID: <20140915010452.GA6586@spoyarek.pnq.redhat.com>
References: <54105ED1.5020206@redhat.com>
 <20140910145307.GC14885@spoyarek.pnq.redhat.com>
 <541082E0.8050707@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <541082E0.8050707-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Simo Sorce <ssorce-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jakub Hrozek <jhrozek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2014 at 12:57:04PM -0400, Carlos O'Donell wrote:
> At present glibc will return a NULL `struct group*' and errno set to
> ENOENT if the NSS plugin returns NSS_STATUS_UNAVAIL and errno ENOENT
> indicating it is incorrectly configured. This is a documented entry
> in the glibc manual, and is presently how SSSD behaves (until it
> gets fixed).

Yes but the entry in the libc manual documents the interface between
the plugin and glibc, not the plugin and the user or glibc and the
user.

> Wether we like it or not there is a present day distinction between
> "permanently unavailable until an admin fixes it" (NSS_STATUS_UNAVAIL,ENO=
ENT),
> "temporarily unavailable" (NSS_STATUS_TRYAGAIN,EAGAIN), and the former
> may be seen by the user, and may be useful to act upon by a program
> that is interested in that behaviour. I do not think glibc should hide
> NSS_STATUS_TRYAGAIN from the user.
>=20
> To be clear ENOENT is neccessary if you want to actually detect that
> something is wrong with your system and take evasive action. Simply
> getting back no results is not sufficient to take corrective action.
> In the case of sss however the intent of the inactive plugin is to
> operate as if it had no data. At least this is what I've been told by
> those working on SSSD at Red Hat.
>=20
> SSSD should *not* use status=3D=3DNSS_STATUS_TRYAGAIN and errno=3D=3DEAGA=
IN
> because that will simply result in EAGAIN being returned to userspace
> from getgrent which is again a deviation from the entire philosophy
> behind SSSD wanting `sss` in nsswitch.conf. The point is to appear
> as a transparent plugin that is enabled at a later time by starting
> up the daemon.

This seems to me to be a case for the nss subsystem to clear errno if
it does not.  I'd read the errno list as the number of ways it is
allowed to fail extraordinarily and a resource not being available is
currently not considered as an extraordinary failure by POSIX.  So in
that context it is a bug in the nss subsystem.

My point is that we'll be deviating from the standard by supporting an
extra way to fail and maybe we should get some kind of clarification
=66rom the Austin group before simply documenting it as the truth.

Siddhesh

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUFjs0AAoJEHnEPfvxzyGHbfIH/iRnNvC8FHAGgxRPgyR3Y/1v
+d+m6HDMzd6GmVHbYxd0nHcHLHGcR/FzW+IS3JTiq7tV2rKD6cKjeN4o1vpnwod6
1ev/IWsElb9Ksc7YDxcOFOHA4jWqvAWTuZLafWFdQjtFm/AylObiFbJi2fH6efb6
jNQZDrV2bekZRWLBRQTcvlaFYnzw32EnaYE7mQaqiTHfkcFFyymLaiQkA9MoiwML
hkufFb2eoDoG7bDJcfh3JQCyMifkL24FINJ/PMXYnM0bIhzJAmjiIG6onqc5oVnB
e0ojD24Mg8yS4oVwCz3vtrj1A4hO+NKR8v7IlAq4AY+7MYnTMswf9K+X+zaRg/g=
=0WPK
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
