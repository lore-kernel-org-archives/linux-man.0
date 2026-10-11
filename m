Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520DB314D05
	for <linux-man@vger.kernel.org>; Sun, 11 Oct 2026 17:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791738577; cv=none; b=eW5AYs9k3eHyw1cSVOWCvgbDbsQNUCoelycf88fNXFjp3zT9XKV2Zl1uzr+Z1r2/ADpdg5lkJB4/+V7U6FhCMDvNvwkgc2ppAxswdksSWJV5162kpPpo7yVRzQi4RE+WVhtU7zkvf3tehJcGmW9/ntpotxqbBYb6JuwLLdd+N6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791738577; c=relaxed/simple;
	bh=LbJjShGS/dxOjAFDBQRWMECB6J0ej/iFM9fJrgftEi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVpXFV2SuMxdETeqq3ZQWiCDK73V6uObd/EbP9+AgwTf++hC9we7jSjRW+c3/oVOEUg9hst0m4tMAnG1EIwnQSnAXUYVrZJTR+pdxCffUO9MFqztTsmAyAZfL1I+579QA9bRS/FQs1b5ZLkdGtECVU+lb666BKfJKEBRMKFoZx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHBN1mHp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHBN1mHp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A271F0089B;
	Sun, 11 Oct 2026 17:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791738576;
	bh=6VoMICcAuo7uqWgBFc/cyCs3kRk6Q/ZagIIpFNnYqqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZHBN1mHpR1wmXgnaQah7u74aHb3EbzFVENdi3PUpn9n36GZv9slg2ycXabRcU55UV
	 KSaX7gMTSR7a8hYIg7hDeLmbPeFOGxSm7MZZd5COdra8H1YeD+l/8UjgGTKbazaxo8
	 4msNLIbxGHIT8ev+K2+jJDEoiN+up6M/ashyuY5ZwDGomRyGn4rhymmc3ZPyD6vxzj
	 p9PYs+8Ek6jIyuNempBfldBhHrshUXaIvBi9zNK9M/cQe9TeNJsIP/IosUSgNgZZds
	 vZAJkZ5lXbwYd4XkEqqRo+TPiSYWBETCi6ZNtnJEjqLe3GjodOL1+8D0vpYiEROYYt
	 k/WuuCpKvaMwQ==
Date: Sun, 11 Oct 2026 19:09:31 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
	linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man7/landlock.7: Document whiteout object
 peculiarities
Message-ID: <asvCjvg6nGJafgdv@debian>
References: <20260828160340.11238-2-gnoack3000@gmail.com>
 <apHkx3LvRyqYIB2F@devuan>
 <20260926.919c130a1a6b@gnoack.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bfuvmjvownh6gkb4"
Content-Disposition: inline
In-Reply-To: <20260926.919c130a1a6b@gnoack.org>


--bfuvmjvownh6gkb4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
	linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man7/landlock.7: Document whiteout object
 peculiarities
Message-ID: <asvCjvg6nGJafgdv@debian>
References: <20260828160340.11238-2-gnoack3000@gmail.com>
 <apHkx3LvRyqYIB2F@devuan>
 <20260926.919c130a1a6b@gnoack.org>
MIME-Version: 1.0
In-Reply-To: <20260926.919c130a1a6b@gnoack.org>

Hi G=C3=BCnther,

> Date: 2026-09-26 16:10:44+0200
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> Hello Alejandro,
>=20
> On Fri, Aug 28, 2026 at 09:44:18PM +0200, Alejandro Colomar wrote:
> > > Date: 2026-08-28 18:03:41+0200
> > > From: G=C3=BCnther Noack <gnoack3000@gmail.com>
> > >
> > > Bring documentation for LANDLOCK_ACCESS_FS_MAKE_REG in line with the
> > > Landlock whiteout patch [1].
> > >=20
> > > Link: [1] <https://lore.kernel.org/all/20260813093157.1436894-3-gnoac=
k@google.com/>
> > > Link: [2] <https://github.com/landlock-lsm/linux/issues/66>
> > > ---
> > >  man/man7/landlock.7 | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >=20
> > > diff --git a/man/man7/landlock.7 b/man/man7/landlock.7
> > > index 880dd50582f3..3642a64ff1f6 100644
> > > --- a/man/man7/landlock.7
> > > +++ b/man/man7/landlock.7
> > > @@ -204,6 +204,9 @@ Create (or rename) a directory.
> > >  .TP
> > >  .B LANDLOCK_ACCESS_FS_MAKE_REG
> > >  Create (or rename or link) a regular file.
> > > +.IP
> > > +This also guards the creation of whiteout objects
> > > +as used in OverlayFS.
> >=20
> > Reviewed-by: Alejandro Colomar <alx@kernel.org>
> >=20
> >=20
> > I guess this should not be applied yet, right?  If it's ready, please
> > let me know.
>=20
> The whiteout patch has been backported as bugfix to Linux 7.2, 6.18,
> 6.12, 6.6 and 6.1.  Since it is in stable, I think this can be
> considered ready for the purpose of putting it into man pages?
> (Otherwise, we can also wait for the 7.3 release.)

Yes, it's good for the man pages.  Does it need any update regarding
version numbers or HISTORY, or should I pick the patch as is?


Have a lovely night!
Alex

>=20
> =E2=80=93G=C3=BCnther
>=20

--=20
<https://www.alejandro-colomar.es>

--bfuvmjvownh6gkb4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrLwssACgkQ64mZXMKQ
wqno+RAApNj1zT4ylHMX2YNZcT8ItlZu6Kf+cmKmMs7//c0z2L+2WR+E4ElLgR5H
fQpmBVthlyrfykQGKqMCmsZTp2aNFrhfHD5eauiByJ7Af7gyVXTPCleOZ/GiVRJI
ZwKqMFdsf+2eIJIzoh8xFhG9EBfntdlXJD4ep3ezTc+QVN2GBNdgQzIW7dQ6iQSp
RrOsPuyXAaBCCRZuGkOEHAPO7UiUnruC0zYEXPnpR3wD5Cgwa69DRo0LIjAzn1pw
YNp59o3EzVzjV1Z/2gJNgKdwhTMXCNUWifhVf2im8GC6gNtGNLHPhr7t7OrINV6q
dbprMlgcYF+fW4K28LEvDMUg8jktn4uxtwJUurehwecfcBbG7lmTTCLA9eCPu9MD
TX0njuuG/Km1g8qmp1VXzCFfC4zOnzLVuB4NGTebzdqZY/Dz6gRgUlZnlGKFoQ+t
AZ+jGpCTc9H2rBJDgRyOeexrcEvAwRlI0NSj16p/asZbpgCOTmDpgBAtUOVgz6I0
DLO40QjXMJLto7/+bbhzMGEUA25GPiDva1qx9aLnQP5eDUN50WNZ5pY0XyseOqUm
tXffKdANbKhvfIsNuHZToTv6CD7qUgbImRig6E5GA/mVjG4pJChpphiiuimHa7qR
5YSsl+Wmb176MIQVW3NfNzuJSlre+Pib8DFCESyIR+uSLAcQ1Oc=
=5I7v
-----END PGP SIGNATURE-----

--bfuvmjvownh6gkb4--
