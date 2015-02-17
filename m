From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: restart_syscall.2: remove section number
Date: Tue, 17 Feb 2015 03:43:26 -0500
Message-ID: <20150217084326.GG20008@vapier>
References: <CALhU9t=kM7Z7uO==e6vQ8eZJx1Vq9Gx+T1idTx8k80qMk0whrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JkW1gnuWHDypiMFO"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CALhU9t=kM7Z7uO==e6vQ8eZJx1Vq9Gx+T1idTx8k80qMk0whrQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--JkW1gnuWHDypiMFO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 27 Jan 2015 01:21, Akihiro Motoki wrote:
> diff --git a/man2/restart_syscall.2 b/original/man2/restart_syscall.2
> index a71b618..33081b7 100644
> --- a/man2/restart_syscall.2
> +++ b/man2/restart_syscall.2
> @@ -115,7 +115,7 @@ In the case of system calls that take a timeout argum=
ent and
>  automatically restart after a stop signal plus
>  .BR SIGCONT ,
>  but which do not have the
> -.BR restart_syscall (2)
> +.BR restart_syscall ()
>  mechanism built in, then, after the process resumes execution,
>  the time that the process spent in the stop state is
>  .I not
> @@ -127,7 +127,7 @@ and
>  .BR pselect (2).
>=20
>  From user space, the operation of
> -.BR restart_syscall (2)
> +.BR restart_syscall ()
>  is largely invisible:
>  to the process that made the system call that is restarted,
>  it appears as though that system call executed and

lgtm

(posting mostly because your e-mail was flagged as spam by gmail, so want t=
o=20
make sure Michael sees it too)
-mike

--JkW1gnuWHDypiMFO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJU4v8uAAoJEEFjO5/oN/WBBhIP/2+o7QT6azEmuKVQvdvupJ7p
XvpIADOJxVfhwB8kGiVD0jpEsn3nC5whYcTKTvyatNhKTXsAwUF9NUziCISxXZLr
Fvacncml/zIDV31p8dPWAL2Yn0dpdsfR4VrIe2A10oFSpcJwztuM0WM22xfUEGcl
flhMoHpqneVxLOFSkHiIKEuP5RU0FbqMelxt79l6eu1jXej6WBEYh1HcdgTJYcqc
o++7jMcpOEJ9a0w1RsyRMSh4Qphfsg7ZFFKAUTTdxiMjgXZ/PZY6Wzr5LyH3W1vE
IICA32LwajyzRRxXXaRt/40xuTV7ZM0gfB+7ztvekLtVsP+l0hK9p2lpXFkJHwu0
2485JDHKBltauWRt7HQV2cuazQmH7ZzXAGwollZHF2NYhf754ws73zET5jE8WneL
0PpydHEtxzZ8pxuIszk/tiW3KKWh3M3pOGiKoL5/mAVqaJIJkCgv61p8/iMIfaay
uSPOtoCrNjfbOZ+CYYc7FJfPHzesXAbMZfT8LbRNjrGDfi25cH4w+D7PfGzBdM0B
XvejU/Fa+QJv980g5OijblL+16NmCQsLzl7hdntIdBmWZnIvZAKj+Sb68XOOZ5fz
JVmo6mO59NsO8bge7aHMU47l9x+mLutPXo70EyDoKKVB+zX9EtZttWKjEcCBF33L
Z1dYyZsFUn0008g/F7Y9
=vmzr
-----END PGP SIGNATURE-----

--JkW1gnuWHDypiMFO--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
