From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: The time(2) man page conflicts with glibc
Date: Tue, 15 Dec 2015 09:55:17 -0500
Message-ID: <20151215145517.GR11489@vapier.lan>
References: <CAMe9rOoJLk8VzyJKmkOvbmBxhCj4mVA2huYtHJsdxpatbkgJ1g@mail.gmail.com>
 <CAKCAbMj-X+wLKX3=MDm9z3L9zyikemxCNggu2bfw6=o6K5PGgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s0AIMtcnAlS2OWxa"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKCAbMj-X+wLKX3=MDm9z3L9zyikemxCNggu2bfw6=o6K5PGgg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>
Cc: "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--s0AIMtcnAlS2OWxa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 15 Dec 2015 09:14, Zack Weinberg wrote:
> Given the extreme obsolescence of the argument to `time`, I would
> recommend that the *kernel* be changed to fire an actual SIGSEGV
> instead of returning -EFAULT from the syscall version of `time`, and
> then that can be the documented behavior, with the historic behavior
> relegated to the BUGS section of the manpage.

meh.  it would be out of character for the kernel to do this.
-mike

--s0AIMtcnAlS2OWxa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWcCnUAAoJEEFjO5/oN/WBfJsP+QGbN9vGWmyOflyYcxCnu7Tg
V4u5QCjdnX77yO9uW5wyHVwbpr908KsiHJaJknu7HVC80TR1fq3MXAFxLhE1p2gr
d8KxHDYF5TzYuF08nZJ9m5HWlaJ4Nysl5sivzBx4bgvW2ghqEVZZ4zG9lTDYo7s7
8pPQqliOL++m104OwCE09pRBMGX6CDIrZSd1m+StqWZXjU5NdQxW+z7JmSlL2zKK
wAQ0N9/GU8BOJIEQCKOf13+XC2iYZiRDmwEyh0gNj22rPBVQ3i3+1fgYqbC2i1Vo
ZszPZyRLOhLD5ygbFVQfupEacu1mWr+kdeFxRqKswbn6cHpNZJ9agNYLqUFCBaBa
esw2VAQXemgjjvIDi0kPyuVZAesL6SY0nRlex77IjIyhja86qvW8A51jgjYILZAD
/swvafxArfUVgIi8/ysrjPC+VcdIAM1M+yoSr7RjcytH6/0rPMnLXtgxT4ayVu+o
XLnjfN8pbukDIryjtNXlWyKLpFz9VToNgkrmVWVPRni+MLdA2wQ/5mTw8C0Qypbm
ehJo7Bi0+6gw+/WtDNq1gg6/GSVJf7Y+1tMN+45RGLNSpgk7pyiwf+NM7RZu/Akb
EoJE8qUFd5d7wpBJ0P5eZbtmAtivr7z8Y3WVaTZD0epawO3JwnBLpAYrNoLQ7jpo
upkj8TmI2qDaYv1FDejd
=9FRw
-----END PGP SIGNATURE-----

--s0AIMtcnAlS2OWxa--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
