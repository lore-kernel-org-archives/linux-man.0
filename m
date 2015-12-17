From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: The time(2) man page conflicts with glibc
Date: Wed, 16 Dec 2015 22:15:34 -0500
Message-ID: <20151217031534.GT11489@vapier.lan>
References: <CAMe9rOoJLk8VzyJKmkOvbmBxhCj4mVA2huYtHJsdxpatbkgJ1g@mail.gmail.com>
 <CAKCAbMj-X+wLKX3=MDm9z3L9zyikemxCNggu2bfw6=o6K5PGgg@mail.gmail.com>
 <20151215145517.GR11489@vapier.lan>
 <CAKCAbMh2ysZPQe3oOSjcPsx1_pcnCAQ6yf+gMbv6iDmvfnGXZA@mail.gmail.com>
 <20151215183826.GY11489@vapier.lan>
 <20151216070839.GE238@brightrain.aerifal.cx>
 <20151216203432.GR11489@vapier.lan>
 <20151216215955.GJ238@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="txKhKDJbfcBhMZzA"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151216215955.GJ238-C3MtFaGISjmo6RMmaWD+6Sb1p8zYI1N1@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Cc: Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>, "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--txKhKDJbfcBhMZzA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 16 Dec 2015 16:59, Rich Felker wrote:
> On Wed, Dec 16, 2015 at 03:34:32PM -0500, Mike Frysinger wrote:
> > On 16 Dec 2015 02:08, Rich Felker wrote:
> > > On Tue, Dec 15, 2015 at 01:38:26PM -0500, Mike Frysinger wrote:
> > > > On 15 Dec 2015 10:19, Zack Weinberg wrote:
> > > > > On Tue, Dec 15, 2015 at 9:55 AM, Mike Frysinger wrote:
> > > > > > On 15 Dec 2015 09:14, Zack Weinberg wrote:
> > > > > >> Given the extreme obsolescence of the argument to `time`, I wo=
uld
> > > > > >> recommend that the *kernel* be changed to fire an actual SIGSE=
GV
> > > > > >> instead of returning -EFAULT from the syscall version of `time=
`, and
> > > > > >> then that can be the documented behavior, with the historic be=
havior
> > > > > >> relegated to the BUGS section of the manpage.
> > > > > >
> > > > > > meh.  it would be out of character for the kernel to do this.
> > > > >=20
> > > > > Why?
> > > >=20
> > > > because it returns EFAULT for other syscalls when you pass bad poin=
ters.
> > > > projects like LTP utilize that to verify edge case functionality.
> > >=20
> > > Programs could also be calling the syscall directly (using syscall()
> > > or asm) and using it as a (very cheap, fail-safe) way to verify that
> > > an address is writable before attempting to write to it. Breaking this
> > > would be a kernel API regression. However the library function time()
> > > has UB for invalid pointers and no obligation to support them.
> >=20
> > sure, but that still doesn't mean the kernel should be sending SEGV.
> > which is what this subthread was about.
>=20
> The kernel is not causing SIGSEGV as far as I can tell; it's purely
> the library function time that's causing this.

i'm fully aware of that.  please see the context in this subthread.
i've already trimmed all unrelated content.
-mike

--txKhKDJbfcBhMZzA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWcijRAAoJEEFjO5/oN/WB3rgQAJkQgtiI1GTzjkCQQ/YTMyfB
4hlj3vmf8ghTmGhFf95FuZZTMmgsoWcoQBjIka5OVbbrkzk/UEOxBXy4JKa05mWK
Tpl6Wdw7KSSz4a4EdzXDsF8Swh0W5mnQqclQifgjUM2l+Hc5DQVqzQCd1PkeTe4b
Dd3iC27u8Whf+q9VokrGySnDSdL8GySHziW5azd79YC44Mal29v7aXp0O9SeuWB8
MLzZ1wu5TMbXGjB1XkxiV1hxNH/z9JDkfCjoD+ywK0QCScEMzotwEqMYldxoziTN
/vbnQN2lWEgZJLnTyVBq5eWSNUQlvsgx6oKF4XxDa++5fU+ObKioqqmsLzP+xK8X
VfIkoCtqUVqN+HJyA9SxJ/gNMZZU/WZSveWu4a8PQTFeF9hghUsGmGlFwVo9mrwB
9DVI8ay+G96/Ytrdwvq07f2b/Zr0/iVcrugforwPObFwCw9x2qZgj5N1ruHEi8mW
Tfxtez/wHK9bpGAGmpyRXQV4GzutS2FceI9Mc9uIaFSeKFck6ICyIyAxWa54SXbI
kMHwVJXUE5crHHR3/2334dl4Ir8aqKHBoHZw0jR+VQXOeqMY3sWYUEFUNjkjGTJY
Hawwi5aG8SwOVP2VGx15v+Awq0H3u2KVpMyWuQ0nGOpRwo1yL3vMvsYkAZga5i5E
XEdCRY2nB1isi4ooTHn6
=ENly
-----END PGP SIGNATURE-----

--txKhKDJbfcBhMZzA--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
