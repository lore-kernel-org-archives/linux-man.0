From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Subject: Re: [patch] pthread_rwlockattr_setkind_np.3: Remove bug notes.
Date: Thu, 15 Nov 2018 10:21:16 -0500
Message-ID: <20181115152114.7amsm43s4gxxtxvd@crack.deadbeast.net>
References: <b6d241af-1d89-f6f2-e19b-239cc9c6d98f@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vvbfqae25wxd5i7f"
Return-path: <libc-alpha-return-97260-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
Content-Disposition: inline
In-Reply-To: <b6d241af-1d89-f6f2-e19b-239cc9c6d98f@redhat.com>
To: Carlos O'Donell <carlos@redhat.com>
Cc: "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Michael Kerrisk <mtk.manpages@gmail.com>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org


--vvbfqae25wxd5i7f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

At 2018-11-15T10:03:41-0500, Carlos O'Donell wrote:
> diff --git a/man3/pthread_rwlockattr_setkind_np.3 b/man3/pthread_rwlockat=
tr_setkind_np.3
> index 3cca7d864..6b2b8db39 100644
> --- a/man3/pthread_rwlockattr_setkind_np.3
> +++ b/man3/pthread_rwlockattr_setkind_np.3
[...]
> +.\" Here is the relevant wording:
> +.\"
> +.\"     A thread may hold multiple concurrent read locks on rwlock (that=
 is,
> +.\"     successfully call the pthread_rwlock_rdlock() function n times).=
 If
> +.\"     so, the thread must perform matching unlocks (that is, it must c=
all
> +.\"     the pthread_rwlock_unlock() function n times).
> +.\"
> +.\" By making write-priority work correctly, I broke the above requireme=
nt,
> +.\" because. I had no clue that recursive read locks are permissible.
              ^
This period is not in the original quotation and grammatically doesn't
belong there.

Is the Austin Group aware of the larger issue?  It seems reasonable to
assume that they don't intend to mandate that system implementors
resolve an unsolved problem in computer science.

--=20
Regards,
Branden

--vvbfqae25wxd5i7f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAlvtjuEACgkQ0Z6cfXEm
bc7hiw/+P/LwIo8+xZ8msqCFiV0Z4qHQ62IF3JM6h/g9TQieX+uOk0k/e7GTgs6j
nXgn2eBt+m+n5+ow1+nQZKKzB71Gu0xF66ugT5SjHIPtpSHcP1D8vEXzEM0h2apw
vaCHn51ykLWKQW4Vn6S+qg2EvcLJwxQnGKuemnaiHmfx5QqVlTZPWpmQFcJqwnpP
g0dvLXcTreEsgdqWm3Lx6JD8zPG+drp24Q0v5hj2TZJVdoq8wvJXYTfGnA888EnU
R20PVRZkES7gxeBA4sHPJKX0ClQw0AuWCPVznDGH8EfMGWJLQ44jz4HlGKXUGaDU
BAtcD5PYt23gnATpboA43qI9svPvRZw4lGS42oOPFWNr7QCZwWfLQOE5h9RyDPVN
OJ4AZ4zGdaTYkP6HRZide147GHVZ8z4vxD9/iexKnrypC40xpzBXvO4DHapPpm/c
Urf+/CT2enkE8OzrLVTwbIjptF7wt/IH8gyXYdQQvcAnDY3aJQWleRFSMfu9FwsG
wZ+QCbvlFfFT/Foz/ujaqNfCoNdwrckOuJx6RgRRxueY4umWmNSTwQD724yHzOP8
xqfgXt3d1cRENgzR+QN3ZB4IIribg8tdorUui7QYacCJ6FO+TumlXMcHI0Dq+M1M
h/U8nuX5nOl1et0eyrC7dEHBM0YTpkGaZvt0z0TvCVaaFOK6seg=
=W4HD
-----END PGP SIGNATURE-----

--vvbfqae25wxd5i7f--
