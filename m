From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: Beginnings of a style guide
Date: Sun, 5 Jan 2014 15:17:09 -0500
Message-ID: <201401051517.10600.vapier@gentoo.org>
References: <52C626BC.8040206@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart14952612.HFFgDgcPRB";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52C626BC.8040206-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--nextPart14952612.HFFgDgcPRB
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday 02 January 2014 21:55:56 Michael Kerrisk (man-pages) wrote:
> .SH STYLE GUIDE
> The following subsections represent the beginnings of a style guide
> for the
> .IR "man-pages"
> project.

these are the kind of time based sentences that hang around for years ;)

how about:
	The following subsections describe the preferred style for the
	.IR "man-pages"
	project.

also, is that quoting really necessary ?  and should the - be escaped ?  yo=
u=20
don't do it below, and the style guide seems to indicate you should :)

> For details not covered below, the Chicago Manual of Style
> is usually a good source.

would also add a suggestion of grepping around for pre-existing usage in th=
e=20
tree.

> .SS Use of gender-neutral language
> As far as possible, use gender-neutral language in the text of man
> page.

page->pages ?

> Use of "they" ("them", "themself", "their") as a gender-neutral singular
> pronoun is acceptable for pages in the
> .IR man-pages
> project.

do we really need to mention the man-pages project again ?  seems superfluo=
us=20
here.

> .SS Font conventions
> .PP
> For functions, the arguments are always specified using italics,
> .IR "even in the SYNOPSIS section" ,
> where the rest of the function is specified in bold:

where->while ?

> .PP
> .BI "    int myfunction(int " argc ", char **" argv );
> .PP
> Variable names should, like argument names, be specified in italics.

add a .PP for casts ?

how about discussing spacing ?  none before the argument list, but there=20
should be one between a cast and the casted object.

> .PP
> Filenames (whether pathnames, or references to files in the
> .I /usr/include
> directory)
> are always in italics (e.g.,
> .IR <stdio.h> ),
> except in the SYNOPSIS section, where included files are in bold (e.g.,
> .BR "#include <stdio.h>" ).
> When referring to a standard include file under
> .IR /usr/include ,
> specify the header file surrounded by angle brackets,
> in the usual C way (e.g.,
> .IR <stdio.h> ).

i wonder if we should say something like "a standard library include" rathe=
r=20
than explicitly listing "/usr/include".  after all, some headers are provid=
ed=20
by the C compiler (and likely won't be in /usr/include), and that path isn'=
t=20
applicable when talking about cross-compilers or user-based installs, or ot=
her=20
not-quite-as-funky setups.  we could retain one mention of /usr/include in =
an=20
aside like "(e.g. headers in /usr/include)".

> .PP
> Complete commands should, if long,
> be written as an indented line on their own, for example
> .in +4n
> .nf
>=20
> man 7 man-pages
>=20
> .fi
> .in

should also mention that there should be a blank line before/after it. =20
otherwise, this code would pass the guide:

Complete commands ...
=2Ebr
	man 7 man-pages

> .PP
> Any reference to the subject of the current manual page
> should be written with the name in bold.
> If the subject is a function (i.e., this is a Section 2 or 3 page),
> then the name should be followed by a pair of parentheses
> in Roman (normal) font.

is "Roman" really necessary here ?  it's not like changing fonts is even=20
feasible in man pages.

> American English tends to use the forms "backward" "upward", 'toward",

there's a stray single quote before the toward rather than double quote

> .SS Capitalization
> In subsection ("SS") headings,
> capitalize the first word in the heading, but otherwise use lower case,
> except where English usage (e.g., proper nouns) or programming
> language requirements (e.g., identifier names) dictate otherwise.

might be useful to include an example here

> .SS Preferred terms

how about:
	32-bit	32bit	Also applies to 64-bit/128-bit/etc...
	filesystem	file system, fs

> The following table lists some preferred terms to use in man pages,
> mainly to ensure consistency across pages.

the run time/user space/etc... items could do with a note pointing to the=20
hyphenation section below

> .SS NULL, NUL, null pointer, and null character

would be nice to have a sentence on the preferred wording when talking abou=
t=20
an empty C string (i.e. "").

> .SS Use of e.g., i.e., etc., a.k.a., and similar

how about also discouraging use of lists like "this/that/other/etc..." in=20
favor of "this, that, other, and so on"

> .SS Em-dashes
> The way to write an em-dash (\(em) in *roff is with the macro "\\(em".
> Em-dashes should be written
> .I without
> surrounding spaces.

would be nice to add an example of what this is replacing as not everyone=20
knows what an "em dash" is.

> .SS Example programs and shell sessions
> Manual pages can include example programs demonstrating how to
> use a system call or library function.

can->may
=2Dmike

--nextPart14952612.HFFgDgcPRB
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJSyb3GAAoJEEFjO5/oN/WBvywP/3BUy60x6PrG9HTn7WrNpNFM
aAVrkVyxCXomhqWjtv24+gCic+lvR9UeIueg55ZQ/Poxz2rUfK9MHS36PlSD9GCX
RuxXhNQ38/8LzkujCLLVmK0K0BGqSrf0VKlbXjWQqdEP/Tmw9NpvSYC1rytXCak9
89XdWKkg5CrYZWph08e8524YRwlSfXPrOzNfaVuG1j4wrMzC7lMdFXB9+VCAL2IE
yWQrKX3YMMWS0AEx3jHo7cB5KpiPPdiH/o8bHAluJEyjdqma5/yhrRPGzSf06Tgb
hVXo9rYZfl6zOAq+RPbVOaW/snI0+X4JmOvIaFzAtvfl6htikajk+LBq+kV7iXCX
GjhRa+1/uH/6XQaYsXPGBkqIp8xbJoeCKr/EIT995K4EGdsdygCykbTezvNtp4QH
UFv4AWX4W5gLzhdu1BXz+vF+ytxOmJ2aPPVQXxglRRbfDQMXeJLoLKNkizTAJQEJ
05oarNkbn8IdfzPEqAZlAJeuLyKC7ptkaLZSIqXr3pFlewWqvL5bNipVbtq3SBgL
NJVJBVTu7Re6wnujKbPrHcRMntIMzEgDZEDTx7PghtOCCatd4QuIf801NtY0B+Ii
/p1HUoROaOntCWDJf+j6MhfGC70w6ohOSwFV68ywumWoAN66WyC0Mz5UcyLvnwnn
Be/Z5a95lByRChcXi/th
=LMnm
-----END PGP SIGNATURE-----

--nextPart14952612.HFFgDgcPRB--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
