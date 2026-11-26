Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795733549;
	b=S1wWbgK1njlnlgMJJlRG6n4dkrTg6QQbtnI21ngAWxeBe1aRqKHA6OMQXc2wnASA/ZnA
	 WWQF7NCDnretowDODNT7SKGX2uelmguECiHAkjoQIe5xNd2o558U6ygmznexaE7Xb4PlX
	 axdpMoBABZuvheGcXahtJltsST80Al7vx18OQczrpnwOPWkt5LaiHkf7rshUV6fDVQMlA
	 rdveOt+Ra+iOssCG9001gIn50n9guL7uS4rb0brFeMQnWp5AnndrTEZqR0YdlQuOoOO9Z
	 NaeWcC8sRmh9M1diOEY3mmEi+wYWsCZKgEYPrORPGG7w28IV0UHSBTckYHkov6Xuv3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795733549;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=petekXcNUk6E3RWXbeuY3WGDFNPeGikzoNA/+h6l03I=;
	b=rtJKclSHfB4q1kyWTUJ4maEzDWQ3RwR6p1oGXV4Uqw8U7rgXY4AXUp8Tl3HY1bHDpL5q
	 6nSi1EtLY7FppFpZGkk1SPoGc9EIzYF5Pj/r6e03mSdZKm2iz03r2wTIwD8Uv6NRjLKEv
	 1tP2lZHXcPa8aiBiz8MtHmurLFzeq6dCUSsjl8F6sDIoR4vSLBp5I4iJfBC4z2Q22QiAr
	 Up1tfd7JaktR0aAEG1OFDF2/F+RWwH+Co45vOPNm+9R8NLQYllRbyIXUosdIdp4x4Zb4A
	 be18W+hO0737kJUF7mtiXOpNP7wEnyd+4lBWfgzsS9X9mcE+OGY+itWgwQyAMMrQ+xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ULsObJyW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F66606A329
	for <linux-man@vger.kernel.org>; Thu, 26 Nov 2026 22:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ULsObJyW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3D41F00896;
	Thu, 26 Nov 2026 22:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795733549;
	bh=petekXcNUk6E3RWXbeuY3WGDFNPeGikzoNA/+h6l03I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ULsObJyWdHcBsHd8uXSSZo5ySXtUckg94Af2cVBxt7dQa/518Ujc5CoAbuz7e4ovg
	 TuSgtC+6g1Nkgd9GwYcGx9wa3xLoAZnmjFV054G/WUM4J+mMBAzJgpmGCI5b6kHe0G
	 OVl61H2TnHhBnp1Px0nqyORpw3UuIAUTYCGSYK0fZh1gtbKm5sWcUD08NunEEjz/PL
	 3Sp4SoNUmgGzB83Y22shfZxPE69PjnBdG7HHKhcdlQ6g9EOL7oaXzPZuRQ6glDr6xB
	 l+/x/MKIBh2fza+Kl5AWGKGjTilte7E5RVf4MrPf02ys1lln9anVcG5SMFQbs16H1d
	 bktdDXqWIpbQQ==
Date: Thu, 26 Nov 2026 23:52:26 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Cesar Eduardo Barros <cesarb@cesarb.eti.br>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v1 1/1] man/man2const/PR_SET_PTRACER.2const: Document
 EINVAL when Yama is not configured
Message-ID: <awi38FFdYc0xnWEG@devuan>
References: <au8GKjxzoGpp4MqU@debian>
 <cover.1795289695.git.cesarb@cesarb.eti.br>
 <cfc899195f8d66e3846133e0488d713d6eaf975c.1795289695.git.cesarb@cesarb.eti.br>
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
	protocol="application/pgp-signature"; boundary="hcvt3guphlvrg3e5"
Content-Disposition: inline
In-Reply-To: <cfc899195f8d66e3846133e0488d713d6eaf975c.1795289695.git.cesarb@cesarb.eti.br>


--hcvt3guphlvrg3e5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Cesar Eduardo Barros <cesarb@cesarb.eti.br>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v1 1/1] man/man2const/PR_SET_PTRACER.2const: Document
 EINVAL when Yama is not configured
Message-ID: <awi38FFdYc0xnWEG@devuan>
References: <au8GKjxzoGpp4MqU@debian>
 <cover.1795289695.git.cesarb@cesarb.eti.br>
 <cfc899195f8d66e3846133e0488d713d6eaf975c.1795289695.git.cesarb@cesarb.eti.br>
MIME-Version: 1.0
In-Reply-To: <cfc899195f8d66e3846133e0488d713d6eaf975c.1795289695.git.cesarb@cesarb.eti.br>

Hi Cesar,

> Date: 2026-11-21 16:48:07-0300
> From: Cesar Eduardo Barros <cesarb@cesarb.eti.br>
>
> The man page for PR_SET_PTRACER mentions three cases in which
> prctl(PR_SET_PTRACER, ...) can fail with EINVAL, but there's a fourth
> case: when CONFIG_SECURITY_YAMA=3Dn
>=20
> The code which deals with the three currently documented cases is at
> security/yama/yama_lsm.c which is only compiled when "Yama support" is
> configured.  When it isn't, it falls through to the default case at
> kernel/sys.c which returns EINVAL.
>=20
> Fixes: 6f86bef66936 (2013-01-11; "prctl.2: Document EINVAL error for PR_S=
ET_PTRACER")
> Signed-off-by: Cesar Eduardo Barros <cesarb@cesarb.eti.br>

Thanks for the patch!  I've reworded it to be consistent with similar
pages, such as unshare(2).  Here's what I applied:

	commit 5a70354bca4d025720565e1e506c8adab62a01bd (HEAD -> contrib)
	Author: Cesar Eduardo Barros <cesarb@cesarb.eti.br>
	Date:   2026-11-21 16:48:07 -0300

	    man/man2const/PR_SET_PTRACER.2const: Document EINVAL when Yama is not =
configured
	   =20
	    The man page for PR_SET_PTRACER mentions three cases in which
	    prctl(PR_SET_PTRACER, ...) can fail with EINVAL, but there's a fourth
	    case: when 'CONFIG_SECURITY_YAMA=3Dn'.
	   =20
	    The code which deals with the three currently documented cases is at
	    "security/yama/yama_lsm.c" which is only compiled when "Yama support" =
is
	    configured.  When it isn't, it falls through to the default case at
	    "kernel/sys.c" which returns EINVAL.
	   =20
	    Fixes: 6f86bef66936 (2013-01-11; "prctl.2: Document EINVAL error for P=
R_SET_PTRACER")
	    Signed-off-by: Cesar Eduardo Barros <cesarb@cesarb.eti.br>
	    Message-ID: <cfc899195f8d66e3846133e0488d713d6eaf975c.1795289695.git.c=
esarb@cesarb.eti.br>
	    [alx: reword]
	    Signed-off-by: Alejandro Colomar <alx@kernel.org>

	diff --git a/man/man2const/PR_SET_PTRACER.2const b/man/man2const/PR_SET_PT=
RACER.2const
	index 48bd8f04e104..b07ee5ae4d2d 100644
	--- a/man/man2const/PR_SET_PTRACER.2const
	+++ b/man/man2const/PR_SET_PTRACER.2const
	@@ -57,6 +57,9 @@ .SH ERRORS
	 is not 0,
	 .BR PR_SET_PTRACER_ANY ,
	 nor the PID of an existing process.
	+.TP
	+.B EINVAL
	+Yama support is not built into the running kernel.
	 .SH STANDARDS
	 Linux.
	 .SH HISTORY


Have a lovely night!
Alex

> ---
>  man/man2const/PR_SET_PTRACER.2const | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/man/man2const/PR_SET_PTRACER.2const b/man/man2const/PR_SET_P=
TRACER.2const
> index 48bd8f04e104..b07ee5ae4d2d 100644
> --- a/man/man2const/PR_SET_PTRACER.2const
> +++ b/man/man2const/PR_SET_PTRACER.2const
> @@ -57,6 +57,9 @@ .SH ERRORS
>  is not 0,
>  .BR PR_SET_PTRACER_ANY ,
>  nor the PID of an existing process.
> +.TP
> +.B EINVAL
> +Yama support is not built into the running kernel.
>  .SH STANDARDS
>  Linux.
>  .SH HISTORY
> --=20
> 2.56.1
>=20

--=20
<https://www.alejandro-colomar.es>

--hcvt3guphlvrg3e5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmsIuCkACgkQ64mZXMKQ
wqlJkQ/9Gc0fjvVyvbDlTtnhtU7whCOfGo4HyUeysFBMT8SOPykqBUScxlDRIfoT
Tlbn+yqdg+LX7XsX3me+KJimR0Ag/8MWB/mDCkngamVb81vTzkfn6TfiC2wzq/pa
/+I2zbWbCP5BM5Cv05zAXof/Bgn09HyrB+T2odCRRgA4hCy9wNBN1yuZZJdLI+eB
s5mFp3GymKosvVP/QzOs7cVdeE3Osi3hpNua0vYszyQ4/KlgKXJ9zbwouTN2dCr5
wK1XAfnXoHkz4040u2/nA1go+pQ7DDaZlgzOffgvsW/2bRasf1vQkDv9P2B0Iiup
9GG/4Ibo/xw4jjcZb3S8cm2KZsLPummhPlOa+FJsDT3bUa7owdK0CT29XRo1Swli
dHYTPYTtzFD5I03316aKTnBzUfrqzqu4A4Q9Dl7rDvhW0rf20vDMuBMGwEx9llD+
MUZxDrm8FnoVW/EgNPbnjBsURrcdKtgYPyuwSYheQ2rmjHN8nqgkwEdx0XNbfTdi
P9jPOYkz+CM6ZNifPh8YBw8XwiDidyuVF2t9Al2U5h0PYXyn3fvnNc0c5alyrc1K
EnbRyMBXwXIhpoZrXkOegiH0MiOAvYCMCHKMMlHFyibV2LjL9pijWILvilNKdAFb
aDF4DBHV8w55fQFNazeeF1WXtAIRbGqHzpcoVsS2WMlTPkq5uOY=
=t0Rk
-----END PGP SIGNATURE-----

--hcvt3guphlvrg3e5--
