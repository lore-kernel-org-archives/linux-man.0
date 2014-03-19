From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: Documenting the kernel-user-space ABI
Date: Wed, 19 Mar 2014 03:41:21 -0400
Message-ID: <2468582.tM5WcKAPFo@vapier>
References: <53285F85.3000807@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1566773.SONe7U1K2y"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53285F85.3000807-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--nextPart1566773.SONe7U1K2y
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Tue 18 Mar 2014 16:00:21 Michael Kerrisk wrote:
> You raised a question at the bottom of a bug report
> (https://bugzilla.kernel.org/show_bug.cgi?id=3D70801#c4)
> that I though might better go to the list, since I
> think it merits some wider discussion:
>=20
>     i'd like to have a master location to document all
>     this stuff at the kernel ABI level.  can we do that
>     with the man-pages project somehow without violating
>     the C library API tenet?
>=20
> First though, I'd like to check: what do you mean by "all this stuff"=
?
> Am I correct to understand your question as something like:
>=20
>     Can man-pages become a place where the kernel-user-space ABI
>     (as distinct from the glibc wrappers on top) is consistently
>     and thoroughly documented?

the linux-man-pages project is great at meeting the needs of the majori=
ty of=20
developers -- those that live in userland with the C library between th=
em and=20
the kernel.

but i think there is not an insignificant number of developers who live=
 at the=20
direct kernel ABI level and do not want to see any C library details at=
 all. =20
like the people who write C libraries, or low level debugging utilities=
 (i.e.=20
anyone who touches ptrace -- gdb, qemu, strace just to name a few), or =
kernel=20
developers themselves, or arch porters (who live in all the aforementio=
ned=20
sections), or test writers (like LTP), or researchers (academic, securi=
ty,=20
etc...), or the stubbornly curious.  i've worn most of these hats at so=
me=20
point in time and have been frustrated way more times than i can rememb=
er=20
after trying to follow the man page for a function only to find out the=
 kernel=20
was slightly different.  doing `man foo` is a lot easier than going int=
o the=20
kernel and tracking down the actual function's source (and then tracing=
 it=20
through all the various subsystems to see how the diff args get treated=
).

basically i want this:
=09http://thread.gmane.org/gmane.linux.kernel.cross-arch/21821
and i want documentation :).

the linux-man-pages project is already filling the critical documentati=
on gap=20
and rather than bootstrap another project, i was hoping we could find s=
ome way=20
to integrate.  i understand the perfectly reasonable desire to not have=
 to=20
maintain multiple man pages that cover a lot of the same content (upwar=
ds of=20
90%) when the functions are pretty one-to-one in flags/behavior (like t=
he=20
openat() syscall and the openat() C library function).  so maybe we nee=
d a=20
technical solution to be able to split off the kernel-specific bits ?
=2Dmike
--nextPart1566773.SONe7U1K2y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABAgAGBQJTKUohAAoJEEFjO5/oN/WBqgEP/1samuxE8SSqdUtgUxeOUzYH
GgIJCkpn76k/PcGAtJvUYA9UDhFcaQAzOF/S3A1kjbJXNeNhUT7DwkHNrWd7+A1w
w7qWM4CS9oEC4DtZTnLyzQiJx8Vaz1iMXR8HvBkdpJBaKF8FwevbPBZOWU/oy5j6
J1w9DuD5RpN2BTIVO4SVw5i5Zyk4n9HD+gMp1NCzlBaCWNdZHyyDOtPFr1zpxg6x
aecEhSI9kftuYVScUlZpiGVUcb81Ceh8lS9t1TV9Xf9rMxiEzYvMVWFGG49mLdYw
WOEy+fTzOrHm4iXVRTnd+9t8IAEUCxdbRbllK9uiic3f2FNLMn6XlZZ4fNZV3nov
fVHg4o7PlOxod6bTdT2wxbEmgIyucRL/tsv4OaXWMlUg8IWJsuUbNuf+mMv6Z676
WOnhs3tCDfUuM7A7pMEr604DxKnGvQbD45lEVjUEukvFVNa9wdL0+Z+2I4J3vWbV
0tLTJxYsA5tK0EexZG6jTYqJEkN4AanIF0fLwZqnGOrS6VS323grGPs9OsDEJtZt
GxCW1h68d+NvnrzjIxvkBnaUts/yp1LnTCJzmduB6hIpj2fKYOUDvkksCvoc920H
E9u3ISNLg51B/1reD16Eq6ehO/tBc0ud4Mze/2Fr+Y3hQKLtDgELDyl9ojfWhvZh
76ym+wURl8euwL4tK055
=QnVt
-----END PGP SIGNATURE-----

--nextPart1566773.SONe7U1K2y--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
