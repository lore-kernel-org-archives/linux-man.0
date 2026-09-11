Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AFE30C14A
	for <linux-man@vger.kernel.org>; Fri, 11 Sep 2026 00:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084947; cv=none; b=BApFJpOx+P2AyBsFashu5160tMk+5gl3vzKLgbYe93e9AeE4kFAoTaT2TXmX4Jqsgb0+J4Eo8oUbsx71O9xOkJrwwn7gP0FXTUkrnCnDAuO0TKAwvuGQbb+RH8FSX+PbHhDtu3KsMWQizTfCWLM+WqYekxqqkHDaPMjnJI01r9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084947; c=relaxed/simple;
	bh=Lj8Er/VNweJ2Od78cYSZ12alaoVW7wCpTilKBWCpfBM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jF6YWUUVi5Iu0empSFkLTO/Do8zglnJrTQDH9Aj+y+67CY1MZSzjV8V9oJsBzWl/8JSiVsH2JgamoP5rSHIr1PaQTCxX5Uwk+CmftVXgZdeqEO/Y2xX9O9aX5WfnuIEwhDBCy1kjB52Z3IaxAftIDHAZIxmPOvTe86nP9I99YTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iw8ru10Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iw8ru10Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BDFB1F000FF;
	Fri, 11 Sep 2026 00:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789084946;
	bh=S+Vie0R6lahFmP1MngoSvROaPe7QsWvYvYTifN2VRSw=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=iw8ru10YwfwUk1EeJolwXniemrZ7p4hzLxTPF87CcjMimxF5GeO4/DZpCRl0hVlqB
	 yvYsZ+2fQagc5Htajd/RXj7CTB6nBJneehhsFj5o+Ue/YbpB6y4SYIFjAV1zidumpC
	 7PkO0r9hNm617qVd8hVdQVmjUY8HomrhPlGGn0eDqxrVXJ/okYcbJV0FCyeGk3OQM6
	 C6YerUs04N603g78nnmeKZS6mNcDFi0OJRO9g5t/8lCZrMYx7EQ4C2/xwSFsRROYYZ
	 2JYahNpJc0mPsmdbPFOYOcGVVecIARw9/Fmo0N+fVIiU6rKmjOvyNnIlYvIBksa9XZ
	 a5ZkZNt9xgElg==
Date: Fri, 11 Sep 2026 02:02:22 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	linux-man@vger.kernel.org, groff@gnu.org, man-db-devel@nongnu.org
Subject: Re: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
Message-ID: <aqNEgI2zt2viHDJb@devuan>
References: <20241015211719.1152862-1-irogers@google.com>
 <20241101132437.ahn7xdgvmqamatce@devuan>
 <CAP-5=fXo5XjxUXshm9eRX-hCcC5VWOv0C5LBZ3Z0_wQb+rdnsw@mail.gmail.com>
 <20241101200729.6wgyksuwdtsms3eu@devuan>
 <20241102100837.anfonowxfx4ekn3d@illithid>
 <ZyZ4Tfxfr7M-EqUo@riva.ucam.org>
 <20241103005023.kdv5bkpqkpmsom5g@illithid>
 <ZybX9q_zReTgdMxU@riva.ucam.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l2d5qtvzuart3oxm"
Content-Disposition: inline
In-Reply-To: <ZybX9q_zReTgdMxU@riva.ucam.org>


--l2d5qtvzuart3oxm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	linux-man@vger.kernel.org, groff@gnu.org, man-db-devel@nongnu.org
Subject: Re: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
Message-ID: <aqNEgI2zt2viHDJb@devuan>
References: <20241015211719.1152862-1-irogers@google.com>
 <20241101132437.ahn7xdgvmqamatce@devuan>
 <CAP-5=fXo5XjxUXshm9eRX-hCcC5VWOv0C5LBZ3Z0_wQb+rdnsw@mail.gmail.com>
 <20241101200729.6wgyksuwdtsms3eu@devuan>
 <20241102100837.anfonowxfx4ekn3d@illithid>
 <ZyZ4Tfxfr7M-EqUo@riva.ucam.org>
 <20241103005023.kdv5bkpqkpmsom5g@illithid>
 <ZybX9q_zReTgdMxU@riva.ucam.org>
MIME-Version: 1.0
In-Reply-To: <ZybX9q_zReTgdMxU@riva.ucam.org>

[CC trimmed]

Hi Colin,

> Date: 2024-11-03 01:55:02+0000
> From: Colin Watson <cjwatson@debian.org>
>
> On Sat, Nov 02, 2024 at 07:50:23PM -0500, G. Branden Robinson wrote:
> > At 2024-11-02T19:06:53+0000, Colin Watson wrote:
> > > How embarrassing.  Could somebody please file a bug on
> > > https://gitlab.com/man-db/man-db/-/issues to remind me to fix that?
> >=20
> > Done; <https://gitlab.com/man-db/man-db/-/issues/46>.
>=20
> Thanks, working on it.

I accidentally found this email (preparing for reporting some unrelated
man(1) bug), and checked that the gitlab issue is still open.  Just
wanted to ping you about it, just in case.


Have a lovely night!
Alex

>=20
> > > I already know that getting acceptable performance for
> > > this requires care, as illustrated by one of the NEWS entries for
> > > man-db 2.10.0:
> > >=20
> > >  * Significantly improve `mandb(8)` and `man -K` performance in the
> > >    common case where pages are of moderate size and compressed using
> > >    `zlib`: `mandb -c` goes from 344 seconds to 10 seconds on a test
> > >    system.
> > >=20
> > > ... so I'm prepared to bet that forking nroff one page at a time will
> > > be unacceptably slow.
> >=20
> > Probably, but there is little reason to run nroff that way (as of groff
> > 1.23).  It already works well, but I have ideas for further hardening
> > groff's man(7) and mdoc(7) packages such that they return to a
> > well-defined state when changing input documents.
>=20
> Being able to keep track of which output goes with which input pages is
> critical to the indexer, though (as you acknowledge later in your
> reply).  It can't just throw the whole lot at nroff and call it a day.
>=20
> One other thing: mandb/lexgrog also looks for preprocessing filter hints
> in pages (`'\" te` and the like).  This is obscure, to be sure, but
> either a replacement would need to do the same thing or we'd need to be
> certain that it's no longer required.
>=20
> > > and of course care would be needed around error handling and so on.
> >=20
> > I need to give this thought, too.  What sorts of error scenarios do you
> > foresee?  GNU troff itself, if it can't open a file to be formatted,
> > reports an error diagnostic and continues to the next `argv` string
> > until it reaches the end of input.
>=20
> That might be sufficient, or man-db might need to be able to detect
> which pages had errors.  I'm not currently sure.
>=20
> > > but on the other hand this starts to feel like a much less natural fit
> > > for the way nroff is run in every other situation, where you're
> > > processing one document at a time.
> >=20
> > This I disagree with.  Or perhaps more precisely, it's another example
> > of the exception (man(1)) swallowing the rule (nroff/troff).  nroff and
> > troff were written as Unix filters; they read the standard input stream
> > (and/or argument list)[1], do some processing, and write to standard
> > output.[2]
> >=20
> > Historically, troff (or one of its preprocessors) was commonly used with
> > multiple input files to catenate them.
>=20
> But this application is not conceptually like catenation (even if it
> might be possible to implement it that way).  The collection of all
> manual pages on a system is not like one long document that happens to
> be split over multiple files, certainly not from an indexer's point of
> view.
>=20
> --=20
> Colin Watson (he/him)                              [cjwatson@debian.org]

--=20
<https://www.alejandro-colomar.es>

--l2d5qtvzuart3oxm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqjRQ0ACgkQ64mZXMKQ
wqlx3Q/+PKJSJRZSxmIJN/ksCDrReywSZ7t/j4GJ5veKxw2wMYFNcO976Bjt3n57
FCKrhgd+PTYaEDk1zDu/jKGX1gHESA5njf5upggaCGQJ5vpyST4fPWClrhX+muvx
50Z4B1BVfT5t5nBVPXy91X8Z9W7+f9ccGxVqD4QT0RYGDx7dGqJFW+2uqFbtaP1d
WgOm2n3MeeVk/veFWaQtk/nDijCk+0PfzQxVOyLGIsf1ehTL9KH8lT7m/H8yeZpw
BI0gtJ/cO/kzAAmr7n3+HaUuzozo5FiQVXR1LQOBOEFaGfy3UK8KRiqqSGVJhyNj
dQzq/p9Fl5Ctwi+8bXqp/dsEXlpMF8Bpa94XOqqgILWGiCYsxYWauzRQ2vVJHPrn
Q0JQKFwucEGLk3D4OpmqwUk9KEFMiNmWAWretKwbQ5be34kgd/oFZJLxHvl+3oX0
oOtoOyr8Ty0EEBApiNdHJxZmdCJm5MiyJOzsp3XNHbBQUqRw17gIftb23pCmMV+H
8Aml5jP8TI8pVFIgI3PFxWnfovrOVR9lOG8G7Yed9CfHdJxGj7Wwgk7ml5j+Eo7W
HLBQu8OlPJnYpUh1oLSXv9x/G9OfpETR6pKM1MZEcJGR8qWGX7G/rtAfwy4ccj2K
/S7KeP4onDETzX4Aa7yCl2ouT3GKgxvqZPneQ076cJAcFovT+M4=
=ZQnN
-----END PGP SIGNATURE-----

--l2d5qtvzuart3oxm--
