Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6484A21D5B0
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 00:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785631506; cv=none; b=BAdggqb8cX10erczPYfYE+j7ewgk1sF1clxLrgR1IKvP18QprS9MMqPTMf/T3VnKPWOqZpnNWFuM8GYNnUiN2/t3ecm635m85QUVvOjEV03s6ZdyYuBHBYwQWFc3L9vw5f7viV8F7K3tAMa+xHjvCBtx/PxNpTm/dKy7JJe6M8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785631506; c=relaxed/simple;
	bh=v+Zi2pZ4Wm15l5DPOzaYBOL0Gdtd+N9dmyVZYZBE574=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DX21hsdqU6G1/aaZRJRgZ/yrbJvwTpUjwx1CaQg1HRZjB9+Ag3K1VdOlYPj8yJjQl1Ui6QkN2sc/OusW9oDP2IWJS2zrccTcmj1DeJ8/rWwYFBwxy2IJ8lE3gwxW124U77sU2FPJeSzDmhII/W+bZuPuWJMvBvDlRVaeMSYmZPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0xclZex; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0xclZex"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A23391F00AC4;
	Sun,  2 Aug 2026 00:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785631504;
	bh=stkiUwhLkThZOXDHjibR/xOA3XVH3QHSqzpr5Ya3vkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I0xclZexJZ4lJniLAK1FpQ7RwunY6lpzddC0C8hXeKzhCBiEhXwylJiECmnYcEn+S
	 LJYbsiWE6gLzLB/E+TkKPMO5HZZcZQdP6yp05BhcKvNT6tP7vy/GHKILvuIwvAJ6ck
	 C+wqC27dxm0tlLEfWy+PMENj1IGMzSZgZXCzRzicV+a4qLUVecTMSdmWQ5zwbUsWgp
	 Uq+atfxpwW+XfCsrKBsOy9dbAkr9j7kj3Ufp54iUT4L9lYREJ2SSC8WmrocC4+OGzi
	 cywvvYuTnxPWmG5oXhcS7MHCGVPiopIxE7HVIxeuiGxHRgC0l4PNXBtP5+drMDkcv/
	 8MlYxOpY9qq9Q==
Date: Sun, 2 Aug 2026 02:45:01 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, 
	bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool (was: [PATCH v2]
 man/man3/mem*(): SYNOPSIS: Document non-standard mem*() functions as
 provided by <memory.h>)
Message-ID: <am6PkypxYg-Fq4Iz@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <3556566.BddDVKsqQX@cagnes>
 <am50AM0bdufHa9W3@devuan>
 <15288158.RDIVbhacDa@cagnes>
 <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w44ldivr4sm4yzo6"
Content-Disposition: inline
In-Reply-To: <20260802000833.zpu27l7ibvrbouna@illithid>


--w44ldivr4sm4yzo6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, 
	bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool (was: [PATCH v2]
 man/man3/mem*(): SYNOPSIS: Document non-standard mem*() functions as
 provided by <memory.h>)
Message-ID: <am6PkypxYg-Fq4Iz@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <3556566.BddDVKsqQX@cagnes>
 <am50AM0bdufHa9W3@devuan>
 <15288158.RDIVbhacDa@cagnes>
 <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
MIME-Version: 1.0
In-Reply-To: <20260802000833.zpu27l7ibvrbouna@illithid>

Hi Branden,

> Date: 2026-08-01 19:08:33-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> At 2026-08-02T01:36:28+0200, Alejandro Colomar wrote:
> > > Date: 2026-08-01 18:29:13-0500
> > > From: Paul Eggert <eggert@cs.ucla.edu>
> > >
> > > On 8/1/26 17:10, Alejandro Colomar wrote:
> > > > #include's aren't that important.
> > >=20
> > > But this whole thread is about #includes, no?
> > >=20
> > > I would focus energy on areas of the manual where effort provides
> > > the most bang for the buck. As your remark suggests, this particular
> > > area is low priority.
> >=20
> > I wouldn't call it low priority or low bang for the buck.  What I mean
> > is that it's not a breaking change.
> >=20
> > I believe education is important, and provides bang for the buck.
> > It's not all about features.  The features are already there, but
> > misused.
>=20
> I'd like to underscore this point.  As I noted in my response to Doug,
> the flagship book on C, as we all know, is stuck in 1988.  The throne is
> vacant, with many pretenders, some with excellent cases for service as
> regent.

In fact, the throne might currently fall in the Linux man-pages project.
While not being a blood heir of the Unix standards, it has become a
de-facto standard.

After all, both POSIX and C89 in one way or the other derive from the
Unix and System V manual pages (you can see it in their structure and
formatting).  Unix and System V were the largest systems of their age,
and GNU+Linux is currently in that position.  It's natural that its
manual pages are the current de-facto standard (no, not the texinfo
docs).

> But no head wears the crown.
>=20
> And at the same time many C programmers are shy of consulting the formal
> standard.  We can lament their lack of wisdom in doing so and in failing
> to spin themselves up in standardese sufficiently to grapple with it.
>=20
> But we can also throw 'em a bone.  To where shall they turn?
>=20
> Sure, if they're in Emacs, they might go to glibc's Info manual.
>=20
> But some people dislike Info, and some people use a different libc.

Michael was wise to document different libc's, including the BSDs, in
the manual pages, which is why they've become a standard.  If he had
limited to just glibc and Linux, it might not have been the case.

> So what remains for the motley crew left behind?
>=20
> The man pages.

Indeed.

> I think people come to the Linux man-pages in part to learn C.  When I
> was starting out, long ago, I wondered why there wasn't a man page for
> the language itself.  Years later, I learned that there once sort of had
> been, in the 1970s.  It was Ritchie's "C Reference Manual".[1]

Hmmm, indeed, I believe that is the place to have it.  It doesn't make
much sense to document only part of the language in the pages but not
all of it.  FWIW, I've been documenting attributes and operators in the
manual pages recently.  We're closing the gap.

> But it wasn't on any Unix machine I had access to.
>
> Why not?
>=20
> Because Prentice-Hall didn't want it there.  And still don't, I guess.
>=20
> https://www.tuhs.org/cgi-bin/utree.pl?file=3DV7/usr/doc/cman

Hmmm.  Is there any copy of that?

> Maybe education is not a job the Linux man-pages project _should_ have,

I don't see why.  In fact, I believe it's its ultimate job.

If documentation for a car was an aseptic piece of text describing
it mechanically but not saying how to use it, it wouldn't be much good.
It doesn't need to teach you how to drive (that's for driving schools),
but it certainly must educate the driver about the limitations of the
car, such as "this vehicle can lift from the ground if you drive at
300 mph, don't reach this speed".  Or "if you have a lateral hit, the
airbag won't protect you".

Same happens here.


Cheers,
Alex

> but it is one that has been thrust upon it.
>=20
> Regards,
> Branden
>=20
> [1] Not a man page, but you could render it intelligibly with nroff.



--=20
<https://www.alejandro-colomar.es>

--w44ldivr4sm4yzo6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpukwcACgkQ64mZXMKQ
wqmyrQ/+Oo2ebQ1bGApQOlcdOPJvKFGrnIA963Q8uth1wQyHkw5Q4kOUWui7zbtI
AQOgtoWkcJPMs38904tyY2m6fQX5GJ+DAxinzQf7ob7OPZdMnpPf7/7y5S/SYW/b
TMb5SuJ94cbuTI5qmk1r4f7kZRcZ3p0gca0c6AdaHSwF86qeMwSsv/E4wes6DqSh
zrzk3MOhWP4BRTsTjPE0XrbO+E58IJikXjtgBZxfdJmxYxar9Dwbhp94VjqjyCrY
OgGK2FPRUfJGvxksSYw0rC3OuQ+unn6gudnycGsYst0VDmq9paQ9vPymWp1DxYS5
XLhNcQgvhmAZBLgKFbA7YCJAPkKWFRfDVcZTXYi8/wg0LQkbcolxqEddYB6+5X51
3GJIyfOSsWnkN0e2XOHt/V8xukZmawF/x32qQpgb53CEDnws8iWpJlVUnjKdwi5c
ENWeoqTwmJVxWdH/CZTtsQDT5XmRM0hRJmeQYypcpe7NDpXYaMbwAOSDyTXv9hK+
b5fBZhGAa37gBETLP3gQzlIcW0fsTjERnpkz2o0xjSG6nevi9de/3UMbco/KqdsR
e0KfwpVsoUjWncmYxPMCanb0U6RMTfV3uUoUfQ9c9pddvi4E9xZaCsbWyUXLmkeB
wOyYvVaqX9kTGPX34g0KhXVtXenehw+U/YenWWbzb7MPBlVNYuQ=
=L27H
-----END PGP SIGNATURE-----

--w44ldivr4sm4yzo6--
