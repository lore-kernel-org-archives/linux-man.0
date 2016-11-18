From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] elf(5): document notes
Date: Fri, 18 Nov 2016 10:25:47 -0800
Message-ID: <20161118182547.GY21655@vapier.lan>
References: <20161117205939.2295-1-vapier@gentoo.org>
 <2dbf5664-524e-9411-16f4-2a84e6395c82@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LPpFCDFbLReSU+rX"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2dbf5664-524e-9411-16f4-2a84e6395c82-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--LPpFCDFbLReSU+rX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 18 Nov 2016 08:25, Michael Kerrisk (man-pages) wrote:
> On 11/17/2016 09:59 PM, Mike Frysinger wrote:
> > for documenting the Elf{32,64}_Nhdr structure,
> > the sections/segments that contain notes, and how to interpret them.  I=
've
> > been lazy and only included the GNU extensions here,=20
>=20
> Any chance you include the non-GNU stuff also? Or, failing that,
> some clear statements at appropriate points about what is not=20
> documented.

the trouble i was running into is that the man pages says it documents
the elf.h header, but the one installed by glibc doesn't have defines
for all the non-GNU stuff.  so if i put in details about the FreeBSD
namespace, it'll have defines like NT_FREEBSD_THRMISC.  none of those
show up in the current elf.h though so people will get errors.

i'm fine with that though if you are.

> > +Note sections contain a series of notes (see the structs below).
> > +Each note is followed by the name field (whose length is defined in
> > +\fIn_namesz\fR) and then by the desc field (whose length is defined in
> > +\fIn_descsz\fR).
>=20
> I think this could be a little clearer. I presume that the way things loo=
k is
>=20
>      struct {} Nhdr
>      <name>\0
>      <desc>\0
>=20
> ?

i don't think desc is NUL terminated, but otherwise, yes.

> Maybe shos something like that in the text?

i couldn't find any precedent to copy :).  i didn't want to put it into
the struct def since those fields aren't in the struct, they're implicit
in memory.

how about i put a small snippet of C that'd show how to extract things ?

	void *memory, *name, *desc;
	Elf64_Nhdr *note, *next_note;

	note =3D memory;
	name =3D note->n_namesz =3D=3D 0 ? NULL : memory + sizeof(*note);
	desc =3D note->n_descsz =3D=3D 0 ? NULL : name + note->n_namesz;
	next_note =3D memory + sizeof(*note) + note->n_namesz + note->n_descsz;

> > +Keep in mind that the interpretation of
> > +.I n_type
> > +depends on the namespace defined by the
> > +.I n_namesz
> > +field.
> > +After, of course, whether the ELF image has been determined to be a co=
re.
>=20
> I can't understand that last sentence...

i meant that the namespaces are for non-core files, but i'll double check
that is the case.

i snipped all the comments that i'll integrate so i don't have to just
keep saying "OK" over and over :).
-mike

--LPpFCDFbLReSU+rX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYL0erAAoJEEFjO5/oN/WB+REP/1+s8BMBNjaiexok8x0t/7e/
/lgMuRqbpHymOiaun3hBHD8dECEMo9Cydmuy23kJdmNg2UtUWI1sriM0JrA/urMl
HgBl0hIjyWHxsQDlXJ6bW0VMrMUqpGgbv68zn47Kka4t/UR/RFfpUYm9zajPDJIU
SY1RuZcoxECrQxQiO3s5svMjt0gom5sKMmOiSL5jJPieRXGJ60G+eM6TccZLsfEB
u47XhlYPYXn0uvGXJzJPG95n5S4PFeZdg/OJNQA7WIJXEr1cHkopVAi3rgfVKZY2
REUVt9hTLnXyj9Z+pDgkI7h+Mft1mAM/mfmYeoYvBMlowaTW39q+rTIPY6X5o/CS
1Z/JuZAnAuQYANfBf/tozm9wf+fYoeTV0FIY7EMQV0/sI4WjPb0M0aeY6hlzRGYU
5wqwHa8HkiWntCrx4QDmMhp1h9uBBw3afpZSsFjtIgzELGHcGBe7+T0FuWfkWMzQ
UuVnPzATGCoNJXAq/ZgiwiYgpx8dszLh3gsRy8gJFphPmEnL8gsuiyZec+C01Bbl
5z5MVKATqNMU+/TYyqUrgQxJXAfawEMok8fQvww0zf4NiaIzrXE5mn6WF2eYo/Hd
rR3qFK9+XS99O5YjPDQ8ZTGMZKgD7J+RQEFBXktDFUUROFCQqFkTuu5MS51ovEWS
4Z/wn5k16FPnOxRJUXl1
=UjZ/
-----END PGP SIGNATURE-----

--LPpFCDFbLReSU+rX--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
