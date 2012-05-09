From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: ptrace.2: PTRACE_KILL needs a stopped process too
Date: Wed, 9 May 2012 12:41:56 -0400
Message-ID: <201205091241.59060.vapier@gentoo.org>
References: <20091216004533.22261.qmail@kosh.dhis.org> <4FAAC706.6000808@redhat.com> <20120509201219.GA32051@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart8470889.9A0qnNokt4";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120509201219.GA32051-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Pedro Alves <palves-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pacman-ptgZXYu0fikgsBAKwltoeQ@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jan Kratochvil <jan.kratochvil-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--nextPart8470889.9A0qnNokt4
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wednesday 09 May 2012 16:12:19 Oleg Nesterov wrote:
> On 05/09, Pedro Alves wrote:
> > On 05/09/2012 04:09 PM, Mike Frysinger wrote:
> > > probably not that big of a deal, but the reason i like using
> > > ptrace(PTRACE_KILL) over a raw kill() is that you are less likely to
> > > kill the wrong process by accident.  maybe not that big of a deal in
> > > practice though.
> >=20
> > And you can do tgkill instead.  It was specifically invented to handle
> > the reuse case.
>=20
> tgkill() can kill the wrong process/thread too, although it lessens the
> risk.
>=20
> But I don't really understand the problem. The traced thread can't go away
> until the tracer does wait/detach, and thus its pid can't be reused?

or the process has received a SIGKILL for some reason

> May be, "by accident" above means something else, not pid reuse...

i like to assume that my code isn't going to be bug free, so the more=20
mechanisms i have in place to protect innocent bystanders the better :)
=2Dmike

--nextPart8470889.9A0qnNokt4
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJPqp5WAAoJEEFjO5/oN/WBhZQP/RO5BUC6Q6vHq1364xcEGuk1
y7Hrf90DHufw3s47HXXp3eujHEaPwLwV+Jjpn5RNP9aGpKk2Y+7Upe6fDt3MM0YD
tj9mdkIuFQz3AEyxRN6eiDyNRw9TVVE4YfIJfbZT+gbiEezt01AnTcTT5BDmPEGs
kDgeE36F2M7XQiXchx7d3mr25YE6lV+3QcWzgLIoSLUdRaA156Rh4hvtZ8NMq8+4
Z3eC4j0wwHg3sexg+CAHGkrArpAqY+ebn1N8I5ETYYOutDF2tFW02u5gtEkWd6l9
59mmQKp2YKmjLvTA4n9VPjrbyBGbiA6jyPRjFemciJrVB+rRyDw/N7hoFeQkEdDB
uxdH+J9DJNS/3p0UzxMYkmb77Aalz4ZBpnWeb7wVGuLTrXbTL5dWaa367L+ulIK4
U/yXQoe2GjKgRy6Iby3/BB4DGTL74AUUzkTN6fDG5XGX5q+18B8GQgfSxsh6/SKi
oOHW2yhzmu6jveRmSsJlh5kPuuC4MN+oxn1WzMdwqgNxJliJwbaz9+3diGVJi0iN
GNORREDLmKLU6+gZX4T92CIBtRAMxhrw9J4/VhkpZ536Kn43EtXaErp/bokOrK3g
Az+dVF34k2AKZNyXHrfWXYhMUb79vflYcKw+XX0pgC3GVgN8OfqfNUv6kuJIB5vw
1ydLmzzd41DQJjDYHbkP
=2LGv
-----END PGP SIGNATURE-----

--nextPart8470889.9A0qnNokt4--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
