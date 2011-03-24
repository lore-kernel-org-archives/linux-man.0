From: Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] strerror: improve strerror_r description
Date: Thu, 24 Mar 2011 14:51:09 -0600
Message-ID: <4D8BAEBD.4080202@redhat.com>
References: <1300400795-9123-1-git-send-email-eblake@redhat.com> <AANLkTim_cCxXXGE_BgSV5ewEQziru=gH0LpeFAWRWdkb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------enig87B36B8D09F220928602194E"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTim_cCxXXGE_BgSV5ewEQziru=gH0LpeFAWRWdkb-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig87B36B8D09F220928602194E
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 03/18/2011 03:35 AM, Stefan Puiu wrote:
>> Signed-off-by: Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> [...]
>>
>> http://sourceware.org/bugzilla/show_bug.cgi?id=3D12204
>> documents glibc's change to come into compliance with POSIX
>> regarding strerror_r return value.  The GNU strerror_r use
>> of buf was confusing - I ended up writing a test program that
>> proves that buf is unused for valid errnum, but contains
>> truncated "unknown message" for out-of-range errnum.
>=20

>> +on error, glibc 2.13 returns a positive error number, while
>> +older versions returned \-1 and set
>>  .I errno
>> -is set to indicate the error.
>> +indicate the error instead.
>=20
> to indicate the error instead?

Yes.

>=20
>>  .SH ERRORS
>>  .TP
>>  .B EINVAL
>> @@ -165,6 +168,7 @@ On some systems,
>>  .\" e.g., Solaris 8, HP-UX 11
>>  .BR strerror ()
>>  returns NULL if the error number is unknown.
>> +POSIX.1-2008 requires the result to be non-NULL for all inputs.
>=20
> Maybe you could mention C99 as well, since you were saying it also
> mandates this behavior?

Would make sense.  Do you need me to resubmit with those corrections, or
can you squash it in yourself when applying?

> Otherwise, the patch looks ok to me.

--=20
Eric Blake   eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org    +1-801-349-2682
Libvirt virtualization library http://libvirt.org


--------------enig87B36B8D09F220928602194E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org/

iQEcBAEBCAAGBQJNi669AAoJEKeha0olJ0NqbUsH/3KAGoNfjtcVnRTdOZ2NuWEx
u7AnK+fcInRH4o+BYKyDbb583gL0smK1SGSPLKgA4YcIlad01VRuQNFzZ9XbYMrN
7EMXBQJ7kKaBGakBriOpupSOCEcifDvQfOaU5rw8GlI7FR63St5EngW74YJ0z63Z
ZHYKX3THyxnnHR9G8F98IdVWHUBzjKJrmes/oKJLX9kXLl9OTJ68Okb3ojb6Opf0
ssnxnc9rBYvLwUwlNBf+IHlP0LzzL2xC+CT80OfogN1JAtG2y6B/mJ7c5r57s/QM
6j8imnvSjlDSskDnwgcnEiTI7tjovZJ/Fwia4JyI6lmEgbnfb+MD4Zn7VBd6kg8=
=D4BC
-----END PGP SIGNATURE-----

--------------enig87B36B8D09F220928602194E--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
