From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: futex(7) has a broken link ?
Date: Thu, 13 Aug 2009 02:19:42 -0400
Message-ID: <200908130219.43803.vapier@gentoo.org>
References: <20090808175923.GA7302@us.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3578202.KfJjDv4dZm";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090808175923.GA7302-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sukadev Bhattiprolu <sukadev-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart3578202.KfJjDv4dZm
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Saturday 08 August 2009 13:59:23 Sukadev Bhattiprolu wrote:
> futex(7) SEE ALSO lists following URL which is obsolete ?
>
> 	URL:ftp://ftp.kernel.org:/pub/linux/kernel/people/rusty/>
>
> Specifically, futex-*.tar.bz2 is not found in the above directory
> or in the "Misc" sub directory.

i see it in that location just fine.  make sure you delete the spurious sec=
ond=20
colon (this has already been reported & fixed).
=2Dmike

--nextPart3578202.KfJjDv4dZm
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iQIcBAABAgAGBQJKg7B/AAoJEEFjO5/oN/WBx6MP/1eV+1Qhhb6hzHAERwRGARX+
GqAr7TxfQ1XxlTtnHfChQ6Mordq6H39bgRg/+mclhoGXgFxoqgZkm7MZh0EL8D30
wq2DyYSLfndWE1zueMdqU4qvIhavPeichBmXYiQfsuvEodH8L94EX6KZq4WNzpPT
9bBnKhcWddYoozZjAvhNQrs754FMciW4+Zf9xf8GpMutAbAzhHU9d0EK+HlnztmV
jnL3zGAgYhvReg0oC2nOopuX3QPMdUE33f1MI+D4to9ZrAIGznj9RXYQ7RZ8H/Aj
H7FAEhLmFmsoBUhhYdA3udjvRUoGac9qyScwtiKc3izBUHwwCmk4etSuxyh7MnXu
cIMDnBYvPa0JsGwgqKz3T9EkO1O/iQIUWEurj8pgHvag7QnpCo6DU0HN7lYlQ405
TsOqQ2odo2PVLFIfyDJ3QTR8rr03zJNVJ4kz+wcQDUdpiTaNYHGORul7enbHhxs9
pzNEOzaTycyK3i3lK8e5P/ayNimj8msp4pSQ3lQY7Xrd9Nxmt5lyAS7FIcYs4PHZ
m88/e1FR3vpHSnBdppqYh8BWNcxFc8LXKaplgTaGObG4GE38g7A8K9zCfknzfg0d
z8RanEJJ5PtlkHHGANRXNLTuBIDH81CLlLblLAbqfiYqphFmerFiiSrgDNBNDlvz
idcd4gmCr8vP4h+cjwRM
=hcxS
-----END PGP SIGNATURE-----

--nextPart3578202.KfJjDv4dZm--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
