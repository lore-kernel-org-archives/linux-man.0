Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792831004;
	b=hXto5eRWZnLxPeB42L6egJDZ+72lZUFkmssH5BbcL9/X+X2SQSjU/lqDHMwMxav8wDuz
	 furN60ua2dmlC3+NL5cn/Fcg9rSZ31+SaBQB17WCayBUpgbENCTw6UOdGze9JrGVyDysr
	 7D7MW+cNNwR8vF85S8TcQvwNvxz1F6SMEuFgos8WRJJ1xEad22T6WfhBF4cyAWYwiTpZ2
	 0Zmp0H5fao9Q3cBjCyODoQ2qAC7gy2EMoLxd3QuXh56CXNkFq2PA5GRhPPAAZv2S+u+uZ
	 qzpf0LjotKrRrz7GHv1uJlbsM7ifVj+Z898U/WFLa9KOVJ8loDj6eRr7T6S6keHn41w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792831004;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=e6HA6oDe0PZGo4w/2a+eXfQxPm2/En9MYYZhlANT6pk=;
	b=cbS3CZrJG4Wi4tvE/yLRXWToHq2ZAJ6gle3QCVIjbZ/wnX15jxzlulWzvItW1CodTj69
	 wGXVTZDXlMHqYoFrGnKJngqVcFAJJlkPL0eBKMq4Bnu4Ip43EiO3IH9VByDWZfYdhw9lh
	 qTkCah0n0vfl2Y8jHacgX8vlwNQEq5AVItfglVp1BwZLWjF6uD2osfBLxxzYSJS8rVXJL
	 z4uKfv8GF3Kpao6cqdi6kf0Gd9u/u6erTqYcv4+nPKxRRTWKuCUfolhxFhMu+AR3G3HM6
	 +WYodpnw02bx4CkQUnYJhFrTFEl5Lba8wLgkGYdAjQdnd+DHoy8eeXc1LTGAZvaOptQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uhu4kqiM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D731606A320
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 08:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uhu4kqiM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 058051F031E0;
	Sat, 24 Oct 2026 08:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792831003;
	bh=e6HA6oDe0PZGo4w/2a+eXfQxPm2/En9MYYZhlANT6pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uhu4kqiMt4MMKopiDEfhzuZGFf0xAUy1gX0v80MT5yTJTeZvzviHCzm6sgyuW/hod
	 EdlXy1C3jP8vsgKhrDMh3cxuyhS4n/vFaBzigs+dU4uEIanxTg5away+rsKZBKVQzO
	 rbzjB4kbSJBfpjpt3T4kbPvTS8N12TaJPclzOLVsryLTxgPaE/+zlKEiqVga3NDZRl
	 eG8+JE+WJXwu4GgNFbA8w1VqT3wuK2Hdnvnpa/v8hQwMZNFwf63RgiZ1S9A4DJiobl
	 I+LuKNApheu+5S4rxJrV/x0/HZFPh0+HUn2qolCHzVCq5pJejCxBBPJK4pGbzwa1lL
	 1RNxKAKqdY34w==
Date: Sat, 24 Oct 2026 10:36:33 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	linux-man@vger.kernel.org
Subject: Re: [PATCH 5/7] man/man7/unix.7: SO_PASSSEC: wfix
Message-ID: <atxr50Vql9s6XW4F@debian>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-6-gnoack3000@gmail.com>
 <atw7vbZdVk2RJWw6@google.com>
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
	protocol="application/pgp-signature"; boundary="emfawtn7zipmmpn6"
Content-Disposition: inline
In-Reply-To: <atw7vbZdVk2RJWw6@google.com>


--emfawtn7zipmmpn6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	linux-man@vger.kernel.org
Subject: Re: [PATCH 5/7] man/man7/unix.7: SO_PASSSEC: wfix
Message-ID: <atxr50Vql9s6XW4F@debian>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-6-gnoack3000@gmail.com>
 <atw7vbZdVk2RJWw6@google.com>
MIME-Version: 1.0
In-Reply-To: <atw7vbZdVk2RJWw6@google.com>

Hi Kuniyuki,

> Date: 2026-10-24 05:02:06+0000
> From: Kuniyuki Iwashima <kuniyu@google.com>
>
> On Wed, 21 Oct 2026 23:22:54 +0200, G=C3=BCnther Noack wrote:
> > Use "security context", as in the description of SCM_SECURITY.
> >=20
> > Cc: Kuniyuki Iwashima <kuniyu@google.com>
> > Assisted-by: LLM
> > Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> > ---
> >  man/man7/unix.7 | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/man/man7/unix.7 b/man/man7/unix.7
> > index 4abd216d19c7..67dd10cc146f 100644
> > --- a/man/man7/unix.7
> > +++ b/man/man7/unix.7
> > @@ -317,7 +317,7 @@ and returned as the result of
> >  is an integer boolean flag.
> >  .TP
> >  .B SO_PASSSEC
> > -Enables receiving of the security label of the peer socket
> > +Enables receiving of the security context of the peer socket
>=20
> Patch 4 touches here, why not squash ?

I prefer not squashing.  It makes the commit messages more specific,
which is easier to understand and review in the future.


Have a lovely day!
Alex

>=20
>=20
> >  in an ancillary message of type
> >  .B SCM_SECURITY
> >  (see below).
> > --=20
> > 2.56.0
> >=20

--=20
<https://www.alejandro-colomar.es>

--emfawtn7zipmmpn6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrcbhEACgkQ64mZXMKQ
wql2jQ//Xyqh9Ddl6KzLj0FkFAExX12rT/iaGO2s5aWPocWI8HSEl2tR2XWgNImF
vvIbGjPHW30pVwWKRSybIERecxJimEOZ0vVAGtqi/9ub4GQMfycQdit3Elsaa+3A
pOKbKrgxRJSTxhHvBt3dB8y1TJxVAdpKhCPW8jnwRxhVDyelbtgtdbRxaHz15jvj
tnPEGcY/iSSeaBkoew8uUU9jg9gctFjKbscFD50g4rA+1XU4FGODo/FtCK8h+f59
q/3i2NQN+PeiXo9Pjn/OxImGZVs9jX1W1+2Xk5yzUXo9ZLTEidsV1kB6yET6X+1r
B1jvnTZ8oJu5pxfnIHSn7KeQer8/IwPolaXxZFGIloPho7phT76lZ2kDrX8eDht0
jWtF/0cf7yPs66qNxQ1PS8sLLHQyImBd66da9ZL5yapMUHNjmtUEnKganzezkHQC
0ILgGsYptqYejCUBJhJBLysaF5/UoVmP3l1NeEPNxpilA4tFAGV2wvUeeRvP/A9w
SsMK58sA/Y/pnoNFgEPiZ8wVlP/4mKJSavSgglOPPyZJ4AeeCbM4VcdGmZRUQji7
DpDa5H9w9YRaHfuxRqpOCruFYronZXBZykmnbUIEKlrWQz7Mg19SzmWdyQVL2Twr
rzximEGHeFnFrTHpW0onDpgwdPRXVRdh6SFBzb0N2bnEwtEw778=
=4EMb
-----END PGP SIGNATURE-----

--emfawtn7zipmmpn6--
