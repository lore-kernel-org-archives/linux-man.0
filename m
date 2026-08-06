Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBA3418375
	for <linux-man@vger.kernel.org>; Thu,  6 Aug 2026 20:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786048269; cv=none; b=HvT1h1x1BS2WZCSwyDFnaTjM4prIAEYZfh7h46bwIFtHl3dzn8/bke8+2RUKrF1+jcIZKF97XGcNpTAygVLqdNroSvrEtxvA4t226+/Sw74fxzLdflpjFkMaK/CK4P02rU8ka8DayXdgjZnJXocW3vYpuo0ddr2+EwgPiTyGgvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786048269; c=relaxed/simple;
	bh=IPVEYm7Kq1xllJs+xnN6x3vhQRdYTP4tdjZyXdjtylM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePsqrS4tieKF32QbuFhXyyZ3n3X9MJ/Xqld4I7Y+k+CXUPD+8QdJECTueZUbwGMzhsKa+PsNss6PGOjNkkLm6zchWOL1nbLcK0AhYwkDgeTUAeO9rPXwkUEyIWoc57vSBOZYIybGjeUmF3eyGI+v4Q3E1NTGVvXjDYguVOhG2ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijxAewNz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijxAewNz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35CC71F000E9;
	Thu,  6 Aug 2026 20:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786048267;
	bh=YUTqLP9eoDXoy8c9KamQ147ijX4TgztaGSX6Tz7dayk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ijxAewNziwe4MQV+KRf98XjAdy8szbM0D7VV8TGlDvbeRrxKCLk70JWQNXo2VJmtp
	 0MUhOHMC6gRuRJQOQAtCw12w9OX7QkGW5vqgXcGz7CWGyJ5ksqpkSJsIVZi2+W/NO7
	 r5kfM2Z9Nsdpld9/Vyrw2/KGm8RVrWJhwOcxJ/pmskMxt4coCQt7NORks9sYf2XVKO
	 8LEaeDBfiV3KhDSnWs7gAxM5x6fzvzys6KroXxhIr9JytKkEW+0JOYNsdy7ctVFd3P
	 3y59w8PcAPRSobcjUtbyslcHU4/u5f74/DNLHxg1Qob9yX8bS3Z17q03BI22rgYRmZ
	 FYdIxiN38Xzxg==
Date: Thu, 6 Aug 2026 22:31:04 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v4 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <anTugcvjragzGpSK@devuan>
References: <anTZdJDceYtD7Rfj@devuan>
 <xn5x1n3swv.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7gyf6crm5zec7l63"
Content-Disposition: inline
In-Reply-To: <xn5x1n3swv.fsf@greed.delorie.com>


--7gyf6crm5zec7l63
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v4 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <anTugcvjragzGpSK@devuan>
References: <anTZdJDceYtD7Rfj@devuan>
 <xn5x1n3swv.fsf@greed.delorie.com>
MIME-Version: 1.0
In-Reply-To: <xn5x1n3swv.fsf@greed.delorie.com>

Hi DJ,

> Date: 2026-08-06 16:17:36-0400
> From: DJ Delorie <dj@redhat.com>
>
> Alejandro Colomar <alx@kernel.org> writes:
>=20
> > Hmmmm, let's see.  I couldn't do it in five words, but how about this
> > schematic approach?
> >
> > 	The file may also contain
> > 	.IR filters ,
> > 	which limit the tunables following it,
> > 	The effects of a filter are terminated by
> > 	any of the following:
> > 	.IP \[bu] 3
> > 	The end of the file.
> > 	.IP \[bu]
> > 	The end of an included file.
> > 	.IP \[bu]
> > 	An
> > 	.B include
> > 	directive.
> > 	.IP \[bu]
> > 	A new (possibly empty) filter.
>=20
> I like it as-is, other than "why are there blank lines" but I don't care
> about that ;-)

We can compact them.  ;-)

	The file may also contain
	.IR filters ,
	which limit the tunables following it,
	The effects of a filter are terminated by
	any of the following:
	.PD 0
	.IP \[bu] 3
	The end of the file.
	.IP \[bu]
	The end of an included file.
	.IP \[bu]
	An
	.B include
	directive.
	.IP \[bu]
	A new (possibly empty) filter.
	.PD

(I haven't tested; I've written it in the mail editor directly)

> > Since a filter can be empty, we should document that.  If we document
> > that 'filter:pattern' is optional, it'd be [[filter:pattern]] (with the
> > appropriate formatting differences: the inner '[' wouldn't be bold).
> > However, that's likely to be confusing, so let's document that
> > separately:
> >
> > 	A filter can also be empty:
> > 	.BR [] .
> > 	Such a filter has no effects.
>=20
> Done.  I put it after the filter list, so the "also" made sense.

Thanks!


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--7gyf6crm5zec7l63
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmp07wgACgkQ64mZXMKQ
wqkv4A/+P7lJ9w6cvIVtmP7MrzXdV0tBAo6XZRXpEwPruA+K5GvhY6FRZIK3866E
MLbxMzX0cyIsA6kH/L5M7fu1l8W3Ddctah2ayGgK9jydwdz2q2mqbCmHaHQbtPjl
xTHQB34boswukDRk5/ef5vPDHSRknCn/O/8hleaDW3tqChFcCENvG8B5g/5jf/qS
F6C7OGcVnIWUvOPwnjN2ZWU5MVNMwBBWtIZ1iZ78In+yFByVmL6IinlWyABQ/HA2
kKKonPI5Uojdg7ntALUcC2KI/So+wqMGZg7MhExwvn8m0ayDwFwiGRWASkH2wMQP
edIVUiMDuQ6YEy5DndKVQu9lUYhLlZ/BX4ljYWqSKeASo9+lUTa7++YvUgoRdpdQ
4212jAfK6CA90dzBcJujvZ+u9rjoL10G3/Zu7RMO+eN/hbBl4X9WeROC+oOxbgMs
p8GdFGnHBNYaJj9cZ36Fq/rBQapKsp2t0BswHlobmMif9GhM4VInYZCw3llQHuJj
ClM8q7zr/FDSkDHURxVaHG0EJido1fXGHRe/T/rZY7mTActtrwzg1WV+RAAjZ8uH
JkY9Wp4kH1IMyIcbb0yLw4QFEaHAqFu5WEZX7vGrs7/7nzt+s6D5uhXr7oU5BArA
hxIdeqi9gmgSKga3r8OrHZkLTj3YJenmIhwIYVvqdhSH86a6WAw=
=1QBw
-----END PGP SIGNATURE-----

--7gyf6crm5zec7l63--
