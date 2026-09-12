Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090B347ECDE
	for <linux-man@vger.kernel.org>; Sat, 12 Sep 2026 13:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789220507; cv=none; b=OBV5ibj2i7FFRp+cM48t1vtgQ98SXNZX+4JIzvZ7gY+9GF13Z2mOYvHEOPIiMKElNy/4O7FcM+AXeK8nw9AZFvOiIkwrClYGlSbHNg1hIWznvPLj+FhZUh4EGgA3+aNDftNaNfze3zAN4iLjyOpHGIeT5QHjgyBRXEsBljrgr+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789220507; c=relaxed/simple;
	bh=seDL9XqNyqjiaOYQfhHrTG3kSDvPkkSfWitYGB++Yzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avxfbVXmxE3oN9KMvDrRpyWrXD+X/EL+DiG1pH/+y/Xu/91LEhQSTgnLJcXnmJd+wJikN1qGyZa3279A4SRPkj7rJ8G0yzzAePte0q2E7Pzb2cI1ItRLrhJNhsO5i2OaxL3Z118j3Z2LyCwi4NtO3FJ3vH+MeQ773qVUGyo/3ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKIT0GS4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKIT0GS4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D86BB1F00893;
	Sat, 12 Sep 2026 13:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789220505;
	bh=85ZUnXz0bkMT75Yo5yYBM1iDBkoKsdWIpW9vbdBuw04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EKIT0GS42aJ+YbEKViBk5r40GUbHcthhvt2DSI+f2iPVwew91zmr/iCfGwvnmWhoF
	 /Y25Du4hDQHzEE+0GWHZz09lHdFpJESVFLOAorefKK6hhQrjF3bBHQp+1VQfMAGUDZ
	 ThnG87kZrBC2YNtY24OApyI2j/dk8Yp5PjhjIjhwHq45FTzjGijlADxsQNhJLWhinz
	 EA+x15IDafeoNbnZXUAixlQ2K7nb8O9NT1QmXcAxstMhNGkeXA0Dp4pW7FdiKa+w4R
	 WLn0LcaiU0yDVJhvhbjZ09WIx0DL1kRL+Xkq6kGq1DMHgrS7uVOP1EX3X1mBt5d6FL
	 8m1sImdv2IzzA==
Date: Sat, 12 Sep 2026 15:41:41 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Max Chernoff <git@maxchernoff.ca>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 3/3] man/man7/capabilities.7: CAP_MAC_ADMIN allows
 setting undefined SELinux contexts
Message-ID: <aqVWdILY1dRay2EM@devuan>
References: <2129b0c39ad5248641f24b43a4b1750bb62be43f.1789212041.git.git@maxchernoff.ca>
 <bed5f1b68369af7e6a5cd5ebae8eb8ecfa7ef441.1789212041.git.git@maxchernoff.ca>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zrx7keit4zstckjc"
Content-Disposition: inline
In-Reply-To: <bed5f1b68369af7e6a5cd5ebae8eb8ecfa7ef441.1789212041.git.git@maxchernoff.ca>


--zrx7keit4zstckjc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Max Chernoff <git@maxchernoff.ca>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 3/3] man/man7/capabilities.7: CAP_MAC_ADMIN allows
 setting undefined SELinux contexts
Message-ID: <aqVWdILY1dRay2EM@devuan>
References: <2129b0c39ad5248641f24b43a4b1750bb62be43f.1789212041.git.git@maxchernoff.ca>
 <bed5f1b68369af7e6a5cd5ebae8eb8ecfa7ef441.1789212041.git.git@maxchernoff.ca>
MIME-Version: 1.0
In-Reply-To: <bed5f1b68369af7e6a5cd5ebae8eb8ecfa7ef441.1789212041.git.git@maxchernoff.ca>

> Date: 2026-09-12 05:32:13-0600
> From: Max Chernoff <git@maxchernoff.ca>
>
> Link: <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/commit/?id=3D12b29f34558b9b45a2c6eabd4f3c6be939a3980f>
> Signed-off-by: Max Chernoff <git@maxchernoff.ca>
> ---

Reviewed-by: Alejandro Colomar <alx@kernel.org>


Cheers,
Alex

>  man/man7/capabilities.7 | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/man/man7/capabilities.7 b/man/man7/capabilities.7
> index bb8f6d9db433..8813ff81f0ea 100644
> --- a/man/man7/capabilities.7
> +++ b/man/man7/capabilities.7
> @@ -210,8 +210,16 @@
>  .BR FS_IOC_SETFLAGS (2const)).
>  .TP
>  .BR CAP_MAC_ADMIN " (since Linux 2.6.25)"
> -Allow MAC configuration or state changes.
> -Implemented for the Smack Linux Security Module (LSM).
> +.RS
> +.IP \[bu] 3
> +.PD 0
> +For the Smack Linux Security Module (LSM),
> +allow MAC configuration or state changes;
> +.IP \[bu]
> +For the SELinux LSM,
> +allow setting undefined security contexts on inodes (since Linux 2.6.27).
> +.RE
> +.PD
>  .TP
>  .BR CAP_MAC_OVERRIDE " (since Linux 2.6.25)"
>  Override Mandatory Access Control (MAC).
> --=20
> 2.55.0
>=20

--=20
<https://www.alejandro-colomar.es>

--zrx7keit4zstckjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqlVpQACgkQ64mZXMKQ
wqmW9A//Tgw9rSGKnl1ime9dU6cF0nghFyHfxZYNdVKJnEJgUr5G9+ZBGcO0NH1y
Wl0x4Hykp2vInnFh4Uxk/ByG0bpa9uyusPIQU+ZxkLvI81JyP81Uo+J9VqwjLrDA
N/tYNNS4LTWvmSgiUMasblTjVGUohZvHaACaaKesRvSPmfur8pA81Acm34W4/UU0
O8ZBh7NfFCshZU6BMH6OD0UepUG5FpqvUAU3iJmQLzi4B15Uxh3hI74JLKfajq+1
G2wZD/UCv87WaaQB1Yiiy17tdCslcu+RCIpT+xJGMXoz/rFqjezCmoC+aBl3N4Nl
OkPyV8KBKinNuamimbU2WDnZJcVqg02yXtIINUodz2rA0V0Vw8HcoPw40qHJsIRn
ZuhTgDmO9gb/4B/GMARX0Av2Tg1gD1esMw5CBsuvHUoiOy7AE8jssbZmtTPpkCw5
NtlgyFsxLrrPbgouZ7AFCcvWyN4CpSesFfusv4ZMG7yP4I97/O5v22kRMsQ8MYP/
2H3i0adX+Li6Ns32YYPBD1LP4ECKU2Hgkbh374lxCojiDdLWjTbF8sXo3o9LW7uM
Bp/bfM5ETH+pl6GW1E1IbugPpC5lQsvd5sS1iUQDQwTCE7iJeKd9eUrKIuwuTfdY
u4mTaSDQ4hkoxT+L019BiHf7+6p3UgMnGRCTrsnLSlabPCPG3as=
=B+Ve
-----END PGP SIGNATURE-----

--zrx7keit4zstckjc--
