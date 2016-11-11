From: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Subject: Re: [PATCH] random.4: Improve discussion or urandom, blocking reads,
 and signals
Date: Fri, 11 Nov 2016 11:28:35 +0100
Message-ID: <d5eca965-c8b9-51e5-6acb-172e47f85ba0@supelec.fr>
References: <1461574090.32558.45.camel@redhat.com>
 <1470052099.2926.6.camel@redhat.com> <1476952646.2522.10.camel@redhat.com>
 <b07fb334-149d-cf65-74f3-1d1951e5981b@gmail.com>
 <1478768067.2642.23.camel@redhat.com>
 <e5c1f87c-aad0-b526-a346-74348a36c2a3@gmail.com>
 <1478778837.2642.26.camel@redhat.com>
 <05152136-6943-8ada-3d65-51ef4ce9c1b1@gmail.com>
 <4a8c573c-0c19-29d0-248e-74c088968806@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Gx4GPjIhV1ib9da0SDFM5HVuMSqUmNTP5"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4a8c573c-0c19-29d0-248e-74c088968806-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tytso-3s7WtUTddSA@public.gmane.org, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, =?UTF-8?Q?Carl_Winb=c3=a4ck?= <c@tunnel53.net>, Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Gx4GPjIhV1ib9da0SDFM5HVuMSqUmNTP5
Content-Type: multipart/mixed; boundary="J98957EBmxJ6mIQe6rKNIlq2oVQlx3F3c"
From: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
 Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tytso-3s7WtUTddSA@public.gmane.org,
 George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>,
 =?UTF-8?Q?Carl_Winb=c3=a4ck?= <c@tunnel53.net>,
 Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org
Message-ID: <d5eca965-c8b9-51e5-6acb-172e47f85ba0-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Subject: Re: [PATCH] random.4: Improve discussion or urandom, blocking reads,
 and signals
References: <1461574090.32558.45.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
 <1470052099.2926.6.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> <1476952646.2522.10.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
 <b07fb334-149d-cf65-74f3-1d1951e5981b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 <1478768067.2642.23.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
 <e5c1f87c-aad0-b526-a346-74348a36c2a3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 <1478778837.2642.26.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
 <05152136-6943-8ada-3d65-51ef4ce9c1b1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 <4a8c573c-0c19-29d0-248e-74c088968806-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <4a8c573c-0c19-29d0-248e-74c088968806-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

--J98957EBmxJ6mIQe6rKNIlq2oVQlx3F3c
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 10/11/2016 =C3=A0 15:20, Michael Kerrisk (man-pages) a =C3=A9crit :
> Hello all,
>=20
> While reworking the text of the random(4) page, I found
> what appear to be some inaccuracies. Could I get some feedback
> on the patch below?
>=20
> Thanks,
>=20
> Michael
>=20
>     random.4: Improve discussion or urandom, blocking reads, and signal=
s
>    =20
>     The text currently states that O_NONBLOCK has no effect for
>     /dev/urandom, which is true.  It also says that reads from
>     /dev/urandom are nonblocking.  This is at the least confusing.
>     If one attempts large reads (say 10MB) from /dev/urandom
>     there is an appreciable delay, and interruption by a signal
>     handler will result in a short read. Amend the text to
>     reflect this.
>    =20
>     Signed-off-by: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> diff --git a/man4/random.4 b/man4/random.4
> index db5d0a2..736cbde 100644
> --- a/man4/random.4
> +++ b/man4/random.4
> @@ -46,7 +46,6 @@ When read, the
>  .I /dev/urandom
>  device returns random bytes using a pseudorandom
>  number generator seeded from the entropy pool.
> -Reads from this device are nonblocking.

Being non blocking is not incompatible with being interruptible, though.
Non blocking only means that the reading will never explicitly yield the
CPU to wait for data, which is true. This is consistent with the use of
"non blocking" elsewhere in the filesystem, as far as I understand it.

But I guess this can be confusing indeed, and that the precision is not
useful in the man page.

>  When read during early boot time, this device may return
>  data prior to the entropy pool being initialized.
>  If this is of concern in your application, use
> @@ -88,8 +87,11 @@ When calling
>  .BR read (2)
>  for the device
>  .IR /dev/urandom ,
> -signals will not be handled until after the requested random bytes
> -have been generated.
> +reads of up to 256 bytes will return as many bytes as are requested
> +and will not be interrupted by a signal handler.
> +Reads with a buffer over this limit may return less than the
> +requested number of bytes or fail with the error
> +.BR EINTR .

Yes, this is a useful precision.

This patch looks good to me.

Cheers,
Laurent


--J98957EBmxJ6mIQe6rKNIlq2oVQlx3F3c--

--Gx4GPjIhV1ib9da0SDFM5HVuMSqUmNTP5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF4EAREIAAYFAlglnVMACgkQRTidSplJch7CDgD/W0EhkP8/6w6Wi1oJ95t+kQQf
ytz08j4wZoJnnkVo2noBAJjAT4Ob1tQ6mEnaLw7OOIbEGq5GzEzduiXfJop4OZ45
=ygdR
-----END PGP SIGNATURE-----

--Gx4GPjIhV1ib9da0SDFM5HVuMSqUmNTP5--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
