Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330473845C2
	for <linux-man@vger.kernel.org>; Sun, 26 Apr 2026 19:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777230943; cv=none; b=aiUkOEudx1bBOBGR/NCssnLsIdPkl4DvuWdLuUv7ya7R142OSZqN9bT9t9i9W18SqQSDBEImaeUT0cc1JpHIC/X9qWYOv8QSPo+XZy+9WRY0uyWdT5Ov91MdwadelLpL+uNA7c0Nq+oTYYh8bh6Pe4BrJLOcpveut07OnDhT1h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777230943; c=relaxed/simple;
	bh=0XQb34ZtiqGIYDPX9rvRsYwZ99AhTPgIECJrayJAAVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwHzAnK6ADlRwJ5Bagr1lZxjnPEA9kqcpQWO3j+zn7fmtH4Hbd5k9NhSd0TrsB6KQjixwW0fBN3LwxmObsj0sjpVmgTfLbq89Iik9F1jFN2zQaiCZ9xi52XqaMvvEMi/KD+sFp52jOH4LyumnLR464giLnFf6vJL90HifmQ9Dzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S9URU04I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S9URU04I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDC2C2BCAF;
	Sun, 26 Apr 2026 19:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777230942;
	bh=0XQb34ZtiqGIYDPX9rvRsYwZ99AhTPgIECJrayJAAVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S9URU04I8twubpguJnG+19Dvm07AtM52HmcHQpOB6GpzQCVUKOIxMpB2XueT0Nzp2
	 Qztx1gmhelHwqgXoe2r+ks+67PifsFDv1dByjCQdhdCiKlWock2hrhI/98zHxz7WbX
	 wkgUTBu3iYqUXeNDRzn7EZoO7e36IuYJqFCZx9jJzj87ZsfKx/CuhRI/KHmPRHcl88
	 L6vjjr2sX8MEkvKoB65b0rqC2dflWgUL1e6VCev4RnSr/5Oxb3IBfZpGyf41hUEmlH
	 RTlDSIZakUNbOOkE0lameQxqcvW15cIdsWLhr7+EB07E8RtCYDLbSYR65+6C7W1cm/
	 58PvlRcv73koQ==
Date: Sun, 26 Apr 2026 21:15:39 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Dorjoy Chowdhury <dorjoychy111@gmail.com>
Cc: linux-man@vger.kernel.org, brauner@kernel.org, jlayton@kernel.org
Subject: Re: [PATCH v2 2/2] man/man2/openat2.2: Document OPENAT2_REGULAR flag
Message-ID: <ae5jY4KyRvZWTzTZ@devuan>
References: <20260426111707.36541-1-dorjoychy111@gmail.com>
 <20260426111707.36541-3-dorjoychy111@gmail.com>
 <ae4MinC7edJZRGFF@devuan>
 <CAFfO_h4cL0nPV8YsSHErJN9fqHy3e4j2C-P-PPUcxr1xAJZ5pQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3llefkyg5qtd7bdk"
Content-Disposition: inline
In-Reply-To: <CAFfO_h4cL0nPV8YsSHErJN9fqHy3e4j2C-P-PPUcxr1xAJZ5pQ@mail.gmail.com>


--3llefkyg5qtd7bdk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Dorjoy Chowdhury <dorjoychy111@gmail.com>
Cc: linux-man@vger.kernel.org, brauner@kernel.org, jlayton@kernel.org
Subject: Re: [PATCH v2 2/2] man/man2/openat2.2: Document OPENAT2_REGULAR flag
Message-ID: <ae5jY4KyRvZWTzTZ@devuan>
References: <20260426111707.36541-1-dorjoychy111@gmail.com>
 <20260426111707.36541-3-dorjoychy111@gmail.com>
 <ae4MinC7edJZRGFF@devuan>
 <CAFfO_h4cL0nPV8YsSHErJN9fqHy3e4j2C-P-PPUcxr1xAJZ5pQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFfO_h4cL0nPV8YsSHErJN9fqHy3e4j2C-P-PPUcxr1xAJZ5pQ@mail.gmail.com>

Hey Dorjoy,

On 2026-04-26T23:39:29+0600, Dorjoy Chowdhury wrote:
> Hey Alex,
>=20
> On Sun, Apr 26, 2026 at 7:03=E2=80=AFPM Alejandro Colomar <alx@kernel.org=
> wrote:
> >
> > Hi Dorjoy,
> >
> > On 2026-04-26T17:14:26+0600, Dorjoy Chowdhury wrote:
> > > Signed-off-by: Dorjoy Chowdhury <dorjoychy111@gmail.com>
> >
> >         Reviewed-by: Alejandro Colomar <alx@kernel.org>
> >
> > Thanks!  Please ping when it's in Linus's tree, so that I'll merge.
> >
>=20
> Thanks for reviewing. I should ping after it's in Linus's tree,
> meaning if it's in Linux 7.2 or Linux 7.2-rc1 ?

-rc1 should be fine.  If anything is eventually reverted, we can fix it
here; no problem.

> Sorry I don't quite
> know the workflow.


> Also I guess I need to look into glibc after it
> gets into Linus's tree, right?

I guess once it's in -rc1, you can start discussing a patch there.
I guess they won't merge anything until it's in the final release, but
you could discuss it earlier, so that it lands there soon after
Linux 7.2.


Have a lovely night!
Alex

>=20
> Regards,
> Dorjoy

--=20
<https://www.alejandro-colomar.es>

--3llefkyg5qtd7bdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmnuZFUACgkQ64mZXMKQ
wqnfwBAAkufv/VbyNryBih5IUcoZspHK+e12GtSsHM0rg8PLaBXPTiY5QqHFlf1F
fmu8jkiMQnal/B3J3Lz0Ec850nvjkaUx80dyH8YkgOkaheD/fjtjpOb0CDwykd0l
Hlpk2y10wrnVfndRcfCJpk5ST2wN+Qh/ys0SGSm4/Cc8LQzx5oH5xF/5jfgV55PI
3jwPcLv09af6Cs08YLEBP6gxktYPvqmrr45EQHKol5RfYVUz7t3G7X6NO+yafbw6
g0Jrk6ajcxDVlSOnG9dqOjEgoTHU8MABdLEEIzFfzgzQDIWJrvs8+qZ79h1ok/Cd
ZS1HGS0N57CwG1n7pw8EDMnDpUh6G1hYm4pMWASY8gGvzy9qXE2mwxMcrOzX4jd1
CdfBBLkd2UEz7sLWTQHsXo61bAL9QO1YNSj3HwzlNHOExUOfJxYWwJ5YUOUIFA5n
nE89zX086CFr6jpYFHDYq5iKeL+MNF5lYQJHpr4H8fAFg43TMGQnndMBQCHor4Ir
1wZn2/idd4gGPu3T4UD6cVA5B3LXGodpp7SDV4BeR2sIvZkhxNtrajN8hmK5/7tv
Z74TpmR6dDmFOVic521pcjYWn8jy5lst54Dkd6xK42P2Gd1aMyuDafN2AMiupkFQ
Be1hz2000tDDxJ7wfKdV2fWY/uAbVyH7FEYCmMcCdugBPjbKdPs=
=p+cl
-----END PGP SIGNATURE-----

--3llefkyg5qtd7bdk--
