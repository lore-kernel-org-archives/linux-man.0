Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793707033;
	b=Y/r/Mwr5rVoWhz3A43WK0cj6nP+KB2SU4Ye8jYTDlYNj4/wvITTGyq9Sem0mdsVVjOkN
	 CJK6ZPTF0nRbuS/4lB9RlJ5S4LTsJFCQb71N13vF+MwKEsKp8drdGbWcLQa9aYaSvn+kZ
	 vM9+stl8stUfvNR9ad5e8Rp0Ar+4WZEeUbP317YYuTIZR5h3OL/LBrhg1UvEOSmqNwjc7
	 3r7KSOehLPBnzcJ4ksDnaxeSbHM61PmCUdxba2hQChxVHvhBI0hegOupCB9KxTxSEG0e0
	 gRJXRmVB3D13BsOagwoPGECgIGoQDIKFa2nb54emll34ic5DCRX8QNwrTI4j1kCeEEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793707033;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TTy2DCogaB+E+qj/lJqgpT2qsdDEE/V1mVzphHLkmzs=;
	b=adDxWdtLtExLAJw841oXyIiHWjJrQ8UmP5dFC0VunjCjnPjfltLNovh5RgVYFooZG+Gc
	 6QsLr+ehRwG9hyCLsdYAbsB/7PobbM38QCz2ZbOQklfN65xjqkrepy8u9qNfvaBh4U6HE
	 K1cgXtYmsWGlPjr+Oz3hFx4Asvf5AZiLE9CEwse0WN39KRZ3kd14zqJ+ooU4yYrx+xm3I
	 87N40i8NF+F4qdccSTLrcKgHOGCXtJUH0bSU5WgF7XRLQ1PFhxtZnSjBLxlxeNbY9qGSY
	 nVj0/3I2/IIpkD3am532Sh1U3F+WycCvVZGQ+hFpKV8NhrDlDcwRTlAmQGK57mg7YDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cEluW5R5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421FC606A327
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 11:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cEluW5R5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A75981F000C1;
	Tue,  3 Nov 2026 11:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793707032;
	bh=TTy2DCogaB+E+qj/lJqgpT2qsdDEE/V1mVzphHLkmzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cEluW5R59pg7QAtmoXh9Xhw82jGrRY9uI7nuzuPkqw6nbVcNPbET8TSYcCWXnhzX5
	 Dz9e3OW0GBRKjwXSnYOmJNR6R952nIBnrInswtZUMg+X+r3sJiPhmCNVRbDbJll0q9
	 Z4llklpQjou9bANx8dHHYYNCLZ1l535pMaMAjC91w9nzQihaytMN98vZ9qDQf/wvL7
	 hiKd26tYutg3UC9x0wcNGpSghvi3GV3GuP4IBxQQC+PLonar1LBV07aXfZiriLixsQ
	 5SbwEskKlzTcupbzdhEUnSCvzEY8dXpGzo8meBNGPUTSnCr4VILaUZEUfAU71Zl7Dy
	 426+ChplhFxqg==
Date: Tue, 3 Nov 2026 12:57:09 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Michal Schorm <mschorm@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>, 
	Xavier Leroy <Xavier.Leroy@inria.fr>, Carlos O'Donell <carlos@redhat.com>, 
	linux-man <linux-man@vger.kernel.org>
Subject: Re: Two copyright notices missing in 6.20?
Message-ID: <aunL8qxBkXFvLxCN@devuan>
References: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com>
 <aukT75oZFuvhwiEd@devuan>
 <CALC7GWzhb81jNjvDyymfWQP6eXXM2OZ4LhtM=uYNWQ8TK=KpgQ@mail.gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nbhcinwy6c7vr32q"
Content-Disposition: inline
In-Reply-To: <CALC7GWzhb81jNjvDyymfWQP6eXXM2OZ4LhtM=uYNWQ8TK=KpgQ@mail.gmail.com>


--nbhcinwy6c7vr32q
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Michal Schorm <mschorm@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>, 
	Xavier Leroy <Xavier.Leroy@inria.fr>, Carlos O'Donell <carlos@redhat.com>, 
	linux-man <linux-man@vger.kernel.org>
Subject: Re: Two copyright notices missing in 6.20?
Message-ID: <aunL8qxBkXFvLxCN@devuan>
References: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com>
 <aukT75oZFuvhwiEd@devuan>
 <CALC7GWzhb81jNjvDyymfWQP6eXXM2OZ4LhtM=uYNWQ8TK=KpgQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALC7GWzhb81jNjvDyymfWQP6eXXM2OZ4LhtM=uYNWQ8TK=KpgQ@mail.gmail.com>

Hi Michal,

> Date: 2026-11-03 08:10:52+0100
> From: Michal Schorm <mschorm@redhat.com>
>
> Hi,
>=20
> There's a typo (Linus / Linux) in the commit restoring Linus' notice:
> https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit/?id=3D=
034b29a5f2686f647d12e75bf6da4bd30f97db0d

lol, Thanks!  Fixed.


Have a lovely day!
Alex

>=20
>=20
>=20
> Michal
>=20
> --
>=20
> Michal Schorm
> Senior Software Engineer
> Databases Team
> Red Hat
>=20
> --
>=20
> On Tue, Nov 3, 2026 at 12:22=E2=80=AFAM Alejandro Colomar <alx@kernel.org=
> wrote:
> >
> > Hi Carlos, Xavier,
> >
> > > Date: 2026-11-02 11:24:25-0500
> > > From: Carlos O'Donell <carlos@redhat.com>
> > >
> > > Alejandro,
> > >
> > > I did a quick audit through 6.20 since we're looking to ship an updat=
e in Fedora.
> > >
> > > - Xavier Leroy =E2=80=94 pthread_once.3
> >
> > Xavier asked me to remove his name from the pages when I told him about
> > picking the old pthread_*() pages from glibc and Debian.
> >
> >         commit 13151ec525a21101dabb2528784bf9a86b1280f4
> >         Author: Alejandro Colomar <alx@kernel.org>
> >         Date:   2023-10-03 16:57:29 +0200
> >
> >             pthread_*.3: Remove AUTHOR section; add copyright; adapt TH
> >
> >             Xavier asked that his name be removed from the AUTHOR secti=
on, and since
> >             we don't use that section in this project, we can just wipe=
 it.
> >
> >             Add copyright notices to the pages, with Xavier as the orig=
inal author,
> >             and me, who will maintain them from now on.  Xavier ACKed t=
he
> >             Linux-man-pages-copyleft license.
> >
> >             Adapt the TH line:
> >
> >             -  Specify the date as (date).
> >             -  Specify the project name in the 4th arg.
> >             -  The first arg, the page name, must be the same as the fi=
le name.
> >
> >             Suggested-by: Xavier Leroy <Xavier.Leroy@inria.fr>
> >             Signed-off-by: Alejandro Colomar <alx@kernel.org>
> >
> > Here's a quote from an email from Xavier:
> >
> > | Date: Sun, 21 May 2023 11:40:12 +0200
> > | From: Xavier Leroy <Xavier.Leroy@inria.fr>
> > | Message-ID: <CAH=3Dh3gFakgz3xcH63h-5nO0L9LuSy2Xr5b2riwpJ1o4L3DzuRg@ma=
il.gmail.com>
> > |
> > | To answer your question:
> > | - I don't think it's a good idea to take these man pages "as is" and =
drop
> > | them in the man-pages project, because they are probably obsolete and
> > | incomplete.
> > | - However, if you or others would like to use these man pages as a st=
arting
> > | point for a comprehensive, up-to-date and maintained documentation for
> > | POSIX Threads functions in Linux, you're most welcome.
> > | - In both cases, I'd like my name and e-mail address to be removed fr=
om the
> > | man pages, as I no longer support them.
> >
> > And a follop-up email:
> >
> > | Date: Sun, 21 May 2023 19:29:19 +0200
> > | From: Xavier Leroy <Xavier.Leroy@inria.fr>
> > | Message-ID: <CAH=3Dh3gF3F-tOq6-zYKf63_JhR3tRZ9NFMiTpX2YEjhhjDGr7Hw@ma=
il.gmail.com>
> > |
> > | I'm happy with the man-pages-copyleft  license.  If you need me to wr=
ite a
> > | more formal message for the licensing of these pages, let me know.
> > |
> > | No other requests than 1- removing my name, and 2- updating the pages=
 as
> > | much as you and others can.
> >
> > I'm not sure why I kept his name in the copyright notices back then.
> > I thought I had asked him about it, but I can't find that discussion.
> >
> > Anyway, I've CCed Xavier now.  Xavier, are you okay with your copyright
> > notices being transformed to a generic one that says this?:
> >
> >         Copyright, the authors of the Linux man-pages project
> >
> > > - Linus Torvalds =E2=80=94 setreuid.2
> >
> > Seems a mistake.  Fixed now.  Thanks!
> >
> > > At the top level the following people have had their notices removed =
but I didn't
> > > see them acknowledge that removal on the mailing list, or in your fin=
al audit here:
> > > https://lore.kernel.org/linux-man/unavr5u2uynqfvj7iymgvsptq4k5s5b4ex7=
havl36zro4bbua4@fqpjhnsuu5ln/
> > >
> > > Should we add these back?
> > >
> > > I can only assume the Michael Kerrisk consented,
> >
> > He didn't.  We talked in person, and he asked his notices to be
> > restored, which I believe I did.
> >
> >         $ grep -rn Copyright.*Kerrisk | wc -l
> >         1224
> >
> > Did I miss any?
> >
> > > but I don't think you explicitly
> > > mentioned this in any email I read with a Message-id. Would you do so=
 for the record?
> >
> >
> > Have a lovely night!
> > Alex
> >
> > --
> > <https://www.alejandro-colomar.es>
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--nbhcinwy6c7vr32q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrpzBQACgkQ64mZXMKQ
wqnW5A//cbg+B25oLXZSiei9pS8gc4SwkkQk3RUmg4cuVPbUK8fos2diq3mIsLc/
JDu72dDkWS8Jcg2b0ZWbaETcl1sKXrtxQ9YAaj7PyZt6Fx1wrEvmkw1iIzVZEToG
7YQW29CFO3WjjmtxuZbToVC2TTDlU9KsFT8R6CsetWmf/CfdPpBRM/95a9tuazHl
OhGIZddKN7Qi/AOvWl8rNIfLc1yB8hKjuofBb//3xWl8sCifdI5Z7XoLcSpQUnZa
+MKXLmA16iBnEPHSSydRZWxVyGx39eBAHvveIbO/29n+0oVzBRoBPwXDZvZMX/0j
HfBgM7/GLKLqBAdIQgT5tFLYgnKCuIBjSQV7fXI1TOC1kVMHh4hNkFaKG7Exd70s
6GHZnPI9BMCBKYfe3vsvJrUsxxBqIDmNf0lDFbyJa1rGN6+SCjIbOVSnnlqb4bWT
nwVSXPmcowKBOYCNrGW4vr9bRs+a/PqXY/nONg7lMgcnh9sMRVUUci6+YeCvXMOx
aioW6kuJhPH47TqcOtzRLx+DH+KDnI42JhJf+BGc+spUOmG9ICUaoZ7TZoHn9u5X
/j1/AGKks3kYEnVDGyxZCPMGgp2j+dsdL97jgTCeYLLIR1GJNIhHv/FYSDrwN7tG
Lbo6wXQZjYLoXMyoDC7dNIEBp+m4rw/SQqydHwsP4HTHVf8KunA=
=8BPT
-----END PGP SIGNATURE-----

--nbhcinwy6c7vr32q--
