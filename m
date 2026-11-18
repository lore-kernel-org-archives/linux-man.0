Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794964530;
	b=V/vcD0sf8EdOeDJvUW7f2gCn/XtOsJXOXN7JwqjxJKIBPVyU4M3+KofnCUX5TFlI3KNL
	 pZ8JGO7K35R/vL0M4yKlzi2xklEBL8eWWvsbXEWwJzo+UwV5SsFSvYl55GprSlU9dfIOo
	 TlC2vRqoN/ABIQp9kQfgHFYOUFJaR7bp9+vNqtzh/qWNRmqNTg8692CKElfritXRsPJQr
	 y8GfZnjqQTU7ceH5rS7KW5vmB2FvGRVBqI8pQeT+4btqp6WCkfR0xJxKre59qh4B/4cm7
	 jHX/0UivWr3IFeeV4BFhoofr7UMj8H4GQRAG/Wf/xPQ0tTKmOUh82ZNLHJssHmry9Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794964530;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=VrLcYN9Av35lznUUX+MRTv4tBxoKr71dl3b11OeQo0Q=;
	b=YmgWcxgWtlORaMOGOJEjY2YeHZTgIo7TzuOzcrD4OU62qT2II4B/KG+KkeBZ+C/aWsMN
	 PBERRnKSucWovRSw1W0jWv0Ukac7HOH1RwouRuhcGHBIrLPKcztPVjHB3R7jpryT4Pj/q
	 S+c6ign9trqSxUVxorGnGhkKDQMKd8N7QLYlG7C2QZnSFxQTNx/HUbi2qoCWv1xBYJzaD
	 ssbrJYSLbnEIvGvT1CzPXPyaC8GJXkXwmU0o/qkTC5ceD7iPb8neiVjZsSNY9Gv3J5oFJ
	 Ejln0x5gcV+mVLZNEUThJp/QxKp+gpzbWQHoocJJxaejAVbq8pPkLQcSYRseu5GesDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=khItm7zw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4805E606A32A
	for <linux-man@vger.kernel.org>; Wed, 18 Nov 2026 01:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=khItm7zw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E611F000C4;
	Wed, 18 Nov 2026 01:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794964529;
	bh=VrLcYN9Av35lznUUX+MRTv4tBxoKr71dl3b11OeQo0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=khItm7zwSBEOpkYLorZ1i3eYTKbpGCXDYEAOvflOGhC4OdvmjGsyP3CZ6HtCSl9vS
	 DKf/2eY+DzaUxINyZInaAKcKe3nQzZjz8gci0T/4dX46DdTyK+Gk8boPNeahX0XoSS
	 W3uJMZ6AreLNDoMeRqKdOfbY6tPSFgIU+o43+tWNuFqdeVB5YJvOWw97Kkg2YIQPsA
	 rpAI/tsCt+7FiGJpDMFYjM5qt7DTyPFSVnOhIzD6R9oyEUMJpTqlD1mJuXTBUBts9U
	 tV0MMo1OFXEPJLHLyGXu2DJzXzfbh2ZFcAOfwSJynXihfz/tnIbzUxPDfycW7DW+W+
	 b0PxuHXLpQ3QQ==
Date: Wed, 18 Nov 2026 02:15:26 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH v2 4/8] man/man7/unix.7: SCM_SECURITY: Generalize to
 other LSMs, not just SELinux
Message-ID: <avz720UWEwL1AXzR@devuan>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
 <20261103202211.13820-5-gnoack3000@gmail.com>
 <avpUW_zBBph5d40d@google.com>
 <20261116.34a1603ed035@gnoack.org>
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
	protocol="application/pgp-signature"; boundary="k3ylje4g3glapmva"
Content-Disposition: inline
In-Reply-To: <20261116.34a1603ed035@gnoack.org>


--k3ylje4g3glapmva
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH v2 4/8] man/man7/unix.7: SCM_SECURITY: Generalize to
 other LSMs, not just SELinux
Message-ID: <avz720UWEwL1AXzR@devuan>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
 <20261103202211.13820-5-gnoack3000@gmail.com>
 <avpUW_zBBph5d40d@google.com>
 <20261116.34a1603ed035@gnoack.org>
MIME-Version: 1.0
In-Reply-To: <20261116.34a1603ed035@gnoack.org>

Hi G=C3=BCnther,

> Date: 2026-11-16 08:35:57+0100
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> Thank you for the review!
>=20
> On Mon, Nov 16, 2026 at 12:55:26AM +0000, Kuniyuki Iwashima wrote:
> > On Tue, 03 Nov 2026 21:22:06 +0100, G=C3=BCnther Noack wrote:
> > > [...]
> > >
> > > diff --git a/man/man7/unix.7 b/man/man7/unix.7
> > > index 61f06a74359b..c0e2bdbacdd8 100644
> > > --- a/man/man7/unix.7
> > > +++ b/man/man7/unix.7
> > > @@ -538,13 +538,16 @@ .SS Ancillary messages
> > >  option must be enabled on the socket.
> > >  .TP
> > >  .B SCM_SECURITY
> > > -Receive the SELinux security context (the security label)
> > > -of the peer socket.
> > > -The received ancillary data is a null-terminated string containing
> > > -the security context.
> > > -The receiver should allocate at least
> > > -.B NAME_MAX
> > > -bytes in the data portion of the ancillary message for this data.
> > > +Receive the security context (the security label)
> > > +of the peer socket,
> > > +as provided by the active Linux Security Module (LSM).
> > > +The received ancillary data is a byte buffer.
> > > +.IP
> > > +The exact format of the security context buffer
> > > +is defined by the active major LSM.
> > > +For example,
> > > +SELinux returns a SELinux label as a string
> > > +(including a terminating null byte).
> >=20
> > nit: s/null/NUL/
> >=20
> > otherwise looks good
> >=20
> > Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
>=20
> The "null byte" is spelled in line with the man-pages(7) conventions
> for consistency, where it says:
>=20
>   The preferred term for the byte is "null byte".  Avoid writing
>   "NUL", since it is too easily confused with "NULL".
>=20
> So unless you feel strongly about it, I would prefer to keep it as is.

Yup, I prefer null byte, even if just for consistency.

NUL byte is something I would find okay, but we'd have to rewrite so
much text for it.  NUL (without saying byte) is the dangerous thing, as
a typo might easily convert it to NULL.


Cheers,
Alex

>=20
> =E2=80=93G=C3=BCnther
>=20

--=20
<https://www.alejandro-colomar.es>

--k3ylje4g3glapmva
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr8/C4ACgkQ64mZXMKQ
wqn8cxAAh2a4Km6Kxbyfjdoe1/4oFnDvD/ENRPTzkPpPZqFF8iR/FwzW8BkNsV16
cdP9aL7Kr/tgmle2SVkym6CGBKEb1etL1gorek+RmwZHPfyFJz1VW/AFz53PrjlF
I/BFBM5fU2R/r3DEzZCXn9Q5/fKWrPcehu2Rnj4gxN919sqAmN010f+tb3bdqz/F
uKxSjo44xcuM3Pfb72QUrKQV+WYZJbMEIkK8C114krpF1ozKTvRangdps5tk4XTh
Dd257ITN1aJRncvq5GEnW+ZxekHN2W2FXffTj02RDLRPtfzh6zTPZJ7phAKLVYbZ
LA7wrp7drfuVu/cmfrNHXchtY0SoV27G2JTBIZj1cw7nOzBiRXIrQxOEJl+MBFcu
JjTWKsVWQJ4/y4/W/i0w4AfiLJfkhFIue4zhKNTiZAE1OVfq/UM8Mu7ySZsOBqAa
w0TjX4qvhDL8Zll8zMbes6Ac/jDOy2NCOdbBjVg+47/Fnt83ti0qFCyMQnd5xshQ
Md+FmlqfhXF8B0VN0nlHfMwBjnYdMfm99HNlXLMGjd4r9i72ygPwgUa++BTfnRRn
mxijVHA5gJo5QsF4o54Q9xsRCihizIkGGRzMqhCBnnJ/1pDMDt7WaMPhLRiDld1N
1bxSSH1zaygH6c2oqyhyrQNzFi/wdAePO1jG/IiKuWjo49rp2Vs=
=2DxT
-----END PGP SIGNATURE-----

--k3ylje4g3glapmva--
