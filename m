Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792704500;
	b=P9hk2uo1nwXRJqwZcvG6QdHRBchgf4camXefImiLyr6ewt/0eXS5VFJfqQPOXVPCWCce
	 BYv6RsvFono37lOcSma9OWEch1Lw76934xj/LK6oZIdaQN6s6cSNDjiG6ZvgbJ/7UMv7D
	 D4NMTDj17zQCd6/4T60yVgT/HgOc76F8ogS1Ywl/0I6qgJgmBz8t+nLfGlppas8yNjmao
	 38BOwOslm3gXa+YxLoWLEa/wcnxlsaqcrc/FvB0rkg5OziLhx/r7FDACLQGc0GArgHGkb
	 ni2oUVn5fomWGEtN463kBtj8OcPs452rJwAkx9P8YXceA7vSNlnVSpS4KJdRXnYos5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792704500;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6ON5EbuIbg5PcaktFiCtGVv2caUxkRnP5tgaG5srV0Q=;
	b=Kw0+2tstDrbVezJMQVbUY8JLAnYzidh94kFVXTsRaiYpMJF8m5AHXjap4Vya4AZPqC+g
	 w68BJ22e6sdpcS8ibJK8zb92yKIEGzT+aqqG7XWBi0OtDPEZDEXipastw9vUm1g8KdoXu
	 ZMsucA+enw4qMNhhfGyiW4g0GyzYVg/R3fsFylNRwgOueJrRPc2tZxDZ0/AR0Q2+KMPgt
	 hcWiWMAUDbOUmZzqLm+zWeauVacKbXQQ+kivQw6jY380LiPaaCkuLtwzF1S7nhs0Cs8gW
	 N8imqZzk4lXkTIx1mFHN2imKVR9haURpuDMfhaqsilT6AIsDMRCiA0iFeP96OH8Tb5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TuKDltkx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A764606A319
	for <linux-man@vger.kernel.org>; Thu, 22 Oct 2026 21:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TuKDltkx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD8D1F01825;
	Thu, 22 Oct 2026 21:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792704500;
	bh=6ON5EbuIbg5PcaktFiCtGVv2caUxkRnP5tgaG5srV0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TuKDltkxE3XRphrSs5rB5eoXSudzDhXfAy325GDAgWVWYbBJ6tT84s3q4+ats8v01
	 8tDn7FucinAQ38+4AmvZ0ayW1mjWuhd54tsTU9Xj/A/IHF1EJuv9x0a4WvdutKp05S
	 jKGaMu2v/uDYCJVDSArTIpWW4pnj+ls8E8aULSNt7OfE5lEJIfAu8KwHasokpYHDE9
	 h/GryQw2MM/o30IU/ecygWMk0vvpxd7hKRh+wVFT7m1WnMM1urWfpJFRfxqEGRnOx0
	 LaT/T++UhetC8Fotdlpf3ojWuBwqWF8TedrRFYlXlqF3P8aDD60HlzwDEAJCQZYaKC
	 NPt42LOZvkiDg==
Date: Thu, 22 Oct 2026 23:28:12 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH 2/7] man/man7/unix.7: Multiple same-typed SCM_* messages
 may be sent in one message
Message-ID: <atp-nJT72YOgvnw4@debian>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-3-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zpxfj3fwsdx5iu45"
Content-Disposition: inline
In-Reply-To: <20261021212256.27961-3-gnoack3000@gmail.com>


--zpxfj3fwsdx5iu45
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH 2/7] man/man7/unix.7: Multiple same-typed SCM_* messages
 may be sent in one message
Message-ID: <atp-nJT72YOgvnw4@debian>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-3-gnoack3000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261021212256.27961-3-gnoack3000@gmail.com>

Hi G=C3=BCnther,

> Date: 2026-10-21 23:22:51+0200
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> Verified in Linux kernel code:

I think 'verified' in a commit message seems inappropriate.  It should
describe, rather than verify, and the verification would come only from
the review tags.  Maybe say something like "Relevant kernel code:".

> __scm_send() in linux.git net/core/scm.c walks all control messages
> in a loop like this:
>=20
> 	for_each_cmsghdr(cmsg, msg) {
> 		// ...
> 		switch (cmsg->cmsg_type)
> 		{
> 		case SCM_RIGHTS:
> 			// Append(!) file descriptors
> 			// up to the SCM_MAX_FD limit
> 			break;
> 		case SCM_CREDENTIALS:
> 			// Replace previously set credentials

Since these are your comments, and not actual comments in the source
code (are they yours, or from the LLM?), I'd format them clearly as
such using invalid code rather than comments:

			... replace previously set credentials ...

> 			break;
> 		default:
> 			goto error;
> 		}
> 	}
>=20
> So it is possible to pass multiple SCM_* messages -- they will compose
> if possible and override the previous value if not.  Since their
> contents are being conflated that way, they will appear as one message
> again on the receiving side.
>=20
> Keep the recommendation as portability advice, and describe the Linux
> behavior.
>=20
> Fixes: 5b5cb1958062 (2018-07-10; "unix.7: When sending ancillary data, on=
ly one item of each type may be sent")
> Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> ---
>=20
> Notes:
>     The factual analysis in the commit message is correct.
>    =20
>     I kept the LLM phrasing; it did not seem overly wordy to me and the
>     style is in line with the paragraph after it, which also documents
>     Linux-only vs. portable APIs that way.
>=20
>  man/man7/unix.7 | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>=20
> diff --git a/man/man7/unix.7 b/man/man7/unix.7
> index 0d2ea8bda2ae..a1dce8c47246 100644
> --- a/man/man7/unix.7
> +++ b/man/man7/unix.7
> @@ -543,7 +543,24 @@ option must be enabled on the socket (see above).
>  .P
>  When sending ancillary data with
>  .BR sendmsg (2),
> -only one item of each of the above types may be included in the sent mes=
sage.
> +portable applications should include
> +only one item of each of the above types in the sent message.
> +On Linux,
> +if several
> +.B SCM_RIGHTS
> +items are included,
> +their file descriptors are combined into a single list,
> +to which the
> +.B SCM_MAX_FD
> +limit applies as a whole,
> +and the receiver gets them in a single
> +.B SCM_RIGHTS
> +item;
> +if several
> +.B SCM_CREDENTIALS
> +items are included,
> +each of them is checked,
> +and the last one takes effect.

Is 'takes effect' appropriate?  I think 'is sent' might be more
appropriate, right?  There's nothing taking effect, I think (but I'm not
an expert in SCM_* stuff).


Have a lovely night!
Alex

>  .P
>  At least one byte of real data should be sent when sending ancillary dat=
a.
>  On Linux, this is required to successfully send ancillary data over
> --=20
> 2.56.0
>=20

--=20
<https://www.alejandro-colomar.es>

--zpxfj3fwsdx5iu45
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmraf+QACgkQ64mZXMKQ
wql9/w//ViLtuI+N6Qi+xB2WomnhWXqLAM963DpWSh5gMixqnnSX/hDrAYafpnEO
kjJZLa10hJh6Xh31AXSAkFkG/PCwodzsbvXB02KBR1kh366uYjgB6XAk9vToXFHU
MESw85K1yijaGIznnDD1K4h0UhBQB1+LZO3SEYiHtkSj1jAnLOrJDxYtNxDVNeZd
c/+DkoLF3+dsB6ygExa7zCJiPgIEbdPIoPHX2rkfmMMQdQcBhKDNCqjIx+KMqmX0
YG7E5IOmAxYMWujWbD6eCpccxlwOeX3zxIViY0inNgcMsyAtJLmEE3qu6FDNveFM
jn27PxysEjHejzh0rO+PtA6HmfXAP1UPoSPehB7uuFTNVDBoV3Mk62VrS7PIG5ZA
HBWNYrD00Nqleyho0FwYPUKpbxoIOPXuzXm+2cMUluK9dOwb36JvnbH0RuoI5efW
mTez0ads8yV138vUf8iesK8rPw0eHHlZF7hWdAOLxL7jTYbN+pdwkXM52XzbqBEq
iDizrJrFlYwkti9GFQvUHqcsmzs9q4HMCrPgy9c60WXlsHKz8AMS+dNILkj0jDxQ
iabu6S4EQvLaF+/6tCJuW5Npkx5JylTXUM6zglFWjU0r32zjh8gRcN5mlY1SpmvH
NC+gjOeJc8CgUR2zAvsv935TpVtkEf2Tjq5trvpsxMsOsUHBuo8=
=gbVf
-----END PGP SIGNATURE-----

--zpxfj3fwsdx5iu45--
