Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0C52DB79F
	for <linux-man@vger.kernel.org>; Sat,  9 May 2026 19:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778355746; cv=none; b=S42bsDK4aPkZNki3Pe3g1H1B7zyVE102JBoAWb1t109cY8uCB3iyeQfL6bawcg6W8T3kELe4nw/3jOBr0R0opumLjjJMNa6e0TKfOTpmBeZRuR9Hqd8bum+vp4GkUK9/KjrHOWdqtTCDb+PRL+jNRdcO4q3ulzSQDDg16xI2U1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778355746; c=relaxed/simple;
	bh=DpnxMf7/g3JLlh+bs1qNDL7n51Ay4THKa/9kBFr5ohI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/Bqw1tfArlD5wx9WKUew2szO94fynhWRfqWuxxSdOsi0HPz+jP99rhs5UQLfiwa8nQQ1oQQ96MLbZiCkKG4nO9Q2I/xelNrWWi8wiau4VHjSssjbzcOnwNb6SsxO2Aq3H8rhYidezMMGGNixuswZqB7y2hl025aZsLco9/RYt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rESGoWgP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rESGoWgP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8845FC2BCB2;
	Sat,  9 May 2026 19:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778355745;
	bh=DpnxMf7/g3JLlh+bs1qNDL7n51Ay4THKa/9kBFr5ohI=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=rESGoWgPmonl/qF+a2fx1s5vpBLgp1um75QfhmyiZWST9YJrPzov6Qpe83FrqYG9T
	 szXo02wt1qWM031Emlo77uN/dTxBdIipftsAyd8KaWk5WmhEoyd7J/fRAeb4jOSzMh
	 +PAva6CSgIVnCKkKK83waxmH5wv1iuv7EaR2LuW79h9PQrXSs9IyD7IwdbRn6dtqRP
	 I1SWO4sHPTLY/zscR2oDYRs0zA7Z+TJhdPEZrxa6jb5r9EAUMbgcfvyIGM1kckGwki
	 jTBdiXkA6+X40lCshJgHu/yBgYQ/JW9O9L/saV6QdZ+h9O7fOYS2BREtYO/a1GsfUI
	 zyowaznzgzyiw==
Date: Sat, 9 May 2026 21:42:21 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Russ Allbery <rra@debian.org>, debian-policy@lists.debian.org, 
	"Dr. Tobias Quathamer" <toddy@debian.org>, linux-man@vger.kernel.org, 
	Helge Kreutzmann <debian@helgefjell.de>, "G. Branden Robinson" <branden@debian.org>
Subject: Re: Stop compressing manual pages
Message-ID: <af-Nwzwx-oEIlMve@devuan>
References: <aUzUvdZEJpDHb3QX@meinfjell.helgefjelltest.de>
 <aUzUvdZEJpDHb3QX@meinfjell.helgefjelltest.de>
 <aU0WjfHED1esOwPy@devuan>
 <fec615b5-af5b-46cd-ae09-d9343db6da77@debian.org>
 <aU1D0aL00gy1V-NX@devuan>
 <87ms364c05.fsf@hope.eyrie.org>
 <aeX8nCySpQhTBw8j@riva.ucam.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tr4ko54wakl4cidf"
Content-Disposition: inline
In-Reply-To: <aeX8nCySpQhTBw8j@riva.ucam.org>


--tr4ko54wakl4cidf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Russ Allbery <rra@debian.org>, debian-policy@lists.debian.org, 
	"Dr. Tobias Quathamer" <toddy@debian.org>, linux-man@vger.kernel.org, 
	Helge Kreutzmann <debian@helgefjell.de>, "G. Branden Robinson" <branden@debian.org>
Subject: Re: Stop compressing manual pages
Message-ID: <af-Nwzwx-oEIlMve@devuan>
References: <aUzUvdZEJpDHb3QX@meinfjell.helgefjelltest.de>
 <aUzUvdZEJpDHb3QX@meinfjell.helgefjelltest.de>
 <aU0WjfHED1esOwPy@devuan>
 <fec615b5-af5b-46cd-ae09-d9343db6da77@debian.org>
 <aU1D0aL00gy1V-NX@devuan>
 <87ms364c05.fsf@hope.eyrie.org>
 <aeX8nCySpQhTBw8j@riva.ucam.org>
MIME-Version: 1.0
In-Reply-To: <aeX8nCySpQhTBw8j@riva.ucam.org>

Hi Colin,

On 2026-04-20T11:14:52+0100, Colin Watson wrote:
> On Thu, Dec 25, 2025 at 11:06:34AM -0800, Russ Allbery wrote:
> > Alejandro Colomar <alx@kernel.org> writes:
> > > On Thu, Dec 25, 2025 at 02:47:33PM +0100, Dr. Tobias Quathamer wrote:
> > >> thanks for your bug report and the provided statistics. I haven't th=
ought
> > >> about this up until now, because it violates Debian Policy. Quoting =
=66rom
> > >> Section 12.1
> > >> (https://www.debian.org/doc/debian-policy/ch-docs.html#manual-pages):
> > >>=20
> > >> "Manual pages should be installed compressed using gzip -9."
> >=20
> > [...]
> >=20
> > > Yup, I'd like that policy to change.  I've added debian-policy@ to th=
is
> > > mail (and also linux-man@).
> >=20
> > Colin, do you have an opinion on this as the man-db maintainer? The
> > software you maintain is probably the primary consumer by a significant
> > margin of the installed manual pages.
> >=20
> > The rationale in Debian for compressing documentation in general is for
> > embedded systems and other small installations, and it applies to just
> > about anything that can be safely compressed (manual pages are only one
> > example). But this rule also predates such facilities as the nodoc build
> > profile, and is several decades old and thus predates the growth in
> > storage size even in small embedded environments that has significantly
> > outpaced the size of text-adjacent documents. I would definitely want to
> > get feedback from embedded folks before changing this rule, but at least
> > at first glance it sounds like a reasonable request worth considering.
>=20
> Sorry for being slow to reply to this.
>=20
> It's not something I feel as strongly about as Alejandro: in man-db=20
> we've already paid most of the costs (in terms of software complexity)=20
> of making compressed manual pages work well, and we'll have to keep that=
=20
> code around for the foreseeable future no matter what.  But it's true=20
> that there are continuing annoyances with ad-hoc shell pipelines.
>=20
> Let's put it this way: as man-db maintainer, I have no objection to=20
> recommending uncompressed manual pages.  Sort of +0 or +0.5.

Thanks!

>  I=20
> definitely agree that embedded folks ought to be consulted, if they=20
> aren't already simply excluding manual pages entirely.

Does anyone know how to contact them?  Could you please add them to CC
(some key people and/or a mailing list)?


Have a lovely night!
Alex

>=20
> --=20
> Colin Watson (he/him)                              [cjwatson@debian.org]

--=20
<https://www.alejandro-colomar.es>

--tr4ko54wakl4cidf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmn/jhcACgkQ64mZXMKQ
wqmfEQ//bLSCS2BYc6CoE50ChpuL66yc58KtOKkec0Ii50yLU/mQVWnJLmCPd3Of
Y6MKH6vMOyhzrLyMgIYV8YdCz62969TQsfTK4jwigupsslkbrohHCjmmzurt51WR
+xq/AeBVtlfrpJZ8cec9vR4SIph8KvQXFdDawMdBCEf+6ljQ/DnjHPXarIwYf3he
0MbYKjYwINPqAffLjomMbhrCEM90kmbbzcB8Co4+fbafMo8rbGaEMZnoGuY5KSgb
iaNG03sjJ5phvjSlp9MvNB59gqudCn38cV48Y/7trn/uHSmR9ougN2u4G5d5yuOE
6NbOItjl1kC6+GQpBl48iv7wp30305Zlw8m3N6ErrUlq1xc65UfwTlsSseT43oaV
eY/7xrewaa+BwhZmNEa/Wprbr3FxFl9PqnLrkN8SdcSSnKXQdXWSGkzXH/5Scq6b
mQCRfeW4YyXELTvuBp7nrxLi6+ehOIMIwYQfxK2KrqUKkDtI59gQeGwD/rreIazs
mhjL9RXgo1pd69lTtPEM/0kY1fac+h6UF+QjLV23OQ008rslHqxYI7EnluplHO7C
ABwy0bKnmxhAxtYIAgzDJ7yy08jNIVV8lVdmfbE8uFvYM+0MA+CJCXotozuk1LPI
Tm2eJY7435tolXojmWLogYD2GowGQJnN9doKRlXZ29tFMfGm9MU=
=gH6A
-----END PGP SIGNATURE-----

--tr4ko54wakl4cidf--
