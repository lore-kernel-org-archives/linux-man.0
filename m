From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: For review: New locale(1) page
Date: Mon, 10 Mar 2014 16:46:21 -0400
Message-ID: <2209120.2rQ55bWOnb@vapier>
References: <531DBDCF.3070202@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1755293.UjqM2xp70P"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <531DBDCF.3070202-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--nextPart1755293.UjqM2xp70P
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Mon 10 Mar 2014 14:27:43 Michael Kerrisk wrote:
> For each argument, the following is displayed:
> .IP * 3
> For a locale keyword, the value of that keyword to be displayed.
> .IP *
> For a locale category,
> the values of all keywords in that category are displayed.

these bullet points don't seem to be indented.  should they be ?  the=20=

rendering looks not that great ... but maybe it's the standard.

> .BR "\-c" ", " \-\-category\-name"

that last " shouldn't be there

> .BR "\-k" ", " "\-\-keyword\-name"
> For each keyword whose value is being displayed,
> include also the name of that keyword,
> so that the output has the format:
>=20
>     \fIkeyword\fP=3D"\fIvalue\fP"
>=20
> .PP

there's two blank lines after this keyword section.  is the intention f=
or each=20
.PP to have two blank lines precede it in the output ?  this is the onl=
y one,=20
so maybe the other .PP need tweaking ?

> .SH EXAMPLE
> .nf
> $ \fBlocale\fP

this this example discuss which env vars you had set ahead of time ?  s=
eems=20
like you just have LC_ALL=3Den_US.UTF-8 (which is kind of weird ... nor=
mally you=20
only set LANG).

> LANG=3Den_US.UTF\-8
> LC_CTYPE=3D"en_US.UTF\-8"
> LC_NUMERIC=3D"en_US.UTF\-8"
> LC_TIME=3D"en_US.UTF\-8"
> LC_COLLATE=3D"en_US.UTF\-8"
> LC_MONETARY=3D"en_US.UTF\-8"
> LC_MESSAGES=3D"en_US.UTF\-8"
> LC_PAPER=3D"en_US.UTF\-8"
> LC_NAME=3D"en_US.UTF\-8"
> LC_ADDRESS=3D"en_US.UTF\-8"
> LC_TELEPHONE=3D"en_US.UTF\-8"
> LC_MEASUREMENT=3D"en_US.UTF\-8"
> LC_IDENTIFICATION=3D"en_US.UTF\-8"
> LC_ALL=3Den_US.UTF\-8
> $ \fBlocale date_fmt\fP
> %a %b %e %H:%M:%S %Z %Y
> $ \fBlocale \-k date_fmt\fP
> date_fmt=3D"%a %b %e %H:%M:%S %Z %Y"
> $ \fBlocale \-ck date_fmt\fP
> LC_TIME
> date_fmt=3D"%a %b %e %H:%M:%S %Z %Y"
> $ \fBlocale LC_MESSAGES\fP
> ^[yY].*
> ^[nN].*
> Yes
> No
> UTF\-8
> $ \fBlocale \-k LC_MESSAGES\fP
> yesexpr=3D"^[yY].*"
> noexpr=3D"^[nN].*"
> yesstr=3D"Yes"
> nostr=3D"No"
> messages\-codeset=3D"UTF\-8"

i think this section would be a bit more readable if there was a blank =
line=20
before each $ prompt.  relying on the bolding alone seems insufficient.=

=2Dmike
--nextPart1755293.UjqM2xp70P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABAgAGBQJTHiSdAAoJEEFjO5/oN/WB+WcP/ib7RHjlWvxPX3Fp+ZfhYKdj
XwZKoO+BkiOEv106/3aYQMEXNFAZZCpmoaecntB5kyKwT7YQg5xB++oTmv9FbtvR
VnZSmjW3MJFbSl8rsNzmDXw7dXacHoFeqgYqxu5mJjHl7ZhS3dh93+H5R7JLvbfI
LfR9v6EklrmxEM0FYQc2R2B9XjhLasPtgCKtFy95/0cdDxtI8EC5ePp9zM6Xf4Sy
hcbwTgx+al304dDF/snfrt0eq4RFcYB5prLw8kVOeefj20+AfTjEvfYLwFipy/40
5s2n1dnlquYn5fRmNgbXnldWLVZVoLomUJt9XKgElW68GQZLBeYVhIRoBqXy5wnZ
gdQWgdxgIYswpkEm5wqg/hJ4xaRWd8EFjr7gZIhowbOZ7g16v8gYhjXXRNHgBY5n
llvOFEG+yAgJjGIJyGRmWyT3gvBFYJwNqhvmZMaMVw/3T2lr5zHGbexRV5kjezLO
UcgTk4OtSxpkFGk9FpzdSVKx2tCIkkMgGOiLqdvee2bFZSRfkC0uu4Gz19YPZf+7
jM6iobk61ygjpti6l/jMh8IqsVMbVCH3GfJuOfP+hFfTJffpTfhZDTKb7Ot1r264
Q6fbKKu6TzfrEj1DYVH6QevTL9H01zEJo89SMi6KaIoAxUtwxJzvwhH1reGYS13i
LIB7uLi3ngl6JvhJrAH6
=UrST
-----END PGP SIGNATURE-----

--nextPart1755293.UjqM2xp70P--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
