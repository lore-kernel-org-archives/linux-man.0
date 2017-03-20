From: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] ttyname.3: document ENODEV error code
Date: Tue, 21 Mar 2017 00:58:23 +0300
Message-ID: <20170320215823.GA28075@altlinux.org>
References: <20170320205104.GA27434@altlinux.org>
 <CAPP7u0WL2wa2MLavq22q616=-pHNPyNXqLpPGzR4JqYzGA16-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPP7u0WL2wa2MLavq22q616=-pHNPyNXqLpPGzR4JqYzGA16-A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christian Brauner <christian.brauner-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Serge Hallyn <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>, =?utf-8?B?U3TDqXBoYW5l?= Graber <stgraber-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 20, 2017 at 10:02:15PM +0100, Christian Brauner wrote:
> Hi,
>=20
> Thanks Dmitry. One comment
>=20
> On 20 Mar 2017 9:51 p.m., "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org> wrote:
>=20
> ---
>  man3/ttyname.3 | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/man3/ttyname.3 b/man3/ttyname.3
> index 14c24e7..0be50c6 100644
> --- a/man3/ttyname.3
> +++ b/man3/ttyname.3
> @@ -71,6 +71,11 @@ File descriptor does not refer to a terminal device.
>  .RB ( ttyname_r ())
>  .I buflen
>  was too small to allow storing the pathname.
> +.TP
> +.\" glibc commit 15e9a4f378c8607c2ae1aa465436af4321db0e23
> +.B ENODEV
> +File descriptor refers to a slave pseudoterminal device
> +but the corresponding pathname could not be found.
>=20
> I think it would be good to explicitly mention that ENODEV is set in case
> the fd does not refer to a pts device in its namespace. Otherwise users
> might take this as an indication that this is a more generic error which =
is
> not the case.

In fact, this is a more generic error than a namespace mismatch, although
the latter is the most likely reason.

Imagine that the corresponding file inside /dev/pts/ is not available for
some reason and the stat call has failed.  This situation could be
reproduced e.g. by bind-mounting an empty directory to /dev/pts.
A subsequent ttyname invocation would end up with ENODEV because the device
is literally not available although it's withing the same namespace.

I don't mind if you change the description to mention the namespace case
as the most likely, but please do not make it the only case when ENODEV
can happen.


--=20
ldv

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY0FB/AAoJEAVFT+BVnCUIqW0QAI9rXbsGy86ORtXeQ+Adywar
4sDIrhFY/XIY/gfwSf5p72Xx9t/9rq8f7ablfkOnL8apd6tlSxPqAeqf0ngiCJQD
I4YKn5uqfIkR6tlHDG9NTnwZA8U7NMwC6Ywb7EBKwNKIDY9J66hXkVhQIlGVvMX/
boj2u43g2QSFFIM+B9AvJdgKbiH1YZonSS2TOWhphIsKihJQG/IHwFxBHf384Puk
7p8Paca1DDn057YYzh9ItWH2+CbmKEEMV1Z+9MB8YtJ8RaN37ZwNXr0vD0vBSsFs
mjlIARKjgXRd4fkt2WErDb9hNYlOKMB42NrXHunSRswBYMPLGGOthHGJVcvLS7Xm
eODdakKewzVTEheIyb6ZvlrCWEuGxuaxdhQ8vc3mPRffY1HiBEChyQffMESrHBdC
T94gysErEFFRaPIGare91vqHOPtGVUkW2ffENdaQfN4ZfcZPoBcKPrhsshpwW7Rt
2yLinIG4Mom7grtHXDp+3jZ+02ROze7+p0ZUKdn+J2FLjfg1xNrjmIyfrV9iMyB3
XYnqiufmBMTwypBTFRH0HBZKXwQS5ocez431eCTuexwVboTQwY1SG+gQPFco4TGJ
Dp/TBtERCJz2pjDk+8AAbk6jaFUaa/f8aLaVLML/owDMPVrJVr5lkK7U4t0YbKnr
QOeVUuqODhGTnruosIPm
=TqEY
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
