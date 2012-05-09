From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: ptrace.2: PTRACE_KILL needs a stopped process too
Date: Wed, 9 May 2012 11:09:33 -0400
Message-ID: <201205091109.35637.vapier@gentoo.org>
References: <20091216004533.22261.qmail@kosh.dhis.org> <CAKgNAkhtu8d0NKcTwWyCA8qWgz8Lag+GcpEE1=YMVe_Nh8XJ9Q@mail.gmail.com> <20120422200459.GA7519@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart8313227.YqHPenWRRy";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120422200459.GA7519-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pacman-ptgZXYu0fikgsBAKwltoeQ@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jan Kratochvil <jan.kratochvil-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pedro Alves <palves-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--nextPart8313227.YqHPenWRRy
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sunday 22 April 2012 16:04:59 Oleg Nesterov wrote:
> On 04/23, Michael Kerrisk (man-pages) wrote:
> > [widening CC]
>=20
> add more CC's
>=20
> > The man page says "For requests other than PTRACE_KILL,
>=20
> Argh, PTRACE_KILL again.
>=20
> You know, I simply do not know what it was supposed to do. I can only
> see what the code actually does.
>=20
> > the child process
> > must be stopped."
>=20
> Yes and no.
>=20
> Yes, ptrace(PTRACE_KILL) "succeeds" even if the tracee is not stopped.
>=20
> No, it has no effect if the tracee is not stopped.
>=20
> All I can say is: PTRACE_KILL should never exist. If you want to kill
> the tracee, you can do kill(SIGKILL).
>=20
> Roughly, ptrace(PTRACE_KILL) is equal to ptrace(PTRACE_CONT, SIGKILL)
> except it always returns 0.
>=20
> > If the man page is describing actual intended kernel behavior, then it's
> > a fairly long-standing kernel bug.
>=20
> Perhaps. May be it should simply do kill(SIGKILL), but then it is not
> clear why do we have PTRACE_KILL. And once again, I was never able to
> understand the supposed behaviour.
>=20
> Personally, I think we should fix the documentation. And imho the only
> possible fix is to add this note: do not ever use PTRACE_KILL.

probably not that big of a deal, but the reason i like using=20
ptrace(PTRACE_KILL) over a raw kill() is that you are less likely to kill t=
he=20
wrong process by accident.  maybe not that big of a deal in practice though.
=2Dmike

--nextPart8313227.YqHPenWRRy
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJPqoivAAoJEEFjO5/oN/WBoYsP/0ogZ1TZMoYRhAEkPXwHorSy
Tlgw9du3HzuRzNhCbgGDTCXzoyoWpWY4VO1A7HQjVPU1aK0MrjSPzxHaQbGNOI/T
F9s7cBjvL1R13xiEFSRDcBRsv9E3fSFAhRBi4ygYuAUyrzxLqFG+atmopczb10Zr
RLcXnK4hNtmGoGojx1rShbA8g7MzJVADIshD54LFj/MULrhsZCCmLllDoMv0FAkk
/rT2eAkljgMXgyi/NVqWqjX00/5YhhUx6u/qLAGEF3w2iRk7Dfo9fHYWZaMdPKlX
Q9Y4kWxygaQbjFMqYH5YyR40Fz9tqp4jhm9kszT9en+zxLKpgvGelppY6kZpQ/YP
9wsXF3xNVCxQVe9NwrudBt6iUlWEP7UyokkA9Mp1h611l7n0k32w8ZHxVKQOXg+2
eJgU31bnoBSbni+A6cUr6PTdnU8Hv9K4xCesJDIxXNXgpICDuQCvIR2FNfzvqxqF
qvGsAhh/I+nWyOu/sNLykvN016+4Uz/Bs9MZTIItsXP4nBANAyP0XwcBhWEqh+PS
8IbFSHemtUhR9y87Gw6tz09jXm1iN4mntSsDfdUwLjEjV5UYJq98IyfeXdB1q9GU
Z4ehkyKFUMdsDhgaCNe5WTfnj6LbSbocDmBfGUVbKAKbv4VLq1vajIbnmtoDziam
RjAR+QafbnHYLNowUlvV
=bWJO
-----END PGP SIGNATURE-----

--nextPart8313227.YqHPenWRRy--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
