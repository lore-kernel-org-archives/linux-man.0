Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7138A41A779
	for <linux-man@vger.kernel.org>; Thu, 16 Jul 2026 11:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784201648; cv=none; b=Whm0tXl0zmnx+E6V0dO+5Uen+Zit1b40UxeZscVv9CDvZXnNZ2BDrIRHkckhLU3Ew3DryLJ2+voGhtVqOtfd8nbuUDCFH1YWhUejXw33sS5qlLIV1PhLFEoXH7WNpNEuLgWWN/90SZXU5qkx/rNZozzKJTOwTtNdb06Yp3cLXe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784201648; c=relaxed/simple;
	bh=ct0XbsO0aaMw4YfhCNxGSyNoF0uJBq1fhrqhTwvEFDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JW1qsFBwQDJzhsoQoKQbX+alWI9okiXzBLWOjnsHme3LjuothVgNWD8OQmZ8BWJYLREe1A6Jna6EB/KEIpQ8QvBgBSKzZhKRArXmtzq3CiSTw/2VSkeohFiXCTyDd1sgNVO2nacC/LkRF8ehmt5JGND1RTEylzJNgZFo1vfemts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XC8iI7wG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XC8iI7wG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5DB1F000E9;
	Thu, 16 Jul 2026 11:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784201647;
	bh=huBWkrMxMFiUGWLu7+f8FOAVBag2qQ8N0AWIm0GOdX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XC8iI7wGdjJ5JGo/v29v26fCspBI8t+GRAwq3T8ganM4tnKcA4hQcj6n2nEBvJA5b
	 ZzyhpxKe99syAleRv5Gw4eilECbSsWXtOnvs6rcHqqHAFt8QYHy7LTMGRXQ40/aSCn
	 7H7k0YTiqy1c/YDDj377FUO973O/TDr0vNIVq5jlp6TwqeHeYEw0wS6G8krz/orK+g
	 2kwaFTa/wqZ4Msl70o6Ca5F9EmDgqszvNrIjUIvDx+qCHTepvVuP1zAem3KTx3XcL5
	 Mdosj/KrcWdMruwFErfJqeg0aPJj2wl5AR3k50xgElmIYu1VSIdSUwC9O2ICFO4qAc
	 UBitAEfbZteMQ==
Date: Thu, 16 Jul 2026 13:34:02 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Runxi Yu <me@runxiyu.org>
Cc: linux-man@vger.kernel.org, Runxi Yu <runxiyu@umich.edu>, 
	Andrew Lutomirski <luto@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Peter Anvin <hpa@zytor.com>, Jan Kara <jack@suse.cz>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] man/man2/link.2: Document new AT_EMPTY_PATH behavior
Message-ID: <ali_j2Z8ASVyNThE@devuan>
References: <20260716090602.16571-2-me@runxiyu.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3ophl2w4hpno572y"
Content-Disposition: inline
In-Reply-To: <20260716090602.16571-2-me@runxiyu.org>


--3ophl2w4hpno572y
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Runxi Yu <me@runxiyu.org>
Cc: linux-man@vger.kernel.org, Runxi Yu <runxiyu@umich.edu>, 
	Andrew Lutomirski <luto@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Peter Anvin <hpa@zytor.com>, Jan Kara <jack@suse.cz>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] man/man2/link.2: Document new AT_EMPTY_PATH behavior
Message-ID: <ali_j2Z8ASVyNThE@devuan>
References: <20260716090602.16571-2-me@runxiyu.org>
MIME-Version: 1.0
In-Reply-To: <20260716090602.16571-2-me@runxiyu.org>

[CC +=3D the people involved in the linux.git patch]

Hi Runxi,

On 2026-07-16T09:05:36+0000, Runxi Yu wrote:
> From: Runxi Yu <runxiyu@umich.edu>
>=20
> Signed-off-by: Runxi Yu <runxiyu@umich.edu>
> ---
> I'm not on the list, so please place my address in the SMTP envelope
> recipient.

Ack.

>  man/man2/link.2 | 32 +++++++++++++++++++++++++++-----
>  1 file changed, 27 insertions(+), 5 deletions(-)
>=20
> diff --git a/man/man2/link.2 b/man/man2/link.2
> index effed3f74..a888da919 100644
> --- a/man/man2/link.2
> +++ b/man/man2/link.2
> @@ -115,9 +115,30 @@ created with
>  and without
>  .B O_EXCL
>  are an exception).
> -The caller must have the
> +.\" commit 42bd2af5950456d46fdaa91c3a8fb02e680f19f5
> +Since Linux 6.10,
> +no privilege is required to use this flag if the credentials under which
> +.I olddirfd
> +was opened match the caller's current credentials

The commit message says this is not enough.  The credentials must not
have changed since olddirfd was opened.  Restoring credentials wouldn't
work.

Here's what the commit message says:

    Note that the credential equality check is done by using pointer
    equality, which means that it's not enough that you have effectively the
    same user - they have to be literally identical, since our credentials
    are using copy-on-write semantics.

> +(as is normally the case when the caller opened
> +.I olddirfd
> +itself and has not since altered its credentials).

This is not the normal case where it happens, but actually the only case
that is allowed.

> +Otherwise
> +(for example, when
> +.I olddirfd
> +was received from another process,
> +or the caller's credentials have changed since
> +.I olddirfd
> +was opened),
> +the caller must have the
>  .B CAP_DAC_READ_SEARCH
> -capability in order to use this flag.
> +capability in the user namespace of the credentials under which

I feel this reads a bit weird.  Would it be better to remove
'of the credentials' in the line above?  Or should it stay?

> +.I olddirfd
> +was opened.
> +Before Linux 6.10,
> +the
> +.B CAP_DAC_READ_SEARCH
> +capability was required in all cases.

I think we can move this to HISTORY.

>  This flag is Linux-specific;
>  define
>  .B _GNU_SOURCE
> @@ -281,9 +302,10 @@ An invalid flag value was specified in
>  .B AT_EMPTY_PATH
>  was specified in
>  .IR flags ,
> -but the caller did not have the
> -.B CAP_DAC_READ_SEARCH
> -capability.
> +but the caller lacked the privilege required to create the link;
> +see the description of
> +.B AT_EMPTY_PATH
> +above.

Let's remove the last three lines.  This is of course implied when
talking about AT_EMPTY_PATH.


Have a lovely day!
Alex

>  .TP
>  .B ENOENT
>  An attempt was made to link to the
> --=20
> 2.55.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--3ophl2w4hpno572y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpYwaQACgkQ64mZXMKQ
wqmGEg/+PFW1kDtAgReWSTfEturIG0WmqihGNrwYrDEy2EqM7Bt4PClP/g6lWtTU
jK/6wNzwklfAYGvpgBOG8ZrUBrYLbLT15gIsJ0EfLGg0o3tz1P5RFp6i5FYMdTf6
vyy3bK3bLMPc2hXq5H8ft7gKCFvuRy0r4z8WTx33/EKg89cJ/tEnYoajV/RFzbFN
nikpPFm1F48tts83nh7BtRmACX3Qe4QWJ119ZVXr5HcPR96dATlVJLmJHq5Nl7Et
/O8da2ZlhWOaf/SdbR3WwDLKjEY8KFQ10wi3Y3mkjZOwGGDz/IfaMGKBKQRiMw27
1aPV510Ryo971Azn/V3VJMXt6eLBjxC8c1QQ04pKujU0kjUIdtAh1ESBchFvpgZy
Hz1aLAKQXeZMKRF4p5Eg0jmxE6GrVdFEghOSqJEh1uvGQH0hrajMTz6y++yEDZxA
9Th2+zszXYA6w/QclOMIJQuceFau+AXQ7r68ZxPxgEiBqvLsN35AqAcb9d24GxHV
6pSqwJt9HuAb0K6VIrB4NQOpiiSJqwMVjw+ut1FZq+mlaY15hsK0QM+4Rpn8yHNP
7lpt5SCzwPrZX/sDzSfGPUBxiBXlbnQpIyv4ZaMkcp1E6pHrc0i1R5nKi4OWm9cS
ruwvRkALFassUmpgSZ1UyMqlTViogyraFAEI2G4Gy+K3V0yn5WU=
=RhGp
-----END PGP SIGNATURE-----

--3ophl2w4hpno572y--
