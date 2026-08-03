Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCAF3043CE
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 12:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785759682; cv=none; b=gcg/k5p1GwZhFihABoNcl2tC7pOLQLLwDz3c1evmQLxJG/z8zf/zE88YVuTyrxnAxoim0B9VUJxIqJCJRC1tX+2EV7DoQj2MipqDaZhAOkiGokjMJRDjPVZjBlxyiReSgLIhL2MPGB/F1GXXBIc4dPXiQncC4v3ebCURmYnA5mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785759682; c=relaxed/simple;
	bh=77XdufXz8wQ3JXN/kVEFU9bzvBfSd6Vz/utNJN9Vm9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUu7YRfAz7eCXsYhTyhMAduYf5hxq15rqAnvDDgFEKRL80TJWS8LmUoQsX4spW9SDfR5ZrurfPJGhR5u/hpiba4K9dJDG+p21IBJIgwY1QRxz8bz1F/uNpyevNn+sneID+tZtG+VydjE09qBuoX/wq9OxJMixb0poqisTUbqNig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=clUo/2Zh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="clUo/2Zh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6391F000E9;
	Mon,  3 Aug 2026 12:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785759681;
	bh=4S3lyuDc3JMrJqjYspMeaxM0LQqttUnrs8tYjPd9AD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=clUo/2Zhr3/n2FKUyzhOEpXeFobFjNUs6L0+uWoLTXC2czq3wjYkWPzCN4v8iYjCb
	 IaY4M9ivdmEe+79Fh2ysMiK+96WJRYX4GTY8dwXK3brF/6Vd2eRqPPpcUD3+yDaWwO
	 5VXS8LPktC8z0E3EQmC+Dg1L6SvaGRrE3rwT4XEEhqY9v4KlJzQgCSJpNIrGq+iG32
	 eiNg149XLW08MsxRxewQNixVtOB8b5bBUEEwiyuWIrlyS3bVV94e98UKPEYcHSDf6K
	 VHglUta0xwPo3c4Ste2kk/m3bsR+Vi4iiUtt0uu+PGP91fqEreURZ2fMpGXF4oRE4w
	 Fy9yTWpxFgTDA==
Date: Mon, 3 Aug 2026 14:21:17 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Collin Funk <collin.funk1@gmail.com>, 
	Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <anCAeQ5YNwXwSTWA@devuan>
References: <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <am_VUE1SzxqRkTAo@devuan>
 <am_V3bvOiH9TaJQW@devuan>
 <20260803020908.efqt5ilkcjq4z3yz@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sxzbalvdwtiuwivq"
Content-Disposition: inline
In-Reply-To: <20260803020908.efqt5ilkcjq4z3yz@illithid>


--sxzbalvdwtiuwivq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Collin Funk <collin.funk1@gmail.com>, 
	Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <anCAeQ5YNwXwSTWA@devuan>
References: <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <am_VUE1SzxqRkTAo@devuan>
 <am_V3bvOiH9TaJQW@devuan>
 <20260803020908.efqt5ilkcjq4z3yz@illithid>
MIME-Version: 1.0
In-Reply-To: <20260803020908.efqt5ilkcjq4z3yz@illithid>

Hi Branden,

> Date: 2026-08-02 21:09:08-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> At 2026-08-03T01:42:57+0200, Alejandro Colomar wrote:
> > > > > Date: 2026-08-02 16:27:21-0700
> > > > > From: Collin Funk <collin.funk1@gmail.com>
> > > > > I can't help but wonder of what happens in WG 14 rejects this
> > > > > controversial, as obvious by this thread, change. Will the
> > > > > man-pages changes be reverted?
> > >=20
> > > > > Or will we slowly watch them document personal
> > > > > preferences instead of existing standards?
> > >=20
> > > BTW, as I showed in another subthread, strncpy(3) did contain
> > > opinionated comments well before I was involved.  If you're really
> > > going to accuse me of that, better make sure you get the history
> > > right.
> >=20
> > Oh, and while at it, please also read my review of glibc's own
> > opinionated and bogus documentation about string truncation.
>=20
> I don't think this rhetorical tactic is a sound one.  You are implying
> that because Collin (and perhaps others) are not on record as having
> already consistently opposed editorializing in the glibc manual, or in
> the Linux man-pages prior to your stewardship, that they are hypocrites.
>=20
> First, that's not necessarily true.  Who's read every word of either
> work?  Who had already done so 5, 10, or 20 years ago?

He doesn't need to have read every word of the glibc manual, but this
precise text he could have read it, because it was mentioned by Paul in
this thread (different subthread) prior (19:28 UTC) to his message, and
reviewed by me also prior (20:31 UTC) to his message (23:27 UTC).

	Date: Sun, 2 Aug 2026 14:28:33 -0500
	From: Paul Eggert <eggert@cs.ucla.edu>
	Message-ID: <8715af47-867c-417a-8ef5-7b4b7ceb2c31@cs.ucla.edu>

	Date: Sun, 2 Aug 2026 22:31:59 +0200
	From: Alejandro Colomar <alx@kernel.org>
	Message-ID: <am-eAGL6OWqP9Yah@devuan>

	Date: Sun, 02 Aug 2026 16:27:21 -0700
	From: Collin Funk <collin.funk1@gmail.com>
	Message-ID: <875x1sp0h2.fsf@gmail.com>

Also relevant is the fact that he accused me of "slowly" documenting
"personal preferences".  His wording implies that it wasn't there
before.  Maybe I misunderstood, though.  I'd be happy to rectify if I
was wrong.

While he didn't need to know whether it was there before, it would be
good to make some effort to learn whether that was the case, before
making such a serious accusation.

In this specific case, again, the relevant text had been shown by me in
this thread (different subthread), prior to (13:17 UTC) his message, and
thus again he should have known.

	Date: Sun, 2 Aug 2026 15:17:04 +0200
	From: Alejandro Colomar <alx@kernel.org>
	Message-ID: <am8_MfPmud43naU-@devuan>

> A charge of hypocrisy can only stick well if you can establish that your
> interlocutors _endorsed_ the editorializing contemporaneously when it
> was done by someone else, but are refusing to endorse yours.

I believe the timestamps above, and the fact that he's been (obviously)
aware of this thread, are sufficient for this charge in this case.

I do agree that in general we shouldn't attribute hypocrisy without
proof, when it might actually be just lack of information.

> But there are more fundamental reasons to conduct this struggle on
> different grounds, which are that (1) people get to change their minds;

Oh, indeed; I've done plenty of times, and it's good.  I certainly
welcome that.

> and (2) people get to raise defects even if they are old ones.
>=20
> Thus, if you feel justified in "relitigating", in Joseph's term, the
> ANSI C Committee's decision in the late 1980s to scotch the memory.h
> header file, then Collin gets to "relitigate" past editorializing by
> (I guess?) Michael Kerrisk in the Linux man-pages, or by the glibc
> authors in their Texinfo manual.

Certainly.

> Thus, here you have handed Collin an easy annulment of your point: he
> can simply say, "well I object to those, too".

I'd welcome that as being consistent, and would then apologize, if for
some reason he really wasn't aware of the messages whose timestamps are
shown above.

If he was aware, then I wouldn't apologize, because the offense and
hypocrisy would have happened, but still, I'd welcome a positive change
of mind, and leave both my and his words in the past.

> Every generation of engineers bears a responsibility to remake the world
> anew.  That which endures does so because its quality is re-tested and
> re-proved by successive cohorts of humans growing up and running
> straight at it with their freshly trained minds and novel phenomena of
> recent invention.  When an artifact persists because it's protected from
> the bratty young philistines by older people who, as William F. Buckley
> put it, stand athwart history and yell "stop!", it fails to prove its
> continued utility: it stops being an engineered product and becomes an
> antiquarian one.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--sxzbalvdwtiuwivq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpwh7cACgkQ64mZXMKQ
wqlaLg/+Le5oUdebsuYB1KcLoqlFRmmBLaHHA/g1iaoW1MjtkSuVUGvpr+kVb3Rt
lPruB0yaGBY6M63JD7LVdRCisULYWKS+STnULk1QltOGbz43VmufA4RaqxGB8Alp
LpzJuXiC7clqVFijo2QHi+sMiezgyYWySmODnfseS9jyJYZP/bm6myCLqunGcbzE
6xYIL1E6JXP2AsWuNpVAlg4DPO6HK4E23ivt9IS4HcsSWQn5z0GsHacoSCty5EUd
XzyQ2mMSKdFVNrxVAADOfm1KJyP2MfZAKD6c6NIvGiFStHDHG+Jt1fyUAKvmO8CZ
7bHd1rr47QIyTDiGarNV8iZqvNnOiKvKh2OnDjaFJfdXuBu4dWy1xfxQ5n4Igy9A
m+yz7pCqmmTW5SxPpknfvSUPtYoFCqMyjhjoT63439gEVUdZI7uDb+qaNE29miip
4Lult7B2+Y3UWld7zcAYWCEao9KC2DjEaXna56BMRQdPSUIY9FXHvRbG1shVqN3I
2cU2RLtcn/nZQNO6WVdWlLVvFiv0alHPkbA7gVteP4gShu+DFQfLoqwwN+tvE1A/
anmWxUWwI26teMtSIczTzmSCpfc/1bJpW7yZYwFAnVrTuSyQl5i0NlfmlGNgJ72S
9g5FOHTpmpRa9D8J5vF4PKubOxOOz9d/R93ycMVbchWMqY37P8k=
=HGhF
-----END PGP SIGNATURE-----

--sxzbalvdwtiuwivq--
