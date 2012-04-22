From: Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] strerror: improve strerror_r description
Date: Sat, 21 Apr 2012 20:18:58 -0600
Message-ID: <4F936A92.4050004@redhat.com>
References: <1300400795-9123-1-git-send-email-eblake@redhat.com> <AANLkTim_cCxXXGE_BgSV5ewEQziru=gH0LpeFAWRWdkb@mail.gmail.com> <4D8BAEBD.4080202@redhat.com> <CAKgNAkhJDrjrTJJKxubkJ2CMmoB0HBPHWmG2PWJpg7DKMcKWnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------enig365AF0380D69F8645DEE810D"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhJDrjrTJJKxubkJ2CMmoB0HBPHWmG2PWJpg7DKMcKWnw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bernhard Walle <bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig365AF0380D69F8645DEE810D
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 04/21/2012 06:19 PM, Michael Kerrisk (man-pages) wrote:
> Eric,
>=20

> In addition to the above, I added the following, and I'd be happy if
> you could ack it.
>=20
> =3D=3D=3D=3D=3D
> --- a/man3/strerror.3
> +++ b/man3/strerror.3
> @@ -133,6 +133,19 @@ functions return
>  the appropriate error description string,
>  or an "Unknown error nnn" message if the error number is unknown.
>=20
> +POSIX.1-2001 and POSIX.1-2008 require that a successful call to
> +.BR strerror (3)
> +shall leave
> +.I errno
> +unchanged, and note that,
> +since no function return value is reserved to indicate an error,
> +an application that wishes to check for errors should initialize
> +.I errno
> +to zero before the call,
> +and then check
> +.I errno
> +after the call.
> +
>  The XSI-compliant
>  .BR strerror_r ()
>  function returns 0 on success.
> =3D=3D=3D=3D=3D

Correct.

--=20
Eric Blake   eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--------------enig365AF0380D69F8645DEE810D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBCAAGBQJPk2qSAAoJEKeha0olJ0Nq4wYIAIj7Y8/MmmIHOQ3vDR85coFI
OnQtXxpmlnuFvEZJg6Aatrho41jKDk35HHlaN0f/PIsTg7PPbyeOT0i+1v2aMsqY
z+nILJ6kdDBks7QDa4a8hUEhNjBx/1aTwTWA3NR+RkP95srCqSwvaY83i7I0WS+R
KgKZXUvO02HT+2XzqQaENHXA47HL+YB5JVHJFT5Iawb81+dL6qOB5lmE9fqE41GR
jlqH4AkVbXyO1tYrKrZ6Z9SUg8OBiC8wwvBF1/OAv5/JbQfMr6mAmjt6ZZMhrTVD
pk4CttnaAgNfE5Di6xaa1mUKeNIltMC95A1jLzgjk1Sw1NddOLAMywj0ccYbmbc=
=Atyq
-----END PGP SIGNATURE-----

--------------enig365AF0380D69F8645DEE810D--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
