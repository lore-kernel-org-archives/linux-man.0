From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] man2 : syscall.2 : document syscall calling conventions
Date: Sun, 7 Apr 2013 14:43:07 -0400
Message-ID: <201304071443.08504.vapier@gentoo.org>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com> <201304021917.17659.vapier@gentoo.org> <CAKgNAkgODPSWSeA8ZymiAjFBqSAZQMtQe9GW84Y6QHdFEc9S-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2591267.0IYHagftQk";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgODPSWSeA8ZymiAjFBqSAZQMtQe9GW84Y6QHdFEc9S-w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--nextPart2591267.0IYHagftQk
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sunday 07 April 2013 06:00:50 Michael Kerrisk (man-pages) wrote:
> On Wed, Apr 3, 2013 at 1:17 AM, Mike Frysinger wrote:
> > On Tuesday 02 April 2013 02:54:39 Michael Kerrisk (man-pages) wrote:
> >> On Mon, Apr 1, 2013 at 12:32 PM, Mike Frysinger wrote:
> >> > On Monday 01 April 2013 05:29:11 Michael Kerrisk (man-pages) wrote:
> >> >> On Mon, Apr 1, 2013 at 10:29 AM, Mike Frysinger wrote:
> >> >> > on a related topic, would it be useful to document the exact
> >> >> > calling convention for architecture system calls ?  from time to
> >> >> > time, i need to reference this, and i inevitably turn to a variety
> >> >> > of sources to dig up the answer (the kernel itself, or strace, or
> >> >> > qemu, or glibc, or uClibc, or lss, or other random places).  i
> >> >> > would find it handy to have all of these in a single location.
> >> >>=20
> >> >> Sounds like it would be useful to have that documented. Would you
> >> >> have a chance to write patches for that?
> >> >=20
> >> > should we do it in syscall(2) ?  or a dedicated man page ?
> >>=20
> >> It's a little hard to say until I see the shape of what comes. Can you
> >> provide a rough per-syscall example or two of what you expect to
> >> document? (Don't write too concrete a patch yet, until I can get a
> >> handle on what you intend.)
> >=20
> > this renders nicely i think.  it shows most of the stuff i'm interested
> > in. might be useful to add a dedicated section covering the clobbers in
> > the future.
>=20
> Thanks for that. It looks good to me, and I have applied. But it
> renders too wide (wherever possible, I try to ensure that everything
> renders inside 80 columns), so I have split into tables, one with
> "instruction, NR, ret" and another with the arguments (arg1 to arg7).
>=20
> Now, just to make 100% sure of your intention, the NR column would be
> better named "syscall #" (or similar), right? (I've made that change.)

i called it "nr" because that's the common convention (__NR_xxx/etc...) in=
=20
code bases, and because it does a nice job of not pushing the table too wid=
e.

if you've split up the table though, that should no longer be a problem.

> > --- a/man2/syscall.2
> > +++ b/man2/syscall.2
> > @@ -79,6 +79,35 @@ and an error code is stored in
> >  .BR syscall ()
> >  first appeared in
> >  4BSD.
> > +.SS Architecture calling conventions
> > +Every architecture has its own way of invoking & passing arguments to
> > the +kernel.
> > +Note that the instruction listed below might not be the fastest or best
> > way to +transition to the kernel, so you might have to refer to the
> > VDSO.
>=20
> Mike, any chance that I could interest you in writing a vdso(7) man
> page? I've felt the lack of such a page for a while (it need not be
> too long), but am not deep enough into the details to write it easily
> (I am not sure if you are).

i might take a stab at it.  it's annoying to constantly have to refer to th=
e=20
kernel source when looking something up.

in order to be useful, i think there will have to be arch-specific sections=
=20
which document the funcs each port provides.
=2Dmike

--nextPart2591267.0IYHagftQk
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRYb48AAoJEEFjO5/oN/WBUUYP/31BPZgset6cX6eOqXn6RPry
mux8979VsOJIcTYl607afAy6/o1o0EKoNVALJONbcRG5aN4OorveOfErtQ0PO3Ic
r0UHM5bH1j3ShzaUHQ1IAoTnq5Z6jjyyo7kineR7mfxAyQLxQS38V+hk2PoWY9nt
LyTn5XHwA5a9/o3Y0Ws7aSqBNhPpWC78YyfxegT75xhggCI7QD6OH9lUKcxX2Jt/
Ds8wnpUtdl+ChYN4lJ15wpOgkl8hE5ou2uQWYQbYkyH4LXT857FjPr7TeREkUEB/
47AWRNTP/y/g2wregmaO/yzPiMsURzm7xE/FCFsDZASphOiTkwray3rjzciQYVZF
i3+U9CxV3SHNIbYcruAAbJcDt7yaY4PZCDLWuK/+OO8AilotAAEWeAJBHwYNYjZ4
icdJfOs38P/JTeWhQyJrM4vetRCdPsCD/HwuJ0OWIgyDOpe4Id9gdh2GNel+6wm6
QR5fQZ7oEE4wpFh6HJHAyi3Gx4sdcRYN2O4UJfCrYGrXIrvprKoyME/5mfk8VU0a
TSmMVsZKLdYOtwT1Cw8oF4Zusbca7iykQTDPlZ2JvUJ4P0+2Emkeq13nwclRWcP2
myD1ByDUsQW9Rnf6r9P0mU/V5bddJqvwEmLSWR/WEAJOWjEpISPZEO7MO0xKbt4f
lgQUjxS2x84MJ6cWD8tE
=Tquj
-----END PGP SIGNATURE-----

--nextPart2591267.0IYHagftQk--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
