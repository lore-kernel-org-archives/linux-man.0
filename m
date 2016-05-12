From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: man-pages-4.06 released
Date: Thu, 12 May 2016 11:14:35 -0400
Message-ID: <20160512151435.GS26300@vapier.lan>
References: <f06548d5-5857-c73f-0f9a-331761cd748c@gmail.com>
 <20160511233214.GD22574@port70.net>
 <20160512001830.GR26300@vapier.lan>
 <57344EF2.1080206@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t3tFFy74pA5/PEcJ"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <57344EF2.1080206-5wv7dgnIgG8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Szabolcs Nagy <szabolcs.nagy-5wv7dgnIgG8@public.gmane.org>
Cc: Szabolcs Nagy <nsz-4P1ElwuDYu6sTnJN9+BGXg@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, nd-5wv7dgnIgG8@public.gmane.org
List-Id: linux-man@vger.kernel.org


--t3tFFy74pA5/PEcJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 12 May 2016 10:37, Szabolcs Nagy wrote:
> On 12/05/16 01:18, Mike Frysinger wrote:
> > On 12 May 2016 01:32, Szabolcs Nagy wrote:
> >> * Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [2016-05-11 08:=
51:14 +0200]:
> >>> clone.2
> >>>     Michael Kerrisk  [Colin Ian King]
> >>>         ERRORS: add EINVAL for improperly aligned 'child_stack' value
> >>
> >> glibc is able to align the stack
> >> maybe it should (e.g. musl does).
> >=20
> > see the original thread for discussion:
> > 	https://www.spinics.net/lists/linux-man/msg10237.html
>=20
> glibc can provide consistent behaviour even
> if the kernel does not, so kernel side does
> not matter much.
>=20
> i have no strong opinion here, fixing it in
> the man page is ok, but i can provide an
> aarch64 clone.S patch.

if you want to post a kernel patch, that'd be great
-mike

--t3tFFy74pA5/PEcJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXNJ3bAAoJEEFjO5/oN/WBnkAQAKgWr6r+J0u2yOrsBZLQfwcV
hX6/d4j2dQwYeC6GKFuPujyUyFswMURPBRN9mj0cBOiQq5ukreg79ldGE5FajNTg
O6xdqXHY3ji9TFLlF2yZ/UZhyn8RKfBh0VrHCwUP1PUy9KpBekn76wiyhE4HryDE
S/k5OBPYH3YeW0EsWOwMzq1g3QlAOv2Yxn6GqOgjUsax6Xic7OvsVmakm6raFuha
rPwy89QFxv2y2dt5vytEPVGm0egP/BkdLNFxlJl1TgybSgB8aUTkbL9tTjKrQIjR
t0DpUuesgkl+WvezF2XIRadq7k1jnZyvvwj8weWBbtOw1Dhsk0y7gycAvyJJfQwR
nslOlX9ubmwy3YCEsWfL56v2sjBt/wxU2KXewaSx6vjGXMbtbbH15GJGR3l6Vpsb
ANQh25i3L58wJISgfOcvtAOwqFBOQN6mKaJtTcsZtczRY4BYPyrFzlHYCd0JpssY
/EGmmyMHf9x+kNYK1rmZZOdu9MUmr1QQsDKkGTMrAt0Q8Y8I+//matD0/zHV6M3H
lXeuYcg0xVGL15URKaolN10+eaWKqMFwvnP+EFVviV1hKSM84XpvJIOugt7ORRaU
ryEjHfcfTKKOfimhC3WHb1jnRl1RJe4HGpSKOq+ZBsD+yufQPC+y4i7J7DbLI13B
Zfuci3DJYIIZotHGRfMZ
=MfY5
-----END PGP SIGNATURE-----

--t3tFFy74pA5/PEcJ--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
