Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8D638E5F9
	for <linux-man@vger.kernel.org>; Sat, 29 Aug 2026 21:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788038181; cv=none; b=LufUl8dZWb2bKmM9dxPD/tpkq2TtddMt8kdRm92Yzca8cwP4YxTzMxYGLdbnrGT2zaCUXYIcKxzaBLPlPSJm8LChO/QVUWzJwuTLcq//dkjnx2JkKC8Uz7v0P2okX94ga1GBVqY3uGIvK6Jrtab7+vC9l24O19hhpcmAFYErawY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788038181; c=relaxed/simple;
	bh=gZJm3bK3wxtTgT4YgeWYk5myvuvCI3dk85RcJOXcH0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nOtU/8OrxBJZlc4JfDdoS7yg3mppLO0WaCP6dWT3Zl5dGf6wPGF8WJjtgao2Fy1l0stxMmrVPxM7xVo5p3cx+7l8sALLYF2VsEkgIybHQZEzOP7Z7stYJCyZ3UOwX+XS176hCc9cS25TlGzgTLUI218jUj5KdScuzUd1e30syys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRUE3Ag1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRUE3Ag1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5D91F000E9;
	Sat, 29 Aug 2026 21:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788038179;
	bh=pKoWuWDkVNehPqXacJeJ0Gkwr5xAZU3RaiBfjTMhZhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mRUE3Ag1v3NLYstDu/tX5w68H2aqq4amWuQl7ceyGgtGvnmQbSR61/Yfxl0n/CWK8
	 b6lsfNrcO2wxaH76ryEGJwaMBE/j6zuc3ZpVtxxblGCEMyokHWneUnUdKPpig2zIpx
	 3d6iPphdI5m6t98MgWQApZilfIsuRuZB92bWBFt7iBw/9HzxxBEGfSydR7Rl8iyk3E
	 LDyQ4okugcltKUqhOIU/y+Q5cigOkDnQu7aAPAyjQ5ku4hdSCJ3esVVT+sTdd1h57C
	 GCD2y4KDkh2wCXBdKJcJrlS/PnRxRWjx7twfk5pLJC4yck8LmuFipCFr9cBE4ms8Eq
	 700Wejj+HvlTw==
Date: Sat, 29 Aug 2026 23:16:16 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Tingmao Wang <m@maowtm.org>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2] landlock.7, landlock_*.2: Document
 LANDLOCK_ADD_RULE_QUIET
Message-ID: <apNJooGfbt3Fx-ll@devuan>
References: <20260829151304.101952-1-m@maowtm.org>
 <20260829.acedcd1feb62@gnoack.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aj56cz5eomdopxjx"
Content-Disposition: inline
In-Reply-To: <20260829.acedcd1feb62@gnoack.org>


--aj56cz5eomdopxjx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Tingmao Wang <m@maowtm.org>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2] landlock.7, landlock_*.2: Document
 LANDLOCK_ADD_RULE_QUIET
Message-ID: <apNJooGfbt3Fx-ll@devuan>
References: <20260829151304.101952-1-m@maowtm.org>
 <20260829.acedcd1feb62@gnoack.org>
MIME-Version: 1.0
In-Reply-To: <20260829.acedcd1feb62@gnoack.org>

Hi G=C3=BCnther, Tingmao!

> Date: 2026-08-29 19:24:45+0200
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> Thank you very much, Tingmao!
>=20
> Documentation is the same as in the kernel docs, and renders fine.  I
> left a few smaller comments below on individual points.  Apart from
> these this looks good. :)

Thanks!  :)

> On Sat, Aug 29, 2026 at 04:13:03PM +0100, Tingmao Wang wrote:
> > LANDLOCK_ADD_RULE_QUIET is a new feature introduced in Landlock ABI
> > version 10, merged in kernel v7.2 [1].  This patch copies relevant
> > kernel documentation into man-pages.
> >=20
> > Link: <https://patch.msgid.link/cover.1781228815.git.m@maowtm.org/> [1]
> > Signed-off-by: Tingmao Wang <m@maowtm.org>
> > ---
> >=20
> > Changes in v2:
> > - Fix missing .RE, and fix EINVAL label being incorrectly formatted
> > - Fix missed API bump in the example program (abi =3D MIN(abi, 10);)

Thanks!  I made some comments on v1 a moment ago (I hadn't found v2 yet;
sorry).  They also apply in v2.

> >=20
> > Hi,
> >=20
> > For context, I'm the author of the quiet flag feature and this is my
> > first man-pages patch.  @G=C3=BCnther or @Micka=C3=ABl, can one of you =
do a quick review?

Thanks a lot for the documentation patch!

> > All text in this patch is copied from the kernel source except this
> > bit:
> >     .TP
> >     .B EINVAL
> >     .I flags
> >     is not 0 or one of the allowed values.
> >
> > (the kernel says "%EINVAL: @flags is not valid", I decided to make it
> > more precise)

Thanks for clarifying the difference!  :)

> >=20
> >  man/man2/landlock_add_rule.2       | 48 ++++++++++++++++++++++++++++--
> >  man/man2/landlock_create_ruleset.2 | 48 ++++++++++++++++++++++++++++++
> >  man/man7/landlock.7                | 29 +++++++++++++++++-
> >  3 files changed, 121 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/man/man2/landlock_add_rule.2 b/man/man2/landlock_add_rule.2
> > index fe01a98d9..c848c9b4b 100644
> > --- a/man/man2/landlock_add_rule.2
> > +++ b/man/man2/landlock_add_rule.2
[...]
> > +Because logging is only suppressed by a layer if the layer denies
> > +access,
>=20
> (I suspect Alejandro will bring it up as well; man pages use "semantic
> line breaks" trying to break lines after logical parts of a sentence,
> e.g.
>=20
>   Because logging is only suppressed by a layer
>   if the layer denies access,
>=20
> etc.)

Indeed, I've made such comments extensively in v1.  :-)

This is some excellent documentation advise, used already by
Brian W. Kernighan back in the days of early Unix.  I find it sad that
most projects don't use this today.  The kernel internal docs must be
unmaintainable, and this is a strong reason why I'd *never* agree to
port manual pages to .rst format as some people have suggested at some
point.

[...]
> > @@ -70,6 +73,17 @@ .SH DESCRIPTION
> >  in
> >  .BR landlock (7)).
> >  .IP
> > +.I quiet_access_fs
> > +is a bitmask of filesystem actions which should not be logged if
> > +per-object quiet flag is set.
>=20
> Maybe add a "the" before "per-object" here?  Unlike in the kernel
> docs, this is a full sentence here, so a more complete sentence is
> probably in order?  (Same for quiet_access_net and quiet_scoped below
> as well.)

+1

[...]
> > +.BR LANDLOCK_ADD_RULE_QUIET ,
> > +even if logging would normally take place per
> > +.BR landlock_restrict_self (2)
> > +flags.
> > +.I quiet_scoped
> > +is similar, except that it does not require marking any objects as qui=
et
> > +-
>=20
> Should maybe be a \[em]?

Yes, this should be an \[em].  However, I'd prefer to use parentheses.
Or if we use \[em], I'd want to use them in pairs, and with the same
spacing as if they were parentheses.  Here's an example of how it should
look like:

	... any objects as quiet --if the ruleset ... any log--.
or
	... any objects as quiet (if the ruleset ... any log).

I'm okay with any of these.  This placement of em dashes is standard in
Spain, FWIW.  I'm aware it's not common in English-speaking countries,
but I prefer Spanish rules for em dashes (and we use these rules already
in the manual pages).

[...]
> >  Users should use the Landlock ABI version rather than the kernel versi=
on
> > @@ -622,7 +649,7 @@ .SH EXAMPLES
> >      perror("Unable to use Landlock");
> >      return;  /* Graceful fallback: Do nothing.  */
> >  }
> > -abi =3D MIN(abi, 9);
> > +abi =3D MIN(abi, 10);
>=20
> Please also add an entry to the array in the example (even though it
> is the same as the entry before, in this case).  Otherwise, the
> example has an out-of-bounds array access when this is 10.
>=20
> >  \&
> >  /* Only use the available rights in the ruleset.  */
> >  attr.handled_access_fs &=3D landlock_fs_access_rights[abi \- 1];
> > --=20
> > 2.55.0
> >=20
>=20
> Thanks,
> =E2=80=93G=C3=BCnther

Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--aj56cz5eomdopxjx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqTTBoACgkQ64mZXMKQ
wqn56Q//aNlBQm+bNLXy4HbH5q+qJy5eDDlG9yqRcmFSliqSP3Eq8qJA/VGUBQvQ
L7BeZFx+pWjFVhxBHH+PXXSra+qYH+ZZIkLpgMC41TzL63YFooOTlbnPQTWEzSQ9
gRQ/yQp6vHnkHXUWa+5DE7bbUmYv2eIo2fPyaokCJeits+ioJgq4D1Z87h6P4yf4
461r048U/jpjj8k3ibr/GYcCn/qaGPSxog5AQ720OiYc2a2kjRdFp50bgvVCd3qv
ZWFSOf5E2QLk9bQ3XI6tiQvGerE+SAVKXunoHlkMUsblZqaRLt73/maRgjtmJwRo
pYE88BcNFLd5Ut8i/5aPGInvVXGGpxiW0XOtGFrOMDnp7KiEdcpZINdWqKJOAplg
z4/mN96UOJEiceSsAGQY0kaM/sHyYms2KMLgpIBwoI69NrdY5ty6xGO8Scoq+Xnt
+tHFG2wTcaJmdJhYwM5ACyOjDTu2kSWKK3nGCe8XD3JfzA/IEYq73jQ4FZjy/H6m
/iLI1HlcQnhr42n6ioiJ4x17X5sY+B1vI5KiU8JiX3kyyvy4atZ9kmOvQliHgS8/
Hg0G+OZN9XefDztyTS1pXgrBMxC0xyXc2TeKvaA0Ab7fj+RmvlArR4L8BslWFFzG
K6htzLvw7WN2KfWRHdqhxLAencGXewCE1qCn4uZOQ2PTmkwqdp0=
=xKaH
-----END PGP SIGNATURE-----

--aj56cz5eomdopxjx--
