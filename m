From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: For review: mtrace(1) man page
Date: Sat, 02 Aug 2014 12:57:18 -0400
Message-ID: <1777637.kUP8sTC8nC@vapier>
References: <53C8E24E.3040704@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart46914435.hsthLpA5mn"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53C8E24E.3040704-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org, myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, drepper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--nextPart46914435.hsthLpA5mn
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Fri 18 Jul 2014 11:01:02 Jan Chaloupka wrote:
> mtrace(1) command is not documented. All informations come from the s=
cript.
>=20
> Feel free to comment or ask any question.

it doesn't feel right for truly glibc-specific tools to have their man =
pages=20
hosted in the Linux man-pages project, especially when you consider=20
functionality/flags/etc... skew across glibc versions trying to be trac=
ked in=20
an unrelated git repo.

the GNU standard doesn't say that we can't include them in GNU projects=
, just=20
that they should be secondary to info pages.  so i think things like mt=
race(1)=20
are better in glibc itself.

how else do people feel in this regard ?
=2Dmike
--nextPart46914435.hsthLpA5mn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABAgAGBQJT3RhuAAoJEEFjO5/oN/WBdZ0P/0K3/ff9tjGxDGp2YWuyXQ9M
m2/fze1JFWgm6N8xJsYyjS37zdmh5gZpUF1wUCyOG2imnEpBoxvHTkLZcgppJSej
FbkYmmgM+7BunfJiMmCudOpNEzfdtP5IL+qZk9IXtPYdah7qdOr6NoNatB2sybO1
gqNIDhcVZMaAf8UXc5Vor6WyOGm9hk7/gYcRwrj2230lkx5flzyXBGa21muv9JIU
adjgwbBPu26LMIHeWumrwKD8/71teWmuFAHW6S9uPXmbIxPGUpTFVFyJVpNP5TlY
JMlVVqWMPd+mrZ+Sat0wKayc7AW14ffnF1czdNeCh8pDWNN6cTe33gCPNK1i/yZR
Xf/NWDtmrejsyklwejnST2M2w2y11P6CNRY/4eNvptinvB4Q2DGvDsnWDvOSmfsf
znoh+qZ6BvQn8mbvtMKvxmhuXSRQFKqyOqi//9GClhZCNP5PEMmfvtJ6mht1SdoY
bXTyfjpTk+bVYzjGTWZPh+6ucYd7jbqQaDlKE0ZnnsJyJlE0yvpvVw3YHb009hjb
VUlm2l0Fsu8ahCxMBvbzz95tHlmaG+dx9IbguvAJYNodWgCIR/qoD/ZJlPtu3Cy2
fu9maoxGw/lKgEW/+b2gzgBVdJbuqMhS41Pg3ejxZpEGNy8YnXUIKrV6/+YAMwfn
womg60DiCSjidwp9I2sc
=qYxz
-----END PGP SIGNATURE-----

--nextPart46914435.hsthLpA5mn--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
