Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DC732571D
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 01:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785546880; cv=none; b=u0B4ngo36XjyZ2wGlkWAgihPHoHP3/RMRvv+jTeWsZfVJL2oSt7UARfHx22SXvyGT7JAWXOntsjB7iH4XNnAmqSPia0ussU3gFaS03M2yLUV61eVoL6DxKMUalpD9agz18LU8aiX678zWXqs/8biEzoqUVgUxsTEKsz4G2b00Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785546880; c=relaxed/simple;
	bh=fCWdaELwzqJTB/OFVASxbtcUX8I9Uzk+sdmse9lbroU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTTWGlHZIVGOH92CMRw4R7AAlxAKALRYBZIQdxC3NqQfw4vLZeMUdYjNMURHg0lXJZ/72HUf/Mj4ZVbdH5NaAgtFLVTQ0LMsNhlgjuKQooVtvnzaIdervFTjsR5BBZ9rM+QraQd94nSJas8oWnbWMyMeKjIXvam8plZO0IZW6bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4UvjegJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4UvjegJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07BC11F00ACA;
	Sat,  1 Aug 2026 01:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785546879;
	bh=XYHVwi7QUrSUkfB/70+FnAKkv/RmEXQkZ1Wv9VZXu9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z4UvjegJpKkK06c7cUt6rAfw1azdLwaJiBGTyolNM1QLw6Xbc6MTRhNYvM7RMCn0v
	 dIqYqgHMtaVoPvhWUMm2+gafjgsI0zh/JDAE0PfLcL80b7hZiKEkIYBYkAd8QllYHu
	 YO5oasK1rm3yFITmLzfRGOOirzZfqka/t3WmzZQ4ILtJ+cnWlsCNbtX/Heip52j71V
	 cb9o4orhVBX6uJeKUD1h2QI3ssYN6Jk/uZmuvGjrTC/JHmqiO0WG5y2gqnLyojv3/0
	 gMIwcVv4tL0uTnJmppFz4vHkPBmWUias2hE28LMX5Yab0WDKO5Nqbd9dkZMcT9qGSH
	 WsBEhaLrdZYTA==
Date: Sat, 1 Aug 2026 03:14:37 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v3 3/4] man/man8/ld.so.8: Note that ld.so.cache includes
 tunables
Message-ID: <am1IU3ypDO_tfEyZ@devuan>
References: <cover.1785522144.git.dj@redhat.com>
 <ae9c2cc67047902f68f64d05ca454da0e6d008b3.1785522144.git.dj@redhat.com>
 <4e0cadac19fdaa29081a226cbd6f98a0b5b6a02b.1785522144.git.dj@redhat.com>
 <bcaddcd0fb8f60276973ae28f091c158332e20c6.1785522144.git.dj@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bqwi7lz7vpkzktbq"
Content-Disposition: inline
In-Reply-To: <bcaddcd0fb8f60276973ae28f091c158332e20c6.1785522144.git.dj@redhat.com>


--bqwi7lz7vpkzktbq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v3 3/4] man/man8/ld.so.8: Note that ld.so.cache includes
 tunables
Message-ID: <am1IU3ypDO_tfEyZ@devuan>
References: <cover.1785522144.git.dj@redhat.com>
 <ae9c2cc67047902f68f64d05ca454da0e6d008b3.1785522144.git.dj@redhat.com>
 <4e0cadac19fdaa29081a226cbd6f98a0b5b6a02b.1785522144.git.dj@redhat.com>
 <bcaddcd0fb8f60276973ae28f091c158332e20c6.1785522144.git.dj@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bcaddcd0fb8f60276973ae28f091c158332e20c6.1785522144.git.dj@redhat.com>

Hi DJ,

> Date: 2026-07-31 14:22:24-0400
> From: DJ Delorie <dj@redhat.com>
>
> ---

Patch applied; thanks!  BTW, please sign your patches (Signed-off-by);
I just noticed now.


Cheers,
Alex

>  man/man8/ld.so.8 | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/man/man8/ld.so.8 b/man/man8/ld.so.8
> index d1d60cefd..36c8db275 100644
> --- a/man/man8/ld.so.8
> +++ b/man/man8/ld.so.8
> @@ -793,7 +793,8 @@ .SH FILES
>  .TP
>  .I /etc/ld.so.cache
>  File containing a compiled list of directories in which to search for
> -shared objects and an ordered list of candidate shared objects.
> +shared objects and an ordered list of candidate shared objects,
> +and any tunables to be applied.
>  See
>  .BR ldconfig (8).
>  .TP
> --=20
> 2.47.3
>=20

--=20
<https://www.alejandro-colomar.es>

--bqwi7lz7vpkzktbq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmptSHwACgkQ64mZXMKQ
wqmsUhAAhRFy5zliAapdWLmJY3vgeT/3wFizGmTLQab9LOr+2xJiBSawZpMnjtsO
Br4NqVjBHs7uMMM74WEAVxFt45n58+XzWiRf94AoeLGD7bqY7IaYfSCLqE6OrEXk
brN+r5iaU97Z93HZq5G0IykfI9pxIW+JHknC5PPzlSqrmYP8BoZrV2HiRatj3EUw
jKRcDF3klGQvwUedZTyXzDcBl+ni/5vAPHSD4IPyCLBmrOh+2Rn2mI3WSMiljaGy
Zt60GESgoIE42EMIEcp+LddCQO9AR5F54s8SEluUVBs3IBglQGpsyiv6Djl+IGFz
RCJNmbbaEry5XekpI21qcRnqScb8YsY/evxsfCSAQoE6Hm2lwZLjpOVqFWsduFhe
syedjmeyFw9LnIVnZetJZLqVWGs5mzPaayYCITs3hE8SmbYbbon/dUJ7G4CPNWOQ
LtYYefZZpqUsjSXh7C6RWXzedIXXU//THZR23F2YexLFuobvZf91KUYTReTRYs4c
VuFKOhInDL4D26k+pZsh0AOAlNIo0dXBYN1jrlQyGhM8TzXe00ENih/2gQOVW0qp
FN7GiZwW/xzvlH4GILcFVhyT8sRYToDYSFlb1LjiyJu7dHPzxEyzh9be6jXr3iNi
oeKIralGOnKox1718YB9AJmRybEA2nuYCa6z9EnnZFKrN2/0xD8=
=wbZT
-----END PGP SIGNATURE-----

--bqwi7lz7vpkzktbq--
