Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793919984;
	b=i4LhAT02z7ItnlBfcUOl2cg7u0WCeLPHd9bz4i3NTS3DPzb8w8tNj/XrbOT0SgnyddzQ
	 eQHBa7Xa/yuuRidMiXLaZLVM0uqBMeiegU6dU2xHVDzuoJLJf79klYxH/bAaGa4MNKGad
	 IAx6qamAKVzQCPaECv3jm+lIJjddVyOShuU2gqvXc7T3UYFnW9BKsQRt45PzlsIZsuo4I
	 0ti8xLlWA6TPjB6ST2D5Y7PN1MW/YjCz3Xx58FSlbqBO4xeXbLscF8Lall1HFiCyVR1L9
	 x8bIIawfOpQMj4f0ZBpi/9nJ8+pIZaRXC++rdVVXCUxWbR9g5HyaGC35Z6+CndprkXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793919984;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xd90spx1jz6b9iVjOwel5zlCN6nXN3/pi4iUHMV+has=;
	b=ERsHs0hwXtX8DAD9KoKe56iVk+F19mkoYUVCTqCrSTocofHsiUV3sIIiTGofFiE3NNqw
	 o2uA87R99Kmm/fE+gD6wmXaqHJKHrAiQVNWbten9ED2j5aMivHZkcf6gWZsr+q4qp4ARj
	 oLwreNQNRARQ3VJVgp5YORk2nJLfD02uxmMvCpW9TmU0xaVrSc6kT13+C0spmKP49PXLw
	 QdJWTUKxJn9Dkohm+bj5r4l+jfRis/zn6WIB424zeHUk1y/ot9ffh2FTHc5SBe9/Bb6Qh
	 1kR9/pLVWg7yT8crfVKmWRfC9ytFrK8+MtMLWOsCmZqc051JR/ShL6WvY82qg5FQlHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KEqYwcQo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139C3606A31B
	for <linux-man@vger.kernel.org>; Thu,  5 Nov 2026 23:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KEqYwcQo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AAE51F0089F;
	Thu,  5 Nov 2026 23:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793919983;
	bh=xd90spx1jz6b9iVjOwel5zlCN6nXN3/pi4iUHMV+has=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KEqYwcQoTalbFE49P/sdup8N5voMhfHbY4c3RVlYByF5CEr2xqtPj7M8+31sAyh21
	 XNsIdxbs3CIqTMrZ2YwScFaOgydUWQC+c0WJU1/tNRY1Y/S6plBtueJVZdspF4xvv0
	 DVY4cDcgwYkICO1i4P06Zhed8WbkCzVdUAqJJdXGmb0U9aU6dSK+R26OQgdXY7ybm2
	 aq0SNbeDlo95IZPI7syXq5nqaDPmLYqpxvm2HhftfNThJ8TD4jlmufmpRl5hEhfYTX
	 DsYglA3ncEHwwh7wt0DZY/fDMmAp+oXM5FLe6yQ7egOlwWgteruLuGsGBlpHH9/IL+
	 HJB1jLNap/DQA==
Date: Fri, 6 Nov 2026 00:06:20 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>, 
	Xavier Leroy <Xavier.Leroy@inria.fr>, linux-man <linux-man@vger.kernel.org>, 
	Michal Schorm <mschorm@redhat.com>
Subject: Re: Two copyright notices missing in 6.20?
Message-ID: <au0J1MGwWEwdnUSK@devuan>
References: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com>
 <aukT75oZFuvhwiEd@devuan>
 <0b9233b7-3c3f-4209-9d01-a1c94aaa8439@redhat.com>
 <aun6mEuYKQG-1IKv@devuan>
 <40697762-75d5-4d08-9740-4e68b379d80b@redhat.com>
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
	protocol="application/pgp-signature"; boundary="wyoqpkulqeu6wiek"
Content-Disposition: inline
In-Reply-To: <40697762-75d5-4d08-9740-4e68b379d80b@redhat.com>


--wyoqpkulqeu6wiek
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>, 
	Xavier Leroy <Xavier.Leroy@inria.fr>, linux-man <linux-man@vger.kernel.org>, 
	Michal Schorm <mschorm@redhat.com>
Subject: Re: Two copyright notices missing in 6.20?
Message-ID: <au0J1MGwWEwdnUSK@devuan>
References: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com>
 <aukT75oZFuvhwiEd@devuan>
 <0b9233b7-3c3f-4209-9d01-a1c94aaa8439@redhat.com>
 <aun6mEuYKQG-1IKv@devuan>
 <40697762-75d5-4d08-9740-4e68b379d80b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <40697762-75d5-4d08-9740-4e68b379d80b@redhat.com>

Hi Carlos,

> Date: 2026-11-03 13:02:01-0500
> From: Carlos O'Donell <carlos@redhat.com>
>
[...]
> > > (2) Removal of Linux Foundation copyright statements
> > >=20
> > > There were ~116 of Linux Foundation copyright notices present that we=
re removed.
> >=20
> > I'm waiting for them to approve it formally.  I expect they will.
>=20
> Thank you.
>=20
> If you need any help there please just ask and I'll see what I can do.

I emailed some contact a few days ago about this.  He'll be back from
vacation in a few days, so let's see what he says.  If he doesn't solve
it quickly, I'll ping you.

[...]
> > > Did the project get permission from the foundation for the removal?
> >=20
> > Not yet.
>=20
> Until that approval arrives would you consider reinstating the copyright =
notices
> that belong to the Linux Foundation?

I'll not do it right now, but I'll do it before the next release, in
case they haven't replied before the release.

> > > (3) Collapsed years
> > >=20
> > > Michael's copyright status collapsed from 2002, 2006, 20220 to 2002-2=
020.
> > >=20
> > > Were additional contributions made in the intervening years?
> >=20
> > I don't know.  I suspect there are, even though he probably didn't
> > consider them worthy of copyright.
> >=20
> > > If there were no such contributions then the years should be kept dis=
tinct.
> >=20
> > I think I disagree.  The copyright dates are only meaningful as a start
> > and an end.  One could also argue that 2005 means 2005-01..2005-12, but
> > there might have been contributions only in 2005-07.  Is it legally
> > meaningful to say 2002, 2004 in a way that 2002-07, 2002-09, 2004-05
> > isn't?  And is it legally meaningful to say 2002-2004 instead of any of
> > the above?
>=20
> I've responded to Branden on this topic downthread.

As Branden said, a copyright notice stating the years are 2002, 2004
is useless, because it doesn't identify which text corresponds to 2002
and which to 2004.  So, unless one has the git(1) log, one can't use
that information at all.  And if one has git(1), that information
becomes irrelevant.

> I leave this with you to decide.

I'll maintain the collapsed ranges.  I don't see the usefulness of
non-collapsed years.  Moreover, it might seem funny, but some copyright
notices stated the exact days in which the author worked.  IIRC, I saw
in a copyright notice two different days of the same year.

> > > Only ranges like 2002, 2003, 2004, 2005 etc. should be collapsed into=
 a contiguous range e.g. 2002-2005.
> > >=20
> > > May you please correct the collapsed ranges?
> >=20
> > I'd really like to avoid this.
> >=20
> > > (4) SPDX identifiers
> > >=20
> > > With Linus' clause restored, the SPDX identifier for setreuid.2 is no=
t correct.
> > >=20
> > > The original text read:
> > > .\" Portions extracted from linux/kernel/sys.c:
> > > .\"             Copyright (C) 1991, 1992  Linus Torvalds
> > > .\"             May be distributed under the GNU General Public Licen=
se
> > >=20
> > > Which makes this SPDX identifier incorrect:
> > > .\" SPDX-License-Identifier: BSD-4-Clause-UC
> > >=20
> > > Should include GPL?
> >=20
> > Indeed.
> >=20
> > > Likewise bind.2.
> > >=20
> > > Likewise connect.2.
> > >=20
> > > Likewise iopl.2 implied GPL.
> > >=20
> > > Likewise subpage_prot.2 implied GPL.
> > >=20
> > > May you please update 5 pages with GPL notices?
> >=20
> > Thanks!  I'll GPL these files tonight.
>=20
> Thank you!

Done.

> > > Likewise signbit.3, significand.3, and memcpy.3 are GFDL derivatives.
> > > - These should be rewritten from scratch or GFDL front-matter invaria=
nt requirements apply.
> >=20
> > Ouch!  Indeed.
>=20
> Yes, these are problematic and we should move towards compliance.
>=20
> > >=20
> > > The man-pages project should not copy from the glibc manual
> > > due to the GFDL front-matter invariant requirements, and that
> > > GFDL cannot be combined with GPL.
> >=20
> > Agree.  I'll try to rewrite them from scratch.
>=20
> Thank you!
>=20
> > memcpy(3) will be easier, because I know the page very well (and I've
> > already rewritten most of it from scratch; I guess the only remnants are
> > in CAVEATS).  The others, I'll need to learn about them before
> > rewriting.  I'll use the BSD pages to learn about these APIs.
>=20
> Perfect.

Actually, I've looked at memcpy(3), and the text I thought might have
come from glibc is not present in the glibc manual, so I guess it's
=66rom this project only.  The text from glibc might have been replaced
entirely over time.

Now we have a Ship of Theseus problem here.  The page doesn't seem to
contain any copyrighted text, but are we allowed to just drop that
license notice?  Any suggestions about memcpy(3)?

> I will go publicly on the record as saying I do not like the GFDL for the
> glibc manual, the invariant section, and choice of incompatibility with
> the LGPLv2+ means we can't even copy comments into the manual without
> having someone who can relicense them. This is a process mistake that we'=
ve
> been trying to fix for a long time.
>=20
> > > (5) Uncertain provenance
> > >=20
> > > Restore the des_crypt.3 uncertain provenance header:
> > >=20
> > > .\" However, the above header line suggests that this file in fact is
> > > .\" Copyright Sun Microsystems, Inc (and is provided for unrestricted=
 use,
> > > .\" see other Sun RPC sources).
> > >=20
> > > Or conclusively resolve the provenance issue.
> > >=20
> > > I'd leave the SPDX-header as-is because Eric's statement can be seen =
as authoritative
> > > over the uncertain provenance.
> > >=20
> > > Likewise login.3 uncertain GFDL.
> > >=20
> > > Likewise remove.3 which should include copyright notices from unlink.=
2 as a derived work.
> > >=20
> > > May we please add back the uncertain text notes?
> >=20
> > Okay.
> >=20
> > >=20
> > > Were any of these uncertain notices resolved?
> >=20
> > Some of them might have been resolved due to the affected text being
> > removed.  It's probably not worth the effort, so I think it might be
> > easier to just restore them (even if maybe not relevant anymore).
>=20
> Thank you very much for your help in getting everything to point where
> we can publish this in Fedora.

Thank you!


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--wyoqpkulqeu6wiek
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrtC+QACgkQ64mZXMKQ
wqnQlBAAlCPPsTg+tii1Pra+iRoBl43z7xn8ukidSZ5sRC202cHYD3aDpFpHVvIB
ghi0Y8OvNfkfBhYosxh3b/3p3gSA8OuiQVo4pxvs/e2wXxJKpxj2TNnzHjyI5fWG
izyncwhgSXWmh/b0yHeJ+iH7G84rmurc0TBa321iE4GYt8tK7MmvR8Lj2k9Pxuja
HoZNsOFSv9nmsTkEF5Pb/xRRe7VqBMzKf5rIGZqbef+jG7Pv2Zxnheefq4UFcU6C
k8TSQ/jmI5EnHe0uX8+t6bNBTkyz85D9V7YEcpTRgIlDeM9JlOmz3YsEVIpGBAgc
uyRLwE2A142Mo1yKZmygB7+wStQH6bkGwdFOgTRqFaBJCHML/6hkSfnqN8Of9B2Y
NeIWQNIHZdAvv2ogDoiUSgJ+rdodf2YLP7q3JgNZgm0XcBeBEm94Crircqp+crbI
ilVvU9cVGuMV6+tpfNqCMyiksA4M1bdPz9xSzlVqHsBYOuBtnUl9aY9NUhu1su1h
YmwKY8lpzUp48TIvHTmTWnCdCWAReKAdSDfNbG88kHtNU+rzpZpVGC9IAjNWk6lJ
959KM3Pzllz/2zJNaqfHKkjx7aQNlVJ/3P2fhrP57fRv7yWolT6uajc4PE/f0HSr
zjsge1zQ/BI8KirhXdQOlFJZ2FCYD6PDeOxKISAdC1h22kwR420=
=x70b
-----END PGP SIGNATURE-----

--wyoqpkulqeu6wiek--
