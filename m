Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657F33BED66
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 11:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321659; cv=none; b=QJLjtcqlfjjjR+7t/DpWQve76N9FdmCD+Pbcb3j+vFYSK59NbNJhc8K9VJahujNwqHDyvcp2ShOXucXHWuhJ2ky7daGUGWDuycf0JecutJYauUr43OEtlq6h9dZkHMRqsheiq/XiFYRBb09XlW+BVMxKrsemeMfHhHJi5lQzbpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321659; c=relaxed/simple;
	bh=7hixIbImGMlXu00lsccMBMMIpUOw21pebmT0CeJWn/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyaeN0wPxdsXb0oyY5myt5OZNtSntEg7uCwEyAAZrb9CVxhZ9n5hwHUdakwxI1oTTs7Av7MNrJoJXz9YpDCp3qnCgTHDccJPP7RES64siW2z/wClmh3tayqb9siG6hSngXzcpAJ1EFaxwDAoWp0IE/gmMaKzgVyqBlW6Lm/rltI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtB85zXX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtB85zXX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54EC61F000C4;
	Sun, 18 Oct 2026 11:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792321658;
	bh=+hMCPGM7zf4JLEvjWQnEzBw4TZVxRQB+C5u/BgcGJh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BtB85zXXkg1P6Y928Z2+yt5Lyb9IEk2NOnPFYExrundQvHpvLC5aig493LK2LVplu
	 Ae+JQWPyVyZaQ9WRUwvshZ50WZZ+KAoOIyzayxSHceeiJbDrzoEuwK3uT4hBPRDkD9
	 YrqmUVGN3VGGGWLOBGsmrkoIxI1yVOJdrrykIfKbej6UHTkOK0YmRfzDnppSyoSIJC
	 CeiQ7kPH63giZUl2WOAI+z6Ey/awrIl2Jc5GraEy7DnALeQA324lV4USoMoitBCXXm
	 hMH7yeel6xnwUWwPfXo4GJWdlh+Hu9XptnKlPKuwaOKYADdcDvCm+kzBqQiUT28wN0
	 p3V5ngjPyfVEQ==
Date: Sun, 18 Oct 2026 13:07:31 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, "Dmitry V. Levin" <ldv@altlinux.org>, 
	Pavel Emelyanov <xemul@virtuozzo.com>, Michael Kerrisk <mtk.manpages@gmail.com>
Subject: Re: [PATCH 04/24] man/man7/sock_diag.7: Fix member order of struct
 unix_diag_vfs
Message-ID: <atSnqiYS4fpTAkKC@debian>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
 <20261016173139.13076-5-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j2pscfskgm3lsnvh"
Content-Disposition: inline
In-Reply-To: <20261016173139.13076-5-gnoack3000@gmail.com>


--j2pscfskgm3lsnvh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, "Dmitry V. Levin" <ldv@altlinux.org>, 
	Pavel Emelyanov <xemul@virtuozzo.com>, Michael Kerrisk <mtk.manpages@gmail.com>
Subject: Re: [PATCH 04/24] man/man7/sock_diag.7: Fix member order of struct
 unix_diag_vfs
Message-ID: <atSnqiYS4fpTAkKC@debian>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
 <20261016173139.13076-5-gnoack3000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261016173139.13076-5-gnoack3000@gmail.com>

Hi,

> Date: 2026-10-16 19:31:19+0200
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> In the kernel's <linux/unix_diag.h>, udiag_vfs_ino comes before
> udiag_vfs_dev, and it has been that way since the structure was added
> in linux.git 5f7b0569460b ("unix_diag: Unix inode info NLA").  Both

Please include the commit date.

	$ git ref 5f7b0569460b
	5f7b0569460b (2011-12-16; "unix_diag: Unix inode info NLA")

> members are __u32, so code written after the manual page would silently
> mix up the inode and the device number.
>=20
> Also reorder the member descriptions to match.
>=20
> Fixes: 4f6a0a4a (2016-12-07; "sock_diag.7: New page documenting NETLINK_S=
OCK_DIAG interface")

Please include 12 characters of the hash.

	$ git ref 4f6a0a4a
	4f6a0a4a909e (2016-12-07; "sock_diag.7: New page documenting NETLINK_SOCK_=
DIAG interface")

Worth CCing the authors of the patch.

Cc: Dmitry V. Levin <ldv@altlinux.org>
Cc: Pavel Emelyanov <xemul@virtuozzo.com>
Cc: Michael Kerrisk <mtk.manpages@gmail.com>

> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>

Reviewed-by: Alejandro Colomar <alx@kernel.org>


Cheers,
Alex

> ---
>=20
> Notes:
>     Compared against unix_diag.h header,
>     where the struct field order is different.
>=20
>  man/man7/sock_diag.7 | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/man/man7/sock_diag.7 b/man/man7/sock_diag.7
> index d4e78c46cc8d..35a6d5a80ffc 100644
> --- a/man/man7/sock_diag.7
> +++ b/man/man7/sock_diag.7
> @@ -180,8 +180,8 @@ structure:
>  .in +4n
>  .EX
>  struct unix_diag_vfs {
> -    __u32 udiag_vfs_dev;
>      __u32 udiag_vfs_ino;
> +    __u32 udiag_vfs_dev;
>  };
>  .EE
>  .in
> @@ -189,11 +189,11 @@ struct unix_diag_vfs {
>  The fields of this structure are as follows:
>  .RS
>  .TP
> -.I udiag_vfs_dev
> -The device number of the corresponding on-disk socket inode.
> -.TP
>  .I udiag_vfs_ino
>  The inode number of the corresponding on-disk socket inode.
> +.TP
> +.I udiag_vfs_dev
> +The device number of the corresponding on-disk socket inode.
>  .RE
>  .TP
>  .B UDIAG_SHOW_PEER
> --=20
> 2.56.0
>=20

--=20
<https://www.alejandro-colomar.es>

--j2pscfskgm3lsnvh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrUqHMACgkQ64mZXMKQ
wqnCaA//Ugynzxqya2N+ZvyMAjHhEBbSId7CxKuE/EaMjPjjY1eJR+ta/XkZDIeX
B72i5MmGMIjK8a4xbbSjSVAkRDwmCFQFiphQv0QXUJLkG734tQesHQ5Hd4QSTCyl
lVCSh3YWM/aSj0b6x3bWMEtm1KXUQJ8VblwVrHzqB4/HsfwcAV3278FHHSJAbv3d
B/+N765b01/RT6GvhsXYWe7kovEIDo5UZINzFgegd5VeNAkNudBjzqi808n8CaPN
h2JDCJqd54FIE1Dvt3NLkSg+fXBGJKx5P8PPM3V3SFTad+ePMy4QGiIJHt6rFdpT
HKiJzJourHHYHuvdcUtRTVFHJFeHAd9t0HU9ZhlNQ3BN68oVi6VyHJz00GG/oBOY
9odZfyNW88qjdXsq3r0Ns/qO492Q1ki/cJUHlzlTMSXg+HRpnPeoPJ+IDx+yoz2E
8arFq6NDza5yOWtH5CGBKcWS2CBR/Cf2bIv6dV+N1O0MCwapkeT5tvlarEgWfPHN
gRqp6jUETjcNscCgE/e+bNQGGUF+JqAGn75qceNt+xiidevFHoiEt4F5krtygyvQ
KRhq8diP0ij2GymImB3lbzb/3Pgq2rKIKyEF1rJyImrh1CaC4KX8euv2MQrvoQ4e
GHK6uoIgxrq6OBpO0SBZBz6MA50TEbhxGeKfNCdbLKeXOXcOH9c=
=xXPF
-----END PGP SIGNATURE-----

--j2pscfskgm3lsnvh--
