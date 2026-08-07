Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9082E738B
	for <linux-man@vger.kernel.org>; Fri,  7 Aug 2026 23:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786146254; cv=none; b=duY6xoN4V/4O1jSHGOT9P8KqLZaqTM+WSDgyv0mT40Zw73yxKQZM/3DoEZq1ke8/Vh1jXMsUJ6r2/F5BvV2e/lHzCm6kGFEQTreSm2swz9KJUS5uX+PKWGthTYySVPSztWp6G7EwJCRZX1x8fZxxaSkOTsjxWw4RwbJxBSxkcpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786146254; c=relaxed/simple;
	bh=7IXqIb9bttchNPPy7pbUaUb2Bsk02YQInYB4EOf9U3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZa/sYbbntv9rQSSnGaLP1ChjWxlu6jK4Ygw74Wj22z32UH66WGTG70RlJL7nC3aVGE2OLG0ISXhuuVyyw6Eu007zZWd6DDr/eOtYZxKJwf50hRnEMAFmdP4usHXIlaDmP1WcCXBFjN2qykFwWDFkPejvbiEWehqy3Y894GAQuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JjXEOEEo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JjXEOEEo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B891F000E9;
	Fri,  7 Aug 2026 23:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786146252;
	bh=G2IbEXbiVAxtUF7GeKzxwZRLFdl1WUc9cnDcFtIpFdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JjXEOEEovoqhrrJZCRu2jMOAoWOrBSMPvaELjImZrSUnqeGGNfn8veQPJbheNFNyJ
	 wwDyu3eq7lFXXMfNFuWNcyTCFf3/F8M3Fi65v88HzUOEcQ/PIQGLO/K/XnclqpoQtG
	 k4JKWByjZ0tt1ToU+jioee20Np0hhauo/F3EyVpwEyFhldFEMgfLPsafGLEkJpns5R
	 7e/8Ybnq09039M3PpPtCRtCyqZGDG0V7CvjcpKlsdSxnt6C1wJtV8nFTxjl9sJHJD/
	 8/LnHoMoTNU659BiHPOgwOfyoYXLZdqMqVNYr2BuC/wUCgYjtcDYf+l0QVAKmqwV3r
	 Uzzei+DAuKPIQ==
Date: Sat, 8 Aug 2026 01:44:09 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Masanari Iida <standby24x7@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] resolv.conf: Update MAXNS header reference for
 resolv.conf(5)
Message-ID: <anZtjC89LJFudMay@devuan>
References: <20260807124916.18007-1-standby24x7@gmail.com>
 <anZpIHHNt96X2Ybv@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mjuswsbly2ynn7tt"
Content-Disposition: inline
In-Reply-To: <anZpIHHNt96X2Ybv@devuan>


--mjuswsbly2ynn7tt
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Masanari Iida <standby24x7@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] resolv.conf: Update MAXNS header reference for
 resolv.conf(5)
Message-ID: <anZtjC89LJFudMay@devuan>
References: <20260807124916.18007-1-standby24x7@gmail.com>
 <anZpIHHNt96X2Ybv@devuan>
MIME-Version: 1.0
In-Reply-To: <anZpIHHNt96X2Ybv@devuan>

> Date: 2026-08-08 01:26:05+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> Hi Masanari,
>=20
> > Date: 2026-08-07 21:49:16+0900
> > From: Masanari Iida <standby24x7@gmail.com>
> >
> > The MAXNS limit mentioned in resolv.conf.5 now points
> > to <res_state.h> instead of <resolv.h>, matching the
> > change in glibc headers.
>=20
> Would you mind providing a reference to that change?  When did it
> happen?
>=20
> Could you provide a specific glibc commit?

I've found it:

glibc.git 500b3a499fff (2017-05-20; "Remove __need_list_t and __need_res_st=
ate.")

Please include that reference in the commit message.


Cheers,
Alex

>=20
>=20
> Have a lovely night!
> Alex
>=20
> >=20
> > Signed-off-by: Masanari Iida <standby24x7@gmail.com>
> > ---
> >  man/man5/resolv.conf.5 | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/man/man5/resolv.conf.5 b/man/man5/resolv.conf.5
> > index 8e914f12a18d..89f9d903a1e3 100644
> > --- a/man/man5/resolv.conf.5
> > +++ b/man/man5/resolv.conf.5
> > @@ -50,7 +50,7 @@ or an IPv6 address in colon (and possibly dot) notati=
on as per RFC 2373.
> >  Up to
> >  .B MAXNS
> >  (currently 3, see
> > -.IR <resolv.h> )
> > +.IR <res_state.h> )
> >  name servers may be listed,
> >  one per keyword.
> >  If there are multiple servers,
> > --=20
> > 2.25.0
> >=20
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--mjuswsbly2ynn7tt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmp2bcMACgkQ64mZXMKQ
wqkUrhAAoIRiXYM2vuvZxS1YT2Ih451QCj4T+kiBOMYOdvInQ3qgkWo7zdesxjrm
gbpbvXLj4Wp/VHl6irsnXQKUJBYFtbjEw4yjoXkfsESWNVhq/sPJi3Q4FMpJuGGM
UCKHZIThhjU9bva0eYE5pBLVNSrTvTnjmm/pRGK8v3EcZAPwNE+l4g9FbaxuOwXq
QZ74x3B2sAqhXPMQTrEcTdvCeO+8s6Y8yO6IRcJ0ui63CMooo4xsJiv9ojaj6JNI
bA14N8y8G/2uBQi4agyYlScr4NYvnSZbazCLENZ6MDjCbN+YEJGAfjFjkrHuCS0n
A/tUo9xlbaKn2oTn62s58cVyv7o2pw8kCwLDsnGqLbNNSCpiLNx2GluLlFWXl2DQ
qqXXJ9dmuPW6yH/BPbkCZohe2F/GNIxDb+CvwiNudaDHxqCqe9gK/1gpgFcc4Iz9
t4Fss9dHq0DzG7HxCP+MW9QH97gf4i2NbNxn+m0IwBncgKPTnOUspNHqd7h/mSwQ
jCZh3uZDfU/yb7OBuqxiBAnoS0tLozKXdes0x6DHZyE+Xtfcmo7fNC11vCqdk96O
JLVfVHvD5ATKiY/029WaxMpIYnkchewCGrjtmB340iNhahH3LK/LR+R45UWfVGps
Lx0Ug9WFl/fhPJZCGX3Y8lSBn7oPjPjzZgPmRRVxsR6Q9YI6uZ8=
=c4HJ
-----END PGP SIGNATURE-----

--mjuswsbly2ynn7tt--
