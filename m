Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4415455630
	for <linux-man@vger.kernel.org>; Sat, 19 Sep 2026 10:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789812660; cv=none; b=cuVdoTAb+UFRIW+DuiBjAn+hEzYE2qmRJSy/9dTLB0imCoJX9ckiltl/b962aNU4dhmvE3iHmW19Q1Joyrd0W75R5ksT3bdXxhlzwi53MGSmbbCS+OiRZ6E5a+CGwvawuXSD+50pqhPZ0aN6fgrSce/7Cs5vat4zqdo7hDh7o8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789812660; c=relaxed/simple;
	bh=uciln1TrzoZmtbGKc+S1RwxT0/H83xaCVGQQVPEk/pA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sj5XYQVTJgr/Eo8ju5B1GxpsD7NHEYmY9jA1xua6wqUHYpIi+H0yAMQKjuj3xrfvlAJcXzVkM7PhwC+DjVXtGfVVYxjx6CAIfnogYPIXvVJdFHdBwny/PztjuuQ8S/3/m9sx8DqWgU6llzVQtdM/7TveiZ67F03rXODqr2hH1xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TMabGNUk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TMabGNUk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124571F000FF;
	Sat, 19 Sep 2026 10:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789812658;
	bh=57j9mMEryh84uiYsQSKeL0JC0Q564tdt+6uY7PwGp1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TMabGNUk3nMTDBKuLQYz2SV6x2RXuYjXz5HirSViNs3FxojeNjH4G0vnVi0jYTYcg
	 QuS6zrUGSj92QeR9jdA/ebRQzDFsD6LBm2DbiogKYKpSUizHe5xJ6qQ3x4qldnMHIa
	 mRKVOCKRy/6DxaOvqhQNBawAGx+Ebn86h8UJmyzNqMI/2QwosLBUUishDqqgW8HpGR
	 zN9f4K8yRMFeNnN4qd+BuONOVsNLeK4D/XHrU86nNp7+GWnqHJdPnIwDMKGlrZut13
	 UNlTnaIdk4LjcKdAY279m2TG0V8rM1eIdJs8AMht2XqdUJEubhADxPPLbGQem7FOEo
	 HasW2TqoGLPeg==
Date: Sat, 19 Sep 2026 12:10:53 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Maxim Inozemtsev <milnadar@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v2] man/man7/inotify.7: Fix typo in struct size
 calculation
Message-ID: <aq5fZu_H6rG5J_KL@debian>
References: <CAE8uRQ0-xyboJ3gy5wu-EaoQ2UEj4bL74hnrosaMpNkqJ9vYnA@mail.gmail.com>
 <9a02836a5be6c1505a2cff8bc9a5a8f749a160c4.1789082120.git.alx@kernel.org>
 <CAE8uRQ2RsF3MBQfzB=roViVr1dAKkATTTos50o0L8=tJ89w4jg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nsnrpjg5zmdcysak"
Content-Disposition: inline
In-Reply-To: <CAE8uRQ2RsF3MBQfzB=roViVr1dAKkATTTos50o0L8=tJ89w4jg@mail.gmail.com>


--nsnrpjg5zmdcysak
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Maxim Inozemtsev <milnadar@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v2] man/man7/inotify.7: Fix typo in struct size
 calculation
Message-ID: <aq5fZu_H6rG5J_KL@debian>
References: <CAE8uRQ0-xyboJ3gy5wu-EaoQ2UEj4bL74hnrosaMpNkqJ9vYnA@mail.gmail.com>
 <9a02836a5be6c1505a2cff8bc9a5a8f749a160c4.1789082120.git.alx@kernel.org>
 <CAE8uRQ2RsF3MBQfzB=roViVr1dAKkATTTos50o0L8=tJ89w4jg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE8uRQ2RsF3MBQfzB=roViVr1dAKkATTTos50o0L8=tJ89w4jg@mail.gmail.com>

Hi Maxim,

> Date: 2026-09-18 23:05:58-0700
> From: Maxim Inozemtsev <milnadar@gmail.com>
>
> I like your corrections.
> Please see my sign-off for this patch below:
>=20
> Signed-off by: Maxim Inozemtsev <milnadar@gmail.com>

Thanks!

I had pushed the patch already some days ago, so I can't append your
signature, but still thanks!  I'll remain here in the list.  :)


Have a lovely day!
Alex

>=20
> Thank you,
> Maxim
>=20
> On Thu, Sep 10, 2026 at 4:17=E2=80=AFPM Alejandro Colomar <alx@kernel.org=
> wrote:
> >
> > From: Maxim Inozemtsev <milnadar@gmail.com>
> >
> > Fixes: 18e7c4597c4e (2024-11-17; "man/: Terminology consistency reforms=
 (n, size, length)")
> > Co-authored-by: Maxim Inozemtsev <milnadar@gmail.com>
> > Message-ID: <CAE8uRQ1WhW=3D5X-zCCi4g9y4s-rEYdmY_=3D2o4Re1thKyijV3RXw@ma=
il.gmail.com>
> > Signed-off-by: Alejandro Colomar <alx@kernel.org>
> > ---
> >
> > Hi Maxim,
> >
> > I've slightly modified your patch, to be more correct, and show that
> > 'len' isn't just a variable, but a structure member.
> >
> > Do you like this patch?  If so, would you mind signing it?
> > <https://www.kernel.org/doc/html/latest/process/submitting-patches.html=
#when-to-use-acked-by-cc-and-co-developed-by>
> >
> >
> > Have a lovely night!
> > Alex
> >
> >  man/man7/inotify.7 | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/man/man7/inotify.7 b/man/man7/inotify.7
> > index 9575b82e7ffb..dcdf95d0665c 100644
> > --- a/man/man7/inotify.7
> > +++ b/man/man7/inotify.7
> > @@ -137,7 +137,7 @@ .SS Reading events from an inotify file descriptor
> >  the size of each
> >  .I inotify_event
> >  structure is thus
> > -.IR "sizeof(struct inotify_event)+size" .
> > +.IR sizeof(struct\~inotify_event)\~+\~event.len .
> >  .P
> >  The behavior when the buffer given to
> >  .BR read (2)
> >
> > base-commit: 93337ae940c227db2b4a6141268a41b222df4283
> > --
> > 2.55.0
> >
>=20

--=20
<https://www.alejandro-colomar.es>

--nsnrpjg5zmdcysak
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmquX6YACgkQ64mZXMKQ
wqnm+xAAqfqLqSNgKm0mMmfUPO43fSWUW144yEQmjGaqFRXqPgN/d8igCn3zKvc6
Oe4zpZpekTYZ0o5r+1pR7cIUQppK9hzpaeYmi2yKiDKBH+JxhtC0WGiH/fkANyDN
Mo5Ie4oS+xaFPnOD9/2ikI7ZY+be5vL7jxj2q9m1K0im2YSrxfTbQSQ4AHsxH8kP
VOcdzoRlFmimQAZbnD/p4bFJcY0tIikPhR/6RDbNJSREjw3M5DyG6+ICKF6l2ZTa
Ml4EygOouElYnELpURweCYW4ohnuKMyu1PTQQ1wRAiF2c/5ad9+mqgmErb5vmj6c
dd41w+q06cnN5wsg9kA4IIIaynzR+HXSNZJouCoKS7Vj8dnZzTDCIqc8bzNBTxiL
sM6nPQ0jloMB251aQGC5G7HxQOiQg1+axCEVlSrOrIfg2K11m8nwXfnMLJQwLjsr
88slGt7pCLzm0coFN1GvlyY//IocpO7NAfl0DeoNn+M1hr6E2Hlwk3HWx7NSSiVx
Onjm0a5hxHcAbEzMLngItESTH6WWLX2zCXWy957RUWugvRBj0dQDWqrq3++udZvt
nZYmh6CDah+YV0DHt7V9JQyZ1hquNg19Rkh0jHltUp9b8u9a7e/t+TKuQ+h6ml49
lBgrnZ35tBVuZmZRURlh1vJre6dn3WeZhASeRekkmxL1VjwHyZw=
=atbG
-----END PGP SIGNATURE-----

--nsnrpjg5zmdcysak--
