From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: The time(2) man page conflicts with glibc
Date: Wed, 16 Dec 2015 15:34:32 -0500
Message-ID: <20151216203432.GR11489@vapier.lan>
References: <CAMe9rOoJLk8VzyJKmkOvbmBxhCj4mVA2huYtHJsdxpatbkgJ1g@mail.gmail.com>
 <CAKCAbMj-X+wLKX3=MDm9z3L9zyikemxCNggu2bfw6=o6K5PGgg@mail.gmail.com>
 <20151215145517.GR11489@vapier.lan>
 <CAKCAbMh2ysZPQe3oOSjcPsx1_pcnCAQ6yf+gMbv6iDmvfnGXZA@mail.gmail.com>
 <20151215183826.GY11489@vapier.lan>
 <20151216070839.GE238@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u/BH/w+/n8IGbYqX"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151216070839.GE238-C3MtFaGISjmo6RMmaWD+6Sb1p8zYI1N1@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Cc: Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>, "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--u/BH/w+/n8IGbYqX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 16 Dec 2015 02:08, Rich Felker wrote:
> On Tue, Dec 15, 2015 at 01:38:26PM -0500, Mike Frysinger wrote:
> > On 15 Dec 2015 10:19, Zack Weinberg wrote:
> > > On Tue, Dec 15, 2015 at 9:55 AM, Mike Frysinger wrote:
> > > > On 15 Dec 2015 09:14, Zack Weinberg wrote:
> > > >> Given the extreme obsolescence of the argument to `time`, I would
> > > >> recommend that the *kernel* be changed to fire an actual SIGSEGV
> > > >> instead of returning -EFAULT from the syscall version of `time`, a=
nd
> > > >> then that can be the documented behavior, with the historic behavi=
or
> > > >> relegated to the BUGS section of the manpage.
> > > >
> > > > meh.  it would be out of character for the kernel to do this.
> > >=20
> > > Why?
> >=20
> > because it returns EFAULT for other syscalls when you pass bad pointers.
> > projects like LTP utilize that to verify edge case functionality.
>=20
> Programs could also be calling the syscall directly (using syscall()
> or asm) and using it as a (very cheap, fail-safe) way to verify that
> an address is writable before attempting to write to it. Breaking this
> would be a kernel API regression. However the library function time()
> has UB for invalid pointers and no obligation to support them.

sure, but that still doesn't mean the kernel should be sending SEGV.
which is what this subthread was about.
-mike

--u/BH/w+/n8IGbYqX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWccrXAAoJEEFjO5/oN/WBMqIQAIESUazJvDC9723Dr69cCI3C
cRqDs1Xx2ByzNMyL5EKANMpv/fBuZW1hGAdopjTyYgTyNnIDiRXbEPq8krANikiM
LpS8VQuKyqGijuR5/lQ9Fv2qidZruGH5H1q2UT7obwSt8Ku8eqiTSaVb2JqIf90B
jlHKDl4Vz/W3HLTuSV5q6s4rzp36WVzMwdOzxCh1a0zLgy+a3nkDofNbAShDujg7
tRM30ZG7bQYakUVCkEWuQY6qLNJjusv7kEpqHoHMJq7hAhM9ASgY/8w7yPfBmsYZ
bWXnwgczYs2ZnA3/sJjvtsEdDH5klN8KgbBJzu077p0A7FI9nZfQrjPTDqIl1mkQ
4eAsgLB2GjiC8mglbka0rGenTtid6aGjRIN7l8FWuDFzR9xh8/qK0kExxrITAup6
/Ns5qi2Z+i4T+exvTKMcgJTCgJpa/tF1y18kt0aYbNUiqvuMq8s1xuFZwfotm92l
uIKlniOAPptcvfd8NaNn0x2vK7md/mGshyBHOnmUCWIGn47NhijCJNRYGbTy4ITg
SG36hy4YwyTsAdTE8Q1tBJTayQIV0k+96FHZT6aLcXpR/ncFOvrwiBQoSnF4UGhB
9G7BYKF6yzW85E5yd+nLl6YO3rH17YikxBjks9PHOOychSAAaXSxGhjNuB16fPFP
GqbjxHI3YTIIzUlDAGZV
=WNmO
-----END PGP SIGNATURE-----

--u/BH/w+/n8IGbYqX--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
