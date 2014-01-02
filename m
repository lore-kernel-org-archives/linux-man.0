From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: "Writing" instead of "Warning" in dlopen(3) manpage
Date: Wed, 1 Jan 2014 23:06:39 -0500
Message-ID: <201401012306.40108.vapier@gentoo.org>
References: <20131231124209.GA4814@darkstar> <201312311119.55754.vapier@gentoo.org> <52C4C513.7020509@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2886715.zMZvoNq58h";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52C4C513.7020509-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: noname-CuI0ZDT4mYnsrOwW+9ziJQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart2886715.zMZvoNq58h
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wednesday 01 January 2014 20:46:59 Michael Kerrisk (man-pages) wrote:
> --- a/man3/dlopen.3
> +++ b/man3/dlopen.3
>=20
> /* According to the C99 standard, casting 'void *' to a function pointer
> as shown above is forbidden. POSIX.1-2003 and POSIX.2008 followed
> C99's requirement, and proposed the following workaround:

i don't want to be pedantic, buuuuut:
 - you want to say "ISO C" rather than "C99"
 - the spec says that it is "undefined behavior" rather than "forbidden"

i wonder about deleting the "followed C99's requirement" part.  they aren't=
=20
really following the requirement since (at least 2008) says that it must be=
=20
supported.

the "POSIX.2008" probably should be "POSIX.1-2008".  or maybe just change i=
t=20
to "POSIX.1" ?

> +           *(void **) (&cosine) =3D dlsym(handle, "cos");
> +
> +       This (clumsy) cast conforms with C99 and will avoid any compiler
> +       warnings.

might it be worth suggesting a union too ?
	double (*cosine)(double);
	union {
		void *vptr;
		double (*ptr)(double);
	} cast;
	cast.vptr =3D dlsym(...);
	cosine =3D cast.double;

i think this also avoids aliasing warnings and works nicely in C++ ?  or i=
=20
could be making this up entirely :).

> The 2013 Technical Corrigendum to POSIX.1-2008 (a.k.a. POSIX.1-2013)
> improved matters by requiring that conforming implementations support
> casting 'void *' to a function pointer.

how about adding a comment inside of the man page itself linking to the POS=
IX=20
pages ?  making it visible to end users might be too much, but for people=20
maintaining the comments (i.e. you) would be good.
http://pubs.opengroup.org/onlinepubs/009695399/functions/dlsym.html#tag_03_=
112_08
http://pubs.opengroup.org/onlinepubs/9699919799/functions/dlsym.html#tag_16=
_96_07

> Nevertheless, some compilers
> (e.g., gcc with the '-pedantic' option) may complain about the cast
> used in this program. */

three things:
 - i think the ISO C standard is required to at least emit a warning
 - i was going to suggest the -pedantic thing :)
 - seriously, you're using "e.g." after chastising me ? :D
=2Dmike

--nextPart2886715.zMZvoNq58h
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJSxOXQAAoJEEFjO5/oN/WB/nIP/1/OVu24gsBPI4iTuaXJ6SEt
WenFGcQMBUQrznxtNNQdukn6cn6pAxH3S+aCDY91Kb7scF4VcfFhwvD4W4ZqEdx+
pR1BMbffWCW0QW2aNIzDWeiJORlAOFDHt+EwjgecOPppTViMaXDYtZkrr/AJlNX/
GW1nzC+Y6t9cYkbPq2qKP9Q6i98wPhjQ/5DxCgr3gETYm9EM6q9NELuKYtWg0t2T
BSKEoRtvkNrTsOXp7g9uSF4qDeDGo+oUh3/zspHVXuIgQ844ZZ0qg5ijDkUMbuUu
0QjrjXALVArh06kdYMNFZZ6M7vGTo/dQgRrdjOSCOqQKJJtge0dpsSLGScPGUMrB
sZbuidQ5aGXU5OgK08BtS+bJh+MxvjwaZADVVqG6aqenWwNjZEs3J8iXwHBXL5vr
fJYD34oxAC4hVJtiD/2KJfSPQ+/no5RX0Mgq50VTqwwP+cGBrKOd6N5o1hP3ot8Z
zwcGH1RkVJMTTHGyfihcgptydcS8hDopN7O0MQn1nHKKyFQu0k2OSWa2M90okffz
ACAxUUKJJIQMyw8ZaF5IDZG7zZvhWXWjbi/PdrElkbQBzxCkSSwZIlQi8hZob2fF
ShWKfhE+TFlKPAMcQzihJhgseCMFf0GfahpGsutxXb4mZNS9g76P9OijYXg/XLzz
ORC3wzmHcMW4KFiwf2LG
=Y3Oy
-----END PGP SIGNATURE-----

--nextPart2886715.zMZvoNq58h--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
