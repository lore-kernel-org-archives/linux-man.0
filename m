Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE41747C111
	for <linux-man@vger.kernel.org>; Sat, 12 Sep 2026 13:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789220114; cv=none; b=VdukRBOWxbH7Aqw89hK/TIlvlSplBnW0btSGzrQgHgn2Sx6eT4D8Qa/RsCms2IXIi4Y8lA/Jcu6TISlRGCERwAmK84bs+T6YFdOA0+AXO0xaoLooEQi3MEgA/Jo2r4TYe0GOoXTKtEW1pgv8Baq8HYSrmRzc5a9FHPlIzUMRKvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789220114; c=relaxed/simple;
	bh=kXL/xeet1b9udkFX7IJdmpgB/cAcS5ztLpcyBE+MA3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HC/TbSLYMK8lPses1mJ3GDs8m958XQJQDkmC7GqTT2td0pA9jZLzXRzXK9sCmjf7YEVg4eQk/aoz5hfB02bR9YK4EJKHZVpYIgsiiRSAcYH2eIZ9lyvPm6S2qyY7wq3bDlDV6yD6QDn5i87NtZIpBHY6Om2xrIKoppffqZUg998=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQTAB0bM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQTAB0bM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96DD1F000FF;
	Sat, 12 Sep 2026 13:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789220112;
	bh=M/jTqwuH+6tbctWNOMzMoLnR1U1T8/ckpqAoWSpg0IM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UQTAB0bMzFEhtwu321++14+q7IyDRhHGsycJF2dDm0rngychGrx4I2UTZsZCxuKw0
	 VC78iBRuyuvZkDyX8AGroE/FpwLrxQA9ponOSj+WN3YFNDnVeiS/6AVFh6d4e/j8pJ
	 JDif85cd/DtnOHqNk0lr7plkIJ+HQWVTp850Xub4YgHip8I2524HblpVLgHeA3UqHo
	 omwvFs7YYHcv6UT4R3OoazZNbmoZxZ59pFnneuOislfA4FwclwIRW34k4h6FNwO12Z
	 MYO6BgR2GHk/uegMVgatYygHyfr66RUEbSOQvJ/qH4/S2M4MFWYLJkb5f9bL4lWYMs
	 aSMs6BHzB2iHQ==
Date: Sat, 12 Sep 2026 15:35:09 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Max Chernoff <git@maxchernoff.ca>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 1/3] man/man5/proc_pid_smaps{,_rollup}.5: Add
 proc_pid_smaps_rollup(5)
Message-ID: <aqVUfFdWaHxWvBWf@devuan>
References: <2129b0c39ad5248641f24b43a4b1750bb62be43f.1789212041.git.git@maxchernoff.ca>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2ugvonblzv4iitrd"
Content-Disposition: inline
In-Reply-To: <2129b0c39ad5248641f24b43a4b1750bb62be43f.1789212041.git.git@maxchernoff.ca>


--2ugvonblzv4iitrd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Max Chernoff <git@maxchernoff.ca>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 1/3] man/man5/proc_pid_smaps{,_rollup}.5: Add
 proc_pid_smaps_rollup(5)
Message-ID: <aqVUfFdWaHxWvBWf@devuan>
References: <2129b0c39ad5248641f24b43a4b1750bb62be43f.1789212041.git.git@maxchernoff.ca>
MIME-Version: 1.0
In-Reply-To: <2129b0c39ad5248641f24b43a4b1750bb62be43f.1789212041.git.git@maxchernoff.ca>

Hi Max,

> Date: 2026-09-12 05:32:11-0600
> From: Max Chernoff <git@maxchernoff.ca>
>
> Document /proc/pid/smaps_rollup, which is similar to /proc/pid/smaps,
> except it merges all mappings are merged into a single synthetic
> entry [1].
>=20
> Also, add a better description to the NAME, following the discussion
> in [2].

Thanks!  Although I'd prefer the renaming to happen in a separate
commit, please.

> Link [1]: <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
=2Egit/commit/?id=3D493b0e9d945fa9dfe96be93ae41b4ca4b6fdb317>
> Link [2]: <https://lore.kernel.org/lkml/3f250c7105010613115554b9d9@mail.g=
mail.com>

Would you mind quoting the most relevant lines of it?  It seems a long
discussion.

> Signed-off-by: Max Chernoff <git@maxchernoff.ca>
> ---
>  man/man5/proc_pid_smaps.5        | 7 ++++++-
>  man/man5/proc_pid_smaps_rollup.5 | 1 +
>  2 files changed, 7 insertions(+), 1 deletion(-)
>  create mode 100644 man/man5/proc_pid_smaps_rollup.5
>=20
> diff --git a/man/man5/proc_pid_smaps.5 b/man/man5/proc_pid_smaps.5
> index 9c433dbc1e60..51440cc13bf6 100644
> --- a/man/man5/proc_pid_smaps.5
> +++ b/man/man5/proc_pid_smaps.5
> @@ -7,7 +7,7 @@
>  .\"
>  .TH proc_pid_smaps 5 (date) "Linux man-pages (unreleased)"
>  .SH NAME
> -/proc/pid/smaps \- XXX: What does 's' in "smaps" stand for?
> +/proc/pid/smaps, /proc/pid/smaps_rollup \- size of mapped memory regions
>  .SH DESCRIPTION
>  .TP
>  .IR /proc/ pid /smaps " (since Linux 2.6.14)"
> @@ -125,5 +125,10 @@
>  file is present only if the
>  .B CONFIG_PROC_PAGE_MONITOR
>  kernel configuration option is enabled.
> +.TP
> +.IR /proc/ pid /smaps_rollup " (since Linux 4.14)"
> +This file is similar to
> +.IR /proc/ pid /smaps ,
> +except all mappings are merged into a single synthetic entry.

LGTM.  Thanks!


Have a lovely day!
Alex

>  .SH SEE ALSO
>  .BR proc (5)
> diff --git a/man/man5/proc_pid_smaps_rollup.5 b/man/man5/proc_pid_smaps_r=
ollup.5
> new file mode 100644
> index 000000000000..4b5f9eba0484
> --- /dev/null
> +++ b/man/man5/proc_pid_smaps_rollup.5
> @@ -0,0 +1 @@
> +.so man5/proc_pid_smaps.5
>=20
> base-commit: 59ba1c34fb6538206e96597739f053183d1e6428
> --=20
> 2.55.0
>=20

--=20
<https://www.alejandro-colomar.es>

--2ugvonblzv4iitrd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqlVQcACgkQ64mZXMKQ
wql0PBAAp+ob3fospu0+89itIr2LnCAecxoc6MwSCSqBIh/11T48wDPIicG4cbd2
M5KZIrAjBtQEicpSf+T6R/ZcM6rVPNyA5flJk/QR+AjgCkzwOoafBD9hQVRsKmg9
iSVve2rSBhfuVBR2hA0JEmUj2A85cR2CvIiqrKO0EjHXEIdwv+KZJJpBwH/M4cD9
FgNReOn93eQGYIPj0gf1aQsb00xlspVLJi1oIbnnp0o6PFqJVFMKbbKoa/tRF6nT
BeMLHhtcA3eDcVjl+2l6tYHwr/ktgoxdlpoh5cO811qoeva6o1X7a6XYXWD8RZ4j
sKZjUzq8ulzBCwW+WoTgzm1zcJ5pdMSn1vEDmg//wBclfToOD9z+/mjVCKHHUxDv
A81sjh53u+XLyvZeS0Wx1LoAX0+9cG5o9TvSne8Xx3o/IlEwFKOnPq1SQXkgCpn+
Q9bO+E32KIMsM7vz75YQVZ30Ho72P34llAzjhPWTpL2zULeNaEnBILoSTcjUxJth
pK+ekf3A4QIEihvtkihjCToh2zOQ+X2e+odeZIzo9dbDAQASTHgfqMJDWSEX3fuQ
nhaWCxZaAI4Do0TH60T7cq73DeJYA9wRtsks1Fv0VXbhtkYnCf8zM0EJq30qpmf+
N+M9N5D8v56fMjBN9cpDw78JbHSX6cfus3geG+vjgTVTfDdCO2o=
=/9R2
-----END PGP SIGNATURE-----

--2ugvonblzv4iitrd--
