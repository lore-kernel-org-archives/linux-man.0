From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: The time(2) man page conflicts with glibc
Date: Tue, 15 Dec 2015 13:38:26 -0500
Message-ID: <20151215183826.GY11489@vapier.lan>
References: <CAMe9rOoJLk8VzyJKmkOvbmBxhCj4mVA2huYtHJsdxpatbkgJ1g@mail.gmail.com>
 <CAKCAbMj-X+wLKX3=MDm9z3L9zyikemxCNggu2bfw6=o6K5PGgg@mail.gmail.com>
 <20151215145517.GR11489@vapier.lan>
 <CAKCAbMh2ysZPQe3oOSjcPsx1_pcnCAQ6yf+gMbv6iDmvfnGXZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0MoqnzNJK6dBR8Pl"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKCAbMh2ysZPQe3oOSjcPsx1_pcnCAQ6yf+gMbv6iDmvfnGXZA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>
Cc: "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--0MoqnzNJK6dBR8Pl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 15 Dec 2015 10:19, Zack Weinberg wrote:
> On Tue, Dec 15, 2015 at 9:55 AM, Mike Frysinger wrote:
> > On 15 Dec 2015 09:14, Zack Weinberg wrote:
> >> Given the extreme obsolescence of the argument to `time`, I would
> >> recommend that the *kernel* be changed to fire an actual SIGSEGV
> >> instead of returning -EFAULT from the syscall version of `time`, and
> >> then that can be the documented behavior, with the historic behavior
> >> relegated to the BUGS section of the manpage.
> >
> > meh.  it would be out of character for the kernel to do this.
>=20
> Why?

because it returns EFAULT for other syscalls when you pass bad pointers.
projects like LTP utilize that to verify edge case functionality.
-mike

--0MoqnzNJK6dBR8Pl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWcF4hAAoJEEFjO5/oN/WBNBAP/2p7t3fOoSPUdlTT4KxTP+Up
T1d8SA6Xo5ag1D7KcfMEuHqhrJI4AqPMk1Yc/WMrgkyZr+qQXvBbr88qDyFWBPGV
ZJ9IOLOAiEZ/RlQZeH+UX+epe3Pc+XN+8IP51+2nUUeVR3bbKMcm63ZKwXYK0q6v
LowHQlEa6/NbExTYOU0yC/eqwMphSfH+ZWXfbPv+kFtdhvz5YKIqej6vYq4Yi7SU
rRI2VXd/4N8Yn8j/xzX3JdmQ3QOi+X0rfKIrd8v943AqgYcqkE9kCoU0CYAtlYzI
JwK2oIytwdgg44pXMZ7O6y6gEJjXsTGOYczy9a3R8/+qg+RlI6N09ZzDHCBVdxho
r+U3F9YuaTbAE+MGs+luc+36W3yOXum5wSR4TbOc5+y/NR/BIz77mloXBCT6ogRW
WyHdBovCxVF+8cdwH+38VC1CD/na9R+/6nPS0UFQ1HYUUrUzC4WAgZmNfnkAAZEm
L8HV21h9NIQP1zevgPVeaPsFHdzaSSOfnf8fJGPKhC2I4IR6aKomli8o4ZGbh5Du
IdfbxKrevw+Bl34WrOIv2Gy2f7Tjjed/pU36EeVgWSrP6zGJW9aQ8PLMBrc3QODz
PNWTaEbbqE0SHF0uJnBzJ0i6IOAx1pCZ1HbA+SWaLS6Jk2CBu7+na1HOac0qlCgX
y1R4wn9u60goDJzSJpiv
=tq9y
-----END PGP SIGNATURE-----

--0MoqnzNJK6dBR8Pl--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
