From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: syscall(2)
Date: Mon, 6 Mar 2017 14:08:03 -0500
Message-ID: <20170306190803.GJ28432@vapier>
References: <CABLBYvTBKvQXSmiGx3LOUoFHZDGAMmNCofcuHTiKW51kS2bh4g@mail.gmail.com>
 <CAKgNAkg1iRisrd18WHn64j1NWAs2T0hrsc7dRoZs4XPV_22uhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dfFGhfmGgEMjYtLA"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkg1iRisrd18WHn64j1NWAs2T0hrsc7dRoZs4XPV_22uhA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Victor Khimenko <khim-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--dfFGhfmGgEMjYtLA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06 Mar 2017 12:01, Michael Kerrisk (man-pages) wrote:
> [Extending the CC for some other input. Changhee Han added the text
> that you are asking about; Mike F has done a lot of other work on the
> page. Perhaps they can comment.]
>=20
> On 5 March 2017 at 09:08, Victor Khimenko <khim-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
> > syscall(2) example includes the following snippet which explains how to
> > call readahead on ARM:
> >
> >        syscall(SYS_readahead, fd, 0,
> >                    (unsigned int) (offset >> 32),
> >                    (unsigned int) (offset & 0xFFFFFFFF),
> >                    count);
> >
> > But ARM EABI specifies that "A double-word sized type is passed in two
> > consecutive registers (e.g., r0 and r1, or r2 and r3). The content of
> > the registers is as if the value had been loaded from memory representa=
tion
> > with a single LDM instruction."
> >
> > This would imply that arguments are swapped around in the man page, no?
>=20
> So, I'm taking it that you mean the call should look like this:
>=20
>        syscall(SYS_readahead, fd, 0,
>                    (unsigned int) (offset & 0xFFFFFFFF),
>                    (unsigned int) (offset >> 32),
>                   count);
>=20
> Is that what you mean?
>=20
> > I've tried to experiement and with ftruncate, at least, it works like
> > this...
>=20
> Sounds plausible. I'm hoping that Mike or Changhee Han might comment.

it depends on the endianness.  the man page shows BE, and Victor's
suggestion changes it to LE.  we probably need to explain that and
not just swap the args in the example.
-mike

--dfFGhfmGgEMjYtLA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEuQK1JxMl+JKsJRrUQWM7n+g39YEFAli9s40ACgkQQWM7n+g3
9YEj+g/+PKwrVf3Q1rXQxcmRAJiON+v4m0qZuv9hBlk8FQuPQ71VK/FDd5EnLIle
Q/cRWUNML5BjeBT3eLiw9iTylviHZAs7USz9TtPzOXuv8nxgiNhkTtAXo+7nm/d2
QpbknJQj+ZXKp4jHhxqvALwI99RIbvYcgDbZd+/E8FdarY5Nzqd52ZOUd7n8OLf/
kv0etDPazMpwX+JJQpactzs7VezaZbnTY16hiHT7ybSfQnBvR5l0otD3S7MRpwQs
JV/yEu69h7KtW35XYUmEQNpBjYBwfjDbzB8y7svf7gabUJtsWKRjbZ71MXA+r84U
XDUMCN8gjAAPiHfPFTLl8uMb4rZ2e2lCWKhkszVP5+XgZItz37HX/ba9/t4Hh5va
W48UoE2qRMMrWYbqKGcH4BPHCT7SH0IMiAs7N2bpLaa8SwRNCs+c8s/cDk5/FiQj
Ytuv7Xh0feGqExkO7fhEFTcsxcbTD7Pa/UMUqpJ/IvdJK2hefZPj4BU1sL8VsLy6
cFJowx6gv9zKbNq4X3t/CFhtduawQfqRFTU/iNwYzcVo63Br+uG/myTe0JU60S7g
9CJLDi9gwuCyi66uKjEjDdP8ObFb+1CeI+pniWDjhHGABvnAFj2f9Xpm+ZrOeibe
cWVOoT2Z3swsTCmEGhxQdFlSeq2mI7qNXd8T2KJHWwj7YKdhtd0=
=R5cH
-----END PGP SIGNATURE-----

--dfFGhfmGgEMjYtLA--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
