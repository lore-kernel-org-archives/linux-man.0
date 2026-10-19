Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620A047DD44
	for <linux-man@vger.kernel.org>; Mon, 19 Oct 2026 06:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792390846; cv=none; b=rM+jFf7BA/N7h04oZzhTjzfQLIeNu8ISzCwqShIevxu7LvctK4u96B52Ez3yuHidJdaMdSwpWy7qAkBFTNBIXfVVpDPcHLDQNbNYFqJrbiaabi25tyhqD2ogrLzPQUhn36jA/qldhWu1JllRfT293jG7j/OcM568swtKtBxRyVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792390846; c=relaxed/simple;
	bh=m1gTGSFypkhKp9lhbNgnRXwl1g1PuOYkTmBTUWiylso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHuZuvkPnTp65te+sJvTKaPCn1b1T/55DjPIqA0qveTwFstJ8Bk4y3MvIDIxODiW46dbzpAh2oWEsF30/3xUwQTv8YNsgQH0RNn9hfhF7OfOGdiK9y7QR8V4TRWQhT1uJLwi74mlX3E4drwH//8bP9cjX657M6vToVPamkqDTp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JA7B/o5F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JA7B/o5F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA841F000C4;
	Mon, 19 Oct 2026 06:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792390842;
	bh=Ly3x87b9UufgA/6QIZOFGr9DKmBlN1fxivpODPcuqDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JA7B/o5FLcDJK9hwMS/MLHV61KrkNMTwfcSiDQa9LOSsZe87ADlRGr+9fJGIkQy6P
	 T2ArbC7rIbQ+7qVPdQeNhAe3Y3SHcS6EI+ATksq3TKsEMAIo+29rjJhzcp5w2RPlTo
	 woQPZ/o3aFLGiKPLfE8B998mhkOBHuAe30DaaBVBMkut4M7yUfF76iPT+9Y/M660BV
	 P7XPPreK/xaxE+I+CCt61Uo3mwCshWHKnUwYQUDjSoxKQ8UOmfx9+ZrV4acUMwfKry
	 9TDs8HKQFxQXqEXPViIrm1keRlVN+JpxtjjzRLolOkKARHUR2ocayh6ma5xalyOMdW
	 C0VkS1WB8ARFA==
Date: Mon, 19 Oct 2026 08:20:29 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Hugo Buddelmeijer <hugo@buddelmeijer.nl>
Cc: linux-man@vger.kernel.org, g.branden.robinson@gmail.com
Subject: Re: `make -R check` fails due to futex_waitv.2 and console_codes.4
 being too wide
Message-ID: <atW2F1hvJPm2WV5y@debian>
References: <448efb68-e2ff-41d8-a575-97da30e293ff@buddelmeijer.nl>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3mfwrcpqms6bub4y"
Content-Disposition: inline
In-Reply-To: <448efb68-e2ff-41d8-a575-97da30e293ff@buddelmeijer.nl>


--3mfwrcpqms6bub4y
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Hugo Buddelmeijer <hugo@buddelmeijer.nl>
Cc: linux-man@vger.kernel.org, g.branden.robinson@gmail.com
Subject: Re: `make -R check` fails due to futex_waitv.2 and console_codes.4
 being too wide
Message-ID: <atW2F1hvJPm2WV5y@debian>
References: <448efb68-e2ff-41d8-a575-97da30e293ff@buddelmeijer.nl>
MIME-Version: 1.0
In-Reply-To: <448efb68-e2ff-41d8-a575-97da30e293ff@buddelmeijer.nl>

Hi Hugo,

> Date: 2026-10-17 21:19:22+0200
> From: Hugo Buddelmeijer <hugo@buddelmeijer.nl>
>
> Hi Alejandro,
>=20
> Running `make -R check` fails because the text in futex_waitv.2 and
> console_codes.4 is too wide.
>=20
> I noticed this when trying to enable the test phase when updating the
> man-pages package in Guix; see https://codeberg.org/guix/guix/pulls/11893

Thanks a lot for the report.  I'm very interested in having make check
pass cleanly.

> That Guix pull request contains a patch to fix the man-pages so `make che=
ck`
> passes; said patch is attached.

Thanks!

>=20
> Maybe you could device a better patch though, in particular for
> console_codes.  The affected table is much narrower than similar tables, =
so
> some lines that have to be truncated, would easily fit in one of the other
> tables.  But I couldn't easily figure out what determines the column widt=
hs,
> so I didn't fix that.

I think Branden might be better at that; I've added him to CC.

> Also, the Changelog for 6.04 contains some instructions to touch certain
> files to ensure the test suite passes.  I did not attempt to use that
> workaround.

Ok.

> Thanks for maintaining these man pages, they contain such a wealth of
> information.

Thanks!  :-)

> No need to credit me in case you fix these minor things.

I will, anyway.  ;)

>=20
> Hugo


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--3mfwrcpqms6bub4y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrVtp4ACgkQ64mZXMKQ
wqkKKQ/8DeSudEpgCVWGxC4aDx84loG9Puq4DlN7Q5RhY9y71xfOzE2A1Yc3vLil
Kd43FdUU+bGQ4UcPhSSbnBLw2bO1AhECkwA7DEClOwgIZYZqYJ80Y6DVMSbXb0j8
RmTwvmgFY+vYN5bt/P7QzOHPM38lIKO1QxC/r5MjS3IwblmmkkY+bOEbC3Y5qq4J
+vO85KXotSuTE+6M05elAK/n0jupu8C0xiLHs3bFaux534Sm3Ut8kmLlXmN2/PE9
C8mcP/yOU6OPgzvUvslvEgMq4v05VKwPZXVWpWwR+MSA3Bvn5sJ+4Ue8lTVRqwdQ
r3fKzW2e4hOwRLLNWws9QnOH0AaXVBH7qpYKjEm01Muat3NR09T0naUZogMKhdCd
JkVXX6s2nm0K1cFM5JBkdZzq7XL2g2NwqNVYLsuOc7nmdYJozah1/9r7XmTtuhWZ
ogYPyXU4UDzip1LF3w5UBCv3XvaHucPY4ieLkjMHfo6wWvpVMCmTrjkiFsSeqcPa
nKrdcUSagTI0dHPMpncPyijKFZ2n5QvQjU2vQsocNkMpjxN0TRtgBXLlU4v6DL0R
bKzhJ4KAfhHD6+EvVmqhZms1jPxsuAgVrUWt5YioGz96KEt5YY3Pbbv1bNp2kXvQ
iwrShbddZ1/T4hPwaM6Xnz8SIs7S6YiKoiW+f14uabBgGNpr0sI=
=sreD
-----END PGP SIGNATURE-----

--3mfwrcpqms6bub4y--
